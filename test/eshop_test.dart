import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvncrm/services/module_backup_service.dart';
import 'package:kanposvn/modules/kanposvneshop/models/eshop_ops_models.dart';
import 'package:kanposvn/modules/kanposvneshop/models/eshop_order.dart';
import 'package:kanposvn/modules/kanposvneshop/models/eshop_cart.dart';
import 'package:kanposvn/modules/kanposvneshop/models/eshop_category.dart';
import 'package:kanposvn/modules/kanposvneshop/models/eshop_product.dart';
import 'package:kanposvn/modules/kanposvneshop/models/eshop_shop.dart';
import 'package:kanposvn/modules/kanposvneshop/models/eshop_wallet.dart';
import 'package:kanposvn/modules/kanposvneshop/services/eshop_business_logic.dart';
import 'package:kanposvn/modules/kanposvneshop/services/eshop_isar_service.dart';
import 'package:kanposvn/modules/kanposvneshop/services/eshop_seed_data.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

class _FakePathProvider extends PathProviderPlatform {
  final String dirPath;
  _FakePathProvider(this.dirPath);

  @override
  Future<String?> getApplicationDocumentsPath() async => dirPath;
}

void main() {
  late Directory tempDir;
  late Isar db;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
    tempDir = await Directory.systemTemp.createTemp('eshop_test');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);

    db = await EshopIsarService().db;
    await EshopSeedData.seedIfEmpty(db);
  });

  tearDownAll(() async {
    try {
      await db.close();
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  group('Seed dữ liệu mẫu theo kanposvneshop.md', () {
    test('§Shop + §Danh mục đa cấp (Điện thoại > Android > Samsung)', () async {
      expect(await db.kanShopStores.count(), 3);
      final samsung =
          await db.kanShopCategorys.filter().categoryIdEqualTo('cat_samsung').findFirst();
      expect(samsung!.parentId, 'cat_android');
      final android = await db.kanShopCategorys
          .filter()
          .categoryIdEqualTo(samsung.parentId!)
          .findFirst();
      expect(android!.parentId, 'cat_dt'); // 3 cấp
    });
    test('§Sản phẩm: hết hàng / combo / chờ duyệt', () async {
      final products = await db.kanShopProducts.where().findAll();
      expect(products.length, 6);
      expect(products.any((p) => p.status == 'out_of_stock'), isTrue);
      expect(products.any((p) => p.isCombo2x1), isTrue);
      expect(products.any((p) => p.adminStatus == 'pending'), isTrue);
    });
    test('§Flash Sale đang chạy còn hạn mức', () async {
      final fs = await db.eshopFlashSales.where().findFirst();
      expect(fs!.salePrice, 129000);
      expect(fs.soldQty, lessThan(fs.limitedQty));
    });
    test('§Voucher platform % + shop tiền mặt', () async {
      final vouchers = await db.eshopVouchers.where().findAll();
      expect(vouchers.map((v) => v.scope).toSet(),
          containsAll(['platform', 'shop']));
    });
  });

  group('Giỏ hàng nhiều shop', () {
    test('Thêm giỏ: chặn quá tồn kho + chặn sản phẩm ẩn/hết', () async {
      await EshopBusinessLogic.addToCart(db,
          userId: 'kh_hung', productId: 'sp_galaxy_s24');
      expect(
        () => EshopBusinessLogic.addToCart(db,
            userId: 'kh_hung',
            productId: 'sp_galaxy_s24',
            quantity: 999),
        throwsException,
      );
      // iPhone hết hàng.
      expect(
        () => EshopBusinessLogic.addToCart(db,
            userId: 'kh_hung', productId: 'sp_iphone15'),
        throwsException,
      );
    });

    test('Cập nhật số lượng + xóa khi về 0', () async {
      await EshopBusinessLogic.updateCartQty(db,
          userId: 'kh_hung', productId: 'sp_galaxy_s24', newQty: 2);
      final item = await db.kanShopCartItems
          .filter()
          .userIdEqualTo('kh_hung')
          .productIdEqualTo('sp_galaxy_s24')
          .findFirst();
      expect(item!.quantity, 2);
      await EshopBusinessLogic.updateCartQty(db,
          userId: 'kh_hung', productId: 'sp_galaxy_s24', newQty: 0);
      expect(
        await db.kanShopCartItems
            .filter()
            .userIdEqualTo('kh_hung')
            .productIdEqualTo('sp_galaxy_s24')
            .count(),
        0,
      );
    });

    test('Flash Sale giá hiệu lực 129k thay vì 180k', () async {
      final price = await EshopBusinessLogic.effectivePrice(db, 'sp_aothun_den');
      expect(price, 129000);
    });
  });

  group('§Đặt hàng: tách đơn theo shop + voucher + combo', () {
    test('Giỏ 2 shop -> 2 đơn; voucher platform chỉ vào 1 đơn; trừ kho',
        () async {
      // Giỏ: áo đen (fashion) x2 + sách (book) x1.
      await EshopBusinessLogic.addToCart(db,
          userId: 'kh_hung', productId: 'sp_aothun_den', quantity: 2);
      await EshopBusinessLogic.addToCart(db,
          userId: 'kh_hung', productId: 'sp_sach_nghigiau');

      final result = await EshopBusinessLogic.checkout(db,
          userId: 'kh_hung',
          voucherCode: 'SALE10',
          paymentMethod: 'COD');
      expect(result.orders.length, 2); // 2 shop -> 2 đơn

      for (final o in result.orders) {
        expect(o.status, 'pending');
        expect(o.shippingFee, 20000);
        // Phí sàn tính trên tiền sau giảm giá (thông lệ sàn TMĐT).
        expect(o.platformFee, closeTo((o.subTotal - o.discount) * 0.05, 0.01));
      }

      // Đơn fashion: sub = 129k*2=258k, giảm 10% clamp 100k? 25.8k < 100k -> 25.8k.
      final fashionOrder =
          result.orders.firstWhere((o) => o.shopId == 'shop_fashion');
      expect(fashionOrder.voucherCode, 'SALE10');
      expect(fashionOrder.discount, closeTo(25800, 0.01));

      // Tồn kho áo đen 50 -> 48.
      final ao = await db.kanShopProducts
          .filter()
          .productIdEqualTo('sp_aothun_den')
          .findFirst();
      expect(ao!.stockQuantity, 48);

      // Giỏ đã dọn.
      expect(
        await db.kanShopCartItems.filter().userIdEqualTo('kh_hung').count(),
        0,
      );
    });

    test('Combo 2 tặng 1: mua 3 chiếc tính tiền 2', () async {
      await EshopBusinessLogic.addToCart(db,
          userId: 'kh_lan', productId: 'sp_aothun_trang', quantity: 3);
      final result = await EshopBusinessLogic.checkout(db, userId: 'kh_lan');
      final order = result.orders.first;
      // 290k * (3-1) = 580k.
      expect(order.items.first.quantity, 3);
      expect(order.subTotal, closeTo(580000, 0.01));
    });

    test('Trả bằng ví: trừ đúng số dư + ví thiếu thì chặn', () async {
      // kh_hung có sẵn ví 500k từ seed... nhưng đã tiêu ở trên? Chưa — seed
      // tạo ví 500k, checkout đầu dùng COD nên vẫn còn.
      await EshopBusinessLogic.topUpWallet(db, 'kh_hung', 200000);
      final wallet =
          await db.kanShopWallets.filter().ownerIdEqualTo('kh_hung').findFirst();

      await EshopBusinessLogic.addToCart(db,
          userId: 'kh_hung', productId: 'sp_sach_nghigiau', quantity: 2); // 198k
      final balanceBefore = wallet!.balance;

      final result = await EshopBusinessLogic.checkout(db,
          userId: 'kh_hung', payWithWallet: true);
      final after =
          await db.kanShopWallets.filter().ownerIdEqualTo('kh_hung').findFirst();
      // balanceBefore đã gồm 200k nạp phía trên.
      expect(after!.balance, closeTo(balanceBefore - result.grandTotal, 0.01));

      // Mua vượt số dư -> chặn.
      await EshopBusinessLogic.addToCart(db,
          userId: 'kh_hung', productId: 'sp_galaxy_s24');
      expect(() => EshopBusinessLogic.checkout(db, userId: 'kh_hung', payWithWallet: true),
          throwsException);
      // Dọn giỏ để không ảnh hưởng test sau.
      await EshopBusinessLogic.updateCartQty(db,
          userId: 'kh_hung', productId: 'sp_galaxy_s24', newQty: 0);
    });
  });

  group('Trạng thái đơn + vận chuyển + hoàn thành cộng ví shop', () {
    test('pending → confirmed → shipping(GHN+tracking) → completed', () async {
      final orders = await db.kanShopOrders
          .filter()
          .userIdEqualTo('kh_hung')
          .statusEqualTo('pending')
          .findAll();
      final o = orders.first;

      var updated = await EshopBusinessLogic.advanceOrderStatus(db, o.orderId);
      expect(updated.status, 'confirmed');
      updated = await EshopBusinessLogic.advanceOrderStatus(db, o.orderId,
          carrier: 'GHN', trackingCode: 'GHN123VN');
      expect(updated.status, 'shipping');
      expect(updated.carrier, 'GHN');
      expect(updated.trackingCode, 'GHN123VN');

      final shopWalletBefore = await db.kanShopWallets
          .filter()
          .ownerIdEqualTo(o.shopId)
          .ownerTypeEqualTo('shop')
          .findFirst();

      updated = await EshopBusinessLogic.advanceOrderStatus(db, o.orderId);
      expect(updated.status, 'completed');

      final shopWalletAfter = await db.kanShopWallets
          .filter()
          .ownerIdEqualTo(o.shopId)
          .ownerTypeEqualTo('shop')
          .findFirst();
      final expectedNet =
          o.subTotal - o.discount - o.platformFee + (shopWalletBefore?.balance ?? 0);
      expect(shopWalletAfter!.balance, closeTo(expectedNet, 0.01));

      // Vượt quá flow -> chặn.
      expect(() => EshopBusinessLogic.advanceOrderStatus(db, o.orderId),
          throwsException);
    });

    test('Hủy đơn: hoàn tồn kho + hoàn ví nếu trả bằng ví', () async {
      await EshopBusinessLogic.addToCart(db,
          userId: 'kh_tu', productId: 'sp_sach_nghigiau', quantity: 2);
      final stockBefore = (await db.kanShopProducts
              .filter()
              .productIdEqualTo('sp_sach_nghigiau')
              .findFirst())!
          .stockQuantity;
      await EshopBusinessLogic.topUpWallet(db, 'kh_tu', 300000);
      final result = await EshopBusinessLogic.checkout(db,
          userId: 'kh_tu', payWithWallet: true);
      final order = result.orders.first;

      final stockAfterBuy = (await db.kanShopProducts
              .filter()
              .productIdEqualTo('sp_sach_nghigiau')
              .findFirst())!
          .stockQuantity;
      expect(stockAfterBuy, stockBefore - 2);

      await EshopBusinessLogic.cancelOrder(db, order.orderId, reason: 'đổi ý');
      final stockRestored = (await db.kanShopProducts
              .filter()
              .productIdEqualTo('sp_sach_nghigiau')
              .findFirst())!
          .stockQuantity;
      expect(stockRestored, stockBefore);

      final refundTx = await db.eshopWalletTransactions
          .filter()
          .typeEqualTo('refund')
          .sortByCreatedAtDesc()
          .findFirst();
      expect(refundTx, isNotNull);
    });
  });

  group('§Đánh giá + Wishlist + Follow + Chat', () {
    test('Review sau khi hoàn thành -> cập nhật ratingAvg sản phẩm', () async {
      final completedOrders = await db.kanShopOrders
          .filter()
          .userIdEqualTo('kh_hung')
          .statusEqualTo('completed')
          .findAll();
      final target = completedOrders.first.items.first;

      await EshopBusinessLogic.submitReview(db,
          orderId: completedOrders.first.orderId,
          productId: target.productId,
          userId: 'kh_hung',
          stars: 4,
          comment: 'Tạm ổn',
          imageUrls: ['https://img/1.jpg']);

      final p = await db.kanShopProducts
          .filter()
          .productIdEqualTo(target.productId)
          .findFirst();
      expect(p!.ratingCount, greaterThanOrEqualTo(1));
      expect(p.ratingAvg, greaterThan(0));
      // Chặn đánh giá sai sao.
      expect(() => EshopBusinessLogic.submitReview(db,
          orderId: completedOrders.first.orderId,
          productId: target.productId,
          userId: 'kh_hung',
          stars: 9), throwsException);
    });

    test('Wishlist toggle on/off', () async {
      await EshopBusinessLogic.toggleWishlist(db, 'kh_hung', 'sp_sach_nghigiau');
      expect(await EshopBusinessLogic.isWishlisted(db, 'kh_hung', 'sp_sach_nghigiau'), isTrue);
      await EshopBusinessLogic.toggleWishlist(db, 'kh_hung', 'sp_sach_nghigiau');
      expect(await EshopBusinessLogic.isWishlisted(db, 'kh_hung', 'sp_sach_nghigiau'), isFalse);
    });

    test('Follow shop: followersCount tăng/giảm', () async {
      final before =
          (await db.kanShopStores.filter().shopIdEqualTo('shop_book').findFirst())!
              .followersCount;
      await EshopBusinessLogic.toggleFollowShop(db, 'kh_hung', 'shop_book');
      expect(
        (await db.kanShopStores.filter().shopIdEqualTo('shop_book').findFirst())!
            .followersCount,
        before + 1,
      );
      await EshopBusinessLogic.toggleFollowShop(db, 'kh_hung', 'shop_book');
      expect(
        (await db.kanShopStores.filter().shopIdEqualTo('shop_book').findFirst())!
            .followersCount,
        before,
      );
    });

    test('Chat khách↔shop gửi và đọc đúng thứ tự', () async {
      await EshopBusinessLogic.sendChat(db,
          userId: 'kh_hung',
          shopId: 'shop_phone',
          senderRole: 'customer',
          senderUuid: 'kh_hung',
          text: 'Máy còn bảo hành không shop?');
      await EshopBusinessLogic.sendChat(db,
          userId: 'kh_hung',
          shopId: 'shop_phone',
          senderRole: 'shop',
          senderUuid: 'seller_phones',
          text: 'Dạ còn 12 tháng ạ.');
      final msgs = await EshopBusinessLogic.listChat(db, 'kh_hung', 'shop_phone');
      expect(msgs.length, 2);
      expect(msgs.first.senderRole, 'customer');
    });
  });

  group('§Ví + Điểm thưởng + Affiliate + Khiếu nại', () {
    test('Đổi điểm: 100 điểm = 10k, sai bội số chặn', () async {
      // kh_hung tích được điểm từ các đơn ví phía trên.
      final points = await EshopBusinessLogic.pointBalance(db, 'kh_hung');
      expect(points, greaterThanOrEqualTo(19)); // 2 đơn wallet
      final redeemable = (points ~/ 100) * 100;
      if (redeemable >= 100) {
        final walletBefore =
            (await db.kanShopWallets.filter().ownerIdEqualTo('kh_hung').findFirst())!
                .balance;
        final money = await EshopBusinessLogic.redeemPoints(db, 'kh_hung', redeemable);
        expect(money, redeemable / 100 * 10000);
        final walletAfter =
            (await db.kanShopWallets.filter().ownerIdEqualTo('kh_hung').findFirst())!
                .balance;
        expect(walletAfter, closeTo(walletBefore + money, 0.01));
      }
      expect(() => EshopBusinessLogic.redeemPoints(db, 'kh_hung', 50),
          throwsException);
    });

    test('Affiliate: hoa hồng 5% vào ví người giới thiệu', () async {
      final orders = await db.kanShopOrders.filter().statusEqualTo('completed').findAll();
      final o = orders.first;
      final affBalanceBefore =
          (await EshopBusinessLogic.ensureUserWallet(db, 'kh_affiliate')).balance;
      await EshopBusinessLogic.recordAffiliateSale(db, 'kh_affiliate', o);
      final affAfter =
          (await EshopBusinessLogic.ensureUserWallet(db, 'kh_affiliate')).balance;
      expect(affAfter, closeTo(affBalanceBefore + o.subTotal * 0.05, 0.01));
      final ref = await db.eshopAffiliateReferrals
          .filter()
          .orderIdEqualTo(o.orderId)
          .findFirst();
      expect(ref, isNotNull);
    });

    test('Khiếu nại + hoàn tiền về ví', () async {
      final orders = await db.kanShopOrders
          .filter()
          .userIdEqualTo('kh_hung')
          .statusEqualTo('completed')
          .findAll();
      final t = await EshopBusinessLogic.openComplaint(db,
          orderId: orders.first.orderId,
          userId: 'kh_hung',
          reason: 'Hàng lỗi vặt');
      expect(t.status, 'open');
      final walletBefore =
          (await db.kanShopWallets.filter().ownerIdEqualTo('kh_hung').findFirst())!
              .balance;
      await EshopAdvancedShim.resolve(db, t, 100000);
      expect(t.status, 'resolved');
      final walletAfter =
          (await db.kanShopWallets.filter().ownerIdEqualTo('kh_hung').findFirst())!
              .balance;
      expect(walletAfter, closeTo(walletBefore + 100000, 0.01));
    });
  });

  group('§Admin + §7+§16 Báo cáo/Dashboard', () {
    test('Admin duyệt/từ chối sản phẩm, khóa shop', () async {
      await EshopBusinessLogic.setProductAdminStatus(db, 'sp_hoodie', 'approved');
      expect(
        (await db.kanShopProducts.filter().productIdEqualTo('sp_hoodie').findFirst())!
            .adminStatus,
        'approved',
      );
      await EshopBusinessLogic.setShopStatus(db, 'shop_fashion', 'suspended');
      expect(
        (await db.kanShopStores.filter().shopIdEqualTo('shop_fashion').findFirst())!
            .status,
        'suspended',
      );
      // Trả lại như cũ cho các test khác (nếu chạy lại).
      await EshopBusinessLogic.setShopStatus(db, 'shop_fashion', 'active');
    });

    test('Báo cáo GMV/phí sàn/top shop-khách + theo ngày/giờ', () async {
      final r = await EshopBusinessLogic.report(
          db, DateTime(2020), DateTime(2100));
      expect(r['gmv'], greaterThan(0));
      expect(r['platformFees'], greaterThan(0));
      final byDay = r['byDay'] as Map<String, double>;
      expect(byDay.isNotEmpty, isTrue);
      final byHour = r['byHour'] as Map<int, double>;
      expect(byHour.isNotEmpty, isTrue);
      final topProducts = r['topProducts'] as Map<String, dynamic>;
      expect(topProducts.isNotEmpty, isTrue);
    });

    test('Dashboard §16 đủ chỉ số', () async {
      final d = await EshopBusinessLogic.dashboardSummary(db);
      expect(d['customers'], greaterThanOrEqualTo(3));
      expect(d['activeShops'], 3);
      expect(d['totalProducts'], 6);
      expect(d['completedBookings'], isNull); // không nhầm module khác
      expect(d['topProductIds'], isNotEmpty);
    });
  });

  group('XXXI. Sao lưu', () {
    test('Module KanShop đăng ký backup chung (CRM)', () {
      expect(ModuleBackupService.modules.any((m) => m.id == 'eshop'), isTrue);
    });
  });
}

class EshopAdvancedShim {
  static Future<void> resolve(Isar db, EshopComplaintTicket t, double amount) =>
      EshopBusinessLogic.resolveComplaintWithRefund(db, t, amount);
}
