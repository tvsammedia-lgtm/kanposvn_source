import 'package:uuid/uuid.dart';
import 'spa_isar_service.dart';
import '../models/spa_bed.dart';
import '../models/spa_service_model.dart';
import '../models/spa_technician.dart';
import '../models/spa_customer.dart';
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
  }
}
