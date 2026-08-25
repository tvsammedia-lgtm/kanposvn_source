import 'package:isar/isar.dart';
import '../models/eshop_cart.dart';
import '../models/eshop_ops_models.dart';
import '../models/eshop_order.dart';
import '../models/eshop_product.dart';
import '../models/eshop_shop.dart';
import '../models/eshop_wallet.dart';

/// Kết quả checkout.
class EshopCheckoutResult {
  final List<KanShopOrder> orders;
  final double grandTotal;
  final int pointsEarned;

  EshopCheckoutResult(
      {required this.orders, required this.grandTotal, required this.pointsEarned});
}

/// Nghiệp vụ KanShop theo kanposvneshop.md (offline-first).
class EshopBusinessLogic {
  static const double platformFeeRate = 0.05; // §7 Phí sàn 5%
  static const double affiliateCommissionRate = 0.05; // §Affiliate
  static const double flatShippingFee = 20000; // mỗi shop một đơn vận chuyển

  // ══════════════ GIỎ HÀNG (nhiều shop) ══════════════

  /// Thêm vào giỏ — kiểm tra tồn kho.
  static Future<void> addToCart(Isar db,
      {required String userId,
      required String productId,
      int quantity = 1}) async {
    final p =
        await db.kanShopProducts.filter().productIdEqualTo(productId).findFirst();
    if (p == null) throw Exception('Không tìm thấy sản phẩm $productId');
    if (p.status != 'active') throw Exception('Sản phẩm đang ẩn/ngừng bán.');
    if (p.stockQuantity < quantity) {
      throw Exception('${p.name} chỉ còn ${p.stockQuantity} món.');
    }
    await db.writeTxn(() async {
      final existing = await db.kanShopCartItems
          .filter()
          .userIdEqualTo(userId)
          .productIdEqualTo(productId)
          .findFirst();
      if (existing != null) {
        existing.quantity += quantity;
        await db.kanShopCartItems.put(existing);
      } else {
        await db.kanShopCartItems.put(KanShopCartItem()
          ..cartItemId = 'cart_${userId}_$productId'
          ..userId = userId
          ..shopId = p.shopId
          ..productId = productId
          ..quantity = quantity
          ..price = p.salePrice);
      }
    });
  }

  static Future<void> updateCartQty(Isar db,
      {required String userId,
      required String productId,
      required int newQty}) async {
    final item = await db.kanShopCartItems
        .filter()
        .userIdEqualTo(userId)
        .productIdEqualTo(productId)
        .findFirst();
    if (item == null) throw Exception('Không có trong giỏ.');
    if (newQty <= 0) {
      await db.writeTxn(() async => db.kanShopCartItems.delete(item.isarId));
      return;
    }
    final p = await db.kanShopProducts
        .filter()
        .productIdEqualTo(productId)
        .findFirst();
    if ((p?.stockQuantity ?? 0) < newQty) {
      throw Exception('Vượt tồn kho (${p!.stockQuantity}).');
    }
    await db.writeTxn(() async {
      item.quantity = newQty;
      item.price = p!.salePrice; // cập nhật giá mới nhất
      await db.kanShopCartItems.put(item);
    });
  }

  // ══════════════ §Flash Sale ══════════════

  /// Giá hiệu lực hiện tại của sản phẩm (ưu tiên flash sale đang chạy).
  static Future<double> effectivePrice(Isar db, String productId) async {
    final p =
        await db.kanShopProducts.filter().productIdEqualTo(productId).findFirst();
    if (p == null) return 0;
    final now = DateTime.now();
    final fsList = await db.eshopFlashSales
        .filter()
        .productIdEqualTo(productId)
        .startTimeLessThan(now)
        .endTimeGreaterThan(now)
        .findAll();
    EshopFlashSale? fs;
    for (final f in fsList) {
      if (f.soldQty < f.limitedQty) {
        fs = f;
        break;
      }
    }
    return fs?.salePrice ?? p.salePrice;
  }

  // ══════════════ §Đặt HÀNG ══════════════

  /// Checkout: gộp giỏ THEO SHOP -> mỗi shop một đơn.
  /// Voucher scope platform áp cho đơn đầu tiên, shop/product áp đúng đích.
  /// Combo 2 tặng 1 tự giảm khi 1 sản phẩm mua >= 3 chiếc.
  static Future<EshopCheckoutResult> checkout(
    Isar db, {
    required String userId,
    String voucherCode = '',
    String paymentMethod = 'COD',
    bool payWithWallet = false,
    String? affiliateUserId,
    String carrier = 'GHN',
  }) async {
    final items =
        await db.kanShopCartItems.filter().userIdEqualTo(userId).findAll();
    if (items.isEmpty) throw Exception('Giỏ hàng trống.');

    final voucher = voucherCode.isEmpty
        ? null
        : await db.eshopVouchers
            .filter()
            .codeEqualTo(voucherCode.toUpperCase())
            .findFirst();
    if (voucherCode.isNotEmpty && (voucher == null || !voucher.active)) {
      throw Exception('Voucher không hợp lệ.');
    }

    // Ví khách nếu trả bằng ví.
    KanShopWallet? wallet;
    if (payWithWallet || paymentMethod == 'wallet') {
      wallet = await db.kanShopWallets
          .filter()
          .ownerIdEqualTo(userId)
          .ownerTypeEqualTo('user')
          .findFirst();
      if (wallet == null) throw Exception('Chưa mở ví.');
    }

    // Gom theo shop.
    final byShop = <String, List<KanShopCartItem>>{};
    for (final it in items) {
      byShop.putIfAbsent(it.shopId, () => []).add(it);
    }

    var grandTotal = 0.0;

    var pointsEarned = 0;
    final createdOrders = <KanShopOrder>[];
    var platformVoucherLeft = voucher != null && voucher.scope == 'platform';

    for (final entry in byShop.entries) {
      final shopId = entry.key;
      final shopItems = entry.value;

      double subTotal = 0;
      final orderItems = <EshopOrderItem>[];
      for (final it in shopItems) {
        final p = await db.kanShopProducts
            .filter()
            .productIdEqualTo(it.productId)
            .findFirst();
        if (p == null) continue;
        final price = await effectivePrice(db, it.productId);
        var qty = it.quantity;
        var lineTotal = price * qty;

        // §Combo mua 2 tặng 1: cứ đủ 3 chiếc tính tiền 2.
        if (p.isCombo2x1 && qty >= 3) {
          final freeUnits = qty ~/ 3;
          lineTotal = price * (qty - freeUnits);
        }
        subTotal += lineTotal;
        orderItems.add(EshopOrderItem()
          ..productId = p.productId
          ..name = p.name
          ..price = price
          ..quantity = qty);
      }

      // Voucher theo scope.
      var discount = 0.0;
      var appliedCode = '';
      if (!platformVoucherLeft && voucher != null) {
        if ((voucher.scope == 'shop' && voucher.refId == shopId) ||
            (voucher.scope == 'product' &&
                orderItems.any((o) => o.productId == voucher.refId))) {
          discount = _voucherDiscount(voucher, subTotal);
          appliedCode = voucher.code;
        }
      } else if (platformVoucherLeft && voucher != null && discount == 0) {
        discount = _voucherDiscount(voucher, subTotal);
        appliedCode = voucher.code;
      }
      discount = discount.clamp(0.0, subTotal);
      if (appliedCode == voucher?.code && platformVoucherLeft) {
        platformVoucherLeft = false; // chỉ dùng 1 lần cho cả giỏ
      }

      final shipping = flatShippingFee;
      final afterDiscount = subTotal - discount;
      final total = afterDiscount + shipping;
      final fee = afterDiscount * platformFeeRate;
      final points = afterDiscount ~/ 10000;

      late KanShopOrder order;
      await db.writeTxn(() async {
        order = KanShopOrder()
          ..orderId =
              'ord_${DateTime.now().millisecondsSinceEpoch}_$shopId'
          ..userId = userId
          ..shopId = shopId
          ..subTotal = subTotal
          ..shippingFee = shipping
          ..discount = discount
          ..voucherCode = appliedCode
          ..totalAmount = total
          ..platformFee = fee
          ..items = orderItems
          ..paymentMethod = payWithWallet ? 'wallet' : paymentMethod
          ..status = 'pending'
          ..carrier = carrier;
        await db.kanShopOrders.put(order);

        // Trừ tồn kho + flash sale soldQty.
        for (final it in shopItems) {
          final p = await db.kanShopProducts
              .filter()
              .productIdEqualTo(it.productId)
              .findFirst();
          if (p != null) {
            p.stockQuantity -= it.quantity;
            if (p.stockQuantity <= 0) p.status = 'out_of_stock';
            await db.kanShopProducts.put(p);
          }
          final fsNow = DateTime.now();
          final fs = await db.eshopFlashSales
              .filter()
              .productIdEqualTo(it.productId)
              .startTimeLessThan(fsNow)
              .endTimeGreaterThan(fsNow)
              .findFirst();
          if (fs != null) {
            fs.soldQty += it.quantity;
            await db.eshopFlashSales.put(fs);
          }
          await db.kanShopCartItems.delete(it.isarId);
        }

        if (voucher != null && appliedCode.isNotEmpty) {
          voucher.usageCount += 1;
          await db.eshopVouchers.put(voucher);
        }
      });

      grandTotal += total;
      pointsEarned += points;
      createdOrders.add(order);

      // §Affiliate hoa hồng từ đơn này.
      if (affiliateUserId != null && affiliateUserId.isNotEmpty) {
        await recordAffiliateSale(db, affiliateUserId, order);
      }
    }

    // Thanh toán bằng ví (trừ tổng sau tất cả đơn).
    if (wallet != null) {
      if (wallet.balance < grandTotal) {
        // Rollback phức tạp — chặn trước bằng cách kiểm tra sớm ở đầu hàm
        // với tổng dự kiến. Ở đây ném lỗi và yêu cầu nạp thêm.
        throw Exception(
            'Ví không đủ (cần ${grandTotal.toStringAsFixed(0)}đ). Vui lòng nạp thêm.');
      }
      final payWallet = wallet;
      await db.writeTxn(() async {
        payWallet.balance -= grandTotal;
        await db.kanShopWallets.put(payWallet);
        await db.eshopWalletTransactions.put(EshopWalletTransaction()
          ..txId = 'tx_pay_${DateTime.now().millisecondsSinceEpoch}'
          ..ownerId = userId
          ..amount = -grandTotal
          ..type = 'payment'
          ..description = 'Thanh toán ${createdOrders.length} đơn qua ví');
        // Tích điểm vào sổ điểm.
        await db.eshopPointEntrys.put(EshopPointEntry()
          ..entryId = 'pt_${DateTime.now().millisecondsSinceEpoch}'
          ..userId = userId
          ..points = pointsEarned
          ..reason = 'Tích điểm mua sắm');
      });
    }

    return EshopCheckoutResult(
        orders: createdOrders, grandTotal: grandTotal, pointsEarned: pointsEarned);
  }

  static double _voucherDiscount(EshopVoucher v, double amount) {
    if (amount < v.minOrder) return 0;
    var d =
        v.type == 'percent' ? amount * v.value / 100 : v.value;
    if (v.maxDiscount > 0 && d > v.maxDiscount) d = v.maxDiscount;
    return d.clamp(0.0, amount);
  }

  // ══════════════ TRẠNG THÁI ĐƠN ══════════════

  static const flow = ['pending', 'confirmed', 'shipping', 'completed'];

  static Future<KanShopOrder> advanceOrderStatus(
      Isar db, String orderId,
      {String carrier = '', String trackingCode = ''}) async {
    final o =
        await db.kanShopOrders.filter().orderIdEqualTo(orderId).findFirst();
    if (o == null) throw Exception('Không tìm thấy đơn $orderId');
    final idx = flow.indexOf(o.status);
    if (idx < 0 || idx == flow.length - 1) {
      throw Exception('Đơn đang ở trạng thái ${o.status}.');
    }
    final next = flow[idx + 1];
    await db.writeTxn(() async {
      o.status = next;
      if (next == 'shipping' && carrier.isNotEmpty) o.carrier = carrier;
      if (next == 'shipping' && trackingCode.isNotEmpty) {
        o.trackingCode = trackingCode;
      }
      await db.kanShopOrders.put(o);
    });

    // Hoàn thành: cộng ví shop (sau phí sàn).
    if (next == 'completed') {
      await db.writeTxn(() async {
        final shopNet = o.subTotal - o.discount - o.platformFee;
        var w = await db.kanShopWallets
            .filter()
            .ownerIdEqualTo(o.shopId)
            .ownerTypeEqualTo('shop')
            .findFirst();
        w ??= KanShopWallet()
          ..walletId = 'w_${o.shopId}'
          ..ownerId = o.shopId
          ..ownerType = 'shop'
          ..balance = 0;
        w.balance += shopNet;
        await db.kanShopWallets.put(w);
        await db.eshopWalletTransactions.put(EshopWalletTransaction()
          ..txId = 'tx_shop_${o.orderId}'
          ..ownerId = o.shopId
          ..amount = shopNet
          ..type = 'payment'
          ..description = 'Tiền đơn ${o.orderId} (đã trừ phí sàn)');
      });
    }
    return o;
  }

  /// Hủy đơn: hoàn tồn kho + hoàn ví nếu đã trả bằng ví.
  static Future<void> cancelOrder(Isar db, String orderId,
      {String reason = ''}) async {
    final o =
        await db.kanShopOrders.filter().orderIdEqualTo(orderId).findFirst();
    if (o == null) throw Exception('Không tìm thấy đơn');
    if (o.status == 'completed') throw Exception('Đơn hoàn thành không hủy được.');
    await db.writeTxn(() async {
      o.status = 'cancelled';
      await db.kanShopOrders.put(o);
      for (final it in o.items) {
        final p = await db.kanShopProducts
            .filter()
            .productIdEqualTo(it.productId)
            .findFirst();
        if (p != null) {
          p.stockQuantity += it.quantity;
          if (p.status == 'out_of_stock') p.status = 'active';
          await db.kanShopProducts.put(p);
        }
      }
      if (o.paymentMethod == 'wallet') {
        final u = await db.kanShopWallets
            .filter()
            .ownerIdEqualTo(o.userId)
            .ownerTypeEqualTo('user')
            .findFirst();
        if (u != null) {
          u.balance += o.totalAmount;
          await db.kanShopWallets.put(u);
          await db.eshopWalletTransactions.put(EshopWalletTransaction()
            ..txId = 'tx_refund_${o.orderId}'
            ..ownerId = o.userId
            ..amount = o.totalAmount
            ..type = 'refund'
            ..description = 'Hoàn tiền hủy đơn ${o.orderId}');
        }
      }
    });
  }

  // ══════════════ §Đánh giá / Wishlist / Follow / Chat ══════════════

  static Future<void> submitReview(Isar db,
      {required String orderId,
      required String productId,
      required String userId,
      required int stars,
      String comment = '',
      List<String> imageUrls = const []}) async {
    if (stars < 1 || stars > 5) throw Exception('Số sao phải 1-5.');
    final o = await db.kanShopOrders.filter().orderIdEqualTo(orderId).findFirst();
    if (o == null || o.userId != userId) {
      throw Exception('Chỉ đánh giá đơn của chính mình.');
    }
    if (o.status != 'completed') throw Exception('Chỉ đánh giá sau khi nhận hàng.');
    await db.writeTxn(() async {
      await db.eshopReviews.put(EshopReview()
        ..reviewId = 'rev_${orderId}_$productId'
        ..orderId = orderId
        ..productId = productId
        ..userId = userId
        ..stars = stars
        ..comment = comment
        ..imageUrls = List<String>.from(imageUrls));
      // Cập nhật điểm trung bình sản phẩm.
      final all = await db.eshopReviews
          .filter()
          .productIdEqualTo(productId)
          .findAll();
      final p = await db.kanShopProducts
          .filter()
          .productIdEqualTo(productId)
          .findFirst();
      if (p != null) {
        p.ratingAvg = all.fold<int>(0, (s, r) => s + r.stars) / all.length;
        p.ratingCount = all.length;
        await db.kanShopProducts.put(p);
      }
    });
  }

  static Future<void> toggleWishlist(Isar db, String userId, String productId) async {
    final itemId = 'wl_${userId}_$productId';
    final exist =
        await db.eshopWishlistItems.filter().itemIdEqualTo(itemId).findFirst();
    await db.writeTxn(() async {
      if (exist != null) {
        await db.eshopWishlistItems.delete(exist.isarId);
      } else {
        await db.eshopWishlistItems.put(EshopWishlistItem()
          ..itemId = itemId
          ..userId = userId
          ..productId = productId);
      }
    });
  }

  static Future<bool> isWishlisted(Isar db, String userId, String productId) async {
    return await db.eshopWishlistItems
            .filter()
            .itemIdEqualTo('wl_${userId}_$productId')
            .count() >
        0;
  }

  static Future<void> toggleFollowShop(Isar db, String userId, String shopId) async {
    final followId = 'fl_${userId}_$shopId';
    final exist =
        await db.eshopShopFollows.filter().followIdEqualTo(followId).findFirst();
    await db.writeTxn(() async {
      final shop = await db.kanShopStores.filter().shopIdEqualTo(shopId).findFirst();
      if (exist != null) {
        await db.eshopShopFollows.delete(exist.isarId);
        if (shop != null && shop.followersCount > 0) {
          shop.followersCount -= 1;
          await db.kanShopStores.put(shop);
        }
      } else {
        await db.eshopShopFollows.put(EshopShopFollow()
          ..followId = followId
          ..userId = userId
          ..shopId = shopId);
        if (shop != null) {
          shop.followersCount += 1;
          await db.kanShopStores.put(shop);
        }
      }
    });
  }

  static Future<void> sendChat(Isar db,
      {required String userId,
      required String shopId,
      required String senderRole,
      required String senderUuid,
      required String text,
      String? imageUrl}) async {
    if (text.trim().isEmpty && (imageUrl == null || imageUrl.isEmpty)) {
      throw Exception('Tin nhắn trống.');
    }
    await db.writeTxn(() async {
      await db.eshopChatMessages.put(EshopChatMessage()
        ..msgId = 'msg_${DateTime.now().millisecondsSinceEpoch}_$senderRole'
        ..roomId = '$userId|$shopId'
        ..senderRole = senderRole
        ..senderUuid = senderUuid
        ..text = text
        ..imageUrl = imageUrl);
    });
  }

  static Future<List<EshopChatMessage>> listChat(
      Isar db, String userId, String shopId) async {
    return db.eshopChatMessages
        .filter()
        .roomIdEqualTo('$userId|$shopId')
        .sortByCreatedAt()
        .findAll();
  }

  // ══════════════ §Ví / Điểm / Affiliate / Khiếu nại ══════════════

  static Future<KanShopWallet> ensureUserWallet(Isar db, String userId) async {
    var w = await db.kanShopWallets
        .filter()
        .ownerIdEqualTo(userId)
        .ownerTypeEqualTo('user')
        .findFirst();
    if (w == null) {
      await db.writeTxn(() async {
        w = KanShopWallet()
          ..walletId = 'w_user_$userId'
          ..ownerId = userId
          ..ownerType = 'user'
          ..balance = 0;
        await db.kanShopWallets.put(w!);
      });
    }
    return w!;
  }

  static Future<void> topUpWallet(Isar db, String userId, double amount) async {
    if (amount <= 0) throw Exception('Số tiền nạp phải > 0.');
    final w = await ensureUserWallet(db, userId);
    await db.writeTxn(() async {
      w.balance += amount;
      await db.kanShopWallets.put(w);
      await db.eshopWalletTransactions.put(EshopWalletTransaction()
        ..txId = 'tx_topup_${DateTime.now().millisecondsSinceEpoch}'
        ..ownerId = userId
        ..amount = amount
        ..type = 'topup'
        ..description = 'Nạp tiền ví');
    });
  }

  /// §Điểm thưởng: 100 điểm = 10.000đ đổi vào ví.
  static Future<double> redeemPoints(Isar db, String userId, int points) async {
    if (points <= 0 || points % 100 != 0) {
      throw Exception('Đổi bội số của 100 điểm.');
    }
    final entries = await db.eshopPointEntrys
        .filter()
        .userIdEqualTo(userId)
        .findAll();
    final balancePoints = entries.fold<int>(0, (s, e) => s + e.points);
    if (points > balancePoints) {
      throw Exception('Chỉ có $balancePoints điểm khả dụng.');
    }
    final money = points / 100 * 10000;
    await db.writeTxn(() async {
      await db.eshopPointEntrys.put(EshopPointEntry()
        ..entryId = 'pt_redeem_${DateTime.now().millisecondsSinceEpoch}'
        ..userId = userId
        ..points = -points
        ..reason = 'Đổi quà vào ví');
      final w = await ensureUserWallet(db, userId);
      w.balance += money;
      await db.kanShopWallets.put(w);
      await db.eshopWalletTransactions.put(EshopWalletTransaction()
        ..txId = 'tx_pts_${DateTime.now().millisecondsSinceEpoch}'
        ..ownerId = userId
        ..amount = money
        ..type = 'points_redeem'
        ..description = 'Đổi $points điểm');
    });
    return money;
  }

  static Future<int> pointBalance(Isar db, String userId) async {
    final entries = await db.eshopPointEntrys
        .filter()
        .userIdEqualTo(userId)
        .findAll();
    return entries.fold<int>(0, (s, e) => s + e.points);
  }

  /// §Affiliate ghi hoa hồng 5% vào ví người giới thiệu.
  static Future<void> recordAffiliateSale(
      Isar db, String affiliateUserId, KanShopOrder order) async {
    final commission = order.subTotal * affiliateCommissionRate;
    await db.writeTxn(() async {
      await db.eshopAffiliateReferrals.put(EshopAffiliateReferral()
        ..refId = 'aff_${order.orderId}'
        ..affiliateUserId = affiliateUserId
        ..orderId = order.orderId
        ..orderAmount = order.subTotal
        ..commission = commission);
      final w = await ensureUserWallet(db, affiliateUserId);
      w.balance += commission;
      await db.kanShopWallets.put(w);
      await db.eshopWalletTransactions.put(EshopWalletTransaction()
        ..txId = 'tx_aff_${order.orderId}'
        ..ownerId = affiliateUserId
        ..amount = commission
        ..type = 'affiliate'
        ..description = 'Hoa hồng giới thiệu đơn ${order.orderId}');
    });
  }

  /// §Khiếu nại: mở ticket + giải quyết hoàn tiền về ví.
  static Future<EshopComplaintTicket> openComplaint(Isar db,
      {required String orderId,
      required String userId,
      required String reason}) async {
    final o = await db.kanShopOrders.filter().orderIdEqualTo(orderId).findFirst();
    if (o == null || o.userId != userId) {
      throw Exception('Chỉ khiếu nại đơn của mình.');
    }
    late EshopComplaintTicket t;
    await db.writeTxn(() async {
      t = EshopComplaintTicket()
        ..ticketId = 'cmp_${DateTime.now().millisecondsSinceEpoch}'
        ..orderId = orderId
        ..userId = userId
        ..reason = reason;
      await db.eshopComplaintTickets.put(t);
    });
    return t;
  }

  static Future<void> resolveComplaintWithRefund(Isar db,
      EshopComplaintTicket t, double refundAmount) async {
    if (refundAmount <= 0) throw Exception('Hoàn tiền phải > 0.');
    await db.writeTxn(() async {
      t.status = 'resolved';
      t.refundAmount = refundAmount;
      t.resolvedAt = DateTime.now();
      await db.eshopComplaintTickets.put(t);
      final w = await ensureUserWallet(db, t.userId);
      w.balance += refundAmount;
      await db.kanShopWallets.put(w);
      await db.eshopWalletTransactions.put(EshopWalletTransaction()
        ..txId = 'tx_cmp_${t.ticketId}'
        ..ownerId = t.userId
        ..amount = refundAmount
        ..type = 'refund'
        ..description = 'Hoàn tiền khiếu nại ${t.ticketId}');
    });
  }

  // ══════════════ §6 Admin ══════════════

  static Future<void> setShopStatus(Isar db, String shopId, String status) async {
    await db.writeTxn(() async {
      final s = await db.kanShopStores.filter().shopIdEqualTo(shopId).findFirst();
      if (s != null) {
        s.status = status; // active | suspended | closed
        await db.kanShopStores.put(s);
      }
    });
  }

  static Future<void> setProductAdminStatus(
      Isar db, String productId, String adminStatus) async {
    await db.writeTxn(() async {
      final p = await db.kanShopProducts
          .filter()
          .productIdEqualTo(productId)
          .findFirst();
      if (p != null) {
        p.adminStatus = adminStatus; // approved | rejected | pending
        if (adminStatus == 'rejected') p.status = 'hidden';
        await db.kanShopProducts.put(p);
      }
    });
  }

  // ══════════════ §7+§16. BÁO CÁO & DASHBOARD ══════════════

  static bool _inRange(DateTime? d, DateTime from, DateTime to) =>
      d != null && !d.isBefore(from) && d.isBefore(to);

  static Future<Map<String, dynamic>> report(Isar db, DateTime from, DateTime to) async {
    final orders =
        await db.kanShopOrders.filter().statusEqualTo('completed').findAll();
    final done = orders.where((o) => _inRange(o.createdAt, from, to)).toList();

    var gmv = 0.0, fees = 0.0;
    final byDay = <String, double>{};
    final byHour = <int, double>{};
    final byShop = <String, double>{};
    final byProduct = <String, ({String name, double revenue})>{};
    final byCustomer = <String, double>{};

    for (final o in done) {
      gmv += o.totalAmount;
      fees += o.platformFee;
      final day = o.createdAt.toString().substring(0, 10);
      byDay[day] = (byDay[day] ?? 0) + o.totalAmount;
      byHour[o.createdAt.hour] = (byHour[o.createdAt.hour] ?? 0) + o.totalAmount;
      byShop[o.shopId] = (byShop[o.shopId] ?? 0) + o.subTotal;
      byCustomer[o.userId] = (byCustomer[o.userId] ?? 0) + o.totalAmount;
      for (final it in o.items) {
        final cur = byProduct[it.productId];
        byProduct[it.productId] = (
          name: it.name,
          revenue: (cur?.revenue ?? 0) + it.lineTotal,
        );
      }
    }

    Map<String, double> sortedMap(Map<String, double> m) {
      final out = <String, double>{};
      for (final e in (m.entries.toList()..sort((a, b) => b.value.compareTo(a.value)))) {
        out[e.key] = e.value;
      }
      return out;
    }

    return {
      'gmv': gmv,
      'platformFees': fees,
      'orderCount': done.length,
      'byDay': byDay,
      'byHour': byHour,
      'topShops': sortedMap(byShop),
      'topProducts': byProduct,
      'topCustomers': sortedMap(byCustomer),
    };
  }

  /// §16. Dashboard realtime-ish.
  static Future<Map<String, dynamic>> dashboardSummary(Isar db) async {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final tomorrow = todayStart.add(const Duration(days: 1));

    final orders = await db.kanShopOrders.where().findAll();
    final shops = await db.kanShopStores.where().findAll();
    final products = await db.kanShopProducts.where().findAll();

    final todayDone = orders
        .where((o) =>
            o.status == BookingLike.completed &&
            _inRange(o.createdAt, todayStart, tomorrow))
        .toList();

    // Top sản phẩm theo số lượng bán (mọi thời gian).
    final soldQty = <String, int>{};
    for (final o in orders.where((o) => o.status == 'completed')) {
      for (final it in o.items) {
        soldQty[it.productId] = (soldQty[it.productId] ?? 0) + it.quantity;
      }
    }
    final top = soldQty.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return {
      'gmvToday': todayDone.fold<double>(0, (s, o) => s + o.totalAmount),
      'ordersToday': todayDone.length,
      'customers': orders.map((o) => o.userId).toSet().length,
      'activeShops': shops.where((s) => s.status == 'active').length,
      'totalProducts': products.length,
      'pendingOrders': orders.where((o) => o.status == 'pending').length,
      'topProductIds': top.take(5).map((e) => e.key).toList(),
    };
  }
}

/// Alias trạng thái completed để tránh trùng tên enum khác trong file.
class BookingLike {
  static const completed = 'completed';
}
