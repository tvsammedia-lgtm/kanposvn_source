import '../models/member.dart';
import '../models/membership_plan.dart';
import '../models/check_in.dart';
import '../models/gym_product.dart';
import '../models/trainer.dart';
import '../models/asset.dart';
import 'gym_isar_service.dart';

/// Bộ dữ liệu mẫu KanGYM theo PRD (gói tập, hội viên, PT, lớp học,
/// sản phẩm POS, thiết bị, check-in hôm nay).
class GymSeedData {
  static bool _seeded = false;

  static Future<void> seedIfEmpty(GymIsarService isar) async {
    if (_seeded) return;
    final plans = await isar.getPlans();
    if (plans.isNotEmpty) {
      _seeded = true;
      return;
    }

    // --- Gói tập (PRD §8: ngày/tuần/tháng/3t/6t/năm/không giới hạn) ---
    final planDefs = [
      ('PLN-DAY', 'Vé Ngày', 'day', 50000, 1, 1),
      ('PLN-WEEK', 'Gói Tuần', 'week', 250000, 7, 0),
      ('PLN-MONTH', 'Gói 1 Tháng', 'month', 700000, 30, 0),
      ('PLN-QTR', 'Gói 3 Tháng', 'quarter', 1800000, 90, 0),
      ('PLN-HALF', 'Gói 6 Tháng', 'half_year', 3300000, 180, 0),
      ('PLN-YEAR', 'Gói 1 Năm', 'year', 6000000, 365, 0),
      ('PLN-UNLIM', 'Không Giới Hạn', 'unlimited', 9999000, 3650, 0),
    ];
    for (final d in planDefs) {
      await isar.savePlan(GymPlan()
        ..planId = d.$1
        ..name = d.$2
        ..type = d.$3
        ..price = d.$4.toDouble()
        ..durationDays = d.$5
        ..totalSessions = d.$6
        ..description = 'Bao gồm tất cả khu vực tập');
    }

    // --- Hội viên ---
    final memberDefs = [
      ('MEM-001', 'GYM0901234567', 'Nguyễn Văn An', 'male', '0901234567',
          172, 78, 'Tăng cơ'),
      ('MEM-002', 'GYM0912345678', 'Trần Thị Bình', 'female', '0912345678',
          160, 55, 'Giảm cân'),
      ('MEM-003', 'GYM0923456789', 'Lê Văn Cường', 'male', '0923456789',
          175, 85, 'Sức bền'),
      ('MEM-004', 'GYM0934567890', 'Phạm Thị Dung', 'female', '0934567890',
          158, 50, 'Yoga linh hoạt'),
      ('MEM-005', 'GYM0945678901', 'Hoàng Văn Em', 'male', '0945678901',
          168, 62, 'Giảm mỡ bụng'),
      ('MEM-006', 'GYM0956789012', 'Đỗ Thị Phượng', 'female', '0956789012',
          165, 58, 'Dáng vóc'),
    ];
    for (final m in memberDefs) {
      await isar.saveMember(GymMember()
        ..memberId = m.$1
        ..qrCode = m.$2
        ..fullName = m.$3
        ..gender = m.$4
        ..phone = m.$5
        ..heightCm = m.$6.toDouble()
        ..weightKg = m.$7.toDouble()
        ..target = m.$8);
    }

    // --- Thẻ tập: MEM-001 gói năm, MEM-002 gói tháng (đang hiệu lực) ---
    final now = DateTime.now();
    await _sellCard(isar, 'CARD-001', 'MEM-001', 'PLN-YEAR',
        now.subtract(const Duration(days: 60)));
    await _sellCard(isar, 'CARD-002', 'MEM-002', 'PLN-MONTH',
        now.subtract(const Duration(days: 25)));
    // MEM-003 gói tháng SẮP HẾT HẠN (còn 3 ngày)
    await _sellCard(isar, 'CARD-003', 'MEM-003', 'PLN-MONTH',
        now.subtract(const Duration(days: 27)));

    // --- Check-in hôm nay ---
    await isar.saveCheckIn(GymCheckIn()
      ..checkInId = 'CHK-${now.millisecondsSinceEpoch}-1'
      ..memberId = 'MEM-001'
      ..cardId = 'CARD-001'
      ..method = 'qr_code'
      ..checkInTime = now.subtract(const Duration(hours: 2)));
    await isar.saveCheckIn(GymCheckIn()
      ..checkInId = 'CHK-${now.millisecondsSinceEpoch}-2'
      ..memberId = 'MEM-002'
      ..cardId = 'CARD-002'
      ..method = 'manual'
      ..checkInTime = now.subtract(const Duration(minutes: 40)));

    // --- Sản phẩm POS mini (PRD §15) ---
    final productDefs = [
      ('PRD-001', 'Nước Suối 500ml', 'drink', 10000, 6000, 120),
      ('PRD-002', 'Nước Energy', 'drink', 20000, 14000, 60),
      ('PRD-003', 'Whey Protein 1kg', 'supplement', 1200000, 950000, 15),
      ('PRD-004', 'BCAA 300g', 'supplement', 650000, 500000, 10),
      ('PRD-005', 'Protein Bar', 'supplement', 35000, 22000, 80),
      ('PRD-006', 'Áo Gym KanPOSVN', 'clothing', 250000, 150000, 30),
      ('PRD-007', 'Găng Tập', 'accessory', 120000, 75000, 25),
      ('PRD-008', 'Bình Nước Gym', 'accessory', 90000, 55000, 40),
    ];
    for (final p in productDefs) {
      await isar.saveProduct(GymProduct()
        ..productId = p.$1
        ..name = p.$2
        ..category = p.$3
        ..price = p.$4.toDouble()
        ..importPrice = p.$5.toDouble()
        ..stock = p.$6
        ..barcode = '8934${p.$1.hashCode.abs() % 100000}');
    }

    // --- Huấn luyện viên ---
    final trainerDefs = [
      ('TRA-001', 'Huỳnh Quốc Đại', 'personal_trainer', 15000000, 0.10),
      ('TRA-002', 'Ngô Thanh Hà', 'yoga', 12000000, 0.08),
      ('TRA-003', 'Vũ Minh Tuấn', 'boxing', 14000000, 0.10),
      ('TRA-004', 'Trịnh Lan Chi', 'dance', 11000000, 0.08),
    ];
    for (final t in trainerDefs) {
      await isar.saveTrainer(GymTrainer()
        ..trainerId = t.$1
        ..fullName = t.$2
        ..specialty = t.$3
        ..phone = '09${t.$1.hashCode.abs() % 100000000}'
        ..salary = t.$4.toDouble()
        ..commissionRate = t.$5);
    }

    // --- Lớp học hôm nay & mai ---
    final today7 = DateTime(now.year, now.month, now.day, 7);
    final today18 = DateTime(now.year, now.month, now.day, 18);
    final tomorrow = today7.add(const Duration(days: 1));
    await isar.saveClassSchedule(GymClassSchedule()
      ..classId = 'CLS-001'
      ..trainerId = 'TRA-002'
      ..className = 'Yoga Cơ Bản'
      ..startTime = today7
      ..endTime = today7.add(const Duration(hours: 1, minutes: 30))
      ..maxCapacity = 20
      ..registeredCount = 12);
    await isar.saveClassSchedule(GymClassSchedule()
      ..classId = 'CLS-002'
      ..trainerId = 'TRA-004'
      ..className = 'Zumba Đốt Mỡ'
      ..startTime = today18
      ..endTime = today18.add(const Duration(hours: 1))
      ..maxCapacity = 25
      ..registeredCount = 18);
    await isar.saveClassSchedule(GymClassSchedule()
      ..classId = 'CLS-003'
      ..trainerId = 'TRA-003'
      ..className = 'Boxing Nhập Môn'
      ..startTime = tomorrow
      ..endTime = tomorrow.add(const Duration(hours: 2))
      ..maxCapacity = 12
      ..registeredCount = 5);

    // --- Thiết bị & khấu hao (PRD §17) ---
    final assetDefs = [
      ('AST-001', 'Máy Chạy Bộ Technogym', 85000000, 60, 'active'),
      ('AST-002', 'Xe Đạp Tập Air Bike', 12000000, 48, 'active'),
      ('AST-003', 'Máy Smith Machine', 45000000, 72, 'maintenance'),
      ('AST-004', 'Tủ Lưu Trữ Khăn', 8000000, 36, 'broken'),
    ];
    for (final a in assetDefs) {
      await isar.saveAsset(GymAsset()
        ..assetId = a.$1
        ..name = a.$2
        ..purchasePrice = a.$3.toDouble()
        ..purchaseDate = now.subtract(const Duration(days: 400))
        ..depreciationMonths = a.$4
        ..status = a.$5);
    }

    _seeded = true;
  }

  static Future<void> _sellCard(GymIsarService isar, String cardId,
      String memberId, String planId, DateTime start) async {
    final plan = await isar.findPlan(planId);
    await isar.saveCard(GymMembershipCard()
      ..cardId = cardId
      ..memberId = memberId
      ..planId = planId
      ..startDate = start
      ..endDate = start.add(Duration(days: plan?.durationDays ?? 30))
      ..paymentStatus = 'paid');
  }
}
