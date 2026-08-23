import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/restaurant_inventory_models.dart';
import '../models/restaurant_menu_item.dart';
import '../models/restaurant_order.dart';
import '../services/restaurant_isar_service.dart';
import 'restaurant_providers.dart';

// Ingredients
class RestaurantIngredientsNotifier extends StateNotifier<AsyncValue<List<RestaurantIngredient>>> {
  final RestaurantIsarService _isarService;
  RestaurantIngredientsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadIngredients();
  }

  Future<void> loadIngredients() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.restaurantIngredients.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final restaurantIngredientsProvider = StateNotifierProvider<RestaurantIngredientsNotifier, AsyncValue<List<RestaurantIngredient>>>((ref) {
  return RestaurantIngredientsNotifier(ref.watch(restaurantIsarServiceProvider));
});

// Inventory Transactions
class RestaurantInventoryTxNotifier extends StateNotifier<AsyncValue<List<RestaurantInventoryTx>>> {
  final RestaurantIsarService _isarService;
  final Ref ref;
  RestaurantInventoryTxNotifier(this._isarService, this.ref) : super(const AsyncValue.loading()) {
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.restaurantInventoryTxs.where().sortByCreatedAtDesc().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addTransaction(RestaurantIngredient ingredient, double quantity, RestaurantInventoryTxType type, String note) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        final tx = RestaurantInventoryTx()
          ..ingredientId = ingredient.ingredientId
          ..ingredientName = ingredient.name
          ..quantity = type == RestaurantInventoryTxType.IMPORT ? quantity : -quantity
          ..type = type
          ..note = note
          ..createdAt = DateTime.now();

        await db.restaurantInventoryTxs.put(tx);
        
        ingredient.stock += tx.quantity;
        await db.restaurantIngredients.put(ingredient);
      });
      await loadTransactions();
      ref.read(restaurantIngredientsProvider.notifier).loadIngredients();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final restaurantInventoryTxProvider = StateNotifierProvider<RestaurantInventoryTxNotifier, AsyncValue<List<RestaurantInventoryTx>>>((ref) {
  return RestaurantInventoryTxNotifier(ref.watch(restaurantIsarServiceProvider), ref);
});

// Kitchen Status Manager
class RestaurantKitchenNotifier extends StateNotifier<AsyncValue<void>> {
  final RestaurantIsarService _isarService;
  final Ref ref;

  RestaurantKitchenNotifier(this._isarService, this.ref) : super(const AsyncValue.data(null));

  Future<void> updateItemStatus(RestaurantOrder order, int itemIndex, RestaurantOrderItemStatus newStatus) async {
    try {
      final db = await _isarService.db;
      final oldStatus = order.details[itemIndex].status;
      
      // Update the status in the order
      order.details[itemIndex].status = newStatus;
      
      await db.writeTxn(() async {
        await db.restaurantOrders.put(order);

        // If transitioning to DONE, we need to deduct inventory based on Recipe
        if (newStatus == RestaurantOrderItemStatus.DONE && oldStatus != RestaurantOrderItemStatus.DONE) {
          final detail = order.details[itemIndex];
          final qty = detail.quantity;

          // Tra công thức theo itemId (không theo tên) để tránh trùng tên món.
          final menuItem = await db.restaurantMenuItems
              .filter()
              .itemIdEqualTo(detail.itemId)
              .findFirst();
          if (menuItem != null && menuItem.recipe.isNotEmpty) {
            for (var recipeItem in menuItem.recipe) {
              final ingredient = await db.restaurantIngredients.filter().ingredientIdEqualTo(recipeItem.ingredientId).findFirst();
              if (ingredient != null) {
                final totalDeductQty = recipeItem.quantity * qty;
                
                final tx = RestaurantInventoryTx()
                  ..ingredientId = ingredient.ingredientId
                  ..ingredientName = ingredient.name
                  ..quantity = -totalDeductQty
                  ..type = RestaurantInventoryTxType.AUTO_DEDUCT
                  ..note = 'Tự động trừ món ${detail.itemName} (Mã HĐ: ${order.orderId.substring(0,5)})'
                  ..createdAt = DateTime.now();
                
                await db.restaurantInventoryTxs.put(tx);
                
                ingredient.stock -= totalDeductQty;
                await db.restaurantIngredients.put(ingredient);
              }
            }
          }
        }
      });
      
      // Reload providers
      ref.read(restaurantOrdersProvider.notifier).loadOrders();
      if (newStatus == RestaurantOrderItemStatus.DONE) {
        ref.read(restaurantIngredientsProvider.notifier).loadIngredients();
        ref.read(restaurantInventoryTxProvider.notifier).loadTransactions();
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final restaurantKitchenProvider = StateNotifierProvider<RestaurantKitchenNotifier, AsyncValue<void>>((ref) {
  return RestaurantKitchenNotifier(ref.watch(restaurantIsarServiceProvider), ref);
});
