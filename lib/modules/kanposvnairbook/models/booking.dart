import 'package:isar/isar.dart';

part 'booking.g.dart';

@collection
class BookingLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;

  String? pnrCode;        // Mã đặt chỗ (VD: KAN889)
  String? flightOfferUuid; // Chuyến bay đã chọn
  
  String? passengerName;
  String? passengerPhone;

  double? totalAmount;    // Tổng tiền
  
  bool isCheckedIn = false;
  String? seatNumber;
  
  double? commission; // Hoa hồng
  
  bool needsSync = true;
  bool isDeleted = false;
  DateTime? updatedAt;

  @enumerated
  BookingAirStatus status = BookingAirStatus.draft;

  DateTime? createdAt;
}

enum BookingAirStatus {
  draft,            // Mới nháp
  pendingPayment,   // Đang chờ thanh toán
  confirmed,        // Đã xác nhận/Xuất vé
  cancelled         // Đã hủy
}
