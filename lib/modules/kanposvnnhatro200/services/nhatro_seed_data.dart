import 'package:uuid/uuid.dart';
import '../models/hostel.dart';
import '../models/room.dart';
import '../models/tenant.dart';
import '../models/contract.dart';
import '../repositories/nhatro_isar_db.dart';

class NhaTroSeedData {
  static Future<void> seedIfEmpty() async {
    final isar = await NhaTroIsarDB.getInstance();
    final roomCount = await isar.rooms.count();
    if (roomCount > 0) return;

    await isar.writeTxn(() async {
      final hostel = Hostel()
        ..uuid = const Uuid().v4()
        ..name = 'Nhà Trọ Thanh Xuân'
        ..address = '12 Ngõ 45 Trần Phú, Thanh Xuân, Hà Nội'
        ..managerName = 'Anh Hùng'
        ..notes = 'Khu nhà trọ 200 phòng'
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..syncStatus = SyncStatus.pending;
      await isar.hostels.put(hostel);

      final rooms = [
        Room()..uuid = const Uuid().v4()..roomCode = 'P101'..roomName = 'Phòng 101'..block = 'Dãy A'..floor = 1..areaSize = 20..rentPrice = 2500000..depositAmount = 5000000..status = RoomStatus.rented..hostelUuid = hostel.uuid..createdAt = DateTime.now()..updatedAt = DateTime.now()..syncStatus = SyncStatus.pending,
        Room()..uuid = const Uuid().v4()..roomCode = 'P102'..roomName = 'Phòng 102'..block = 'Dãy A'..floor = 1..areaSize = 20..rentPrice = 2500000..depositAmount = 5000000..status = RoomStatus.rented..hostelUuid = hostel.uuid..createdAt = DateTime.now()..updatedAt = DateTime.now()..syncStatus = SyncStatus.pending,
        Room()..uuid = const Uuid().v4()..roomCode = 'P103'..roomName = 'Phòng 103'..block = 'Dãy A'..floor = 1..areaSize = 18..rentPrice = 2200000..depositAmount = 4000000..status = RoomStatus.empty..hostelUuid = hostel.uuid..createdAt = DateTime.now()..updatedAt = DateTime.now()..syncStatus = SyncStatus.pending,
        Room()..uuid = const Uuid().v4()..roomCode = 'P201'..roomName = 'Phòng 201'..block = 'Dãy B'..floor = 2..areaSize = 25..rentPrice = 3000000..depositAmount = 6000000..status = RoomStatus.rented..hostelUuid = hostel.uuid..createdAt = DateTime.now()..updatedAt = DateTime.now()..syncStatus = SyncStatus.pending,
        Room()..uuid = const Uuid().v4()..roomCode = 'P202'..roomName = 'Phòng 202'..block = 'Dãy B'..floor = 2..areaSize = 25..rentPrice = 3000000..depositAmount = 6000000..status = RoomStatus.repairing..hostelUuid = hostel.uuid..createdAt = DateTime.now()..updatedAt = DateTime.now()..syncStatus = SyncStatus.pending,
        Room()..uuid = const Uuid().v4()..roomCode = 'P203'..roomName = 'Phòng 203'..block = 'Dãy B'..floor = 2..areaSize = 22..rentPrice = 2700000..depositAmount = 5000000..status = RoomStatus.empty..hostelUuid = hostel.uuid..createdAt = DateTime.now()..updatedAt = DateTime.now()..syncStatus = SyncStatus.pending,
        Room()..uuid = const Uuid().v4()..roomCode = 'P301'..roomName = 'Phòng 301'..block = 'Dãy C'..floor = 3..areaSize = 18..rentPrice = 2300000..depositAmount = 4000000..status = RoomStatus.rented..hostelUuid = hostel.uuid..createdAt = DateTime.now()..updatedAt = DateTime.now()..syncStatus = SyncStatus.pending,
        Room()..uuid = const Uuid().v4()..roomCode = 'P302'..roomName = 'Phòng 302'..block = 'Dãy C'..floor = 3..areaSize = 18..rentPrice = 2300000..depositAmount = 4000000..status = RoomStatus.reserved..hostelUuid = hostel.uuid..createdAt = DateTime.now()..updatedAt = DateTime.now()..syncStatus = SyncStatus.pending,
      ];
      await isar.rooms.putAll(rooms);

      final tenants = [
        Tenant()..uuid = const Uuid().v4()..fullName = 'Nguyễn Văn An'..cccd = '001203000001'..birthDate = DateTime(1998, 3, 12)..phone = '0912345671'..email = 'an.nguyen@gmail.com'..permanentAddress = 'Phú Thọ'..occupation = 'Nhân viên văn phòng'..licensePlate = '29A-123.45'..createdAt = DateTime.now()..updatedAt = DateTime.now()..syncStatus = SyncStatus.pending,
        Tenant()..uuid = const Uuid().v4()..fullName = 'Trần Thị Bích'..cccd = '001203000002'..birthDate = DateTime(1996, 7, 25)..phone = '0912345672'..email = 'bich.tran@gmail.com'..permanentAddress = 'Thái Bình'..occupation = 'Giáo viên'..createdAt = DateTime.now()..updatedAt = DateTime.now()..syncStatus = SyncStatus.pending,
        Tenant()..uuid = const Uuid().v4()..fullName = 'Lê Văn Cường'..cccd = '001203000003'..birthDate = DateTime(1995, 1, 8)..phone = '0912345673'..email = 'cuong.le@gmail.com'..permanentAddress = 'Hải Phòng'..occupation = 'Kỹ sư xây dựng'..licensePlate = '16B-456.78'..createdAt = DateTime.now()..updatedAt = DateTime.now()..syncStatus = SyncStatus.pending,
        Tenant()..uuid = const Uuid().v4()..fullName = 'Phạm Minh Đức'..cccd = '001203000004'..birthDate = DateTime(1999, 11, 30)..phone = '0912345674'..email = 'duc.pham@gmail.com'..permanentAddress = 'Nam Định'..occupation = 'Lập trình viên'..createdAt = DateTime.now()..updatedAt = DateTime.now()..syncStatus = SyncStatus.pending,
        Tenant()..uuid = const Uuid().v4()..fullName = 'Hoàng Thị Lan'..cccd = '001203000005'..birthDate = DateTime(1997, 5, 17)..phone = '0912345675'..email = 'lan.hoang@gmail.com'..permanentAddress = 'Bắc Ninh'..occupation = 'Kế toán'..licensePlate = '99C-789.01'..createdAt = DateTime.now()..updatedAt = DateTime.now()..syncStatus = SyncStatus.pending,
        Tenant()..uuid = const Uuid().v4()..fullName = 'Đặng Quốc Bảo'..cccd = '001203000006'..birthDate = DateTime(1994, 9, 2)..phone = '0912345676'..email = 'bao.dang@gmail.com'..permanentAddress = 'Nghệ An'..occupation = 'Kinh doanh tự do'..licensePlate = '37A-234.56'..createdAt = DateTime.now()..updatedAt = DateTime.now()..syncStatus = SyncStatus.pending,
      ];
      await isar.tenants.putAll(tenants);

      final now = DateTime.now();
      final contracts = [
        Contract()..uuid = const Uuid().v4()..contractNumber = 'HD-2025-001'..roomUuid = rooms[0].uuid..tenantUuid = tenants[0].uuid..startDate = DateTime(2025, 1, 1)..endDate = DateTime(2026, 1, 1)..rentPrice = 2500000..depositAmount = 5000000..paymentCycleMonths = 3..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Contract()..uuid = const Uuid().v4()..contractNumber = 'HD-2025-002'..roomUuid = rooms[1].uuid..tenantUuid = tenants[1].uuid..startDate = DateTime(2025, 2, 15)..endDate = DateTime(2026, 2, 15)..rentPrice = 2500000..depositAmount = 5000000..paymentCycleMonths = 1..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Contract()..uuid = const Uuid().v4()..contractNumber = 'HD-2025-003'..roomUuid = rooms[3].uuid..tenantUuid = tenants[2].uuid..startDate = DateTime(2025, 3, 10)..endDate = DateTime(2026, 3, 10)..rentPrice = 3000000..depositAmount = 6000000..paymentCycleMonths = 6..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Contract()..uuid = const Uuid().v4()..contractNumber = 'HD-2025-004'..roomUuid = rooms[6].uuid..tenantUuid = tenants[3].uuid..startDate = DateTime(2025, 4, 1)..endDate = DateTime(2026, 4, 1)..rentPrice = 2300000..depositAmount = 4000000..paymentCycleMonths = 3..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Contract()..uuid = const Uuid().v4()..contractNumber = 'HD-2025-005'..roomUuid = rooms[0].uuid..tenantUuid = tenants[4].uuid..startDate = DateTime(2024, 6, 1)..endDate = DateTime(2025, 6, 1)..rentPrice = 2500000..depositAmount = 5000000..paymentCycleMonths = 3..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
        Contract()..uuid = const Uuid().v4()..contractNumber = 'HD-2025-006'..roomUuid = rooms[4].uuid..tenantUuid = tenants[5].uuid..startDate = DateTime(2025, 5, 20)..endDate = DateTime(2026, 5, 20)..rentPrice = 3000000..depositAmount = 6000000..paymentCycleMonths = 3..createdAt = now..updatedAt = now..syncStatus = SyncStatus.pending,
      ];
      await isar.contracts.putAll(contracts);
    });
  }
}
