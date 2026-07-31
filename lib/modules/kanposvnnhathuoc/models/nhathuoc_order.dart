import 'package:isar/isar.dart';
import 'nhathuoc_patient.dart';
import 'nhathuoc_medicine.dart';

part 'nhathuoc_order.g.dart';

enum NhathuocOrderStatus {
  PENDING('Chờ thanh toán'),
  COMPLETED('Đã thanh toán'),
  CANCELLED('Đã hủy');

  final String label;
  const NhathuocOrderStatus(this.label);
}

@collection
class NhathuocOrder {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String orderId = '';
  
  String orderCode = '';
  
  @enumerated
  NhathuocOrderStatus status = NhathuocOrderStatus.PENDING;
  
  DateTime? orderDate;
  
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
  
  double quantity = 0;
  double unitPrice = 0;
  double total = 0;
  
  String dosageInstructions = ''; // Hướng dẫn sử dụng (VD: Ngày 2 lần, mỗi lần 1 viên)

  final order = IsarLink<NhathuocOrder>();
  final medicine = IsarLink<NhathuocMedicine>();
}
