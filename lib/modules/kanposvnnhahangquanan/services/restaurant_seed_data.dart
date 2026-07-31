import 'package:uuid/uuid.dart';
import 'restaurant_isar_service.dart';
import '../models/restaurant_table.dart';
import '../models/restaurant_menu_item.dart';
import '../models/restaurant_inventory_models.dart';

class RestaurantSeedData {
  static Future<void> seedIfEmpty(RestaurantIsarService isarService) async {
    final db = await isarService.db;
    final tableCount = await db.restaurantTables.count();
    
    if (tableCount == 0) {
      await db.writeTxn(() async {
        // Seed Ingredients
        final tom = RestaurantIngredient()..ingredientId = const Uuid().v4()..name = 'Tôm'..unit = 'Kg'..stock = 10.0;
        final muc = RestaurantIngredient()..ingredientId = const Uuid().v4()..name = 'Mực'..unit = 'Kg'..stock = 15.0;
        final ngheu = RestaurantIngredient()..ingredientId = const Uuid().v4()..name = 'Nghêu'..unit = 'Kg'..stock = 20.0;
        final biaTiger = RestaurantIngredient()..ingredientId = const Uuid().v4()..name = 'Bia Tiger Nâu'..unit = 'Lon'..stock = 100.0;
        
        await db.restaurantIngredients.putAll([tom, muc, ngheu, biaTiger]);

        // Seed Tables
        final tables = [
          RestaurantTable()..tableId = const Uuid().v4()..name = 'Bàn 01'..zone = 'Tầng 1'..status = RestaurantTableStatus.EMPTY,
          RestaurantTable()..tableId = const Uuid().v4()..name = 'Bàn 02'..zone = 'Tầng 1'..status = RestaurantTableStatus.EMPTY,
          RestaurantTable()..tableId = const Uuid().v4()..name = 'Bàn 03'..zone = 'Tầng 1'..status = RestaurantTableStatus.EMPTY,
          RestaurantTable()..tableId = const Uuid().v4()..name = 'Bàn SV01'..zone = 'Sân Vườn'..status = RestaurantTableStatus.EMPTY,
          RestaurantTable()..tableId = const Uuid().v4()..name = 'Bàn SV02'..zone = 'Sân Vườn'..status = RestaurantTableStatus.EMPTY,
          RestaurantTable()..tableId = const Uuid().v4()..name = 'Bàn VIP1'..zone = 'VIP'..status = RestaurantTableStatus.EMPTY,
        ];
        await db.restaurantTables.putAll(tables);

        // Seed Menu Items
        final lauThai = RestaurantMenuItem()
          ..itemId = const Uuid().v4()
          ..name = 'Lẩu Thái Hải Sản'
          ..category = 'Lẩu'
          ..price = 350000
          ..unit = 'Nồi'
          ..recipe = [
            RestaurantRecipeItem()..ingredientId = tom.ingredientId..ingredientName = tom.name..quantity = 0.2, // 200g
            RestaurantRecipeItem()..ingredientId = muc.ingredientId..ingredientName = muc.name..quantity = 0.3, // 300g
            RestaurantRecipeItem()..ingredientId = ngheu.ingredientId..ingredientName = ngheu.name..quantity = 0.5, // 500g
          ];

        final banBiaTiger = RestaurantMenuItem()
          ..itemId = const Uuid().v4()
          ..name = 'Bia Tiger Nâu'
          ..category = 'Đồ uống'
          ..price = 20000
          ..unit = 'Lon'
          ..recipe = [
            RestaurantRecipeItem()..ingredientId = biaTiger.ingredientId..ingredientName = biaTiger.name..quantity = 1.0
          ];

        final menuItems = [
          lauThai,
          banBiaTiger,
          RestaurantMenuItem()..itemId = const Uuid().v4()..name = 'Tôm hùm phô mai'..category = 'Hải sản'..price = 1200000..unit = 'Con',
          RestaurantMenuItem()..itemId = const Uuid().v4()..name = 'Cua Cà Mau hấp'..category = 'Hải sản'..price = 600000..unit = 'Kg',
          RestaurantMenuItem()..itemId = const Uuid().v4()..name = 'Mực sữa chiên mắm'..category = 'Hải sản'..price = 150000..unit = 'Đĩa',
          RestaurantMenuItem()..itemId = const Uuid().v4()..name = 'Heo rừng xào lăn'..category = 'Đồ rừng'..price = 200000..unit = 'Đĩa',
          RestaurantMenuItem()..itemId = const Uuid().v4()..name = 'Bia Heineken'..category = 'Đồ uống'..price = 25000..unit = 'Lon',
        ];
        await db.restaurantMenuItems.putAll(menuItems);
      });
    }
  }
}
