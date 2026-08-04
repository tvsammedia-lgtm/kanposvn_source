import 'package:isar/isar.dart';

part 'spa_inventory_models.g.dart';

enum SpaProductCategory {
  SKINCARE('Chăm sóc da'),
  ESSENTIAL_OIL('Tinh dầu'),
  CONSUMABLE('Vật tư tiêu hao');

  final String label;
  const SpaProductCategory(this.label);
}

@collection
class SpaProduct {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String productId = '';

  String name = '';
  
  @enumerated
  SpaProductCategory category = SpaProductCategory.SKINCARE;

  double price = 0.0;
  int stock = 0;
  String unit = ''; // e.g., Lọ, Chai, Cái
}

enum SpaInventoryTxType {
  IMPORT('Nhập kho'),
  EXPORT('Xuất kho');

  final String label;
  const SpaInventoryTxType(this.label);
}

@collection
class SpaInventoryTx {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  String productId = '';
  String productName = '';

  int quantity = 0;

  @enumerated
  SpaInventoryTxType type = SpaInventoryTxType.IMPORT;

  String note = '';

  @Index()
  DateTime createdAt = DateTime.now();
}
