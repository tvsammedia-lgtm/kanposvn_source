import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import 'spa_isar_service.dart';
import '../models/spa_bed.dart';
import '../models/spa_service_model.dart';
import '../models/spa_technician.dart';
import '../models/spa_customer.dart';
import '../models/spa_session.dart';
import '../models/spa_inventory_models.dart';

class SpaSeedData {
  static Future<void> seedIfEmpty(SpaIsarService isarService) async {
    final db = await isarService.db;
    final bedCount = await db.spaBeds.count();
    
    if (bedCount == 0) {
      await db.writeTxn(() async {
        // Seed Beds
        final bed1 = SpaBed()..bedId = const Uuid().v4()..name = 'Giường 01'..room = 'Phòng Facial'..status = SpaBedStatus.EMPTY;
        final bed2 = SpaBed()..bedId = const Uuid().v4()..name = 'Giường 02'..room = 'Phòng Facial'..status = SpaBedStatus.EMPTY;
        final bed3 = SpaBed()..bedId = const Uuid().v4()..name = 'Giường 03'..room = 'Phòng Body'..status = SpaBedStatus.EMPTY;
        final bed4 = SpaBed()..bedId = const Uuid().v4()..name = 'Giường 04'..room = 'Phòng Body'..status = SpaBedStatus.EMPTY;
        
        await db.spaBeds.putAll([bed1, bed2, bed3, bed4]);

        // Seed Services
        final svc1 = SpaServiceModel()..serviceId = const Uuid().v4()..name = 'Gội đầu dưỡng sinh'..durationMinutes = 60..price = 150000;
        final svc2 = SpaServiceModel()..serviceId = const Uuid().v4()..name = 'Massage Cổ Vai Gáy'..durationMinutes = 60..price = 250000;
        final svc3 = SpaServiceModel()..serviceId = const Uuid().v4()..name = 'Massage Body Đá Nóng'..durationMinutes = 90..price = 450000;
        final svc4 = SpaServiceModel()..serviceId = const Uuid().v4()..name = 'Facial Chuyên Sâu'..durationMinutes = 90..price = 600000;

        await db.spaServiceModels.putAll([svc1, svc2, svc3, svc4]);

        // Seed Technicians
        final tech1 = SpaTechnician()..techId = const Uuid().v4()..name = 'KTV Lan'..phone = '0901234567'..specialized = 'Facial, Gội';
        final tech2 = SpaTechnician()..techId = const Uuid().v4()..name = 'KTV Hoa'..phone = '0907654321'..specialized = 'Body';
        
        await db.spaTechnicians.putAll([tech1, tech2]);

        // Seed Customers
        final cus1 = SpaCustomer()..customerId = const Uuid().v4()..name = 'Nguyễn Thị A'..phone = '0988000111'..skinType = 'Da Nhạy Cảm'..allergies = 'Dị ứng cồn';
        final cus2 = SpaCustomer()..customerId = const Uuid().v4()..name = 'Trần Văn B'..phone = '0988000222'..skinType = 'Da Dầu'..medicalCondition = 'Đau mỏi vai gáy';
        
        await db.spaCustomers.putAll([cus1, cus2]);

        // Seed Products
        final prod1 = SpaProduct()..productId = const Uuid().v4()..name = 'Tinh dầu Sả Chanh'..category = SpaProductCategory.ESSENTIAL_OIL..price = 150000..stock = 20..unit = 'Lọ';
        final prod2 = SpaProduct()..productId = const Uuid().v4()..name = 'Mặt nạ bùn khoáng'..category = SpaProductCategory.SKINCARE..price = 50000..stock = 100..unit = 'Cái';
        
        await db.spaProducts.putAll([prod1, prod2]);
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
        ..totalAmount = services[1].price;
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
        ..totalAmount = services[3].price;
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
