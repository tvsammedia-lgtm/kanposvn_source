import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import 'spa_isar_service.dart';
import '../models/spa_bed.dart';
import '../models/spa_service_model.dart';
import '../models/spa_technician.dart';
import '../models/spa_customer.dart';
import '../models/spa_session.dart';
import '../models/spa_inventory_models.dart';
import '../models/spa_appointment.dart';
import '../models/spa_combo.dart';
import '../models/spa_expense.dart';

class SpaSeedData {
  static Future<void> seedIfEmpty(SpaIsarService isarService) async {
    final db = await isarService.db;
    final bedCount = await db.spaBeds.count();

    if (bedCount == 0) {
      await db.writeTxn(() async {
        // ===== Giường & Phòng (spec §5-§6) =====
        final beds = [
          SpaBed()..bedId = const Uuid().v4()..name = 'Giường 01'..room = 'Phòng Facial'..status = SpaBedStatus.EMPTY,
          SpaBed()..bedId = const Uuid().v4()..name = 'Giường 02'..room = 'Phòng Facial'..status = SpaBedStatus.EMPTY,
          SpaBed()..bedId = const Uuid().v4()..name = 'Giường 03'..room = 'Phòng Body'..status = SpaBedStatus.EMPTY,
          SpaBed()..bedId = const Uuid().v4()..name = 'Giường 04'..room = 'Phòng Body'..status = SpaBedStatus.CLEANING,
          SpaBed()..bedId = const Uuid().v4()..name = 'Giường 05'..room = 'Phòng Dưỡng Sinh'..status = SpaBedStatus.EMPTY,
          SpaBed()..bedId = const Uuid().v4()..name = 'Giường 06'..room = 'Phòng Dưỡng Sinh'..status = SpaBedStatus.MAINTENANCE,
        ];
        await db.spaBeds.putAll(beds);

        // ===== Sản phẩm (ID cố định để định mức tham chiếu) =====
        final prodOil = SpaProduct()
          ..productId = 'p_oil'
          ..name = 'Tinh dầu Sả Chanh'
          ..category = SpaProductCategory.ESSENTIAL_OIL
          ..price = 150000
          ..stock = 20
          ..unit = 'Lọ';
        final prodMask = SpaProduct()
          ..productId = 'p_mask'
          ..name = 'Mặt nạ bùn khoáng'
          ..category = SpaProductCategory.SKINCARE
          ..price = 50000
          ..stock = 100
          ..unit = 'Cái';
        final prodCream = SpaProduct()
          ..productId = 'p_cream'
          ..name = 'Kem dưỡng trắng da'
          ..category = SpaProductCategory.SKINCARE
          ..price = 350000
          ..stock = 4 // tồn kho thấp → cảnh báo dashboard
          ..unit = 'Hũ';
        final prodShampoo = SpaProduct()
          ..productId = 'p_shampoo'
          ..name = 'Dầu gội thảo dược'
          ..category = SpaProductCategory.CONSUMABLE
          ..price = 80000
          ..stock = 30
          ..unit = 'Chai';
        final prodTowel = SpaProduct()
          ..productId = 'p_towel'
          ..name = 'Khăn tắm dùng một lần'
          ..category = SpaProductCategory.CONSUMABLE
          ..price = 10000
          ..stock = 200
          ..unit = 'Cái';
        await db.spaProducts.putAll([prodOil, prodMask, prodCream, prodShampoo, prodTowel]);

        // ===== Dịch vụ: nhóm + SOP + định mức (spec §8-§11) =====
        final svc1 = SpaServiceModel()
          ..serviceId = const Uuid().v4()
          ..code = 'DV001'
          ..name = 'Gội đầu dưỡng sinh'
          ..category = SpaServiceCategory.WELLNESS
          ..durationMinutes = 60
          ..price = 150000
          ..roomType = 'Phòng Dưỡng Sinh'
          ..sopSteps = ['Đón khách, tư vấn', 'Gội sạch 2 lần', 'Massage đầu - vai - gáy', 'Xả tóc thảo dược', 'Sấy & chải kiểu']
          ..consumptions = ['p_shampoo|Dầu gội thảo dược|1', 'p_towel|Khăn tắm dùng một lần|2'];
        final svc2 = SpaServiceModel()
          ..serviceId = const Uuid().v4()
          ..code = 'DV002'
          ..name = 'Massage Cổ Vai Gáy'
          ..category = SpaServiceCategory.WELLNESS
          ..durationMinutes = 60
          ..price = 250000
          ..roomType = 'Phòng Body'
          ..sopSteps = ['Đón khách, kiểm tra sức khỏe', 'Xoa bóp khởi động', 'Massage cổ vai gáy sâu', 'Chườm nóng', 'Kết thúc, uống trà']
          ..consumptions = ['p_oil|Tinh dầu Sả Chanh|1'];
        final svc3 = SpaServiceModel()
          ..serviceId = const Uuid().v4()
          ..code = 'DV003'
          ..name = 'Massage Body Đá Nóng'
          ..category = SpaServiceCategory.WELLNESS
          ..durationMinutes = 90
          ..price = 450000
          ..roomType = 'Phòng Body'
          ..sopSteps = ['Đón khách, tư vấn liệu trình', 'Tẩy tế bào chết', 'Massage đá nóng toàn thân', 'Thư giãn 10 phút', 'Tắm sạch & kết thúc']
          ..consumptions = ['p_oil|Tinh dầu Sả Chanh|2', 'p_towel|Khăn tắm dùng một lần|3'];
        final svc4 = SpaServiceModel()
          ..serviceId = const Uuid().v4()
          ..code = 'DV004'
          ..name = 'Facial Chuyên Sâu'
          ..category = SpaServiceCategory.SKINCARE
          ..durationMinutes = 90
          ..price = 600000
          ..roomType = 'Phòng Facial'
          ..sopSteps = ['Làm sạch trang điểm', 'Xông hơi mặt', 'Lấy nhân mụn', 'Massage mặt', 'Đắp mặt nạ', 'Dưỡng ẩm chống nắng']
          ..consumptions = ['p_mask|Mặt nạ bùn khoáng|1', 'p_cream|Kem dưỡng trắng da|1'];
        await db.spaServiceModels.putAll([svc1, svc2, svc3, svc4]);

        // ===== KTV (spec §7) =====
        final techs = [
          SpaTechnician()..techId = const Uuid().v4()..name = 'KTV Lan'..phone = '0901234567'..specialized = 'Facial, Gội',
          SpaTechnician()..techId = const Uuid().v4()..name = 'KTV Hoa'..phone = '0907654321'..specialized = 'Body',
          SpaTechnician()..techId = const Uuid().v4()..name = 'KTV Mai'..phone = '0905551234'..specialized = 'Dưỡng sinh, Gội',
        ];
        await db.spaTechnicians.putAll(techs);

        // ===== Khách hàng đầy đủ field (spec §3) =====
        final cus1 = SpaCustomer()
          ..customerId = const Uuid().v4()
          ..name = 'Nguyễn Thị A'
          ..phone = '0988000111'
          ..gender = 'Nữ'
          ..birthDate = DateTime(1990, 5, 12)
          ..zalo = '0988000111'
          ..email = 'thia@gmail.com'
          ..address = 'Q.1, TP.HCM'
          ..referrer = 'Facebook Ads'
          ..customerGroup = 'Thân thiết'
          ..skinType = 'Da Nhạy Cảm'
          ..allergies = 'Dị ứng cồn'
          ..medicalCondition = 'Nám nhẹ'
          ..loyaltyPoints = 120
          ..debtAmount = 0;
        final cus2 = SpaCustomer()
          ..customerId = const Uuid().v4()
          ..name = 'Trần Văn B'
          ..phone = '0988000222'
          ..gender = 'Nam'
          ..birthDate = DateTime(1985, 11, 3)
          ..address = 'Bình Thạnh, TP.HCM'
          ..referrer = 'Nguyễn Thị A'
          ..customerGroup = 'Vãng lai'
          ..skinType = 'Da Dầu'
          ..medicalCondition = 'Đau mỏi vai gáy'
          ..loyaltyPoints = 30
          ..debtAmount = 250000;
        final cus3 = SpaCustomer()
          ..customerId = const Uuid().v4()
          ..name = 'Lê Thị C'
          ..phone = '0988000333'
          ..gender = 'Nữ'
          ..customerGroup = 'VIP'
          ..skinType = 'Da Khô'
          ..loyaltyPoints = 500;
        await db.spaCustomers.putAll([cus1, cus2, cus3]);

        // ===== Combo (spec §9) =====
        await db.spaCombos.put(SpaCombo()
          ..comboId = const Uuid().v4()
          ..name = 'Combo Massage body 10 tặng 2'
          ..serviceId = svc3.serviceId
          ..serviceName = svc3.name
          ..totalSessions = 12
          ..bonusSessions = 2
          ..price = 4500000
          ..customerId = cus1.customerId
          ..customerName = cus1.name
          ..usedCount = 3
          ..purchaseDate = DateTime.now().subtract(const Duration(days: 20))
          ..expiryDate = DateTime.now().add(const Duration(days: 70)));

        // ===== Lịch hẹn (spec §4) =====
        final now = DateTime.now();
        final today9 = DateTime(now.year, now.month, now.day, 9, 0);
        final today14 = DateTime(now.year, now.month, now.day, 14, 0);
        final tomorrow = DateTime(now.year, now.month, now.day + 1, 10, 0);
        await db.spaAppointments.putAll([
          SpaAppointment()
            ..appointmentId = const Uuid().v4()
            ..customerId = cus1.customerId
            ..customerName = cus1.name
            ..serviceId = svc4.serviceId
            ..serviceName = svc4.name
            ..technicianId = techs[0].techId
            ..technicianName = techs[0].name
            ..bedId = beds[0].bedId
            ..bedName = beds[0].name
            ..startTime = today14
            ..endTime = today14.add(const Duration(minutes: 90))
            ..status = SpaAppointmentStatus.BOOKED,
          SpaAppointment()
            ..appointmentId = const Uuid().v4()
            ..customerId = cus2.customerId
            ..customerName = cus2.name
            ..serviceId = svc2.serviceId
            ..serviceName = svc2.name
            ..technicianId = techs[1].techId
            ..technicianName = techs[1].name
            ..bedId = beds[2].bedId
            ..bedName = beds[2].name
            ..startTime = today9
            ..endTime = today9.add(const Duration(minutes: 60))
            ..status = SpaAppointmentStatus.COMPLETED,
          SpaAppointment()
            ..appointmentId = const Uuid().v4()
            ..customerId = cus3.customerId
            ..customerName = cus3.name
            ..serviceId = svc1.serviceId
            ..serviceName = svc1.name
            ..technicianId = techs[2].techId
            ..technicianName = techs[2].name
            ..bedId = beds[4].bedId
            ..bedName = beds[4].name
            ..startTime = tomorrow
            ..endTime = tomorrow.add(const Duration(minutes: 60))
            ..status = SpaAppointmentStatus.BOOKED,
        ]);

        // ===== Thu chi mẫu (spec §17-§18) =====
        await db.spaExpenses.putAll([
          SpaExpense()
            ..expenseId = const Uuid().v4()
            ..content = 'Thuê mặt bằng tháng này'
            ..amount = 15000000
            ..type = SpaExpenseType.FIXED
            ..category = 'Thuê nhà'
            ..spentAt = DateTime(now.year, now.month, 1),
          SpaExpense()
            ..expenseId = const Uuid().v4()
            ..content = 'Nhập mỹ phẩm đợt 1'
            ..amount = 5000000
            ..type = SpaExpenseType.VARIABLE
            ..category = 'Mỹ phẩm'
            ..spentAt = DateTime(now.year, now.month, 5),
          SpaExpense()
            ..expenseId = const Uuid().v4()
            ..content = 'Quảng cáo Facebook'
            ..amount = 2000000
            ..type = SpaExpenseType.VARIABLE
            ..category = 'Marketing'
            ..spentAt = DateTime(now.year, now.month, 8),
        ]);
      });
    }

    await _seedSessionsIfEmpty(db);
  }

  static Future<void> _seedSessionsIfEmpty(Isar db) async {
    final sessionCount = await db.spaSessions.count();
    if (sessionCount > 0) return;

    final beds = await db.spaBeds.where().findAll();
    final services = await db.spaServiceModels.where().findAll();
    final techs = await db.spaTechnicians.where().findAll();
    final customers = await db.spaCustomers.where().findAll();
    if (beds.isEmpty || services.isEmpty || techs.isEmpty || customers.isEmpty) return;

    await db.writeTxn(() async {
      final now = DateTime.now();

      final s1 = SpaSession()
        ..sessionId = const Uuid().v4()
        ..startTime = now.subtract(const Duration(hours: 2))
        ..endTime = now.subtract(const Duration(hours: 1))
        ..status = SpaSessionStatus.COMPLETED
        ..totalAmount = services[1].price
        ..paymentInfo =
            '[{"method":"Tiền mặt","amount":${services[1].price}}]';
      s1.bed.value = beds[0];
      s1.service.value = services[1];
      s1.technician.value = techs[1];
      s1.customer.value = customers[0];
      await db.spaSessions.put(s1);
      await s1.bed.save();
      await s1.service.save();
      await s1.technician.save();
      await s1.customer.save();

      final s2 = SpaSession()
        ..sessionId = const Uuid().v4()
        ..startTime = now.subtract(const Duration(minutes: 90))
        ..endTime = now.subtract(const Duration(minutes: 30))
        ..status = SpaSessionStatus.COMPLETED
        ..totalAmount = services[3].price
        ..tipAmount = 50000
        ..paymentInfo =
            '[{"method":"QR Code","amount":${services[3].price}}]';
      s2.bed.value = beds[1];
      s2.service.value = services[3];
      s2.technician.value = techs[0];
      s2.customer.value = customers[1];
      await db.spaSessions.put(s2);
      await s2.bed.save();
      await s2.service.save();
      await s2.technician.save();
      await s2.customer.save();

      final activeBed = beds[2];
      activeBed.status = SpaBedStatus.PLAYING;
      await db.spaBeds.put(activeBed);

      final s3 = SpaSession()
        ..sessionId = const Uuid().v4()
        ..startTime = now.subtract(const Duration(minutes: 20))
        ..status = SpaSessionStatus.IN_PROGRESS
        ..totalAmount = services[0].price;
      s3.bed.value = activeBed;
      s3.service.value = services[0];
      s3.technician.value = techs[0];
      s3.customer.value = customers[0];
      await db.spaSessions.put(s3);
      await s3.bed.save();
      await s3.service.save();
      await s3.technician.save();
      await s3.customer.save();
    });
  }
}
