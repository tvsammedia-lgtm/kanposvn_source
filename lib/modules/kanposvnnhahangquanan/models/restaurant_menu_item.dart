import 'package:isar/isar.dart';

part 'restaurant_menu_item.g.dart';

@embedded
class RestaurantRecipeItem {
  String ingredientId = '';
  String ingredientName = '';
  double quantity = 0;
}

@collection
class RestaurantMenuItem {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String itemId = '';

  String name = ''; // e.g., Tôm Hùm Nướng Phô Mai
  String category = ''; // e.g., Hải Sản, Đồ Rừng, Đồ Uống
  
  double price = 0.0;
  String unit = ''; // e.g., Đĩa, Con, Lon, Kg

  List<RestaurantRecipeItem> recipe = [];
}
