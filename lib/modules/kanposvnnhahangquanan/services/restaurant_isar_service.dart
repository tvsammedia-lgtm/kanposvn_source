import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/restaurant_table.dart';
import '../models/restaurant_menu_item.dart';
import '../models/restaurant_order.dart';
import '../models/restaurant_sync_model.dart';
import '../models/restaurant_inventory_models.dart';
import '../models/restaurant_reservation.dart';
import '../models/restaurant_promotion.dart';
import '../models/restaurant_partner_models.dart';
import '../models/restaurant_expense_model.dart';

class RestaurantIsarService {
  late Future<Isar> db;

  /// [dbOverride] dùng cho unit test (inject Isar instance riêng).
  RestaurantIsarService({Future<Isar>? dbOverride}) {
    db = dbOverride ?? openDB();
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
        RestaurantReservationSchema,
        RestaurantPromotionSchema,
        RestaurantCustomerSchema,
        RestaurantSupplierSchema,
        RestaurantExpenseSchema,
      ],
      directory: dir.path,
      name: 'restaurant_db',
    );
  }
}
