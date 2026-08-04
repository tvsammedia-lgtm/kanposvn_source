import 'package:isar/isar.dart';
import 'vlxd_product.dart';
import 'vlxd_partner.dart';

part 'vlxd_inventory.g.dart';

enum VlxdInventoryTransactionType {
  IMPORT('Nhập kho'),
  EXPORT('Xuất kho'),
  ADJUSTMENT('Điều chỉnh'),
  TRANSFER('Chuyển kho'),
  DESTROY('Xuất hủy');

  final String label;
  const VlxdInventoryTransactionType(this.label);
}

@collection
class VlxdWarehouse {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String warehouseId = '';

  String name = ''; // Kho trung tâm, Kho cát đá, Kho sắt...
  String address = '';
}

@collection
class VlxdInventoryStock {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String stockId = '';

  final warehouse = IsarLink<VlxdWarehouse>();
  final product = IsarLink<VlxdProduct>();

  double currentQuantity = 0; // Số lượng tồn (có thể là số thập phân với cát/đá)
  double minQuantity = 0; // Tồn kho tối thiểu
  double maxQuantity = 0; // Tồn kho tối đa
  
  DateTime updatedAt = DateTime.now();
}

@collection
class VlxdInventoryTransaction {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String transactionId = '';

  String documentCode = ''; // Số phiếu (PN001, PX001)

  @enumerated
  VlxdInventoryTransactionType type = VlxdInventoryTransactionType.IMPORT;

  final warehouse = IsarLink<VlxdWarehouse>();
  final supplier = IsarLink<VlxdSupplier>(); // Nếu nhập từ NCC
  
  String note = '';
  DateTime transactionDate = DateTime.now();
  String createdBy = '';
}

@collection
class VlxdInventoryTransactionDetail {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  final transaction = IsarLink<VlxdInventoryTransaction>();
  final product = IsarLink<VlxdProduct>();

  double quantity = 0;
  double unitPrice = 0; // Giá tại thời điểm giao dịch
  double totalAmount = 0;
}
