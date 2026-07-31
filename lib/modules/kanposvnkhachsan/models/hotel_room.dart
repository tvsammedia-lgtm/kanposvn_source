import 'package:isar/isar.dart';

part 'hotel_room.g.dart';

enum RoomStatus {
  AVAILABLE('Trống', 0xFF10B981),
  OCCUPIED('Có khách', 0xFFEF4444),
  RESERVED('Đặt trước', 0xFFF59E0B),
  CLEANING('Đang dọn', 0xFFF97316),
  MAINTENANCE('Bảo trì / Khóa', 0xFF6B7280);

  final String label;
  final int colorValue;
  const RoomStatus(this.label, this.colorValue);
}

@collection
class RoomType {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String typeCode = ''; // e.g. STD, VIP

  String typeName = ''; // Standard, Superior, Deluxe, VIP...
  
  double basePrice = 0; // Giá ngày
  double hourlyPrice = 0; // Giá giờ
  double overnightPrice = 0; // Giá qua đêm
  
  int capacity = 2;
  String description = '';
}

@collection
class HotelFloor {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String floorCode = '';

  String floorName = ''; // Tầng 1, Tầng 2, Tầng 3...
  String description = '';
  int displayOrder = 1;
}

@collection
class HotelRoom {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String roomId = ''; // UUID for sync

  String roomNumber = ''; // 101, 102, 201...
  String roomName = ''; 

  final floor = IsarLink<HotelFloor>();
  final roomType = IsarLink<RoomType>();

  @enumerated
  RoomStatus status = RoomStatus.AVAILABLE;

  String activeCheckInId = '';
  String activeReservationId = '';
  
  String note = '';
  DateTime updatedAt = DateTime.now();
}
