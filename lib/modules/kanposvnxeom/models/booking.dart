import 'package:isar/isar.dart';

part 'booking.g.dart';

@collection
class XeOmBooking {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;
  
  String? bookingCode;
  
  String? customerUuid;
  String? customerName;
  String? customerPhone;
  
  String? driverUuid;
  String? vehicleUuid;
  
  String? pickupAddress;
  double? pickupLat;
  double? pickupLng;
  
  String? dropoffAddress;
  double? dropoffLat;
  double? dropoffLng;
  
  double? distanceKm; // Khoảng cách
  double? price; // Giá tiền

  /// §11-14. Chi tiết giá: cước gốc + phụ phí (sân bay/cao điểm/lễ) - giảm giá.
  double baseFare = 0;
  double surcharge = 0; // Phụ phí sân bay + cao điểm + lễ
  double discount = 0; // Tiền giảm từ khuyến mãi

  /// §15. Công nợ còn lại nếu thanh toán method = debt.
  double debtAmount = 0;

  String? requiredVehicleType; // Khách yêu cầu loại xe gì
  
  @enumerated
  BookingStatus status = BookingStatus.newBooking;
  
  @enumerated
  PaymentMethod paymentMethod = PaymentMethod.cash;
  
  bool isPaid = false;
  String? promotionCode; // Mã khuyến mãi
  String? notes;
  
  DateTime? scheduledAt; // Chuyến đặt trước
  DateTime? pickedUpAt;
  DateTime? completedAt;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  bool isDeleted = false;
  int syncVersion = 1;
}

enum BookingStatus {
  newBooking,
  searchingDriver,
  driverAccepted,
  driverArriving,
  pickedUp,
  inProgress, // Đang chạy
  completed,
  cancelled
}

enum PaymentMethod {
  cash,
  qr,
  momo,
  zaloPay,
  vnpay,
  bankTransfer,
  debt // Công nợ
}
