import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/restaurant_table.dart';
import '../models/restaurant_menu_item.dart';
import '../models/restaurant_order.dart';
import '../services/restaurant_isar_service.dart';
import '../services/restaurant_einvoice_settings.dart';

final restaurantIsarServiceProvider = Provider((ref) => RestaurantIsarService());

// Settings
final restaurantEinvoiceSettingsProvider =
    ChangeNotifierProvider<RestaurantEinvoiceSettingsStore>((ref) {
  final store = RestaurantEinvoiceSettingsStore();
  store.load();
  return store;
});

// Tables
class RestaurantTablesNotifier extends StateNotifier<AsyncValue<List<RestaurantTable>>> {
  final RestaurantIsarService _isarService;
  RestaurantTablesNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadTables();
  }

  Future<void> loadTables() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.restaurantTables.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final restaurantTablesProvider = StateNotifierProvider<RestaurantTablesNotifier, AsyncValue<List<RestaurantTable>>>((ref) {
  return RestaurantTablesNotifier(ref.watch(restaurantIsarServiceProvider));
});

// Menu Items
class RestaurantMenuNotifier extends StateNotifier<AsyncValue<List<RestaurantMenuItem>>> {
  final RestaurantIsarService _isarService;
  RestaurantMenuNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadMenu();
  }

  Future<void> loadMenu() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.restaurantMenuItems.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final restaurantMenuProvider = StateNotifierProvider<RestaurantMenuNotifier, AsyncValue<List<RestaurantMenuItem>>>((ref) {
  return RestaurantMenuNotifier(ref.watch(restaurantIsarServiceProvider));
});

// Orders
class RestaurantOrdersNotifier extends StateNotifier<AsyncValue<List<RestaurantOrder>>> {
  final RestaurantIsarService _isarService;
  RestaurantOrdersNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadOrders();
  }

  Future<void> loadOrders() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.restaurantOrders.where().findAll();
      // Load table links for each order
      for (var order in data) {
        await order.table.load();
      }
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateOrder(RestaurantOrder order) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        // Save the table first if it's linked
        if (order.table.value != null) {
          await db.restaurantTables.put(order.table.value!);
        }
        // Then save the order
      await db.restaurantOrders.put(order);
 
        if (order.table.value != null) {
           final bed = order.table.value!;
           if (order.status == RestaurantOrderStatus.COMPLETED) {
              bed.status = RestaurantTableStatus.EMPTY;
           } else {
              bed.status = RestaurantTableStatus.SERVING;
           }
           await db.restaurantTables.put(bed);
        }
      });
      await loadOrders();
      ref.read(restaurantTablesProvider.notifier).loadTables();
      ref.read(restaurantDashboardProvider.notifier).loadDashboard();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }  }

  late Ref ref;
  void setRef(Ref r) => ref = r;
}
final restaurantOrdersProvider = StateNotifierProvider<RestaurantOrdersNotifier, AsyncValue<List<RestaurantOrder>>>((ref) {
  final notifier = RestaurantOrdersNotifier(ref.watch(restaurantIsarServiceProvider));
  notifier.setRef(ref);
  return notifier;
});

// Dashboard
class RestaurantDashboardNotifier extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final RestaurantIsarService _isarService;
  RestaurantDashboardNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadDashboard();
  }

  Future<void> loadDashboard() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final orders = await db.restaurantOrders.where().findAll();
      
      double revenue = 0;
      int completedOrders = 0;
      
      for (var o in orders) {
        if (o.status == RestaurantOrderStatus.COMPLETED) {
          revenue += o.totalAmount;
          completedOrders++;
        }
      }
      
      state = AsyncValue.data({
        'revenue': revenue,
        'completedOrders': completedOrders,
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final restaurantDashboardProvider = StateNotifierProvider<RestaurantDashboardNotifier, AsyncValue<Map<String, dynamic>>>((ref) {
  return RestaurantDashboardNotifier(ref.watch(restaurantIsarServiceProvider));
});
