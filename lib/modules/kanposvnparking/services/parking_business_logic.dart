import 'package:isar/isar.dart';
import '../models/camera.dart';
import '../models/monthly_ticket.dart';
import '../models/parking_area.dart';
import '../models/parking_customer.dart';
import '../models/parking_finance.dart';
import '../models/parking_tariff.dart';
import '../models/parking_ticket.dart';
import '../models/rental.dart';
import '../models/vehicle.dart';

/// Kết quả quét camera tại cổng (§10-§12).
class ParkingScanResult {
  final String action; // allowed | monthly_pass | blocked_alarm
  final String message;
  final ParkingTicket? createdTicket;
  final ParkingMonthlyTicket? monthlyTicket;

  ParkingScanResult(
      {required this.action,
      required this.message,
      this.createdTicket,
      this.monthlyTicket});
}

/// Toàn bộ nghiệp vụ Kan Parking theo kanposvnparking.md.
class ParkingBusinessLogic {
  // ══════════════ §6. TRÔNG GIỮ XE ══════════════

  /// Tính tiền gửi: giờ đầu + các giờ tiếp theo làm tròn lên từng giờ,
  /// chặn trần dailyMax mỗi 24h.
  static double calcParkingFee({
    required DateTime checkIn,
    required DateTime checkOut,
    required ParkingTariff tariff,
  }) {
    if (!checkOut.isAfter(checkIn)) return 0;
    final minutes = checkOut.difference(checkIn).inMinutes;
    // Tối thiểu tính 1 giờ, mỗi giờ tiếp theo làm tròn lên.
    final hours = (minutes / 60).ceil();
    var fee = tariff.firstHourPrice +
        ((hours < 1 ? 1 : hours) - 1) * tariff.nextHourPrice;
    if (tariff.dailyMaxPrice > 0) {
      final days = (hours / 24).ceil();
      final capped =
          fee.clamp(0.0, (days < 1 ? 1 : days) * tariff.dailyMaxPrice);
      fee = capped;
    }
    return fee;
  }

  /// Nhận xe vào bãi (§6): tạo/tìm phương tiện, tạo vé, chiếm chỗ trong khu.
  static Future<ParkingTicket> checkIn(
    Isar db, {
    required String licensePlate,
    String vehicleType = 'motorbike',
    String cameraId = '',
    String staffId = '',
    String rfidCard = '',
    String imageFront = '',
    String imageBack = '',
    String areaId = '',
    DateTime? at,
  }) async {
    final plate = licensePlate.trim().toUpperCase();
    if (plate.isEmpty) throw Exception('Biển số không được trống.');

    // Xe nằm blacklist thì chặn ngay (§12).
    final vehicle = await findOrCreateVehicle(db,
        plate: plate, vehicleType: vehicleType, rfidCard: rfidCard);
    if (vehicle.status == 'blocked') {
      throw Exception('BIỂN SỐ $plate NẰM BLACKLIST - TỪ CHỐI NHẬN XE!');
    }

    // Đang gửi rồi thì không nhận nữa.
    final dup = await db.parkingTickets
        .filter()
        .licensePlateEqualTo(plate)
        .statusEqualTo('parking')
        .findFirst();
    if (dup != null) {
      throw Exception('Xe $plate đang trong bãi (vé ${dup.ticketId}).');
    }

    final time = at ?? DateTime.now();
    late ParkingTicket ticket;
    await db.writeTxn(() async {
      ticket = ParkingTicket()
        ..ticketId = 'TK_${time.millisecondsSinceEpoch}_$plate'
        ..vehicleId = vehicle.vehicleId
        ..licensePlate = plate
        ..rfidCard = rfidCard
        ..checkInTime = time
        ..checkInCameraId = cameraId
        ..checkInImageFront = imageFront
        ..checkInImageBack = imageBack
        ..checkInStaffId = staffId
        ..status = 'parking'
        ..paymentStatus = 'unpaid';

      // Kiểm tra vé tháng hợp lệ cho đúng biển số (§7).
      final monthly = await db.parkingMonthlyTickets
          .filter()
          .licensePlateEqualTo(plate)
          .statusEqualTo('active')
          .findFirst();
      if (monthly != null && !monthly.endDate.isBefore(time)) {
        ticket.paymentMethod = 'monthly_card';
        ticket.monthlyTicketId = monthly.ticketId;
      }
      await db.parkingTickets.put(ticket);

      // Chiếm 1 chỗ của khu (§5).
      if (areaId.isNotEmpty) {
        final area = await db.parkingAreas
            .filter()
            .areaIdEqualTo(areaId)
            .findFirst();
        if (area != null && area.usedSpots < area.totalSpots) {
          area.usedSpots += 1;
          await db.parkingAreas.put(area);
        }
      }
    });
    return ticket;
  }

  /// Trả xe (§6): tính tiền theo bảng giá, ghi doanh thu, trả chỗ.
  static Future<ParkingTicket> checkOut(
    Isar db, {
    required ParkingTicket ticket,
    required String paymentMethod,
    String staffId = '',
    List<ParkingTariff> tariffs = const [],
    DateTime? at,
  }) async {
    if (ticket.status != 'parking') {
      throw Exception('Vé ${ticket.ticketId} không còn hiệu lực.');
    }
    final out = at ?? DateTime.now();

    // Vé tháng: miễn phí, chỉ xác nhận ra.
    if (ticket.paymentMethod == 'monthly_card') {
      await db.writeTxn(() async {
        ticket
          ..checkOutTime = out
          ..checkOutStaffId = staffId
          ..feeAmount = 0
          ..paymentStatus = 'paid'
          ..status = 'checked_out';
        await db.parkingTickets.put(ticket);
      });
      await _releaseAreaSpot(db, ticket);
      return ticket;
    }

    final type = await _vehicleTypeOf(db, ticket.vehicleId, ticket.licensePlate);
    final tariff = tariffs
        .where((t) => t.vehicleType == type)
        .fold<ParkingTariff?>(null, (best, t) => best ?? t);
    if (tariff == null) throw Exception('Chưa khai báo giá cho loại xe: $type');

    final fee = calcParkingFee(
        checkIn: ticket.checkInTime, checkOut: out, tariff: tariff);

    await db.writeTxn(() async {
      ticket
        ..checkOutTime = out
        ..checkOutStaffId = staffId
        ..feeAmount = fee
        ..paymentMethod = paymentMethod
        ..paymentStatus = 'paid'
        ..status = 'checked_out';
      await db.parkingTickets.put(ticket);

      // Doanh thu vé lẻ -> phiếu thu để tổng hợp báo cáo (§14).
      await db.parkingFinanceTxs.put(ParkingFinanceTx()
        ..financeId = 'inc_${ticket.ticketId}'
        ..isIncome = true
        ..amount = fee
        ..incomeCategory = ParkingIncomeCategory.OTHER_INCOME.name
        ..note = 'Tiền gửi xe ${ticket.licensePlate}'
        ..createdAt = out);
    });
    await _releaseAreaSpot(db, ticket);
    return ticket;
  }

  static Future<void> _releaseAreaSpot(Isar db, ParkingTicket ticket) async {
    // Trả chỗ theo khu đang đếm xe của biển này — đơn giản: giảm ở khu có chỗ đã dùng.
    final areas = await db.parkingAreas.filter().usedSpotsGreaterThan(0).findAll();
    if (areas.isNotEmpty) {
      await db.writeTxn(() async {
        areas.first.usedSpots -= 1;
        await db.parkingAreas.put(areas.first);
      });
    }
  }

  static Future<String> _vehicleTypeOf(Isar db, String vehicleId, String plate) async {
    final v = await db.parkingVehicles
        .filter()
        .vehicleIdEqualTo(vehicleId)
        .or()
        .licensePlateEqualTo(plate)
        .findFirst();
    return v?.vehicleType ?? 'motorbike';
  }

  // ══════════════ §4 + §12. PHƯƠNG TIỆN / QUÉT CAMERA ══════════════

  static Future<ParkingVehicle> findOrCreateVehicle(Isar db,
      {required String plate,
      String vehicleType = 'motorbike',
      String rfidCard = ''}) async {
    final p = plate.trim().toUpperCase();
    var v = await db.parkingVehicles
        .filter()
        .licensePlateEqualTo(p)
        .findFirst();
    if (v != null) return v;
    v = ParkingVehicle()
      ..vehicleId = 'vh_${p.hashCode.abs()}_$p'
      ..licensePlate = p
      ..vehicleType = vehicleType
      ..rfidCard = rfidCard;
    await db.writeTxn(() async => db.parkingVehicles.put(v!));
    return v;
  }

  /// §10-§13. Quét camera: nhận diện biển -> tra cứu vé tháng / blacklist.
  static Future<ParkingScanResult> scanCamera(
    Isar db, {
    required String plate,
    required bool isEntry,
    String cameraId = '',
    String staffId = '',
    String areaId = '',
    List<ParkingTariff> tariffs = const [],
  }) async {
    final p = plate.trim().toUpperCase();

    // Blacklist -> BÁO ĐỘNG (§12).
    final vh = await db.parkingVehicles.filter().licensePlateEqualTo(p).findFirst();
    if (vh?.status == 'blocked') {
      return ParkingScanResult(
          action: 'blocked_alarm', message: '🚨 BIỂN SỐ $p NẰM BLACKLIST!');
    }

    // Vé tháng còn hạn -> qua cửa miễn phí.
    final monthly = await db.parkingMonthlyTickets
        .filter()
        .licensePlateEqualTo(p)
        .statusEqualTo('active')
        .findFirst();
    final validMonthly =
        monthly != null && !monthly.endDate.isBefore(DateTime.now());

    if (!isEntry) {
      // Làn ra: tìm vé đang gửi để thanh toán.
      final open = await db.parkingTickets
          .filter()
          .licensePlateEqualTo(p)
          .statusEqualTo('parking')
          .findFirst();
      if (open == null) {
        return ParkingScanResult(
            action: 'allowed', message: 'Không tìm thấy vé đang gửi của $p.');
      }
      if (open.paymentMethod == 'monthly_card') {
        await checkOut(db,
            ticket: open, paymentMethod: 'monthly_card', staffId: staffId);
        return ParkingScanResult(
            action: 'monthly_pass',
            message: 'Vé tháng hợp lệ - mời xe $p ra.',
            createdTicket: open,
            monthlyTicket: monthly);
      }
      await checkOut(db,
          ticket: open,
          paymentMethod: 'cash',
          staffId: staffId,
          tariffs: tariffs);
      return ParkingScanResult(action: 'allowed', message: 'Đã trả xe $p.', createdTicket: open);
    }

    // Làn vào.
    final ticket = await checkIn(db,
        licensePlate: p,
        cameraId: cameraId,
        staffId: staffId,
        areaId: areaId);
    if (validMonthly) {
      return ParkingScanResult(
          action: 'monthly_pass',
          message: 'Vé tháng hợp lệ - mời xe $p vào.',
          createdTicket: ticket,
          monthlyTicket: monthly);
    }
    return ParkingScanResult(
        action: 'allowed',
        message: 'Đã nhận xe $p - vé ${ticket.ticketId}.',
        createdTicket: ticket);
  }

  // ══════════════ §7. VÉ THÁNG / QUÝ / NĂM ══════════════

  static Future<ParkingMonthlyTicket> createMonthlyTicket(Isar db,
      {required String customerName,
      required String customerPhone,
      required String licensePlate,
      required double feeAmount,
      String period = 'month', // month | quarter | year
      required String staffId,
      DateTime? start}) async {
    final s = start ?? DateTime.now();
    final months = switch (period) {
      'quarter' => 3,
      'year' => 12,
      _ => 1,
    };
    late ParkingMonthlyTicket t;
    await db.writeTxn(() async {
      t = ParkingMonthlyTicket()
        ..ticketId = 'MT_${s.millisecondsSinceEpoch}_$licensePlate'
        ..customerName = customerName
        ..customerPhone = customerPhone
        ..licensePlate = licensePlate.toUpperCase()
        ..feeAmount = feeAmount * months
        ..startDate = s
        ..endDate = DateTime(s.year, s.month + months, s.day)
        ..status = 'active';
      await db.parkingMonthlyTickets.put(t);

      // Bán vé tháng là doanh thu (§14).
      await db.parkingFinanceTxs.put(ParkingFinanceTx()
        ..financeId = 'inc_${t.ticketId}'
        ..isIncome = true
        ..amount = t.feeAmount
        ..incomeCategory = ParkingIncomeCategory.OTHER_INCOME.name
        ..note = 'Vé $period xe ${t.licensePlate}'
        ..createdAt = s);
    });
    return t;
  }

  /// §16. Vé tháng sắp hết hạn trong [days] ngày tới -> cảnh báo.
  static Future<List<ParkingMonthlyTicket>> expiringSoon(Isar db,
      {int days = 7}) async {
    final now = DateTime.now();
    final limit = now.add(Duration(days: days));
    return db.parkingMonthlyTickets
        .filter()
        .statusEqualTo('active')
        .endDateBetween(now, limit)
        .findAll();
  }

  static Future<void> renewMonthlyTicket(Isar db, ParkingMonthlyTicket t,
      {int months = 1}) async {
    await db.writeTxn(() async {
      final base =
          t.endDate.isBefore(DateTime.now()) ? DateTime.now() : t.endDate;
      t.endDate = DateTime(base.year, base.month + months, base.day);
      t.status = 'active';
      await db.parkingMonthlyTickets.put(t);
    });
  }

  static Future<void> markExpiredTickets(Isar db) async {
    final now = DateTime.now();
    final actives =
        await db.parkingMonthlyTickets.filter().statusEqualTo('active').findAll();
    final expired = actives.where((t) => t.endDate.isBefore(now)).toList();
    if (expired.isEmpty) return;
    await db.writeTxn(() async {
      for (final t in expired) {
        t.status = 'expired';
        await db.parkingMonthlyTickets.put(t);
      }
    });
  }

  // ══════════════ §8-§9. THUÊ XE / HỢP ĐỒNG ══════════════

  static Future<ParkingRental> createRental(Isar db,
      {required ParkingCustomer customer,
      required ParkingVehicle vehicle,
      required DateTime rentEnd,
      required double depositAmount,
      required double rentalFee,
      String contractNo = ''}) async {
    if (vehicle.status == 'rented') {
      throw Exception('Xe ${vehicle.licensePlate} đang được thuê!');
    }
    final now = DateTime.now();
    late ParkingRental r;
    await db.writeTxn(() async {
      r = ParkingRental()
        ..rentalId = 'RT_${now.millisecondsSinceEpoch}_${vehicle.vehicleId}'
        ..customerName = customer.name
        ..customerPhone = customer.phone
        ..customerCccd = customer.cccd
        ..vehicleId = vehicle.vehicleId
        ..licensePlate = vehicle.licensePlate
        ..rentStartTime = now
        ..rentEndTime = rentEnd
        ..depositAmount = depositAmount
        ..rentalFee = rentalFee
        ..status = 'renting';
      await db.parkingRentals.put(r);

      vehicle.status = 'rented';
      await db.parkingVehicles.put(vehicle);

      // Doanh thu cọc + tiền thuê ghi nhận ngay khi giao xe (§14).
      await db.parkingFinanceTxs.put(ParkingFinanceTx()
        ..financeId = 'inc_${r.rentalId}'
        ..isIncome = true
        ..amount = depositAmount + rentalFee
        ..incomeCategory = ParkingIncomeCategory.OTHER_INCOME.name
        ..note = 'Thuê xe ${vehicle.licensePlate} cho ${customer.name}'
            '${contractNo.isEmpty ? '' : ' (HĐ $contractNo)'}');
    });
    return r;
  }

  /// Khách trả xe thuê.
  static Future<void> returnRental(Isar db, ParkingRental r,
      {DateTime? at}) async {
    final vehicle =
        await db.parkingVehicles.filter().vehicleIdEqualTo(r.vehicleId).findFirst();
    await db.writeTxn(() async {
      r.actualReturnTime = at ?? DateTime.now();
      r.status = 'returned';
      await db.parkingRentals.put(r);
      if (vehicle != null) {
        vehicle.status = 'active';
        await db.parkingVehicles.put(vehicle);
      }
    });
  }

  /// Đánh dấu các đơn quá hạn chưa trả (§8/§16).
  static Future<List<ParkingRental>> markOverdueRentals(Isar db) async {
    final now = DateTime.now();
    final renting =
        await db.parkingRentals.filter().statusEqualTo('renting').findAll();
    final overdue =
        renting.where((r) => r.rentEndTime.isBefore(now)).toList();
    if (overdue.isNotEmpty) {
      await db.writeTxn(() async {
        for (final r in overdue) {
          r.status = 'overdue';
          await db.parkingRentals.put(r);
        }
      });
    }
    return overdue;
  }

  // ══════════════ XX. PHIẾU THU/CHI THỦ CÔNG ══════════════

  static Future<ParkingFinanceTx> addFinanceTx(Isar db,
      {required bool isIncome,
      required double amount,
      required String category,
      String note = '',
      DateTime? at}) async {
    late ParkingFinanceTx tx;
    await db.writeTxn(() async {
      tx = ParkingFinanceTx()
        ..financeId =
            '${isIncome ? 'thu' : 'chi'}_${DateTime.now().millisecondsSinceEpoch}_$amount'
        ..isIncome = isIncome
        ..amount = amount
        ..incomeCategory = isIncome ? category : ''
        ..expenseCategory = isIncome ? '' : category
        ..note = note
        ..createdAt = at ?? DateTime.now();
      await db.parkingFinanceTxs.put(tx);
    });
    return tx;
  }

  // ══════════════ §14. BÁO CÁO ══════════════

  static bool _inRange(DateTime? d, DateTime from, DateTime to) =>
      d != null && !d.isBefore(from) && d.isBefore(to);

  /// Doanh thu theo khoảng ngày: vé lẻ + vé tháng + thuê xe + thu khác.
  /// Mỗi khoản doanh thu đều có phiếu thu tự sinh (financeId: inc_TK_/MT_/RT_),
  /// phân loại theo tiền tố để KHÔNG đếm trùng.
  static Future<Map<String, double>> revenueReport(
      Isar db, DateTime from, DateTime to) async {
    final txs =
        await db.parkingFinanceTxs.filter().isIncomeEqualTo(true).findAll();

    var hourly = 0.0, monthly = 0.0, rental = 0.0, other = 0.0;
    for (final f in txs) {
      if (!_inRange(f.createdAt, from, to)) continue;
      if (f.financeId.startsWith('inc_TK_')) {
        hourly += f.amount;
      } else if (f.financeId.startsWith('inc_MT_')) {
        monthly += f.amount;
      } else if (f.financeId.startsWith('inc_RT_')) {
        rental += f.amount;
      } else {
        other += f.amount;
      }
    }
    return {
      'hourly': hourly,
      'monthly': monthly,
      'rental': rental,
      'other': other,
      'total': hourly + monthly + rental + other,
    };
  }

  /// Báo cáo gửi xe: tổng lượt, theo loại xe, theo nhân viên (§14).
  static Future<Map<String, dynamic>> parkingReport(
      Isar db, DateTime from, DateTime to) async {
    final tickets = await db.parkingTickets.where().findAll();
    final inRange = tickets
        .where((t) => _inRange(t.checkInTime, from, to))
        .toList();
    final byType = <String, int>{};
    final byStaff = <String, int>{};
    for (final t in inRange) {
      final v = await db.parkingVehicles
          .filter()
          .vehicleIdEqualTo(t.vehicleId)
          .findFirst();
      final type = v?.vehicleType ?? 'motorbike';
      byType[type] = (byType[type] ?? 0) + 1;
      final st = t.checkInStaffId.isEmpty ? 'không rõ' : t.checkInStaffId;
      byStaff[st] = (byStaff[st] ?? 0) + 1;
    }
    return {
      'totalTurns': inRange.length,
      'byType': byType,
      'byStaff': byStaff,
      'revenue': inRange
          .where((t) => t.status == 'checked_out' && t.paymentMethod != 'monthly_card')
          .fold<double>(0, (s, t) => s + t.feeAmount),
    };
  }

  /// Báo cáo thuê xe: đang thuê / đã trả / quá hạn + công nợ cọc-thiếu (§14).
  static Future<Map<String, dynamic>> rentalReport(Isar db) async {
    final all = await db.parkingRentals.where().findAll();
    final renting = all.where((r) => r.status == 'renting').toList();
    final returned = all.where((r) => r.status == 'returned').toList();
    final overdue = all.where((r) => r.status == 'overdue').toList();
    return {
      'renting': renting.length,
      'returned': returned.length,
      'overdue': overdue.length,
      'deposits': all.fold<double>(0, (s, r) => s + r.depositAmount),
      'fees': all.fold<double>(0, (s, r) => s + r.rentalFee),
      'overdueList': overdue.map((r) => r.rentalId).toList(),
    };
  }

  /// Chi phí theo nhóm (§14).
  static Future<Map<String, double>> expenseReport(
      Isar db, DateTime from, DateTime to) async {
    final txs =
        await db.parkingFinanceTxs.filter().isIncomeEqualTo(false).findAll();
    final out = <String, double>{};
    for (final t in txs) {
      if (!_inRange(t.createdAt, from, to)) continue;
      final key = t.expenseCategory.isEmpty ? 'OTHER' : t.expenseCategory;
      out[key] = (out[key] ?? 0) + t.amount;
    }
    return out;
  }

  /// Lãi lỗ = Doanh thu - Chi phí (§14).
  static Future<Map<String, double>> profitReport(
      Isar db, DateTime from, DateTime to) async {
    final rev = await revenueReport(db, from, to);
    final exp = await expenseReport(db, from, to);
    final expenseTotal = exp.values.fold<double>(0, (s, v) => s + v);
    final revenue = rev['total'] ?? 0;
    return {
      'revenue': revenue,
      'expense': expenseTotal,
      'profit': revenue - expenseTotal,
    };
  }

  // ══════════════ §2. DASHBOARD + §16. THÔNG BÁO ══════════════

  static Future<Map<String, dynamic>> dashboardSummary(Isar db) async {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final monthStart = DateTime(now.year, now.month);
    final tomorrow = todayStart.add(const Duration(days: 1));
    final nextMonth = DateTime(now.year, now.month + 1);

    final tickets = await db.parkingTickets.where().findAll();
    final areas = await db.parkingAreas.where().findAll();
    final cameras = await db.parkingCameras.where().findAll();
    final rentals = await db.parkingRentals.where().findAll();
    await db.parkingMonthlyTickets.where().findAll();

    final checkedOutToday = tickets
        .where((t) => _inRange(t.checkOutTime, todayStart, tomorrow))
        .toList();
    final revenueToday = checkedOutToday.fold<double>(0, (s, t) => s + t.feeAmount);
    final revenueMonth = tickets
        .where((t) => _inRange(t.checkOutTime, monthStart, nextMonth))
        .fold<double>(0, (s, t) => s + t.feeAmount);

    final totalSpots = areas.fold<int>(0, (s, a) => s + a.totalSpots);
    final usedSpots = areas.fold<int>(0, (s, a) => s + a.usedSpots);

    final rentingNow = rentals.where((r) => r.status == 'renting').toList();
    final dueSoon = rentingNow
        .where((r) =>
            r.rentEndTime.isAfter(now) &&
            r.rentEndTime.isBefore(now.add(const Duration(days: 1))))
        .length;

    // Cảnh báo (§16).
    final alerts = <String>[];
    for (final a in areas) {
      if (a.usedSpots >= a.totalSpots && a.totalSpots > 0) {
        alerts.add('Bãi ${a.name} đã đầy (${a.totalSpots}/${a.totalSpots}).');
      }
    }
    for (final c in cameras.where((c) => c.status != 'active')) {
      alerts.add('Camera ${c.name} OFFLINE.');
    }
    for (final t in await expiringSoon(db, days: 7)) {
      alerts.add('Vé tháng ${t.licensePlate} hết hạn ${t.endDate.toString().substring(0, 10)}.');
    }
    for (final r in rentals.where((r) => r.status == 'overdue')) {
      alerts.add('Xe thuê ${r.licensePlate} QUÁ HẠN trả.');
    }

    return {
      'parkingCount': tickets.where((t) => t.status == 'parking').length,
      'checkedOutToday': checkedOutToday.length,
      'freeSpots': totalSpots - usedSpots,
      'totalSpots': totalSpots,
      'revenueToday': revenueToday,
      'revenueMonth': revenueMonth,
      'activeRentals': rentingNow.length,
      'dueSoonRentals': dueSoon,
      'camerasOnline': cameras.where((c) => c.status == 'active').length,
      'camerasTotal': cameras.length,
      'alerts': alerts,
    };
  }
}
