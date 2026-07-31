import 'package:isar/isar.dart';

part 'restaurant_inventory_models.g.dart';

@collection
class RestaurantIngredient {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String ingredientId = '';

  String name = ''; // e.g., Tôm, Mực, Bia Tiger
  String unit = ''; // e.g., Kg, Lon
  
  double stock = 0.0;
}

enum RestaurantInventoryTxType {
  IMPORT('Nhập kho'),
  EXPORT('Xuất kho'),
  AUTO_DEDUCT('Trừ tự động (Bếp)');

  final String label;
  const RestaurantInventoryTxType(this.label);
}

@collection
class RestaurantInventoryTx {
  Id id = Isar.autoIncrement;

  String ingredientId = '';
  String ingredientName = '';
  
  double quantity = 0; // Positive for import, negative for export/deduct
  
  @enumerated
  RestaurantInventoryTxType type = RestaurantInventoryTxType.IMPORT;

  String note = '';
  
  @Index()
  DateTime createdAt = DateTime.now();
}
