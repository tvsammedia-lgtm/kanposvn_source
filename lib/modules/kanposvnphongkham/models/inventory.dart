import 'package:isar/isar.dart';

part 'inventory.g.dart';

@collection
class Warehouse {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? uuid;

  @Index()
  String? branchId;

  String? name;
  String? type; // Kho thuốc, Kho vật tư

  // Sync fields
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  int? version;
  String? syncStatus;
  String? deviceId;
}

@collection
class DrugBatch {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? uuid;

  @Index()
  String? drugId;

  @Index()
  String? warehouseId;

  String? lotNumber;
  DateTime? expiryDate;
  double? purchasePrice;
  double? sellingPrice;
  double? quantity;

  // Sync fields
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  int? version;
  String? syncStatus;
  String? deviceId;
}

@collection
class StockTransaction {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? uuid;

  @Index()
  String? warehouseId;

  @Index()
  String? batchId;

  /// purchase, sale, dispense, return, transfer_in, transfer_out, adjustment, expired, damage
  String? type;

  String? sourceDocumentId;
  double? quantity;
  double? unitCost;
  
  String? createdBy;

  // Sync fields
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  int? version;
  String? syncStatus;
  String? deviceId;
}
