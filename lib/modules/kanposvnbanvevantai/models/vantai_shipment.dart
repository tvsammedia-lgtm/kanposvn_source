import 'package:isar/isar.dart';
import 'vantai_route.dart';
import 'vantai_customer.dart';

part 'vantai_shipment.g.dart';

enum ShipmentStatus {
  PENDING('Chờ gửi'),
  IN_TRANSIT('Đang giao'),
  DELIVERED('Đã giao'),
  CANCELLED('Đã hủy');

  final String label;
  const ShipmentStatus(this.label);
}

@collection
class VantaiShipment {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String shipmentId = '';
  
  String shipmentCode = '';
  
  String senderName = '';
  String senderPhone = '';
  
  String receiverName = '';
  String receiverPhone = '';
  
  double weightKg = 0.0;
  double shippingFee = 0.0;
  double codAmount = 0.0; // Thu hộ
  
  @enumerated
  ShipmentStatus status = ShipmentStatus.PENDING;
  
  DateTime? createdAt;

  final route = IsarLink<VantaiRoute>();
  final senderCustomer = IsarLink<VantaiCustomer>(); // Optional if sender is registered
}
