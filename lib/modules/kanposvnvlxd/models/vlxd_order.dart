import 'package:isar/isar.dart';
import 'vlxd_product.dart';
import 'vlxd_partner.dart';

part 'vlxd_order.g.dart';

enum OrderStatus {
  PENDING('Chờ xử lý'),
  DELIVERING('Đang giao'),
  COMPLETED('Đã hoàn thành'),
  CANCELLED('Đã hủy');

  final String label;
  const OrderStatus(this.label);
}

enum PaymentMethod {
  CASH('Tiền mặt'),
  TRANSFER('Chuyển khoản'),
  QR('QR Code'),
  DEBT('Công nợ');

  final String label;
  const PaymentMethod(this.label);
}

@collection
class VlxdOrder {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String orderId = '';

  String orderCode = ''; // Mã đơn/Hợp đồng

  final customer = IsarLink<VlxdCustomer>();

  bool isWholesaleContract = false; // Phân biệt Hợp đồng sỉ vs Đơn lẻ POS
  
  double subTotal = 0;
  double discount = 0;
  double vatAmount = 0;
  double shippingFee = 0;
  double totalAmount = 0;

  double paidAmount = 0; // Đã thanh toán
  
  @enumerated
  PaymentMethod paymentMethod = PaymentMethod.CASH;

  @enumerated
  OrderStatus status = OrderStatus.PENDING;

  DateTime orderDate = DateTime.now();
  DateTime? expectedDeliveryDate;
  
  String notes = '';
}

@collection
class VlxdOrderDetail {
  Id id = Isar.autoIncrement;

  final order = IsarLink<VlxdOrder>();
  final product = IsarLink<VlxdProduct>();

  double quantity = 0;
  double deliveredQuantity = 0; // Cho hợp đồng sỉ giao nhiều lần
  
  double unitPrice = 0;
  double discountAmount = 0;
  double total = 0;
}

@collection
class VlxdDeliveryTicket {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String ticketId = '';

  final order = IsarLink<VlxdOrder>();

  String vehicleInfo = ''; // Biển số xe
  String driverName = '';
  DateTime deliveryDate = DateTime.now();
  
  String receiverName = '';
  String deliveryPhotoUrl = '';
  String eSignatureUrl = '';
  String gpsLocation = '';

  @enumerated
  OrderStatus status = OrderStatus.PENDING;
}
