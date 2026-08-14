import 'package:isar/isar.dart';
import 'ride_user.dart'; // import for SyncStatus

part 'ride_driver.g.dart';

@collection
class RideDriver {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;

  String? fullName;
  String? phone;
  String? avatarUrl;
  
  String? vehiclePlate;
  @enumerated
  VehicleType vehicleType = VehicleType.motorBike;
  
  double driverWalletBalance = 0.0;
  
  @enumerated
  DriverStatus status = DriverStatus.offline; 
  
  double? currentLat;
  double? currentLng;
  
  double averageRating = 5.0;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  
  @enumerated
  SyncStatus syncStatus = SyncStatus.synced;
}

enum VehicleType {
  motorBike, // Xe máy
  evBike,    // Xe điện
  car4Seats, // Ô tô 4 chỗ
  car7Seats, // Ô tô 7 chỗ
  delivery   // Giao hàng
}

enum DriverStatus {
  online,   // Đang chờ cuốc
  offline,  // Tắt app
  busy      // Đang chở khách
}
