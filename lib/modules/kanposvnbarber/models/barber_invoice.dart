import 'package:isar/isar.dart';

part 'barber_invoice.g.dart';

@collection
class BarberInvoice {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String invoiceId = '';

  String? customerId;
  String? customerName;
  String? appointmentId;

  double subTotal = 0.0;
  double discount = 0.0;
  double total = 0.0;
  
  String paymentMethod = 'Tiền mặt'; // Tiền mặt, QR, Chuyển khoản, Ví điện tử
  String status = 'Chờ thanh toán'; // Chờ thanh toán, Đã thanh toán, Hủy

  String? voucherId;
  String? note;

  @Index()
  DateTime createdAt = DateTime.now();
}
