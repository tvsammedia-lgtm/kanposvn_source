import 'package:uuid/uuid.dart';
import '../models/hostel.dart';
import '../models/room.dart';
import '../models/tenant.dart';
import '../models/contract.dart';
import '../models/payment.dart';
import '../models/expense.dart';
import '../models/electric_reading.dart';
import '../models/water_reading.dart';
import '../models/hostel_service.dart';
import '../models/maintenance.dart';
import '../models/asset.dart';
import '../repositories/nhatro_isar_db.dart';

class NhaTroSeedData {
  static String _uid() => const Uuid().v4();
  static DateTime _daysAgo(int d) => DateTime.now().subtract(Duration(days: d));

  static Future<void> seedIfEmpty() async {
    final isar = await NhaTroIsarDB.getInstance();
    final count = await isar.rooms.count();
    if (count > 0) return;

    final now = DateTime.now();

    await isar.writeTxn(() async {
      // ─── Hostel ───
      final hostel = Hostel()
        ..uuid = _uid()
        ..name = 'Nhà Trọ Thanh Xuân'
        ..address = '12 Ngõ 45 Trần Phú, Thanh Xuân, Hà Nội'
        ..managerName = 'Anh Hùng'
        ..notes = 'Khu nhà trọ 200 phòng, 3 dãy'
        ..createdAt = now
        ..updatedAt = now
        ..syncStatus = SyncStatus.pending;
      await isar.hostels.put(hostel);

      // ─── Rooms (20 rooms, 3 blocks, 3 floors) ───
      final rooms = <Room>[];
      final blocks = ['Dãy A', 'Dãy B', 'Dãy C'];
      final prices = [2200000.0, 2500000.0, 2800000.0, 3000000.0, 3200000.0];
      final statuses = [RoomStatus.rented, RoomStatus.rented, RoomStatus.rented, RoomStatus.empty,
        RoomStatus.repairing, RoomStatus.reserved, RoomStatus.rented, RoomStatus.rented];
      int roomIdx = 0;
      for (int b = 0; b < 3; b++) {
        for (int f = 1; f <= 3; f++) {
          for (int r = 1; r <= 2; r++) {
            roomIdx++;
            final code = 'P${f}0$r';
            rooms.add(Room()
              ..uuid = _uid()
              ..roomCode = code
              ..roomName = 'Phòng $code'
              ..block = blocks[b]
              ..floor = f
              ..areaSize = 18.0 + (roomIdx % 5) * 2
              ..rentPrice = prices[roomIdx % prices.length]
              ..depositAmount = prices[roomIdx % prices.length] * 2
              ..status = statuses[roomIdx % statuses.length]
              ..hostelUuid = hostel.uuid
              ..createdAt = now
              ..updatedAt = now
              ..syncStatus = SyncStatus.pending);
          }
        }
      }
      await isar.rooms.putAll(rooms);

      // ─── Tenants ───
      final tenants = [
        Tenant()..uuid = _uid()..fullName = 'Nguyễn Văn An'..cccd = '001203000001'..birthDate = DateTime(1998, 3, 12)..phone = '0912345671'..email = 'an.nguyen@gmail.com'..permanentAddress = 'Phú Thọ'..occupation = 'Nhân viên văn phòng'..licensePlate = '29A-123.45'..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Tenant()..uuid = _uid()..fullName = 'Trần Thị Bích'..cccd = '001203000002'..birthDate = DateTime(1996, 7, 25)..phone = '0912345672'..email = 'bich.tran@gmail.com'..permanentAddress = 'Thái Bình'..occupation = 'Giáo viên'..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Tenant()..uuid = _uid()..fullName = 'Lê Văn Cường'..cccd = '001203000003'..birthDate = DateTime(1995, 1, 8)..phone = '0912345673'..email = 'cuong.le@gmail.com'..permanentAddress = 'Hải Phòng'..occupation = 'Kỹ sư xây dựng'..licensePlate = '16B-456.78'..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Tenant()..uuid = _uid()..fullName = 'Phạm Minh Đức'..cccd = '001203000004'..birthDate = DateTime(1999, 11, 30)..phone = '0912345674'..email = 'duc.pham@gmail.com'..permanentAddress = 'Nam Định'..occupation = 'Lập trình viên'..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Tenant()..uuid = _uid()..fullName = 'Hoàng Thị Lan'..cccd = '001203000005'..birthDate = DateTime(1997, 5, 17)..phone = '0912345675'..email = 'lan.hoang@gmail.com'..permanentAddress = 'Bắc Ninh'..occupation = 'Kế toán'..licensePlate = '99C-789.01'..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Tenant()..uuid = _uid()..fullName = 'Đặng Quốc Bảo'..cccd = '001203000006'..birthDate = DateTime(1994, 9, 2)..phone = '0912345676'..email = 'bao.dang@gmail.com'..permanentAddress = 'Nghệ An'..occupation = 'Kinh doanh tự do'..licensePlate = '37A-234.56'..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Tenant()..uuid = _uid()..fullName = 'Nguyễn Thị Mai'..cccd = '001203000007'..birthDate = DateTime(2000, 2, 14)..phone = '0912345677'..email = 'mai.nguyen@gmail.com'..permanentAddress = 'Vĩnh Phúc'..occupation = 'Y tá'..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Tenant()..uuid = _uid()..fullName = 'Bùi Văn Nam'..cccd = '001203000008'..birthDate = DateTime(1993, 8, 20)..phone = '0912345678'..email = 'nam.bui@gmail.com'..permanentAddress = 'Hà Nam'..occupation = 'Tài xế'..licensePlate = '90A-567.89'..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
      ];
      await isar.tenants.putAll(tenants);

      // ─── Contracts ───
      final contracts = [
        Contract()..uuid = _uid()..contractNumber = 'HD-2025-001'..roomUuid = rooms[0].uuid..tenantUuid = tenants[0].uuid..startDate = DateTime(2025, 1, 1)..endDate = DateTime(2026, 1, 1)..rentPrice = rooms[0].rentPrice..depositAmount = rooms[0].depositAmount..paymentCycleMonths = 3..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Contract()..uuid = _uid()..contractNumber = 'HD-2025-002'..roomUuid = rooms[1].uuid..tenantUuid = tenants[1].uuid..startDate = DateTime(2025, 2, 15)..endDate = DateTime(2026, 2, 15)..rentPrice = rooms[1].rentPrice..depositAmount = rooms[1].depositAmount..paymentCycleMonths = 1..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Contract()..uuid = _uid()..contractNumber = 'HD-2025-003'..roomUuid = rooms[2].uuid..tenantUuid = tenants[2].uuid..startDate = DateTime(2025, 3, 10)..endDate = DateTime(2026, 3, 10)..rentPrice = rooms[2].rentPrice..depositAmount = rooms[2].depositAmount..paymentCycleMonths = 6..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Contract()..uuid = _uid()..contractNumber = 'HD-2025-004'..roomUuid = rooms[3].uuid..tenantUuid = tenants[3].uuid..startDate = DateTime(2025, 4, 1)..endDate = DateTime(2026, 4, 1)..rentPrice = rooms[3].rentPrice..depositAmount = rooms[3].depositAmount..paymentCycleMonths = 3..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Contract()..uuid = _uid()..contractNumber = 'HD-2025-005'..roomUuid = rooms[4].uuid..tenantUuid = tenants[4].uuid..startDate = DateTime(2024, 6, 1)..endDate = DateTime(2025, 6, 1)..rentPrice = rooms[4].rentPrice..depositAmount = rooms[4].depositAmount..paymentCycleMonths = 3..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Contract()..uuid = _uid()..contractNumber = 'HD-2025-006'..roomUuid = rooms[5].uuid..tenantUuid = tenants[5].uuid..startDate = DateTime(2025, 5, 20)..endDate = DateTime(2026, 5, 20)..rentPrice = rooms[5].rentPrice..depositAmount = rooms[5].depositAmount..paymentCycleMonths = 3..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Contract()..uuid = _uid()..contractNumber = 'HD-2025-007'..roomUuid = rooms[6].uuid..tenantUuid = tenants[6].uuid..startDate = DateTime(2025, 6, 1)..endDate = DateTime(2026, 6, 1)..rentPrice = rooms[6].rentPrice..depositAmount = rooms[6].depositAmount..paymentCycleMonths = 1..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Contract()..uuid = _uid()..contractNumber = 'HD-2025-008'..roomUuid = rooms[7].uuid..tenantUuid = tenants[7].uuid..startDate = DateTime(2025, 7, 1)..endDate = DateTime(2026, 7, 1)..rentPrice = rooms[7].rentPrice..depositAmount = rooms[7].depositAmount..paymentCycleMonths = 3..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
      ];
      await isar.contracts.putAll(contracts);

      // ─── Payments (12 payments across months) ───
      final payments = <Payment>[];
      for (int m = 1; m <= 8; m++) {
        for (int ci = 0; ci < 3; ci++) {
          final contract = contracts[ci];
          final room = rooms[ci];
          final tenant = tenants[ci];
          final rent = contract.rentPrice ?? 2500000;
          final electric = 100000.0 + (m * 30000);
          final water = 50000.0 + (m * 10000);
          final total = rent + electric + water + 100000;
          final paid = ci == 2 ? total * 0.8 : total;
          payments.add(Payment()
            ..uuid = _uid()
            ..receiptNumber = 'PT-${m.toString().padLeft(2, '0')}-00${ci + 1}'
            ..tenantUuid = tenant.uuid
            ..roomUuid = room.uuid
            ..paymentDate = DateTime(2025, m, 5)
            ..content = 'Tiền phòng tháng $m/2025'
            ..rentAmount = rent
            ..electricAmount = electric
            ..waterAmount = water
            ..internetAmount = 100000
            ..garbageAmount = 30000
            ..parkingAmount = 50000
            ..discount = 0
            ..promotion = 0
            ..totalAmount = total
            ..paidAmount = paid
            ..debtAmount = total - paid
            ..collectedBy = 'Chị Hằng'
            ..month = m
            ..year = 2025
            ..createdAt = DateTime(2025, m, 5)
            ..updatedAt = DateTime(2025, m, 5)
            ..syncStatus = SyncStatus.pending);
        }
      }
      await isar.payments.putAll(payments);

      // ─── Expenses ───
      final expenses = [
        HostelExpense()..uuid = _uid()..expenseNumber = 'PC-2025-001'..category = 'Sửa chữa'..description = 'Sửa khóa cửa phòng P101'..amount = 200000..expenseDate = _daysAgo(60)..paidBy = 'Anh Hùng'..createdAt = _daysAgo(60)..updatedAt = _daysAgo(60)..syncStatus = SyncStatus.pending,
        HostelExpense()..uuid = _uid()..expenseNumber = 'PC-2025-002'..category = 'Mua sắm'..description = 'Mua camera an ninh dãy B'..amount = 3500000..expenseDate = _daysAgo(45)..paidBy = 'Anh Hùng'..createdAt = _daysAgo(45)..updatedAt = _daysAgo(45)..syncStatus = SyncStatus.pending,
        HostelExpense()..uuid = _uid()..expenseNumber = 'PC-2025-003'..category = 'Điện nước chung'..description = 'Tiền điện chung khu vực tháng 7'..amount = 2500000..expenseDate = _daysAgo(30)..paidBy = 'Chị Hằng'..createdAt = _daysAgo(30)..updatedAt = _daysAgo(30)..syncStatus = SyncStatus.pending,
        HostelExpense()..uuid = _uid()..expenseNumber = 'PC-2025-004'..category = 'Lương'..description = 'Lương nhân viên tháng 7'..amount = 8000000..expenseDate = _daysAgo(28)..paidBy = 'Anh Hùng'..createdAt = _daysAgo(28)..updatedAt = _daysAgo(28)..syncStatus = SyncStatus.pending,
        HostelExpense()..uuid = _uid()..expenseNumber = 'PC-2025-005'..category = 'Bảo trì'..description = 'Vệ sinh bể nước ngầm'..amount = 1500000..expenseDate = _daysAgo(15)..paidBy = 'Anh Hùng'..createdAt = _daysAgo(15)..updatedAt = _daysAgo(15)..syncStatus = SyncStatus.pending,
        HostelExpense()..uuid = _uid()..expenseNumber = 'PC-2025-006'..category = 'Internet chung'..description = 'Cước Internet tháng 8'..amount = 500000..expenseDate = _daysAgo(5)..paidBy = 'Chị Hằng'..createdAt = _daysAgo(5)..updatedAt = _daysAgo(5)..syncStatus = SyncStatus.pending,
        HostelExpense()..uuid = _uid()..expenseNumber = 'PC-2025-007'..category = 'Thuế'..description = 'Thuế môn bài quý 3'..amount = 1200000..expenseDate = _daysAgo(10)..paidBy = 'Anh Hùng'..createdAt = _daysAgo(10)..updatedAt = _daysAgo(10)..syncStatus = SyncStatus.pending,
        HostelExpense()..uuid = _uid()..expenseNumber = 'PC-2025-008'..category = 'Chi khác'..description = 'Làm lại biển số phòng'..amount = 450000..expenseDate = _daysAgo(3)..paidBy = 'Chị Hằng'..createdAt = _daysAgo(3)..updatedAt = _daysAgo(3)..syncStatus = SyncStatus.pending,
      ];
      await isar.hostelExpenses.putAll(expenses);

      // ─── Electric Readings ───
      final electrics = <ElectricReading>[];
      for (int m = 6; m <= 8; m++) {
        for (int ci = 0; ci < 3; ci++) {
          final oldIdx = 1000 + (ci * 200) + ((m - 6) * 80);
          final newIdx = oldIdx + 80 + (ci * 10);
          electrics.add(ElectricReading()
            ..uuid = _uid()
            ..roomUuid = rooms[ci].uuid
            ..meterNumber = 'CT-${rooms[ci].roomCode}'
            ..oldIndex = oldIdx
            ..newIndex = newIdx
            ..consumption = newIdx - oldIdx
            ..unitPrice = 2200.0
            ..totalAmount = (newIdx - oldIdx) * 2200.0
            ..month = m
            ..year = 2025
            ..createdAt = DateTime(2025, m, 28)
            ..updatedAt = DateTime(2025, m, 28)
            ..syncStatus = SyncStatus.pending);
        }
      }
      await isar.electricReadings.putAll(electrics);

      // ─── Water Readings ───
      final waters = <WaterReading>[];
      for (int m = 6; m <= 8; m++) {
        for (int ci = 0; ci < 3; ci++) {
          final oldIdx = 50 + (ci * 20) + ((m - 6) * 15);
          final newIdx = oldIdx + 15;
          waters.add(WaterReading()
            ..uuid = _uid()
            ..roomUuid = rooms[ci].uuid
            ..meterNumber = 'DN-${rooms[ci].roomCode}'
            ..oldIndex = oldIdx
            ..newIndex = newIdx
            ..consumption = newIdx - oldIdx
            ..unitPrice = 15000.0
            ..totalAmount = (newIdx - oldIdx) * 15000.0
            ..month = m
            ..year = 2025
            ..createdAt = DateTime(2025, m, 28)
            ..updatedAt = DateTime(2025, m, 28)
            ..syncStatus = SyncStatus.pending);
        }
      }
      await isar.waterReadings.putAll(waters);

      // ─── Services ───
      final services = [
        HostelService()..uuid = _uid()..name = 'Internet'..category = 'Internet'..price = 100000..billingType = 'fixed'..isActive = true..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        HostelService()..uuid = _uid()..name = 'Rác'..category = 'Rác'..price = 30000..billingType = 'fixed'..isActive = true..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        HostelService()..uuid = _uid()..name = 'Giữ xe'..category = 'Giữ xe'..price = 50000..billingType = 'per_person'..isActive = true..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        HostelService()..uuid = _uid()..name = 'Máy giặt'..category = 'Máy giặt'..price = 10000..billingType = 'per_unit'..isActive = true..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        HostelService()..uuid = _uid()..name = 'Điều hòa'..category = 'Điều hòa'..price = 0..billingType = 'fixed'..isActive = true..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        HostelService()..uuid = _uid()..name = 'Vệ sinh'..category = 'Vệ sinh'..price = 200000..billingType = 'fixed'..isActive = true..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        HostelService()..uuid = _uid()..name = 'Camera'..category = 'Camera'..price = 0..billingType = 'fixed'..isActive = true..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        HostelService()..uuid = _uid()..name = 'Dịch vụ khác'..category = 'Khác'..price = 0..billingType = 'fixed'..isActive = true..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
      ];
      await isar.hostelServices.putAll(services);

      // ─── Maintenance ───
      final maints = [
        Maintenance()..uuid = _uid()..roomUuid = rooms[0].uuid..equipment = 'Khóa cửa'..repairDate = _daysAgo(60)..content = 'Thay ổ khóa điện tử'..repairUnit = 'Khóa Bảo An'..cost = 200000..performer = 'Thầy Tuân'..createdAt = _daysAgo(60)..updatedAt = _daysAgo(60)..syncStatus = SyncStatus.pending,
        Maintenance()..uuid = _uid()..roomUuid = rooms[4].uuid..equipment = 'Máy lạnh'..repairDate = _daysAgo(30)..content = 'Bơm gas máy lạnh'..repairUnit = 'Điện Lạnh Hà Nội'..cost = 350000..performer = 'Thầy Phong'..createdAt = _daysAgo(30)..updatedAt = _daysAgo(30)..syncStatus = SyncStatus.pending,
        Maintenance()..uuid = _uid()..roomUuid = rooms[2].uuid..equipment = 'Đèn'..repairDate = _daysAgo(15)..content = 'Thay bóng đèn LED'..repairUnit = 'Tự sửa'..cost = 80000..performer = 'Anh Hùng'..createdAt = _daysAgo(15)..updatedAt = _daysAgo(15)..syncStatus = SyncStatus.pending,
      ];
      await isar.maintenances.putAll(maints);

      // ─── Assets ───
      final assets = [
        Asset()..uuid = _uid()..name = 'Máy lạnh Daikin 1HP'..roomUuid = rooms[0].uuid..purchaseDate = DateTime(2024, 1, 15)..purchasePrice = 8500000..depreciationRate = 10..usefulLifeMonths = 120..warrantyExpiry = '2029-01-15'..condition = 'Tốt'..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Asset()..uuid = _uid()..name = 'Máy lạnh Daikin 1.5HP'..roomUuid = rooms[1].uuid..purchaseDate = DateTime(2024, 3, 1)..purchasePrice = 10500000..depreciationRate = 10..usefulLifeMonths = 120..warrantyExpiry = '2029-03-01'..condition = 'Tốt'..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Asset()..uuid = _uid()..name = 'Tủ lạnh Panasonic 92L'..roomUuid = rooms[2].uuid..purchaseDate = DateTime(2024, 6, 10)..purchasePrice = 4200000..depreciationRate = 15..usefulLifeMonths = 84..warrantyExpiry = '2027-06-10'..condition = 'Tốt'..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Asset()..uuid = _uid()..name = 'Giường gỗ sồi'..roomUuid = rooms[3].uuid..purchaseDate = DateTime(2023, 12, 1)..purchasePrice = 3500000..depreciationRate = 5..usefulLifeMonths = 240..condition = 'Tốt'..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Asset()..uuid = _uid()..name = 'Bình nóng lạnh Ariston 30L'..roomUuid = rooms[0].uuid..purchaseDate = DateTime(2024, 2, 20)..purchasePrice = 3200000..depreciationRate = 10..usefulLifeMonths = 120..warrantyExpiry = '2029-02-20'..condition = 'Bình thường'..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
      ];
      await isar.assets.putAll(assets);
    });
  }
}
