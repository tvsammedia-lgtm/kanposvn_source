import 'package:isar/isar.dart';

part 'restaurant_menu_item.g.dart';

@embedded
class RestaurantRecipeItem {
  String ingredientId = '';
  String ingredientName = '';
  double quantity = 0;
}

/// Một món thành phần bên trong Combo (VD: 1 Cua + 1 Tôm + 2 Bia).
@embedded
class RestaurantComboItem {
  String itemId = '';
  String itemName = '';
  int quantity = 1;
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

  @Index()
  String barcode = '';

  String name = ''; // e.g., Tôm Hùm Nướng Phô Mai
  String category = ''; // e.g., Hải Sản, Đồ Rừng, Đồ Uống

  double price = 0.0;
  String unit = ''; // e.g., Đĩa, Con, Lon, Kg

  List<RestaurantRecipeItem> recipe = [];

  /// Combo: true nếu đây là món combo gồm nhiều món con.
  bool isCombo = false;
  List<RestaurantComboItem> comboItems = [];

  String description = '';
}
