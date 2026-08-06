import 'package:isar/isar.dart';

part 'ride_driver.g.dart';

@collection
class KanRideDriver {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  
  @Index(unique: true, replace: true)
  String driverId = '';
  
  String fullName = '';
  String phone = '';
  String avatar = '';
  
  String vehicleLicensePlate = '';
  String vehicleModel = '';
  String vehicleTypeId = '';
  
  double rating = 5.0;
  
  double? currentLat;
  double? currentLng;
  
  bool isOnline = false;
  String status = 'available'; // available, busy, offline
  
  DateTime createdAt = DateTime.now();
}
