import 'package:isar/isar.dart';

part 'parking_area.g.dart';

@collection
class ParkingArea {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  
  @Index(unique: true, replace: true)
  String areaId = '';
  
  String name = ''; // Khu A, Tầng hầm 1...
  String areaCode = '';
  
  int totalSpots = 0; // Tổng chỗ đỗ
  int usedSpots = 0; // Chỗ đã dùng
  
  String allowedVehicleTypes = 'motorbike,car'; // Các loại xe cho phép
  
  String status = 'active'; // active, maintenance
}
