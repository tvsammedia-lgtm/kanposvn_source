import 'package:uuid/uuid.dart';
import 'package:isar/isar.dart';
import '../models/hotel_room.dart';
import 'hotel_isar_service.dart';

class HotelSeedData {
  static Future<void> seed(HotelIsarService isarService) async {
    final db = await isarService.db;
    final floorsCount = await db.hotelFloors.count();
    
    if (floorsCount == 0) {
      final uuid = const Uuid();
      
      // Floors
      final floors = [
        HotelFloor()
          ..floorName = 'Tầng 1'
          ..floorCode = 'F1'
          ..description = 'Sảnh & Phòng tiêu chuẩn'
          ..displayOrder = 1,
        HotelFloor()
          ..floorName = 'Tầng 2'
          ..floorCode = 'F2'
          ..description = 'Phòng cao cấp'
          ..displayOrder = 2,
        HotelFloor()
          ..floorName = 'Tầng 3'
          ..floorCode = 'F3'
          ..description = 'Phòng VIP'
          ..displayOrder = 3,
      ];
      
      // Room Types
      final types = [
        RoomType()
          ..typeName = 'Standard Single'
          ..typeCode = 'STD-SGL'
          ..basePrice = 300000
          ..hourlyPrice = 100000
          ..overnightPrice = 250000
          ..capacity = 1
          ..description = 'Phòng tiêu chuẩn 1 giường đơn',
        RoomType()
          ..typeName = 'Standard Double'
          ..typeCode = 'STD-DBL'
          ..basePrice = 400000
          ..hourlyPrice = 150000
          ..overnightPrice = 350000
          ..capacity = 2
          ..description = 'Phòng tiêu chuẩn 1 giường đôi',
        RoomType()
          ..typeName = 'VIP Room'
          ..typeCode = 'VIP'
          ..basePrice = 800000
          ..hourlyPrice = 300000
          ..overnightPrice = 700000
          ..capacity = 2
          ..description = 'Phòng VIP đẳng cấp',
      ];
      
      await isarService.saveAll(floors);
      await isarService.saveAll(types);
      
      // Re-fetch to get IDs
      final savedFloors = await db.hotelFloors.where().findAll();
      final savedTypes = await db.roomTypes.where().findAll();
      
      // Rooms
      final List<HotelRoom> rooms = [];
      
      for (var f in savedFloors) {
        if (f.floorCode == 'F1') {
          for (int i = 1; i <= 5; i++) {
            final t = savedTypes.firstWhere((t) => t.typeCode == 'STD-SGL');
            rooms.add(HotelRoom()
              ..roomId = uuid.v4()
              ..roomName = 'P.10$i'
              ..roomNumber = '10$i'
              ..floor.value = f
              ..roomType.value = t
              ..status = RoomStatus.AVAILABLE
            );
          }
        } else if (f.floorCode == 'F2') {
          for (int i = 1; i <= 5; i++) {
            final t = savedTypes.firstWhere((t) => t.typeCode == 'STD-DBL');
            rooms.add(HotelRoom()
              ..roomId = uuid.v4()
              ..roomName = 'P.20$i'
              ..roomNumber = '20$i'
              ..floor.value = f
              ..roomType.value = t
              ..status = RoomStatus.AVAILABLE
            );
          }
        } else if (f.floorCode == 'F3') {
          for (int i = 1; i <= 2; i++) {
            final t = savedTypes.firstWhere((t) => t.typeCode == 'VIP');
            rooms.add(HotelRoom()
              ..roomId = uuid.v4()
              ..roomName = 'P.30$i'
              ..roomNumber = '30$i'
              ..floor.value = f
              ..roomType.value = t
              ..status = RoomStatus.AVAILABLE
            );
          }
        }
      }
      
      final isar = await isarService.db;
      await isar.writeTxn(() async {
        for(var room in rooms) {
          await isar.hotelRooms.put(room);
          room.floor.save();
          room.roomType.save();
        }
      });
    }
  }
}
