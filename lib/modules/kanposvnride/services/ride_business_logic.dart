import 'dart:math';

import 'package:isar/isar.dart';
import '../models/ride_booking.dart';
import '../models/ride_driver.dart';
import '../models/ride_ops_models.dart';
import '../models/ride_transaction.dart';
import '../models/ride_trip.dart';
import '../models/ride_user.dart';
import '../models/ride_vehicle_type.dart';

/// Kết quả tính giá cước (§14) với giá động (§30).
class RideFareQuote {
  final double baseFare;
  final double distanceFare;
  final double timeFare;
  final double surgeMultiplier; // §30: mưa/cao điểm/lễ
  final double surcharge; // Cầu đường + sân bay
  final double sharedDiscount; // §12 ghép chuyến
  final double promoDiscount; // §18 voucher
  final double total;

  RideFareQuote({
    required this.baseFare,
    required this.distanceFare,
    required this.timeFare,
    required this.surgeMultiplier,
    required this.surcharge,
    required this.sharedDiscount,
    required this.promoDiscount,
    required this.total,
  });
}

/// Hoa hồng nền tảng thu từ mỗi chuyến (§27).
class RideBusinessLogic {
  static const double commissionRate = 0.15;

  // ══════════════ §13+§14+§30. ĐIỀU XE & GIÁ CƯỚC ══════════════

  /// Khoảng cách Euclidean đơn giản giữa tài xế và điểm đón (km ~ độ).
  static double _dist(double lat1, double lng1, double lat2, double lng2) {
    return sqrt(pow(lat1 - lat2, 2) + pow(lng1 - lng2, 2)) * 111.0;
  }

  /// §13. Thuật toán điều xe: xe gần nhất trong số tài xế ONLINE đúng loại,
  /// có thể ưu tiên điểm cao / ít chuyến.
  static Future<RideDriver?> findNearestDriver(
    Isar db, {
    required double pickupLat,
    required double pickupLng,
    required VehicleType vehicleType,
    String strategy = 'nearest', // nearest | bestRated | leastTrips
  }) async {
    final drivers = await db.rideDrivers
        .filter()
        .statusEqualTo(DriverStatus.online)
        .vehicleTypeEqualTo(vehicleType)
        .findAll();
    if (drivers.isEmpty) return null;

    int tripCount(RideDriver d) => d.uuid == null ? 0 : 0;
    int score(RideDriver d) {
      switch (strategy) {
        case 'bestRated':
          return (d.averageRating * -1000).round();
        default:
          return tripCount(d);
      }
    }

    drivers.sort((a, b) {
      final da = _dist(a.currentLat ?? 0, a.currentLng ?? 0, pickupLat, pickupLng);
      final db_ = _dist(b.currentLat ?? 0, b.currentLng ?? 0, pickupLat, pickupLng);
      final diff = (da + score(a)).compareTo(db_ + score(b));
      return diff;
    });
    return drivers.first;
  }

  /// §14+§30. Tính giá: mở cửa + km + phút, nhân surge (mưa/cao điểm/lễ),
  /// cộng phụ phí cầu đường/sân bay, giảm ghép chuyến, trừ voucher.
  static RideFareQuote quoteFare({
    required KanRideVehicleType type,
    required double distanceKm,
    int durationMinutes = 0,
    bool isRaining = false,
    bool isRushHour = false,
    bool isHoliday = false,
    double bridgeToll = 0,
    double airportSurcharge = 0,
    bool isSharedRide = false,
    KanRidePromotion? promotion,
  }) {
    final base = type.baseFare;
    var distanceFare = distanceKm * type.pricePerKm;
    final timeFare = durationMinutes * type.pricePerMinute;

    // §30. Giá động.
    var surge = 1.0;
    if (isRaining) surge += 0.3;
    if (isRushHour) surge += 0.2;
    if (isHoliday) surge += 0.25;
    if (!isRaining && !isRushHour && !isHoliday) {
      // Giờ thấp điểm giữ nguyên 1.0.
      surge = 1.0;
    }

    var subtotal = (base + distanceFare + timeFare) * surge;

    // §12. Ghép chuyến tiết kiệm 20%.
    final sharedDiscount =
        isSharedRide ? subtotal * 0.20 : 0.0;
    subtotal -= sharedDiscount;

    subtotal += bridgeToll + airportSurcharge;

    // §18. Voucher.
    var promoDiscount = 0.0;
    if (promotion != null &&
        promotion.active &&
        subtotal >= promotion.minFare) {
      switch (promotion.type) {
        case 'percent':
          promoDiscount = subtotal * promotion.value / 100;
          break;
        case 'fixedAmount':
          promoDiscount = promotion.value;
          break;
        case 'freeFirstRide':
          promoDiscount = subtotal;
          break;
      }
      if (promotion.maxDiscount > 0) {
        promoDiscount = promoDiscount.clamp(0.0, promotion.maxDiscount);
      }
      promoDiscount = promoDiscount.clamp(0.0, subtotal);
    }

    final total = (subtotal - promoDiscount).clamp(0.0, double.infinity);
    return RideFareQuote(
      baseFare: base,
      distanceFare: distanceFare,
      timeFare: timeFare,
      surgeMultiplier: surge,
      surcharge: bridgeToll + airportSurcharge,
      sharedDiscount: sharedDiscount,
      promoDiscount: promoDiscount,
      total: total,
    );
  }

  // ══════════════ §9-10. LUỒNG ĐẶT XE ══════════════

  /// Khách đặt xe (đặt ngay hoặc đặt trước).
  static Future<RideBooking> createBooking(
    Isar db, {
    required RideUser passenger,
    required String pickupAddress,
    required double pickupLat,
    required double pickupLng,
    required String dropoffAddress,
    required double dropoffLat,
    required double dropoffLng,
    required double distanceKm,
    VehicleType vehicleType = VehicleType.motorBike,
    String paymentMethod = 'cash',
    bool isSharedRide = false,
    String? promotionCode,
    List<KanRideVehicleType> types = const [],
    Map<String, dynamic> env = const {},
  }) async {
    final vt = types
        .where((t) => t.vehicleTypeId == vehicleType.name)
        .fold<KanRideVehicleType?>(null, (b, t) => b ?? t);
    if (vt == null) throw Exception('Chưa khai báo giá cho ${vehicleType.name}');

    final promo = promotionCode == null || promotionCode.isEmpty
        ? null
        : await db.kanRidePromotions.filter().codeEqualTo(promotionCode).findFirst();
    final quote = quoteFare(
      type: vt,
      distanceKm: distanceKm,
      isRaining: env['isRaining'] == true,
      isRushHour: env['isRushHour'] == true,
      isHoliday: env['isHoliday'] == true,
      bridgeToll: (env['bridgeToll'] as num?)?.toDouble() ?? 0,
      airportSurcharge: (env['airportSurcharge'] as num?)?.toDouble() ?? 0,
      isSharedRide: isSharedRide,
      promotion: promo,
    );

    final now = DateTime.now();
    late RideBooking b;
    await db.writeTxn(() async {
      b = RideBooking()
        ..uuid = 'rb_${now.millisecondsSinceEpoch}_${passenger.uuid}'
        ..passengerUuid = passenger.uuid
        ..pickupAddress = pickupAddress
        ..pickupLat = pickupLat
        ..pickupLng = pickupLng
        ..dropoffAddress = dropoffAddress
        ..dropoffLat = dropoffLat
        ..dropoffLng = dropoffLng
        ..distanceKm = distanceKm
        ..estimatedPrice = quote.total
        ..finalPrice = quote.total
        ..surgeMultiplier = quote.surgeMultiplier
        ..surcharge = quote.surcharge
        ..discount = quote.promoDiscount
        ..promotionCode = promotionCode
        ..paymentMethod = paymentMethod
        ..requestedVehicleType = vehicleType
        ..isSharedRide = isSharedRide
        ..status = BookingStatus.findingDriver
        ..createdAt = now
        ..syncStatus = SyncStatus.pending;
      await db.rideBookings.put(b);

      if (promo != null) {
        promo.usageCount += 1;
        await db.kanRidePromotions.put(promo);
      }
    });
    return b;
  }

  /// Tài xế nhận cuốc -> accepted, tài xế chuyển busy.
  static Future<void> assignDriver(Isar db, RideBooking b, RideDriver d) async {
    if (b.status != BookingStatus.findingDriver) {
      throw Exception('Chuyến không còn ở trạng thái tìm tài xế.');
    }
    if (d.status != DriverStatus.online) {
      throw Exception('Tài xế ${d.fullName} không online.');
    }
    if (d.vehicleType != b.requestedVehicleType) {
      throw Exception('Loại xe tài xế không khớp yêu cầu.');
    }
    await db.writeTxn(() async {
      b.driverUuid = d.uuid;
      b.status = BookingStatus.accepted;
      b.acceptedAt = DateTime.now();
      b.updatedAt = DateTime.now();
      await db.rideBookings.put(b);
      d.status = DriverStatus.busy;
      await db.rideDrivers.put(d);
    });
  }

  /// Tiến trình chuyến: accepted → arrived → inProgress → completed.
  static Future<RideBooking> advanceStatus(Isar db, String bookingUuid) async {
    final b =
        await db.rideBookings.filter().uuidEqualTo(bookingUuid).findFirst();
    if (b == null) throw Exception('Không tìm thấy chuyến $bookingUuid');
    const flow = [
      BookingStatus.accepted,
      BookingStatus.arrived,
      BookingStatus.inProgress,
      BookingStatus.completed,
    ];
    final idx = flow.indexOf(b.status);
    if (idx < 0 || idx == flow.length - 1) {
      throw Exception('Chuyến đang ở trạng thái ${b.status.name}.');
    }
    final next = flow[idx + 1];
    await db.writeTxn(() async {
      b.status = next;
      b.updatedAt = DateTime.now();
      if (next == BookingStatus.inProgress) b.pickupAt = b.updatedAt;
      if (next == BookingStatus.completed) {
        b.completedAt = b.updatedAt;
        await _settleCompleted(db, b);
      }
      await db.rideBookings.put(b);
    });
    return b;
  }

  /// Hủy chuyến (khách hoặc tài xế), trả tài xế về online.
  static Future<void> cancelBooking(Isar db, String bookingUuid,
      {String reason = ''}) async {
    final b =
        await db.rideBookings.filter().uuidEqualTo(bookingUuid).findFirst();
    if (b == null) throw Exception('Không tìm thấy chuyến');
    if (b.status == BookingStatus.completed) throw Exception('Đã hoàn thành.');
    await db.writeTxn(() async {
      b.status = BookingStatus.cancelled;
      b.updatedAt = DateTime.now();
      await db.rideBookings.put(b);
      if (b.driverUuid != null) {
        final d = await db.rideDrivers
            .filter()
            .uuidEqualTo(b.driverUuid!)
            .findFirst();
        if (d != null && d.status == DriverStatus.busy) {
          d.status = DriverStatus.online;
          await db.rideDrivers.put(d);
        }
      }
    });
  }

  // ══════════════ §16-§17+§27. THANH TOÁN & VÍ ══════════════

  static Future<void> _settleCompleted(Isar db, RideBooking b) async {
    final fare = b.finalPrice;
    final commission = fare * commissionRate;
    final driverEarns = fare - commission;

    b.commission = commission;
    b.driverEarnings = driverEarns;

    // Thanh toán qua ví khách.
    if (b.paymentMethod == 'wallet') {
      final u = await db.rideUsers
          .filter()
          .uuidEqualTo(b.passengerUuid!)
          .findFirst();
      if (u == null || u.walletBalance < fare) {
        throw Exception('Ví không đủ tiền — chuyển sang tiền mặt.');
      }
      u.walletBalance -= fare;
      u.rewardPoints += fare ~/ 10000; // Điểm thưởng §5
      await db.rideUsers.put(u);
      await db.rideTransactions.put(RideTransaction()
        ..uuid = 'tx_pay_${b.uuid}'
        ..userUuid = u.uuid
        ..amount = -fare
        ..type = TransactionType.payment
        ..description = 'Thanh toán chuyến ${b.uuid}'
        ..createdAt = DateTime.now()
        ..syncStatus = TransactionSyncStatus.pending);
    }

    // Ví tài xế nhận phần sau trừ hoa hồng (cả chuyền cash cũng qua ví).
    if (b.driverUuid != null) {
      final d = await db.rideDrivers
          .filter()
          .uuidEqualTo(b.driverUuid!)
          .findFirst();
      if (d != null) {
        d.driverWalletBalance += driverEarns;
        await db.rideDrivers.put(d);
        await db.rideTransactions.put(RideTransaction()
          ..uuid = 'tx_drv_${b.uuid}'
          ..userUuid = d.uuid
          ..amount = driverEarns
          ..type = TransactionType.reward
          ..description = 'Doanh thu chuyến ${b.uuid} (trừ hoa hồng ${(commissionRate * 100).round()}%)'
          ..createdAt = DateTime.now()
          ..syncStatus = TransactionSyncStatus.pending);

        d.status = DriverStatus.online; // rảnh nhận cuốc mới
        await db.rideDrivers.put(d);
      }
    }

    // Ghi Trip hoàn thành (§24 lịch sử).
    await db.kanRideTrips.put(KanRideTrip()
      ..tripId = 'trip_${b.uuid}'
      ..bookingId = b.uuid!
      ..driverId = b.driverUuid ?? ''
      ..startTime = b.pickupAt ?? b.createdAt ?? DateTime.now()
      ..endTime = DateTime.now()
      ..actualDistanceKm = b.distanceKm
      ..finalPrice = fare
      ..status = 'completed');
  }

  /// §17. Rút tiền khỏi ví tài xế.
  static Future<double> driverWithdraw(Isar db, String driverUuid,
      double amount) async {
    final d = await db.rideDrivers.filter().uuidEqualTo(driverUuid).findFirst();
    if (d == null) throw Exception('Không tìm thấy tài xế');
    if (amount <= 0) throw Exception('Số tiền rút phải > 0.');
    if (amount > d.driverWalletBalance) {
      throw Exception('Số dư không đủ (${d.driverWalletBalance}).');
    }
    await db.writeTxn(() async {
      d.driverWalletBalance -= amount;
      await db.rideDrivers.put(d);
      await db.rideTransactions.put(RideTransaction()
        ..uuid = 'tx_wd_${DateTime.now().millisecondsSinceEpoch}'
        ..userUuid = d.uuid
        ..amount = -amount
        ..type = TransactionType.withdraw
        ..description = 'Rút tiền về ngân hàng'
        ..createdAt = DateTime.now()
        ..syncStatus = TransactionSyncStatus.pending);
    });
    return d.driverWalletBalance;
  }

  /// §19. Áp mã giới thiệu: cả người giới thiệu lẫn người mới được thưởng.
  static Future<void> applyReferral(
      Isar db, RideUser newUser, String referralCode,
      {double bonusPerSide = 30000}) async {
    final inviter = await db.rideUsers
        .filter()
        .referralCodeEqualTo(referralCode)
        .findFirst();
    if (inviter == null) throw Exception('Mã giới thiệu không hợp lệ.');
    await db.writeTxn(() async {
      inviter.rewardPoints += bonusPerSide ~/ 100;
      inviter.walletBalance += bonusPerSide;
      await db.rideUsers.put(inviter);

      newUser.walletBalance += bonusPerSide;
      newUser.rewardPoints += bonusPerSide ~/ 100;
      await db.rideUsers.put(newUser);
    });
  }

  /// §20. Đánh giá chuyến đi -> cập nhật averageRating của tài xế.
  static Future<void> submitRating(Isar db,
      {required String bookingUuid,
      required int stars,
      String comment = '',
      bool isComplaint = false}) async {
    if (stars < 1 || stars > 5) throw Exception('Số sao phải 1-5.');
    final b = await db.rideBookings
        .filter()
        .uuidEqualTo(bookingUuid)
        .findFirst();
    if (b == null || b.driverUuid == null) {
      throw Exception('Chuyến không hợp lệ để đánh giá.');
    }
    await db.writeTxn(() async {
      await db.rideRatings.put(RideRating()
        ..ratingId = 'rate_${b.uuid}'
        ..bookingUuid = b.uuid!
        ..driverUuid = b.driverUuid!
        ..passengerUuid = b.passengerUuid ?? ''
        ..stars = stars
        ..comment = comment
        ..isComplaint = isComplaint);
      // Trung bình cộng lại toàn bộ rating của tài xế này.
      final all = await db.rideRatings
          .filter()
          .driverUuidEqualTo(b.driverUuid!)
          .findAll();
      final avg = all.fold<int>(0, (s, r) => s + r.stars) / all.length;
      final d = await db.rideDrivers
          .filter()
          .uuidEqualTo(b.driverUuid!)
          .findFirst();
      if (d != null) {
        d.averageRating = avg;
        await db.rideDrivers.put(d);
      }
    });
  }

  // ══════════════ §24-28. BÁO CÁO & DASHBOARD ══════════════

  static bool _inRange(DateTime? d, DateTime from, DateTime to) =>
      d != null && !d.isBefore(from) && d.isBefore(to);

  /// §24+§26+§27. Báo cáo tổng hợp theo khoảng ngày.
  static Future<Map<String, dynamic>> report(Isar db, DateTime from,
      DateTime to) async {
    final bookings = await db.rideBookings.where().findAll();
    final inRange = bookings
        .where((b) => _inRange(b.createdAt, from, to))
        .toList();
    final completed = inRange.where((b) => b.status == BookingStatus.completed);
    final cancelled = inRange.where((b) => b.status == BookingStatus.cancelled);

    final byDriver = <String, double>{};
    final byDay = <String, double>{};
    final byType = <String, int>{};
    double revenue = 0, commission = 0, discountTotal = 0;
    for (final b in completed) {
      revenue += b.finalPrice;
      commission += b.commission;
      discountTotal += b.discount;
      byDriver[b.driverUuid ?? '?'] =
          (byDriver[b.driverUuid ?? '?'] ?? 0) + b.driverEarnings;
      final day = (b.completedAt ?? b.createdAt).toString().substring(0, 10);
      byDay[day] = (byDay[day] ?? 0) + b.finalPrice;
      byType[b.requestedVehicleType.name] =
          (byType[b.requestedVehicleType.name] ?? 0) + 1;
    }
    // §27: Lợi nhuận = hoa hồng (doanh thu đã trừ phần tài xế).
    return {
      'revenue': revenue,
      'commission': commission,
      'promoCost': discountTotal,
      'profit': commission - discountTotal,
      'tripCount': completed.length,
      'cancelCount': cancelled.length,
      'cancelRatePercent':
          inRange.isEmpty ? 0.0 : cancelled.length / inRange.length * 100,
      'byDriver': byDriver,
      'byDay': byDay,
      'byVehicleType': byType,
    };
  }

  /// §25. Báo cáo một khách hàng.
  static Future<Map<String, dynamic>> customerReport(
      Isar db, String userUuid, DateTime from, DateTime to) async {
    final bookings = await db.rideBookings
        .filter()
        .passengerUuidEqualTo(userUuid)
        .sortByCreatedAtDesc()
        .findAll();
    final done = bookings
        .where((b) => b.status == BookingStatus.completed)
        .where((b) => _inRange(b.createdAt, from, to))
        .toList();
    final u = await db.rideUsers.filter().uuidEqualTo(userUuid).findFirst();
    return {
      'tripCount': done.length,
      'spend': done.fold<double>(0, (s, b) => s + b.finalPrice),
      'points': u?.rewardPoints ?? 0,
      'promoUsed': bookings
          .where((b) => (b.promotionCode ?? '').isNotEmpty)
          .length,
    };
  }

  /// §26. Báo cáo một tài xế.
  static Future<Map<String, dynamic>> driverReport(
      Isar db, String driverUuid, DateTime from, DateTime to) async {
    final trips = await db.kanRideTrips
        .filter()
        .driverIdEqualTo(driverUuid)
        .findAll();
    final inRange =
        trips.where((t) => _inRange(t.startTime, from, to)).toList();
    final bookings = await db.rideBookings
        .filter()
        .driverUuidEqualTo(driverUuid)
        .findAll();
    final cancelled =
        bookings.where((b) => b.status == BookingStatus.cancelled).length;
    final d = await db.rideDrivers.filter().uuidEqualTo(driverUuid).findFirst();
    return {
      'revenue': inRange.fold<double>(0, (s, t) => s + t.finalPrice),
      'tripCount': inRange.length,
      'km': inRange.fold<double>(0, (s, t) => s + t.actualDistanceKm),
      'cancelled': cancelled,
      'walletBalance': d?.driverWalletBalance ?? 0,
      'averageRating': d?.averageRating ?? 5.0,
    };
  }

  /// §28. Dashboard tổng quan.
  static Future<Map<String, dynamic>> dashboardSummary(Isar db) async {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final tomorrow = todayStart.add(const Duration(days: 1));
    final monthStart = DateTime(now.year, now.month);

    final bookings = await db.rideBookings.where().findAll();
    final drivers = await db.rideDrivers.where().findAll();
    final users = await db.rideUsers.where().findAll();

    final todayCompleted = bookings
        .where((b) =>
            b.status == BookingStatus.completed &&
            _inRange(b.completedAt, todayStart, tomorrow))
        .toList();

    return {
      'revenueToday':
          todayCompleted.fold<double>(0, (s, b) => s + b.finalPrice),
      'revenueMonth': bookings
          .where((b) =>
              b.status == BookingStatus.completed &&
              _inRange(b.completedAt, monthStart, now))
          .fold<double>(0, (s, b) => s + b.finalPrice),
      'driversOnline': drivers.where((d) => d.status == DriverStatus.online).length,
      'driversOffline': drivers.where((d) => d.status == DriverStatus.offline).length,
      'pendingBookings':
          bookings.where((b) => b.status == BookingStatus.findingDriver).length,
      'completedBookings':
          bookings.where((b) => b.status == BookingStatus.completed).length,
      'cancelledBookings':
          bookings.where((b) => b.status == BookingStatus.cancelled).length,
      'newCustomersThisMonth': users
          .where((u) => _inRange(u.createdAt, monthStart, now.add(const Duration(days: 1))))
          .length,
      'newDriversThisMonth': drivers
          .where((d) => _inRange(d.createdAt, monthStart, now.add(const Duration(days: 1))))
          .length,
    };
  }
}
