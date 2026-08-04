import 'package:isar/isar.dart';
import 'gara_product.dart';

part 'gara_inventory.g.dart';

enum GaraInventoryTransactionType {
  IMPORT('Nhập kho'),
  EXPORT('Xuất kho');

  final String label;
  const GaraInventoryTransactionType(this.label);
}

@collection
class GaraInventoryTransaction {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String transactionId = '';
  
  String documentCode = '';
  
  @enumerated
  GaraInventoryTransactionType type = GaraInventoryTransactionType.IMPORT;
  
  DateTime? transactionDate;
  
  @Backlink(to: 'transaction')
  final details = IsarLinks<GaraInventoryDetail>();
}

@collection
class GaraInventoryDetail {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  
  double quantity = 0.0;
  double unitPrice = 0.0;
  double totalAmount = 0.0;

  final transaction = IsarLink<GaraInventoryTransaction>();
  final product = IsarLink<GaraProduct>();
}
