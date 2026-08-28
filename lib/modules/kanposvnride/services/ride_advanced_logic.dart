import 'dart:math';

import 'package:isar/isar.dart';
import '../../../core/utils/formatters.dart';
import '../models/ride_booking.dart';
import '../models/ride_driver.dart';
import '../models/ride_ops_models.dart';
import '../models/ride_transaction.dart';
import '../models/ride_trip.dart';
import '../models/ride_user.dart';
import 'ride_business_logic.dart';

/// Tính năng nâng cao Giai đoạn 2-3-4 (§43) của KanRide:
/// QR Payment · Ride Sharing · AI điều phối · Dự đoán nhu cầu · Thuê xe tự lái
/// · Giao hàng · Taxi doanh nghiệp · API đối tác · Chat · Số ảo · Thông báo
/// · GeoFence · CSKH hoàn tiền · Nhật ký · Offline Sync.
class RideAdvancedLogic {
  // ══════════════ §35. NHẬT KÝ HỆ THỐNG ══════════════

  static Future<void> audit(Isar db, String action, String actorUuid,
      String detail) async {
    await db.writeTxn(() async {
      await db.rideAuditLogs.put(RideAuditLog()
        ..action = action
        ..actorUuid = actorUuid
        ..detail = detail
        ..createdAt = DateTime.now());
    });
  }

  static Future<List<RideAuditLog>> recentLogs(Isar db,
      {String? action, int limit = 50}) async {
    final q = action == null
        ? db.rideAuditLogs.where().sortByCreatedAtDesc()
        : db.rideAuditLogs.filter().actionEqualTo(action).sortByCreatedAtDesc();
    return q.limit(limit).findAll();
  }

  // ══════════════ GĐ2. QR PAYMENT ══════════════

  /// Sinh chuỗi payload QR cho khách quét thanh toán (định dạng nội bộ).
  static Future<String> generateQrPayment(Isar db, RideBooking b) async {
    if (b.status == BookingStatus.cancelled) {
      throw Exception('Chuyến đã hủy, không thể thanh toán.');
    }
    await audit(db, 'PAYMENT', b.passengerUuid ?? '',
        'Tạo QR ${b.finalPrice}đ cho chuyến ${b.uuid}');
    return 'KANRIDE|PAY|${b.uuid}|${b.finalPrice.round()}|VND';
  }

  /// Xác nhận khách đã quét QR: tạo giao dịch completed + cộng ví tài xế.
  static Future<void> confirmQrPayment(Isar db, String payload) async {
    final parts = payload.split('|');
    if (parts.length < 4 || parts[0] != 'KANRIDE' || parts[1] != 'PAY') {
      throw Exception('Mã QR không hợp lệ.');
    }
    final bookingUuid = parts[2];
    final amount = double.tryParse(parts[3]) ?? 0;
    final b = await db.rideBookings
        .filter()
        .uuidEqualTo(bookingUuid)
        .findFirst();
    if (b == null) throw Exception('Không tìm thấy chuyến từ QR.');
    if (amount < b.finalPrice) throw Exception('Số tiền QR thiếu so với giá.');

    // Chuyến chưa hoàn thành thì chưa có driverEarnings -> tự tính từ giá.
    final earns = b.driverEarnings > 0
        ? b.driverEarnings
        : b.finalPrice * (1 - RideBusinessLogic.commissionRate);

    await db.writeTxn(() async {
      await db.rideTransactions.put(RideTransaction()
        ..uuid = 'tx_qr_${b.uuid}'
        ..userUuid = b.passengerUuid
        ..amount = -b.finalPrice
        ..type = TransactionType.payment
        ..description = 'Thanh toán QR chuyến ${b.uuid}'
        ..createdAt = DateTime.now()
        ..syncStatus = TransactionSyncStatus.pending);

      if (b.driverUuid != null) {
        final d = await db.rideDrivers
            .filter()
            .uuidEqualTo(b.driverUuid!)
            .findFirst();
        if (d != null) {
          d.driverWalletBalance += earns;
          await db.rideDrivers.put(d);
        }
      }
    });
    await audit(db, 'PAYMENT', b.passengerUuid ?? '',
        'QR thanh toán ${b.finalPrice}đ chuyến ${b.uuid}');
  }

  // ══════════════ GĐ3. RIDE SHARING (§12) ══════════════

  /// Tìm chuyến đang chờ cùng loại xe, điểm đón/trả gần nhau để ghép.
  /// Trả về candidate tốt nhất hoặc null.
  static Future<RideBooking?> matchSharedRide(
    Isar db,
    RideBooking mine, {
    double maxPickupKm = 2,
    double maxDropoffKm = 3,
  }) async {
    final candidates = await db.rideBookings
        .filter()
        .not().uuidEqualTo(mine.uuid!)
        .statusEqualTo(BookingStatus.findingDriver)
        .isSharedRideEqualTo(true)
        .requestedVehicleTypeEqualTo(mine.requestedVehicleType)
        .sharedGroupUuidIsNull()
        .findAll();
    double d(RideBooking a, RideBooking c, bool pickup) => sqrt(
            pow((pickup ? a.pickupLat! : a.dropoffLat!) -
                (pickup ? c.pickupLat! : c.dropoffLat!), 2) +
        pow((pickup ? a.pickupLng! : a.dropoffLng!) -
                (pickup ? c.pickupLng! : c.dropoffLng!), 2)) * 111;

    RideBooking? best;
    var bestScore = double.infinity;
    for (final c in candidates) {
      final dp = d(mine, c, true);
      final dd = d(mine, c, false);
      if (dp > maxPickupKm || dd > maxDropoffKm) continue;
      final score = dp + dd;
      if (score < bestScore) {
        bestScore = score;
        best = c;
      }
    }
    return best;
  }

  /// Ghép 2 chuyến thành 1 nhóm: cùng nhóm + chia giảm giá ghép thêm.
  static Future<String> mergeSharedRide(
      Isar db, RideBooking a, RideBooking b) async {
    final group = 'share_${a.uuid!.hashCode.abs()}_${b.uuid!.hashCode.abs()}';
    await db.writeTxn(() async {
      a.sharedGroupUuid = group;
      a.discount += a.finalPrice * 0.10; // thưởng ghép thành công thêm 10%
      a.finalPrice -= a.finalPrice * 0.10;
      await db.rideBookings.put(a);

      b.sharedGroupUuid = group;
      b.discount += b.finalPrice * 0.10;
      b.finalPrice -= b.finalPrice * 0.10;
      b.driverUuid = a.driverUuid; // cùng một tài xế
      await db.rideBookings.put(b);
    });
    return group;
  }

  // ══════════════ GĐ3. AI ĐIỀU PHỐI ══════════════

  /// Chấm điểm tài xế: khoảng cách (60%) + rating (25%) + ít chuyến hôm nay
  /// (15%). Trả về top 1 kèm breakdown.
  static Future<({RideDriver driver, double score})?> dispatchBestDriver(
    Isar db, {
    required double pickupLat,
    required double pickupLng,
    required VehicleType vehicleType,
    int maxRadiusKm = 8,
  }) async {
    final drivers = await db.rideDrivers
        .filter()
        .statusEqualTo(DriverStatus.online)
        .vehicleTypeEqualTo(vehicleType)
        .findAll();
    if (drivers.isEmpty) return null;

    final now = DateTime.now();
    final dayStart = DateTime(now.year, now.month, now.day);
    final trips = await db.kanRideTrips.where().findAll();

    ({RideDriver driver, double score})? best;
    for (final d in drivers) {
      final distKm =
          _haversine(pickupLat, pickupLng, d.currentLat ?? 0, d.currentLng ?? 0);
      if (distKm > maxRadiusKm) continue;
      final distScore =
          1 - (distKm / maxRadiusKm); // gần nhất = 1
      final ratingScore = (d.averageRating / 5).clamp(0.0, 1.0);
      final tripsToday = trips
          .where((t) =>
              t.driverId == d.uuid &&
              t.startTime.isAfter(dayStart))
          .length;
      final loadScore = 1 / (1 + tripsToday);
      final score =
          distScore * 0.6 + ratingScore * 0.25 + loadScore * 0.15;
      if (best == null || score > best.score) best = (driver: d, score: score);
    }
    return best;
  }

  static double _haversine(lat1, lng1, lat2, lng2) {
    const r = 6371.0;
    final dLat = (lat2 - lat1) * pi / 180;
    final dLng = (lng2 - lng1) * pi / 180;
    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1 * pi / 180) *
            cos(lat2 * pi / 180) *
            sin(dLng / 2) *
            sin(dLng / 2);
    return r * 2 * atan2(sqrt(a), sqrt(1 - a));
  }

  // ══════════════ GĐ3/GĐ4. PHÂN TÍCH + DỰ ĐOÁN NHU CẦU ══════════════

  /// Heatmap số chuyến theo giờ trong ngày (từ lịch sử).
  static Future<Map<int, int>> demandHeatmapByHour(Isar db) async {
    final bookings = await db.rideBookings
        .filter()
        .statusEqualTo(BookingStatus.completed)
        .findAll();
    final out = <int, int>{};
    for (final b in bookings) {
      if (b.createdAt == null) continue;
      out[b.createdAt!.hour] = (out[b.createdAt!.hour] ?? 0) + 1;
    }
    return Map.fromEntries(out.entries.toList()..sort((a, b) => a.key.compareTo(b.key)));
  }

  /// AI dự đoán: giờ mục tiêu có nhu cầu cao hơn trung bình không ->
  /// khuyến nghị bật surge.
  static Future<({int expectedTrips, bool recommendSurge})>
      predictDemandByHour(Isar db, int hourOfDay) async {
    final heat = await demandHeatmapByHour(db);
    final expected = heat[hourOfDay] ?? 0;
    final avgAll = heat.isEmpty
        ? 0.0
        : heat.values.fold<int>(0, (s, v) => s + v) / heat.length;
    return (
      expectedTrips: expected,
      recommendSurge: avgAll > 0 && expected > avgAll * 1.3,
    );
  }

  /// Hiệu suất tài xế: số chuyến / tổng chuyến trong kỳ (%).
  static Future<Map<String, double>> driverUtilization(
      Isar db, DateTime from, DateTime to) async {
    final trips = await db.kanRideTrips
        .filter()
        .startTimeBetween(from, to)
        .findAll();
    final total = trips.length;
    if (total == 0) return {};
    final byDriver = <String, int>{};
    for (final t in trips) {
      byDriver[t.driverId] = (byDriver[t.driverId] ?? 0) + 1;
    }
    return {
      for (final e in byDriver.entries) e.key: e.value / total * 100
    };
  }

  // ══════════════ §21+§22. CHAT & GỌI ĐIỆN SỐ ẢO ══════════════

  static Future<void> sendChat(Isar db,
      {required String bookingUuid,
      required String senderRole,
      required String senderUuid,
      required String text,
      String? imageUrl}) async {
    if (text.trim().isEmpty && (imageUrl == null || imageUrl.isEmpty)) {
      throw Exception('Tin nhắn trống.');
    }
    await db.writeTxn(() async {
      await db.rideChatMessages.put(RideChatMessage()
        ..msgId =
            'chat_${DateTime.now().millisecondsSinceEpoch}_$senderRole'
        ..bookingUuid = bookingUuid
        ..senderRole = senderRole
        ..senderUuid = senderUuid
        ..text = text
        ..imageUrl = imageUrl
        ..createdAt = DateTime.now());
    });
  }

  static Future<List<RideChatMessage>> listChat(
      Isar db, String bookingUuid) async {
    return db.rideChatMessages
        .filter()
        .bookingUuidEqualTo(bookingUuid)
        .sortByCreatedAt()
        .findAll();
  }

  /// §22. Cấp số ảo cho cuộc gọi trong chuyến — che 2 số thật.
  static Future<RideMaskedCall> createMaskedCall(
      Isar db, String bookingUuid) async {
    final b = await db.rideBookings
        .filter()
        .uuidEqualTo(bookingUuid)
        .findFirst();
    if (b == null) throw Exception('Không tìm thấy chuyến.');
    final passenger =
        await db.rideUsers.filter().uuidEqualTo(b.passengerUuid!).findFirst();
    final driver =
        await db.rideDrivers.filter().uuidEqualTo(b.driverUuid!).findFirst();
    late RideMaskedCall call;
    await db.writeTxn(() async {
      call = RideMaskedCall()
        ..callId = 'call_${bookingUuid.hashCode.abs()}'
        ..bookingUuid = bookingUuid
        ..virtualNumber =
            'VN-${(bookingUuid.hashCode.abs() % 900000 + 100000)}'
        ..passengerReal = passenger?.phone ?? ''
        ..driverReal = driver?.phone ?? '';
      await db.rideMaskedCalls.put(call);
    });
    return call;
  }

  // ══════════════ §23. THÔNG BÁO ══════════════

  static Future<void> notify(Isar db,
      {required String userUuid,
      required String title,
      required String body,
      String channel = 'push'}) async {
    await db.writeTxn(() async {
      await db.rideNotifications.put(RideNotification()
        ..notifId =
            'ntf_${DateTime.now().millisecondsSinceEpoch}_$userUuid'
        ..userUuid = userUuid
        ..channel = channel
        ..title = title
        ..body = body);
    });
  }

  static Future<int> unreadCount(Isar db, String userUuid) async {
    return db.rideNotifications
        .filter()
        .userUuidEqualTo(userUuid)
        .isReadEqualTo(false)
        .count();
  }

  static Future<void> markAllRead(Isar db, String userUuid) async {
    final unread = await db.rideNotifications
        .filter()
        .userUuidEqualTo(userUuid)
        .isReadEqualTo(false)
        .findAll();
    await db.writeTxn(() async {
      for (final n in unread) {
        n.isRead = true;
        await db.rideNotifications.put(n);
      }
    });
  }

  // ══════════════ §29. GEO FENCE ══════════════

  static Future<bool> isInsideAnyFence(
      Isar db, double lat, double lng) async {
    final fences = await db.rideGeoFences.filter().activeEqualTo(true).findAll();
    if (fences.isEmpty) return true; // không cấu hình -> cho phép mọi nơi
    for (final f in fences) {
      if (_haversine(lat, lng, f.centerLat, f.centerLng) <= f.radiusKm) {
        return true;
      }
    }
    return false;
  }

  // ══════════════ §31. CSKH: TICKET + HOÀN TIỀN ══════════════

  static Future<RideSupportTicket> openTicket(Isar db,
      {required String userUuid,
      required String category,
      required String subject,
      String detail = '',
      String? bookingUuid}) async {
    late RideSupportTicket t;
    await db.writeTxn(() async {
      t = RideSupportTicket()
        ..ticketId = 'TKC_${DateTime.now().millisecondsSinceEpoch}'
        ..bookingUuid = bookingUuid
        ..userUuid = userUuid
        ..category = category
        ..subject = subject
        ..detail = detail;
      await db.rideSupportTickets.put(t);
    });
    await notify(db,
        userUuid: userUuid,
        title: 'Ticket $subject đã tiếp nhận',
        body: 'Chúng tôi sẽ phản hồi trong 24h.',
        channel: 'push');
    return t;
  }

  /// Giải quyết ticket kèm hoàn tiền vào ví khách (§16 Hoàn tiền).
  static Future<void> resolveTicketWithRefund(Isar db, RideSupportTicket t,
      {double refundAmount = 0}) async {
    await db.writeTxn(() async {
      t.status = 'resolved';
      t.refundAmount = refundAmount;
      t.resolvedAt = DateTime.now();
      await db.rideSupportTickets.put(t);

      if (refundAmount > 0) {
        final u =
            await db.rideUsers.filter().uuidEqualTo(t.userUuid).findFirst();
        if (u != null) {
          u.walletBalance += refundAmount;
          await db.rideUsers.put(u);
          await db.rideTransactions.put(RideTransaction()
            ..uuid = 'tx_refund_${t.ticketId}'
            ..userUuid = u.uuid
            ..amount = refundAmount
            ..type = TransactionType.refund
            ..description = 'Hoàn tiền ticket ${t.ticketId}'
            ..createdAt = DateTime.now());
        }
      }
    });
  }

  // ══════════════ GĐ4. THUÊ XE TỰ LÁI ══════════════

  static Future<RideSelfDriveRental> createSelfDrive(Isar db,
      {required String vehiclePlate,
      VehicleType vehicleType = VehicleType.car4Seats,
      required String customerName,
      required String customerPhone,
      required String customerCccd,
      required DateTime startDate,
      required DateTime endDate,
      required double dailyPrice,
      required double deposit}) async {
    if (!endDate.isAfter(startDate)) {
      throw Exception('Ngày trả phải sau ngày nhận.');
    }
    final days = endDate.difference(startDate).inDays + 1;
    late RideSelfDriveRental r;
    await db.writeTxn(() async {
      r = RideSelfDriveRental()
        ..rentalId = 'sd_${DateTime.now().millisecondsSinceEpoch}'
        ..vehiclePlate = vehiclePlate
        ..vehicleType = vehicleType
        ..customerName = customerName
        ..customerPhone = customerPhone
        ..customerCccd = customerCccd
        ..startDate = startDate
        ..endDate = endDate
        ..dailyPrice = dailyPrice
        ..deposit = deposit
        ..status = 'rented';
      await db.rideSelfDriveRentals.put(r);
    });
    await audit(db, 'RENTAL', customerPhone,
        'Thuê tự lái $vehiclePlate $days ngày (${dailyPrice * days}đ)');
    return r;
  }

  static Future<void> returnSelfDrive(Isar db, RideSelfDriveRental r) async {
    await db.writeTxn(() async {
      r.actualReturnTime = DateTime.now();
      r.status = 'returned';
      await db.rideSelfDriveRentals.put(r);
    });
  }

  static Future<List<RideSelfDriveRental>> markOverdueSelfDrive(
      Isar db) async {
    final now = DateTime.now();
    final renting = await db.rideSelfDriveRentals
        .filter()
        .statusEqualTo('rented')
        .findAll();
    final overdue = renting.where((r) => r.endDate.isBefore(now)).toList();
    await db.writeTxn(() async {
      for (final r in overdue) {
        r.status = 'overdue';
        await db.rideSelfDriveRentals.put(r);
      }
    });
    return overdue;
  }

  // ══════════════ GĐ4. GIAO HÀNG / GIAO ĐỒ ĂN ══════════════

  static Future<RideDeliveryOrder> createDelivery(Isar db,
      {required String customerName,
      required String customerPhone,
      required String pickupAddress,
      required String dropoffAddress,
      required String itemNote,
      double weightKg = 0,
      required double fee}) async {
    late RideDeliveryOrder o;
    await db.writeTxn(() async {
      o = RideDeliveryOrder()
        ..orderId = 'dl_${DateTime.now().millisecondsSinceEpoch}'
        ..customerName = customerName
        ..customerPhone = customerPhone
        ..pickupAddress = pickupAddress
        ..dropoffAddress = dropoffAddress
        ..itemNote = itemNote
        ..weightKg = weightKg
        ..fee = fee
        ..status = 'finding_driver';
      await db.rideDeliveryOrders.put(o);
    });
    return o;
  }

  static Future<void> assignDeliveryDriver(
      Isar db, RideDeliveryOrder o, RideDriver d) async {
    if (o.status != 'finding_driver') {
      throw Exception('Đơn không còn ở trạng thái chờ.');
    }
    if (d.status != DriverStatus.online) throw Exception('Tài xế không online.');
    await db.writeTxn(() async {
      o.driverUuid = d.uuid!;
      o.status = 'picked_up'; // đã lấy hàng
      await db.rideDeliveryOrders.put(o);
      d.status = DriverStatus.busy;
      await db.rideDrivers.put(d);
    });
  }

  static Future<void> deliverOrder(Isar db, RideDeliveryOrder o) async {
    if (o.driverUuid.isEmpty) throw Exception('Chưa có tài xế nhận đơn.');
    await db.writeTxn(() async {
      o.status = 'delivered';
      o.completedAt = DateTime.now();
      await db.rideDeliveryOrders.put(o);

      final commission = o.fee * RideBusinessLogic.commissionRate;
      final d = await db.rideDrivers
          .filter()
          .uuidEqualTo(o.driverUuid)
          .findFirst();
      if (d != null) {
        d.driverWalletBalance += o.fee - commission;
        d.status = DriverStatus.online;
        await db.rideDrivers.put(d);
      }
    });
    await audit(db, 'DELIVERY', o.customerPhone,
        'Giao hàng ${o.orderId} fee ${o.fee}');
  }

  // ══════════════ GĐ4. TAXI DOANH NGHIỆP ══════════════

  static Future<RideCorporateAccount> createCorporateAccount(Isar db,
      {required String companyName,
      required String taxCode,
      required String contactPhone,
      required double creditLimitVnd,
      int invoiceDayOfMonth = 1}) async {
    late RideCorporateAccount c;
    await db.writeTxn(() async {
      c = RideCorporateAccount()
        ..corpId = 'corp_${companyName.hashCode.abs()}'
        ..companyName = companyName
        ..taxCode = taxCode
        ..contactPhone = contactPhone
        ..creditLimitVnd = creditLimitVnd
        ..invoiceDayOfMonth = invoiceDayOfMonth;
      await db.rideCorporateAccounts.put(c);
    });
    return c;
  }

  /// Chuyến doanh nghiệp: công ty gánh tiền, kiểm tra hạn mức tín dụng.
  static Future<void> chargeCorporate(
      Isar db, RideCorporateAccount corp, RideBooking b) async {
    if (!corp.active) throw Exception('Hợp đồng DN đã khóa.');
    if (corp.currentDebt + b.finalPrice > corp.creditLimitVnd) {
      throw Exception(
          'Vượt hạn mức tín dụng (còn ${corp.creditLimitVnd - corp.currentDebt}).');
    }
    await db.writeTxn(() async {
      corp.currentDebt += b.finalPrice;
      await db.rideCorporateAccounts.put(corp);
      b.corporateUuid = corp.corpId;
      await db.rideBookings.put(b);
    });
    await audit(db, 'PAYMENT', corp.corpId,
        '${corp.companyName} chịu ${b.finalPrice}đ chuyến ${b.uuid}');
  }

  /// Thanh toán công nợ định kỳ của công ty.
  static Future<double> payCorporateDebt(Isar db, RideCorporateAccount corp,
      {double? amount}) async {
    final pay = amount ?? corp.currentDebt;
    await db.writeTxn(() async {
      corp.currentDebt = safeDouble(corp.currentDebt - pay);
      await db.rideCorporateAccounts.put(corp);
    });
    await audit(db, 'PAYMENT', corp.corpId,
        '${corp.companyName} thanh toán $pay đ');
    return corp.currentDebt;
  }

  // ══════════════ GĐ4. API CHO ĐỐI TÁC ══════════════

  static String hashKey(String raw) => raw.hashCode.toRadixString(36);

  static Future<RidePartnerApiKey> issuePartnerKey(Isar db,
      {required String partnerName,
      required String apiKey,
      int quotaPerDay = 1000}) async {
    late RidePartnerApiKey k;
    await db.writeTxn(() async {
      k = RidePartnerApiKey()
        ..keyId = 'key_${partnerName.hashCode.abs()}'
        ..partnerName = partnerName
        ..apiKeyHash = hashKey(apiKey)
        ..quotaPerDay = quotaPerDay;
      await db.ridePartnerApiKeys.put(k);
    });
    return k;
  }

  /// Kiểm tra API key đối tác: hợp lệ + còn quota -> tăng lượt dùng.
  static Future<bool> validatePartnerKey(Isar db, String partnerName,
      String apiKey) async {
    final k = await db.ridePartnerApiKeys
        .filter()
        .partnerNameEqualTo(partnerName)
        .findFirst();
    if (k == null || !k.active) return false;
    if (k.apiKeyHash != hashKey(apiKey)) return false;
    if (k.usedToday >= k.quotaPerDay) return false;
    await db.writeTxn(() async {
      k.usedToday += 1;
      await db.ridePartnerApiKeys.put(k);
    });
    return true;
  }

  // ══════════════ §36. OFFLINE SYNC QUEUE ══════════════

  /// Đếm bản ghi chưa đồng bộ (booking + transaction).
  static Future<int> pendingSyncCount(Isar db) async {
    final pendingBookings = await db.rideBookings
        .filter()
        .syncStatusEqualTo(SyncStatus.pending)
        .count();
    final pendingTx = await db.rideTransactions
        .filter()
        .syncStatusEqualTo(TransactionSyncStatus.pending)
        .count();
    return pendingBookings + pendingTx;
  }

  /// Giả lập sync engine upload thành công -> đánh dấu synced.
  static Future<int> flushSyncQueue(Isar db) async {
    final bookings = await db.rideBookings
        .filter()
        .syncStatusEqualTo(SyncStatus.pending)
        .findAll();
    final txs = await db.rideTransactions
        .filter()
        .syncStatusEqualTo(TransactionSyncStatus.pending)
        .findAll();
    await db.writeTxn(() async {
      for (final b in bookings) {
        b.syncStatus = SyncStatus.synced;
        await db.rideBookings.put(b);
      }
      for (final t in txs) {
        t.syncStatus = TransactionSyncStatus.synced;
        await db.rideTransactions.put(t);
      }
    });
    await audit(db, 'SYNC', 'system',
        'Upload ${bookings.length} bookings + ${txs.length} transactions');
    return bookings.length + txs.length;
  }
}
