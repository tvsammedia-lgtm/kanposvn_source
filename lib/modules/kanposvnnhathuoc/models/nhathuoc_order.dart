import 'package:isar/isar.dart';
import 'nhathuoc_patient.dart';
import 'nhathuoc_medicine.dart';

part 'nhathuoc_order.g.dart';

enum NhathuocOrderStatus {
  PENDING('Chờ thanh toán'),
  COMPLETED('Đã thanh toán'),
  CREDIT('Bán nợ'),
  CANCELLED('Đã hủy');

  final String label;
  const NhathuocOrderStatus(this.label);
}

enum PaymentMethod {
  CASH('Tiền mặt'),
  TRANSFER('Chuyển khoản'),
  QR('QR Code'),
  E_WALLET('Ví điện tử'),
  CREDIT('Bán nợ'),
  MIXED('Hỗn hợp');

  final String label;
  const PaymentMethod(this.label);
}

@collection
class NhathuocOrder {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String orderId = '';
  
  String orderCode = '';
  
  @enumerated
  NhathuocOrderStatus status = NhathuocOrderStatus.PENDING;
  
  DateTime? orderDate;
  
  @enumerated
  PaymentMethod paymentMethod = PaymentMethod.CASH;
  
  double cashReceived = 0.0; // Tiền khách đưa
  double transferAmount = 0.0;
  double qrAmount = 0.0;
  double discountAmount = 0.0; // Giảm giá
  double changeAmount = 0.0; // Tiền thối

  String hospitalName = ''; // Bệnh viện (toa bác sĩ)
  String doctorName = ''; // Bác sĩ kê toa
  String diagnosis = ''; // Chuẩn đoán
  
  String notes = ''; // Ghi chú toa thuốc
  String prescriptionImage = ''; // Đường dẫn ảnh chụp toa thuốc (nếu có)
  
  double totalAmount = 0.0;

  final patient = IsarLink<NhathuocPatient>();
  
  @Backlink(to: 'order')
  final details = IsarLinks<NhathuocOrderDetail>();
}

@collection
class NhathuocOrderDetail {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  
  double quantity = 0;
  double unitPrice = 0;
  double total = 0;
  
  String dosageInstructions = ''; // Hướng dẫn sử dụng (VD: Ngày 2 lần, mỗi lần 1 viên)

  final order = IsarLink<NhathuocOrder>();
  final medicine = IsarLink<NhathuocMedicine>();
}
