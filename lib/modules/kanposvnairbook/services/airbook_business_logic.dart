import 'dart:convert';
import 'dart:math';

import 'package:isar/isar.dart';
import '../../../core/utils/formatters.dart';
import '../models/airbook_ops_models.dart';
import '../models/booking.dart';
import '../models/flight_offer.dart';
import '../models/sync_queue.dart';

/// Kết quả tìm kiếm đã lọc/sắp xếp.
class AirSearchResult {
  final List<FlightOffer> offers;
  AirSearchResult(this.offers);
}

/// §7+§52. MockFlightProvider — nguồn vé mô phỏng đọc từ Isar seed.
/// Khi có provider thật chỉ cần thay lớp này (interface tương đương).
class MockFlightProvider {
  final Isar db;
  MockFlightProvider(this.db);

  /// §6. Tìm chuyến bay + bộ lọc + sắp xếp.
  Future<List<FlightOffer>> searchFlights({
    required String origin,
    required String destination,
    DateTime? departureDate,
    String? cabinClass,
    List<String> airlines = const [],
    double? maxPrice,
    int? maxStops, // offer không có stops -> bỏ qua
    String sortBy = 'priceAsc', // priceAsc | priceDesc | departEarly | departLate | duration
  }) async {
    var offers = await db.flightOffers.where().findAll();

    offers = offers.where((o) {
      if (o.origin?.toUpperCase() != origin.toUpperCase()) return false;
      if (o.destination?.toUpperCase() != destination.toUpperCase()) {
        return false;
      }
      if (departureDate != null && o.departureTime != null) {
        final a = DateTime(o.departureTime!.year, o.departureTime!.month,
            o.departureTime!.day);
        final b = DateTime(
            departureDate.year, departureDate.month, departureDate.day);
        if (!a.isAtSameMomentAs(b)) return false;
      }
      if (cabinClass != null &&
          cabinClass.isNotEmpty &&
          o.cabinClass?.toLowerCase() != cabinClass.toLowerCase()) {
        return false;
      }
      if (airlines.isNotEmpty &&
          !airlines.contains(o.airline)) {
        return false;
      }
      if (maxPrice != null && (o.totalFare ?? 0) > maxPrice) return false;
      return true;
    }).toList();

    int cmp(num? a, num? b) => (a ?? 0).compareTo(b ?? 0);
    switch (sortBy) {
      case 'priceDesc':
        offers.sort((a, b) => cmp(b.totalFare, a.totalFare));
        break;
      case 'departEarly':
        offers.sort((a, b) => (a.departureTime ?? DateTime(2100))
            .compareTo(b.departureTime ?? DateTime(2100)));
        break;
      case 'departLate':
        offers.sort((a, b) => (b.departureTime ?? DateTime(0))
            .compareTo(a.departureTime ?? DateTime(0)));
        break;
      case 'duration':
        offers.sort((a, b) => cmp(a.durationMinutes, b.durationMinutes));
        break;
      default:
        offers.sort((a, b) => cmp(a.totalFare, b.totalFare));
    }
    return offers;
  }

  /// §28. Reprice/Recheck trước khi đặt: tính lại từ dữ liệu offer đã lưu,
  /// KHÔNG tin tổng tiền client gửi lên.
  static ({double supplier, double tax}) reprice(FlightOffer offer) {
    return (
      supplier: (offer.baseFare ?? 0) + (offer.taxAndFee ?? 0),
      tax: offer.taxAndFee ?? 0,
    );
  }
}

/// Toàn bộ nghiệp vụ đặt vé KanAirBook.
class AirBookBusinessLogic {
  static const double serviceFeePerPax = 150000; // §12 phí dịch vụ/hành khách

  // ══════════════ §36. AUDIT ══════════════

  static Future<void> audit(Isar db, String actor, String action,
      String entity, String entityId, String detail) async {
    await db.writeTxn(() async {
      await db.airAuditLogs.put(AirAuditLog()
        ..actorUuid = actor
        ..action = action
        ..entity = entity
        ..entityId = entityId
        ..detail = detail
        ..createdAt = DateTime.now());
    });
  }

  // ══════════════ §18. SYNC QUEUE ══════════════

  static Future<void> _enqueue(Isar db, String entity, String entityUuid,
      String operation,
      {Map<String, dynamic>? payload}) async {
    await db.writeTxn(() async {
      await db.syncQueueLocals.put(SyncQueueLocal()
        ..uuid = 'sq_${DateTime.now().millisecondsSinceEpoch}_$entityUuid'
        ..entity = entity
        ..entityUuid = entityUuid
        ..operation = operation
        ..payload = jsonEncode(payload ?? {})
        ..createdAt = DateTime.now()
        ..status = SyncStatus.pending);
    });
  }

  static Future<int> pendingSyncCount(Isar db) async =>
      db.syncQueueLocals.filter().statusEqualTo(SyncStatus.pending).count();

  /// Giả lập push thành công -> SUCCESS.
  static Future<int> flushSyncQueue(Isar db) async {
    final pendings =
        await db.syncQueueLocals.filter().statusEqualTo(SyncStatus.pending).findAll();
    await db.writeTxn(() async {
      for (final p in pendings) {
        p.status = SyncStatus.success;
        await db.syncQueueLocals.put(p);
      }
    });
    return pendings.length;
  }

  // ══════════════ §8+§10+§12+§27+§32. TẠO BOOKING ══════════════

  /// Tạo booking giữ chỗ:
  /// - Reprice từ offer (không tin tổng tiền client — §55).
  /// - IdempotencyKey trùng -> trả booking cũ (§27).
  /// - Trạng thái HELD + expiresAt 30 phút (§46 timeout analog).
  /// - Áp khuyến mãi theo hãng/tuyến/platform (§32).
  static Future<BookingLocal> createBooking(
    Isar db, {
    required FlightOffer offer,
    required String contactName,
    required String contactPhone,
    List<AirPassenger> passengers = const [],
    String promoCode = '',
    String agentId = '',
    double markupPerPax = 0,
    String? idempotencyKey,
    Duration holdDuration = const Duration(minutes: 30),
  }) async {
    if (passengers.isEmpty) throw Exception('Phải có ít nhất 1 hành khách.');

    // §27. Idempotency.
    if (idempotencyKey != null && idempotencyKey.isNotEmpty) {
      final dup = await db.bookingLocals
          .filter()
          .idempotencyKeyEqualTo(idempotencyKey)
          .findFirst();
      if (dup != null) return dup; // không tạo thứ hai
    }

    // §55. Server-authoritative pricing.
    final repriced = MockFlightProvider.reprice(offer);
    final paxCount = passengers.length;

    // §32. Khuyến mãi.
    var discount = 0.0;
    {
      if (promoCode.isNotEmpty) {
        final promo = await db.airPromotions
            .filter()
            .codeEqualTo(promoCode.toUpperCase())
            .findFirst();
        if (promo == null || !promo.active || promo.usedCount >= promo.usageLimit) {
          throw Exception('Mã giảm giá không khả dụng.');
        }
        final applies = promo.scope == 'platform' ||
            (promo.scope == 'airline' && promo.refId == offer.airline) ||
            (promo.scope == 'route' &&
                promo.refId ==
                    '${offer.origin}-${offer.destination}');
        if (!applies) {
          throw Exception('Mã không áp dụng cho chuyến bay này.');
        }
        discount = promo.type == 'percent'
            ? repriced.supplier * paxCount * promo.value / 100
            : promo.value * paxCount;
        if (promo.maxDiscount > 0 && discount > promo.maxDiscount) {
          discount = promo.maxDiscount;
        }
      }
    }

    final supplier = repriced.supplier * paxCount;
    final serviceFee = serviceFeePerPax * paxCount + markupPerPax * paxCount;
    final selling = safeDouble(supplier + serviceFee - discount);
    final commissionCost = selling * 0.05; // hoa hồng chi trả đại lý 5%
    final profit = selling - supplier - commissionCost;

    late BookingLocal b;
    await db.writeTxn(() async {
      b = BookingLocal()
        ..uuid = 'bk_${DateTime.now().millisecondsSinceEpoch}'
        ..pnrCode =
            'KAN${Random().nextInt(900000) + 100000}' // PNR nội bộ §10
        ..flightOfferUuid = offer.uuid
        ..passengerName = contactName
        ..passengerPhone = contactPhone
        ..totalAmount = selling
        ..supplierPrice = supplier
        ..serviceFee = serviceFee
        ..discountAmount = discount
        ..promoCode = promoCode.toUpperCase()
        ..profit = profit
        ..commission = commissionCost
        ..paidAmount = 0
        ..remainingAmount = selling
        ..status = BookingAirStatus.held
        ..expiresAt = DateTime.now().add(holdDuration)
        ..idempotencyKey = idempotencyKey
        ..agentId = agentId
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..needsSync = true;
      await db.bookingLocals.put(b);

      for (final p in passengers) {
        await db.airPassengers.put(AirPassenger()
          ..passengerId =
              'px_${b.uuid}_${p.firstName}_${p.lastName}'.hashCode.abs().toString()
          ..bookingUuid = b.uuid!
          ..type = p.type
          ..title = p.title
          ..firstName = p.firstName
          ..lastName = p.lastName
          ..gender = p.gender
          ..dateOfBirth = p.dateOfBirth
          ..nationality = p.nationality
          ..passportNumber = p.passportNumber
          ..passportExpiry = p.passportExpiry
          ..identityNumber = p.identityNumber
          ..phone = p.phone);
      }

      if (promoCode.isNotEmpty && discount > 0) {
        final promo = await db.airPromotions
            .filter()
            .codeEqualTo(promoCode.toUpperCase())
            .findFirst();
        if (promo != null) {
          promo.usedCount += 1;
          await db.airPromotions.put(promo);
        }
      }
    });

    await _enqueue(db, 'booking', b.uuid!, 'CREATE',
        payload: {'pnr': b.pnrCode, 'total': selling});
    await audit(db, agentId.isEmpty ? 'customer' : agentId, 'CREATE_BOOKING',
        'booking', b.uuid!, 'PNR ${b.pnrCode} tổng ${selling.toStringAsFixed(0)}đ');
    return b;
  }

  /// §46. Quét các booking HELD hết hạn -> EXPIRED.
  static Future<int> expireHeldBookings(Isar db) async {
    final now = DateTime.now();
    final held = await db.bookingLocals
        .filter()
        .statusEqualTo(BookingAirStatus.held)
        .findAll();
    final expired = held.where((b) =>
        b.expiresAt != null && b.expiresAt!.isBefore(now)).toList();
    await db.writeTxn(() async {
      for (final b in expired) {
        b.status = BookingAirStatus.expired;
        b.updatedAt = now;
        await db.bookingLocals.put(b);
      }
    });
    return expired.length;
  }

  // ══════════════ §13. THANH TOÁN (một phần / đủ) ══════════════

  /// Thanh toán booking. Đủ tiền -> PAID (chờ issue ticket).
  static Future<BookingLocal> payBooking(Isar db, BookingLocal b,
      {required double amount,
      String method = 'cash',
      String? idempotencyKey}) async {
    // §27+§53. Idempotency TRƯỚC validate — callback gửi 2 lần phải an toàn.
    if (idempotencyKey != null && idempotencyKey.isNotEmpty) {
      final dup = await db.airPayments
          .filter()
          .idempotencyKeyEqualTo(idempotencyKey)
          .findFirst();
      if (dup != null && dup.status == 'SUCCESS') {
        return b;
      }
    }

    if (amount <= 0) throw Exception('Số tiền thanh toán phải > 0.');
    final remainNow = (b.totalAmount ?? 0) - b.paidAmount;
    if (amount > remainNow) throw Exception('Vượt số tiền còn nợ ($remainNow).');

    await db.writeTxn(() async {
      await db.airPayments.put(AirPayment()
        ..paymentCode =
            'pay_${DateTime.now().millisecondsSinceEpoch}_${b.pnrCode}'
        ..bookingUuid = b.uuid!
        ..method = method
        ..amount = amount
        ..status = 'SUCCESS'
        ..idempotencyKey = idempotencyKey ?? '');
      b.paidAmount += amount;
      b.remainingAmount = (b.totalAmount ?? 0) - b.paidAmount;

      // Chuyển trạng thái theo số tiền.
      if (b.status == BookingAirStatus.held ||
          b.status == BookingAirStatus.pendingPayment) {
        b.status = b.remainingAmount <= 0
            ? BookingAirStatus.paid
            : BookingAirStatus.pendingPayment;
        // Đủ tiền -> gia hạn giữ chỗ thêm 24h chờ xuất vé.
        if (b.remainingAmount <= 0) {
          b.expiresAt = DateTime.now().add(const Duration(hours: 24));
        }
      }
      b.updatedAt = DateTime.now();
      await db.bookingLocals.put(b);
    });
    await audit(db, b.agentId.isEmpty ? 'customer' : b.agentId, 'PAYMENT',
        'booking', b.uuid!, 'Thanh toán ${amount.toStringAsFixed(0)}đ ${b.pnrCode}');
    return b;
  }

  // ══════════════ §14. VÉ ĐIỆN TỬ ══════════════

  /// Xuất vé: yêu cầu đã PAID đủ. Sinh ticketNumber + QR payload.
  static Future<BookingLocal> issueTicket(Isar db, BookingLocal b) async {
    final unpaid = b.remainingAmount > 0 ||
        b.paidAmount < (b.totalAmount ?? 0);
    if (unpaid) {
      throw Exception('Chưa thanh toán đủ — không xuất vé.');
    }
    if (b.ticketNumber != null && b.ticketNumber!.isNotEmpty) {
      return b; // đã xuất rồi
    }
    await db.writeTxn(() async {
      final rnd = Random().nextInt(90000000) + 10000000;
      b.ticketNumber = 'VN0$rnd';
      b.status = BookingAirStatus.confirmed; // Ticketed ≈ confirmed trong enum
      b.isCheckedIn = false;
      b.updatedAt = DateTime.now();
      await db.bookingLocals.put(b);
    });
    await audit(db, b.agentId.isEmpty ? 'system' : b.agentId, 'ISSUE_TICKET',
        'booking', b.uuid!, 'Vé ${b.ticketNumber} PNR ${b.pnrCode}');
    return b;
  }

  /// QR payload cho vé (§14: chỉ chứa mã định danh).
  static String qrPayload(BookingLocal b) =>
      'AIRBOOK|${b.pnrCode}|${b.ticketNumber ?? ''}';

  // ══════════════ HỦY / HOÀN TIỀN ══════════════

  /// Chính sách hoàn đơn giản: trước 24h hoàn 90%, trong 24h hoàn 70%.
  static Future<double> cancelBooking(
      Isar db, BookingLocal b, String actor) async {
    if (b.status == BookingAirStatus.cancelled ||
        b.status == BookingAirStatus.refunded) {
      throw Exception('Booking đã hủy trước đó.');
    }
    if (b.ticketNumber != null && b.ticketNumber!.isNotEmpty) {
      b.status = BookingAirStatus.cancelRequested; // cần xử lý hủy vé đã xuất
      await db.writeTxn(() async => db.bookingLocals.put(b));
      throw Exception('Đã yêu cầu hủy vé đã xuất — chờ xử lý CANCEL_REQUESTED.');
    }

    final depart = await _departureOf(db, b);
    var refundRate = 1.0;
    if (depart != null) {
      final hoursToFlight =
          depart.difference(DateTime.now()).inHours;
      refundRate = hoursToFlight >= 24 ? 0.9 : 0.7;
    }
    final refund = b.paidAmount * refundRate;

    await db.writeTxn(() async {
      if (refund > 0) {
        await db.airPayments.put(AirPayment()
          ..paymentCode =
              'rf_${DateTime.now().millisecondsSinceEpoch}_${b.pnrCode}'
          ..bookingUuid = b.uuid!
          ..method = 'bank'
          ..amount = -refund
          ..status = refund == b.paidAmount ? 'REFUNDED' : 'PARTIAL_REFUND');
      }
      b.status = b.paidAmount > 0
          ? BookingAirStatus.refunded
          : BookingAirStatus.cancelled;
      b.updatedAt = DateTime.now();
      await db.bookingLocals.put(b);
    });
    await audit(db, actor, b.status == BookingAirStatus.refunded ? 'REFUND' : 'CANCEL_BOOKING',
        'booking', b.uuid!, 'Hoàn ${refund.toStringAsFixed(0)}đ ${b.pnrCode}');
    return refund;
  }

  static Future<DateTime?> _departureOf(Isar db, BookingLocal b) async {
    if (b.flightOfferUuid == null) return null;
    final offer = await db.flightOffers
        .filter()
        .uuidEqualTo(b.flightOfferUuid!)
        .findFirst();
    return offer?.departureTime;
  }

  // ══════════════ §30+§35. DASHBOARD & BÁO CÁO ══════════════

  static bool _inRange(DateTime? d, DateTime from, DateTime to) =>
      d != null && !d.isBefore(from) && d.isBefore(to);

  /// Dashboard Manager §30.
  static Future<Map<String, dynamic>> managerDashboard(Isar db) async {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final tomorrow = todayStart.add(const Duration(days: 1));
    final monthStart = DateTime(now.year, now.month);

    final bookings = await db.bookingLocals.where().findAll();
    final paidBookings =
        bookings.where((b) => !b.isDeleted && (b.totalAmount ?? 0) > 0).toList();

    double revenueToday = 0, revenueMonth = 0;
    for (final p in await db.airPayments.where().findAll()) {
      if (p.amount > 0 && _inRange(p.createdAt, todayStart, tomorrow)) {
        revenueToday += p.amount;
      }
      if (p.amount > 0 && _inRange(p.createdAt, monthStart, now)) {
        revenueMonth += p.amount;
      }
    }
    final outstanding =
        bookings.fold<double>(0, (s, b) => s + b.remainingAmount);
    final profitMonth = paidBookings
        .where((b) =>
            _inRange(b.createdAt, monthStart, now) &&
            b.status != BookingAirStatus.cancelled &&
            b.status != BookingAirStatus.expired)
        .fold<double>(0, (s, b) => s + b.profit);

    return {
      'revenueToday': revenueToday,
      'revenueMonth': revenueMonth,
      'bookingsTotal': bookings.where((b) => !b.isDeleted).length,
      'ticketsIssued': bookings
          .where((b) => b.ticketNumber != null && b.ticketNumber!.isNotEmpty)
          .length,
      'paidAmount': bookings.fold<double>(0, (s, b) => s + b.paidAmount),
      'outstandingDebt': outstanding,
      'profitMonth': profitMonth,
    };
  }

  /// §35. Báo cáo doanh thu theo ngày/hãng/tuyến + trạng thái booking.
  static Future<Map<String, dynamic>> report(Isar db, DateTime from, DateTime to) async {
    final payments = await db.airPayments.where().findAll();
    final bookings = await db.bookingLocals.where().findAll();
    final offers = await db.flightOffers.where().findAll();
    final offerById = {for (final o in offers) o.uuid: o};

    final byDay = <String, double>{};
    final byAirline = <String, double>{};
    final byRoute = <String, double>{};
    var revenue = 0.0;
    for (final p in payments.where((p) => p.amount > 0)) {
      if (!_inRange(p.createdAt, from, to)) continue;
      revenue += p.amount;
      byDay[p.createdAt.toString().substring(0, 10)] =
          (byDay[p.createdAt.toString().substring(0, 10)] ?? 0) + p.amount;
    }
    for (final b in bookings) {
      if (b.paidAmount <= 0) continue;
      final offer = offerById[b.flightOfferUuid];
      final airline = offer?.airline ?? '?';
      byAirline[airline] = (byAirline[airline] ?? 0) + b.paidAmount;
      if (offer != null) {
        final route = '${offer.origin}-${offer.destination}';
        byRoute[route] = (byRoute[route] ?? 0) + b.paidAmount;
      }
    }

    final statusCounts = <String, int>{};
    for (final b in bookings) {
      statusCounts[b.status.name] = (statusCounts[b.status.name] ?? 0) + 1;
    }
    return {
      'revenue': revenue,
      'byDay': byDay,
      'byAirline': byAirline,
      'byRoute': byRoute,
      'statusCounts': statusCounts,
      'profit': bookings.fold<double>(0, (s, b) => s + b.profit),
    };
  }
}
