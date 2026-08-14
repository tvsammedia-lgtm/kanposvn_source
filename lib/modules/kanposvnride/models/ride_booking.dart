import 'package:isar/isar.dart';
import 'ride_user.dart';
import 'ride_driver.dart';

part 'ride_booking.g.dart';

@collection
class RideBooking {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;

  @Index()
  String? passengerUuid;
  
  @Index()
  String? driverUuid;
  
  String? pickupAddress;
  double? pickupLat;
  double? pickupLng;
  
  String? dropoffAddress;
  double? dropoffLat;
  double? dropoffLng;
  
  double distanceKm = 0.0;
  double estimatedPrice = 0.0;
  double finalPrice = 0.0;
  
  @enumerated
  VehicleType requestedVehicleType = VehicleType.motorBike;
  
  @enumerated
  BookingStatus status = BookingStatus.findingDriver;
  
  bool isSharedRide = false; // Tính năng Ghép chuyến
  
  DateTime? createdAt;
  DateTime? acceptedAt;
  DateTime? pickupAt;
  DateTime? completedAt;
  
  @enumerated
  SyncStatus syncStatus = SyncStatus.pending; // Quan trọng cho Offline Mode
}

enum BookingStatus {
  findingDriver, // Đang tìm tài xế
  accepted,      // Tài xế đã nhận, đang di chuyển đến
  arrived,       // Tài xế đã tới điểm đón
  inProgress,    // Đang trên đường đi
  completed,     // Đã đến nơi
  cancelled      // Khách hoặc tài hủy
}
