import 'package:isar/isar.dart';

part 'parking_ticket.g.dart';

@collection
class ParkingTicket {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  
  @Index(unique: true, replace: true)
  String ticketId = '';
  
  String vehicleId = ''; // Liên kết tới ParkingVehicle
  String licensePlate = ''; // Lưu trực tiếp biển số tại thời điểm quét
  String rfidCard = ''; // Mã thẻ từ sử dụng
  
  DateTime checkInTime = DateTime.now();
  String checkInCameraId = ''; // Cổng vào
  String checkInImageFront = ''; // URL ảnh đầu xe
  String checkInImageBack = ''; // URL ảnh đuôi xe
  String checkInStaffId = '';

  DateTime? checkOutTime;
  String checkOutCameraId = ''; // Cổng ra
  String checkOutImageFront = '';
  String checkOutImageBack = '';
  String checkOutStaffId = '';

  double feeAmount = 0; // Tiền vé
  String paymentMethod = 'cash'; // cash, qr_code, transfer, monthly_card
  String paymentStatus = 'unpaid'; // unpaid, paid

  /// Vé tháng áp dụng (nếu thanh toán bằng monthly_card).
  String monthlyTicketId = '';

  String status = 'parking'; // parking, checked_out, lost_ticket
}
