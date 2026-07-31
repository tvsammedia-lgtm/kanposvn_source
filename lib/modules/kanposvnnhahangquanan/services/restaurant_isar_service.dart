import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/restaurant_table.dart';
import '../models/restaurant_menu_item.dart';
import '../models/restaurant_order.dart';
import '../models/restaurant_sync_model.dart';
import '../models/restaurant_inventory_models.dart';

class RestaurantIsarService {
  late Future<Isar> db;

  RestaurantIsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains('restaurant_db')) {
      return Isar.getInstance('restaurant_db')!;
    }
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        RestaurantTableSchema,
        RestaurantMenuItemSchema,
        RestaurantOrderSchema,
        RestaurantSyncQueueSchema,
        RestaurantIngredientSchema,
        RestaurantInventoryTxSchema,
      ],
      directory: dir.path,
      name: 'restaurant_db',
    );
  }
}
