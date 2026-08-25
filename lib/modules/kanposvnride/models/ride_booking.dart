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

  /// §14+§30. Chi tiết giá: hệ số giá động + phụ phí + khuyến mãi.
  double surgeMultiplier = 1.0; // Mưa/cao điểm/lễ/tắc đường
  double surcharge = 0; // Phụ phí cầu đường + sân bay
  double discount = 0; // Tiền giảm từ voucher/khuyến mãi
  String? promotionCode;

  /// §15. cash | wallet
  String paymentMethod = 'cash';

  /// Hoa hồng nền tảng + phần tài xế nhận sau khi hoàn thành.
  double commission = 0.0;
  double driverEarnings = 0.0;

  /// Ghép chuyến: nhóm chuyến chia sẻ (§12).
  String? sharedGroupUuid;

  /// Taxi doanh nghiệp (§43-GĐ4): tài khoản công ty gánh công nợ.
  String? corporateUuid;
  String paymentMethodCorp = ''; // mô tả hình thức DN nếu có

  @enumerated
  VehicleType requestedVehicleType = VehicleType.motorBike;
  
  @enumerated
  BookingStatus status = BookingStatus.findingDriver;
  
  bool isSharedRide = false; // Tính năng Ghép chuyến
  
  DateTime? createdAt;
  DateTime? acceptedAt;
  DateTime? pickupAt;
  DateTime? completedAt;
  DateTime? updatedAt;
  
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
