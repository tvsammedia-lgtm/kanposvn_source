import 'package:isar/isar.dart';
import 'gara_customer.dart';
import 'gara_vehicle.dart';
import 'gara_product.dart';

part 'gara_repair_order.g.dart';

enum GaraOrderStatus {
  RECEPTION('Tiếp nhận'),
  IN_PROGRESS('Đang sửa chữa'),
  COMPLETED('Đã hoàn thành'),
  DELIVERED('Đã giao xe');

  final String label;
  const GaraOrderStatus(this.label);
}

@collection
class GaraRepairOrder {
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
  GaraOrderStatus status = GaraOrderStatus.RECEPTION;
  
  DateTime? orderDate;
  
  String notes = '';
  String vehicleCondition = ''; // Tình trạng xe khi tiếp nhận
  int currentKm = 0;

  double subTotal = 0.0;
  double totalAmount = 0.0;
  double paidAmount = 0.0;

  final customer = IsarLink<GaraCustomer>();
  final vehicle = IsarLink<GaraVehicle>();
  
  @Backlink(to: 'order')
  final details = IsarLinks<GaraRepairDetail>();
}

@collection
class GaraRepairDetail {
  Id id = Isar.autoIncrement;
  
  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  
  double quantity = 0;
  double unitPrice = 0;
  double total = 0;

  final order = IsarLink<GaraRepairOrder>();
  final product = IsarLink<GaraProduct>(); // Có thể là Phụ tùng hoặc Dịch vụ
}
