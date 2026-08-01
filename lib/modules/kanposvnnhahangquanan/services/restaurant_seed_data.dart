import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import 'restaurant_isar_service.dart';
import '../models/restaurant_table.dart';
import '../models/restaurant_menu_item.dart';
import '../models/restaurant_order.dart';
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

        // Seed sample orders
        final savedTables = await db.restaurantTables.where().findAll();
        final savedMenu = await db.restaurantMenuItems.where().findAll();

        final menuById = <String, RestaurantMenuItem>{ for (final m in savedMenu) m.itemId: m };

        RestaurantOrderDetail detail(String itemId, int quantity, {String note = '', RestaurantOrderItemStatus status = RestaurantOrderItemStatus.DONE}) {
          final item = menuById[itemId]!;
          return RestaurantOrderDetail()
            ..detailId = const Uuid().v4()
            ..itemId = item.itemId
            ..itemName = item.name
            ..price = item.price
            ..quantity = quantity
            ..note = note
            ..status = status;
        }

        final orders = <RestaurantOrder>[];
        final servingTable = savedTables[0];
        final order1 = RestaurantOrder()
          ..orderId = const Uuid().v4()
          ..status = RestaurantOrderStatus.SERVING
          ..createdAt = DateTime.now().subtract(const Duration(minutes: 35))
          ..details = [
            detail(lauThai.itemId, 1),
            detail(banBiaTiger.itemId, 3, note: 'Đá riêng'),
          ];
        order1.totalAmount = order1.details.fold<double>(0, (sum, d) => sum + d.price * d.quantity);
        order1.table.value = servingTable;
        orders.add(order1);
        servingTable.status = RestaurantTableStatus.SERVING;

        final svTable = savedTables[3];
        final order2 = RestaurantOrder()
          ..orderId = const Uuid().v4()
          ..status = RestaurantOrderStatus.SERVING
          ..createdAt = DateTime.now().subtract(const Duration(minutes: 20))
          ..details = [
            detail(savedMenu[4].itemId, 2, note: 'Ít mắm'),
            detail(banBiaTiger.itemId, 2),
          ];
        order2.totalAmount = order2.details.fold<double>(0, (sum, d) => sum + d.price * d.quantity);
        order2.table.value = svTable;
        orders.add(order2);
        svTable.status = RestaurantTableStatus.SERVING;

        final doneTable = savedTables[1];
        final order3 = RestaurantOrder()
          ..orderId = const Uuid().v4()
          ..status = RestaurantOrderStatus.COMPLETED
          ..createdAt = DateTime.now().subtract(const Duration(hours: 2))
          ..closedAt = DateTime.now().subtract(const Duration(hours: 1, minutes: 40))
          ..details = [
            detail(lauThai.itemId, 1),
            detail(banBiaTiger.itemId, 4),
            detail(savedMenu[5].itemId, 1),
          ];
        order3.totalAmount = order3.details.fold<double>(0, (sum, d) => sum + d.price * d.quantity);
        order3.table.value = doneTable;
        orders.add(order3);

        await db.restaurantOrders.putAll(orders);
        await db.restaurantTables.putAll([servingTable, svTable]);
        for (final o in orders) {
          await o.table.save();
        }
      });
    }
  }
}
