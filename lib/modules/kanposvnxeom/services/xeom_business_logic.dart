import 'package:isar/isar.dart';
import '../models/booking.dart';
import '../models/customer.dart';
import '../models/driver.dart';
import '../models/ops_models.dart';
import '../models/payment.dart';
import '../models/vehicle.dart';

/// Kết quả tính giá cước (§13) + khuyến mãi (§14).
class XeOmFareQuote {
  final double baseFare;
  final double distanceFare; // Theo km
  final double timeFare; // Theo phút
  final double peakExtra; // Cao điểm
  final double airportSurcharge;
  final double holidaySurcharge;
  final double surchargeTotal;
  final double discount;
  final double total;

  XeOmFareQuote({
    required this.baseFare,
    required this.distanceFare,
    required this.timeFare,
    required this.peakExtra,
    required this.airportSurcharge,
    required this.holidaySurcharge,
    required this.surchargeTotal,
    required this.discount,
    required this.total,
  });
}

/// Toàn bộ nghiệp vụ hãng xe ôm/taxi theo kanxeom.md.
class XeOmBusinessLogic {
  /// Hoa hồng mặc định nền tảng thu từ tài xế (§16).
  static const double defaultCommissionRate = 0.20;

  // ══════════════ §13. GIÁ CƯỚC ══════════════

  static bool _isPeakHour(DateTime at) {
    const peaks = [(7, 9), (17, 20)]; // Sáng + chiều tối
    for (final (a, b) in peaks) {
      if (at.hour >= a && at.hour < b) return true;
    }
    return false;
  }

  /// Tính giá chuyến: cước mở + km + phút, nhân cao điểm, cộng phụ phí
  /// sân bay/lễ, trừ khuyến mãi.
  static XeOmFareQuote quoteFare({
    required XeOmTariff tariff,
    required double distanceKm,
    int durationMinutes = 0,
    DateTime? at,
    bool isAirportTrip = false,
    bool isHoliday = false,
    XeOmPromotion? promotion,
  }) {
    final time = at ?? DateTime.now();
    final base = tariff.baseFare;
    var distanceFare = distanceKm * tariff.pricePerKm;
    final timeFare = durationMinutes * tariff.pricePerMinute;

    // §14. Miễn phí km đầu nếu voucher freeFirstKm -> trừ km trước khi tính.
    var discount = 0.0;
    if (promotion != null &&
        promotion.active &&
        promotion.type == 'freeFirstKm') {
      discount = promotion.value * tariff.pricePerKm;
      discount = distanceFare < discount ? distanceFare : discount;
      distanceFare -= discount;
    }

    var subtotal = base + distanceFare + timeFare;

    // §13. Giờ cao điểm: % trên tiền km+phút.
    final peak = _isPeakHour(time)
        ? (distanceFare + timeFare) * tariff.peakSurchargePercent / 100
        : 0.0;
    subtotal += peak;

    final airport = isAirportTrip ? tariff.airportSurcharge : 0.0;
    final holiday = isHoliday ? tariff.holidaySurcharge : 0.0;
    subtotal += airport + holiday;

    // §14. Voucher giảm % hoặc giảm tiền.
    if (promotion != null && promotion.active) {
      if (subtotal >= promotion.minFare || promotion.minFare == 0) {
        if (promotion.type == 'percent') {
          discount += subtotal * promotion.value / 100;
        } else if (promotion.type == 'fixedAmount') {
          discount += promotion.value;
        }
      }
    }
    // Trần giảm tối đa.
    if (promotion != null && promotion.maxDiscount > 0) {
      final applied = subtotal - discount >= 0 ? discount : subtotal;
      discount = applied.clamp(0.0, promotion.maxDiscount).toDouble();
    }

    final total = (subtotal - discount).clamp(0.0, double.infinity);
    return XeOmFareQuote(
      baseFare: base,
      distanceFare: distanceFare,
      timeFare: timeFare,
      peakExtra: peak,
      airportSurcharge: airport,
      holidaySurcharge: holiday,
      surchargeTotal: peak + airport + holiday,
      discount: discount,
      total: total,
    );
  }

  // ══════════════ §9-10. LUỒNG CHUYẾN ══════════════

  /// Khách gọi -> điều hành tạo chuyến (trạng thái Mới -> Đang tìm xe).
  static Future<XeOmBooking> createBooking(
    Isar db, {
    required XeOmCustomer customer,
    required String pickupAddress,
    required String dropoffAddress,
    required double distanceKm,
    required String vehicleType,
    PaymentMethod paymentMethod = PaymentMethod.cash,
    String? promotionCode,
    bool isAirportTrip = false,
    bool isHoliday = false,
    int durationMinutes = 0,
    List<XeOmTariff> tariffs = const [],
    DateTime? scheduledAt,
    String? notes,
    DateTime? at,
  }) async {
    final tariff = tariffs
        .where((t) => t.vehicleType == vehicleType)
        .fold<XeOmTariff?>(null, (best, t) => best ?? t);
    if (tariff == null) {
      throw Exception('Chưa có bảng giá cho loại xe $vehicleType');
    }
    final promo =
        promotionCode == null || promotionCode.isEmpty ? null : await db.xeOmPromotions.filter().codeEqualTo(promotionCode.toUpperCase()).findFirst();
    final quote = quoteFare(
      tariff: tariff,
      distanceKm: distanceKm,
      durationMinutes: durationMinutes,
      isAirportTrip: isAirportTrip,
      isHoliday: isHoliday,
      promotion: promo,
      at: at,
    );

    final now = DateTime.now();
    late XeOmBooking b;
    await db.writeTxn(() async {
      b = XeOmBooking()
        ..uuid = 'bk_${now.millisecondsSinceEpoch}_${customer.uuid}'
        ..bookingCode = 'BOOK-${now.millisecondsSinceEpoch}'
        ..customerUuid = customer.uuid
        ..customerName = customer.fullName
        ..customerPhone = customer.phone
        ..pickupAddress = pickupAddress
        ..dropoffAddress = dropoffAddress
        ..distanceKm = distanceKm
        ..price = quote.total
        ..baseFare = quote.baseFare + quote.distanceFare + quote.timeFare
        ..surcharge = quote.surchargeTotal
        ..discount = quote.discount
        ..requiredVehicleType = vehicleType
        ..paymentMethod = paymentMethod
        ..promotionCode = promotionCode
        ..scheduledAt = scheduledAt
        ..notes = notes
        ..status = BookingStatus.searchingDriver
        ..createdAt = now
        ..updatedAt = now;
      await db.xeOmBookings.put(b);

      if (promo != null) {
        promo.usageCount += 1;
        await db.xeOmPromotions.put(promo);
      }
    });
    return b;
  }

  static const _flow = [
    BookingStatus.searchingDriver,
    BookingStatus.driverAccepted,
    BookingStatus.driverArriving,
    BookingStatus.pickedUp,
    BookingStatus.inProgress,
    BookingStatus.completed,
  ];

  /// Chuyển trạng thái theo đúng thứ tự §10 (bỏ qua bước không bắt buộc
  /// driverArriving). Tài xế nhận chuyến thì chuyển busy, hoàn thành thì
  /// trả về online.
  static Future<XeOmBooking> advanceStatus(Isar db, String bookingUuid,
      {XeOmTariff? tariff}) async {
    final b = await db.xeOmBookings.filter().uuidEqualTo(bookingUuid).findFirst();
    if (b == null) throw Exception('Không tìm thấy chuyến $bookingUuid');
    if (b.status == BookingStatus.completed ||
        b.status == BookingStatus.cancelled) {
      throw Exception('Chuyến đã kết thúc.');
    }
    final idx = _flow.indexOf(b.status);
    if (idx < 0) throw Exception('Trạng thái ${b.status.name} không hợp lệ.');

    final next = _flow[idx + 1];
    await db.writeTxn(() async {
      b.status = next;
      b.updatedAt = DateTime.now();
      if (next == BookingStatus.pickedUp) b.pickedUpAt = b.updatedAt;
      if (next == BookingStatus.completed) {
        b.completedAt = b.updatedAt;
        await _settleCompleted(db, b);
      } else if (next == BookingStatus.driverAccepted && b.driverUuid != null) {
        final d = await db.xeOmDrivers
            .filter()
            .uuidEqualTo(b.driverUuid!)
            .findFirst();
        if (d != null) {
          d.status = DriverStatus.busy;
          await db.xeOmDrivers.put(d);
        }
      }
      await db.xeOmBookings.put(b);
    });
    return b;
  }

  /// Điều xe: gán tài xế + xe vào chuyến đang tìm.
  static Future<void> assignDriver(
      Isar db, String bookingUuid, XeOmDriver driver, XeOmVehicle vehicle) async {
    final b = await db.xeOmBookings.filter().uuidEqualTo(bookingUuid).findFirst();
    if (b == null) throw Exception('Không tìm thấy chuyến');
    if (b.status != BookingStatus.searchingDriver) {
      throw Exception('Chuyến không ở trạng thái tìm xe.');
    }
    if (driver.status == DriverStatus.busy) {
      throw Exception('Tài xế ${driver.fullName} đang chạy chuyến khác.');
    }
    if (vehicle.status != VehicleStatus.active) {
      throw Exception('Xe ${vehicle.licensePlate} không hoạt động.');
    }
    if ((vehicle.type.name) != (b.requiredVehicleType ?? vehicle.type.name)) {
      // Cho phép gán sai loại chỉ khi khách không yêu cầu cụ thể.
      if (b.requiredVehicleType!.isNotEmpty) {
        throw Exception(
            'Khách yêu cầu ${b.requiredVehicleType}, xe là ${vehicle.type.name}.');
      }
    }
    await db.writeTxn(() async {
      b.driverUuid = driver.uuid;
      b.vehicleUuid = vehicle.uuid;
      b.status = BookingStatus.searchingDriver; // chờ tài xế bấm nhận
      b.updatedAt = DateTime.now();
      await db.xeOmBookings.put(b);
    });
  }

  /// Hủy chuyến: tài xế đang gắn sẽ được trả về online.
  static Future<void> cancelBooking(Isar db, String bookingUuid,
      {String? reason}) async {
    final b = await db.xeOmBookings.filter().uuidEqualTo(bookingUuid).findFirst();
    if (b == null) throw Exception('Không tìm thấy chuyến');
    if (b.status == BookingStatus.completed) {
      throw Exception('Chuyến hoàn thành không thể hủy.');
    }
    await db.writeTxn(() async {
      b.status = BookingStatus.cancelled;
      b.updatedAt = DateTime.now();
      b.notes = reason ?? b.notes;
      await db.xeOmBookings.put(b);
      if (b.driverUuid != null) {
        final d = await db.xeOmDrivers.filter().uuidEqualTo(b.driverUuid!).findFirst();
        if (d != null && d.status == DriverStatus.busy) {
          d.status = DriverStatus.online;
          await db.xeOmDrivers.put(d);
        }
      }
    });
  }

  // ══════════════ §12+§15+§16. THANH TOÁN / CÔNG NỢ / HOA HỒNG ══════════════

  static Future<void> _settleCompleted(Isar db, XeOmBooking b) async {
    final fare = (b.price ?? 0).toDouble();
    final method = b.paymentMethod;

    // Hoa hồng nền tảng thu từ tài xế (§16).
    final commission = fare * defaultCommissionRate;

    late XeOmPayment p;
    p = XeOmPayment()
      ..uuid = 'pay_${b.uuid}'
      ..bookingUuid = b.uuid
      ..customerUuid = b.customerUuid
      ..driverUuid = b.driverUuid
      ..amount = fare
      ..driverCommission = commission
      ..method = method == PaymentMethod.debt
          ? PaymentMethod.cash // ghi nhận tiền mặt khi khách trả nợ
          : _mapMethod(method)
      ..status = method == PaymentMethod.debt
          ? PaymentStatus.pending
          : PaymentStatus.completed
      ..paidAt = method == PaymentMethod.debt ? null : DateTime.now()
      ..createdAt = DateTime.now();
    await db.xeOmPayments.put(p);

    // §15. Công nợ khách hàng.
    if (method == PaymentMethod.debt) {
      final c = await db.xeOmCustomers
          .filter()
          .uuidEqualTo(b.customerUuid!)
          .findFirst();
      if (c != null) {
        c.notes = '${c.notes ?? ''}|DEBT:${p.uuid}:${fare.toStringAsFixed(0)}';
        await db.xeOmCustomers.put(c);
        b.debtAmount = fare;
        await db.xeOmBookings.put(b);
      }
    }

    // §8. Thống kê khách: tổng chuyến + doanh thu + điểm thưởng (10k/điểm).
    final cust = await db.xeOmCustomers
        .filter()
        .uuidEqualTo(b.customerUuid!)
        .findFirst();
    if (cust != null) {
      cust.totalBookings += 1;
      cust.totalRevenue += method == PaymentMethod.debt ? 0 : fare;
      cust.rewardPoints += (fare ~/ 10000);
      await db.xeOmCustomers.put(cust);
    }

    // Tài xế hoàn thành -> online lại (§6).
    if (b.driverUuid != null) {
      final d =
          await db.xeOmDrivers.filter().uuidEqualTo(b.driverUuid!).findFirst();
      if (d != null && d.status == DriverStatus.busy) {
        d.status = DriverStatus.online;
        await db.xeOmDrivers.put(d);
      }
    }
  }

  static PaymentMethod _mapMethod(PaymentMethod m) => m;

  /// §15. Thu nợ khách: thanh toán pending của chuyến công nợ -> completed.
  static Future<double> collectDebt(Isar db, String customerUuid) async {
    final pendings = await db.xeOmPayments
        .filter()
        .customerUuidEqualTo(customerUuid)
        .statusEqualTo(PaymentStatus.pending)
        .findAll();
    var total = 0.0;
    await db.writeTxn(() async {
      for (final p in pendings) {
        p.status = PaymentStatus.completed;
        p.paidAt = DateTime.now();
        total += p.amount ?? 0;
        await db.xeOmPayments.put(p);

        final b = await db.xeOmBookings
            .filter()
            .uuidEqualTo(p.bookingUuid!)
            .findFirst();
        if (b != null) {
          b.debtAmount = 0;
          await db.xeOmBookings.put(b);
        }
        // Doanh số khách chỉ cập nhật khi thực thu.
        final c = await db.xeOmCustomers
            .filter()
            .uuidEqualTo(customerUuid)
            .findFirst();
        if (c != null) {
          c.totalRevenue += p.amount ?? 0;
          c.rewardPoints += ((p.amount ?? 0) ~/ 10000);
          await db.xeOmCustomers.put(c);
        }
      }
    });
    return total;
  }

  /// Công nợ còn lại của một khách (tổng payment pending).
  static Future<double> customerOutstandingDebt(
      Isar db, String customerUuid) async {
    final pendings = await db.xeOmPayments
        .filter()
        .customerUuidEqualTo(customerUuid)
        .statusEqualTo(PaymentStatus.pending)
        .findAll();
    return pendings.fold<double>(0, (s, p) => s + (p.amount ?? 0));
  }

  // ══════════════ §18. CHI PHÍ ══════════════

  static Future<XeOmExpense> addExpense(Isar db,
      {required String category,
      required double amount,
      String note = '',
      String? driverUuid,
      String? vehicleUuid,
      DateTime? at}) async {
    late XeOmExpense e;
    await db.writeTxn(() async {
      e = XeOmExpense()
        ..uuid = 'exp_${DateTime.now().millisecondsSinceEpoch}_$category'
        ..category = category
        ..amount = amount
        ..note = note
        ..driverUuid = driverUuid
        ..vehicleUuid = vehicleUuid
        ..createdAt = at ?? DateTime.now();
      await db.xeOmExpenses.put(e);
    });
    return e;
  }

  // ══════════════ §5 + §17 + §19. DASHBOARD & BÁO CÁO ══════════════

  static bool _inRange(DateTime? d, DateTime from, DateTime to) =>
      d != null && !d.isBefore(from) && d.isBefore(to);

  /// §17. Doanh thu nhóm theo nhiều chiều.
  static Future<Map<String, dynamic>> revenueReport(
      Isar db, DateTime from, DateTime to) async {
    final bookings = await db.xeOmBookings.where().findAll();
    final done = bookings
        .where((b) => b.status == BookingStatus.completed)
        .where((b) => _inRange(b.completedAt, from, to))
        .toList();

    final byDriver = <String, double>{};
    final byVehicleType = <String, double>{};
    final byRoute = <String, double>{};
    final byDay = <String, double>{};
    var commission = 0.0, revenue = 0.0;

    for (final b in done) {
      final fare = b.price ?? 0;
      revenue += fare;
      commission += fare * defaultCommissionRate;
      byDriver[b.driverUuid ?? 'chưa gán'] =
          (byDriver[b.driverUuid ?? 'chưa gán'] ?? 0) + fare;
      byVehicleType[b.requiredVehicleType ?? '?'] =
          (byVehicleType[b.requiredVehicleType ?? '?'] ?? 0) + fare;
      final route =
          '${b.pickupAddress} → ${b.dropoffAddress}';
      byRoute[route] = (byRoute[route] ?? 0) + fare;
      final day = b.completedAt.toString().substring(0, 10);
      byDay[day] = (byDay[day] ?? 0) + fare;
    }
    return {
      'revenue': revenue,
      'commission': commission,
      'tripCount': done.length,
      'byDriver': byDriver,
      'byVehicleType': byVehicleType,
      'byRoute': byRoute,
      'byDay': byDay,
    };
  }

  /// §19. Báo cáo tổng hợp: chi phí, lợi nhuận, top, tỷ lệ hủy.
  static Future<Map<String, dynamic>> summaryReport(
      Isar db, DateTime from, DateTime to) async {
    final rev = await revenueReport(db, from, to);
    final expenses = await db.xeOmExpenses.where().findAll();
    final expenseInRange = expenses
        .where((e) => _inRange(e.createdAt, from, to))
        .toList();
    final expenseByCat = <String, double>{};
    for (final e in expenseInRange) {
      expenseByCat[e.category] = (expenseByCat[e.category] ?? 0) + e.amount;
    }
    final expenseTotal =
        expenseByCat.values.fold<double>(0, (s, v) => s + v);

    final allBookings = await db.xeOmBookings.where().findAll();
    final inRangeAll = allBookings
        .where((b) => _inRange(b.createdAt, from, to))
        .toList();
    final cancelled = inRangeAll
        .where((b) => b.status == BookingStatus.cancelled)
        .length;
    final cancelRate =
        inRangeAll.isEmpty ? 0.0 : cancelled / inRangeAll.length * 100;

    // Top tài xế & khách & tuyến.
    final drivers = await db.xeOmDrivers.where().findAll();
    final customers = await db.xeOmCustomers.where().findAll();
    final nameOfDriver = {for (final d in drivers) d.uuid: d.fullName};

    return {
      ...rev,
      'expense': expenseTotal,
      'expenseByCategory': expenseByCat,
      'profit': (rev['revenue'] as double) - expenseTotal,
      'cancelRatePercent': cancelRate,
      'topDrivers': (rev['byDriver'] as Map<String, double>)
          .entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value)),
      'topDriverNames': (rev['byDriver'] as Map<String, double>)
          .keys.map((k) => nameOfDriver[k] ?? k)
          .toList(),
      'topCustomers': (customers.toList()
            ..sort((a, b) => b.totalRevenue.compareTo(a.totalRevenue)))
          .take(5)
          .map((c) => {'name': c.fullName, 'revenue': c.totalRevenue})
          .toList(),
    };
  }

  /// §5. Dashboard.
  static Future<Map<String, dynamic>> dashboardSummary(Isar db) async {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final tomorrow = todayStart.add(const Duration(days: 1));
    final monthStart = DateTime(now.year, now.month);
    final nextMonth = DateTime(now.year, now.month + 1);

    final bookings = await db.xeOmBookings.where().findAll();
    final drivers = await db.xeOmDrivers.where().findAll();

    final todayBookings =
        bookings.where((b) => _inRange(b.createdAt, todayStart, tomorrow));
    final running = bookings
        .where((b) =>
            b.status == BookingStatus.inProgress ||
            b.status == BookingStatus.pickedUp ||
            b.status == BookingStatus.driverArriving)
        .length;
    final emptyDrivers = drivers.where((d) => d.status == DriverStatus.online);

    final payments =
        await db.xeOmPayments.filter().statusEqualTo(PaymentStatus.completed).findAll();
    var revenueToday = 0.0, revenueMonth = 0.0, commissionMonth = 0.0;
    for (final p in payments) {
      if (_inRange(p.paidAt, todayStart, tomorrow)) {
        revenueToday += p.amount ?? 0;
      }
      if (_inRange(p.paidAt, monthStart, nextMonth)) {
        revenueMonth += p.amount ?? 0;
        commissionMonth += p.driverCommission ?? 0;
      }
    }
    return {
      'totalBookingsToday': todayBookings.length,
      'runningBookings': running,
      'emptyDrivers': emptyDrivers.length,
      'driversOnline':
          drivers.where((d) => d.status == DriverStatus.online).length,
      'revenueToday': revenueToday,
      'revenueMonth': revenueMonth,
      'commissionMonth': commissionMonth,
    };
  }
}
