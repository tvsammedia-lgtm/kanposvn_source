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

  // §10+§12. Tách giá & định danh.
  String? providerBookingId;
  String? ticketNumber;   // Số vé điện tử
  String? idempotencyKey; // §27 chống tạo trùng booking/payment

  double supplierPrice = 0; // Giá nhập từ provider (gồm thuế)
  double serviceFee = 0;    // Phí dịch vụ trung tâm
  double discountAmount = 0;
  String promoCode = '';
  double profit = 0;

  double paidAmount = 0;
  double remainingAmount = 0;

  DateTime? expiresAt; // Hết hạn giữ chỗ
  String agentId = ''; // Đại lý/nhân viên bán (trống = B2C)
  String contactEmail = '';

  bool needsSync = true;
  bool isDeleted = false;
  DateTime? updatedAt;

  @enumerated
  BookingAirStatus status = BookingAirStatus.draft;

  DateTime? createdAt;
}

enum BookingAirStatus {
  draft,            // Mới nhập
  pendingPayment,   // Đang chờ thanh toán
  confirmed,        // Đã xác nhận/Xuất vé
  cancelled,        // Đã hủy
  // §8. Trạng thái đầy đủ theo đặc tả.
  held,             // Giữ chỗ tạm (có expires_at)
  paid,             // Đã thanh toán đủ, chờ xuất vé
  ticketed,         // Đã xuất vé điện tử
  cancelRequested,  // Yêu cầu hủy đang xử lý
  expired,          // Hết thời gian giữ chỗ
  failed,           // Lỗi đặt/Thanh toán lỗi
  refunded          // Đã hoàn tiền
}
