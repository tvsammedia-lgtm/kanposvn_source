import 'package:isar/isar.dart';

part 'product.g.dart';

@collection
class TramXangCategory {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String categoryId = ''; 

  String name = '';
  String description = '';
}

@collection
class TramXangProduct {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String productId = ''; 

  String sku = '';
  String barcode = '';
  String name = '';
  
  String productType = 'FUEL'; // FUEL, LUBRICANT, SPARE_PART, GROCERY
  String unit = 'L'; // L, ML, KG, BOX, PIECE

  String brand = '';
  
  final category = IsarLink<TramXangCategory>();

  double taxRate = 0; // percentage
  String costMethod = 'WEIGHTED_AVERAGE';
  
  bool trackInventory = true;
  bool trackBatch = false;
  bool trackExpiry = false;

  double minStock = 0;
  double maxStock = 0;
  
  bool active = true;
}
