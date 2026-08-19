import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../services/gara_isar_service.dart';
import '../services/gara_neon_sync_service.dart';
import '../services/gara_einvoice_settings.dart';
import '../models/gara_product.dart';
import '../models/gara_repair_order.dart';
import '../models/gara_customer.dart';
import '../models/gara_vehicle.dart';
import '../models/gara_supplier.dart';
import '../models/gara_inventory.dart';
import '../models/gara_finance.dart';

// Services
final garaIsarServiceProvider = Provider<GaraIsarService>((ref) {
  return GaraIsarService();
});

final garaTabIndexProvider = StateProvider<int>((ref) => 0);

final garaNeonSyncServiceProvider = Provider<GaraNeonSyncService>((ref) {
  final isarService = ref.watch(garaIsarServiceProvider);
  return GaraNeonSyncService(isarService);
});

// Settings
final garaEinvoiceSettingsProvider =
    ChangeNotifierProvider<GaraEinvoiceSettingsStore>((ref) {
  final store = GaraEinvoiceSettingsStore();
  store.load();
  return store;
});

// Customers
class GaraCustomersNotifier extends StateNotifier<AsyncValue<List<GaraCustomer>>> {
  final GaraIsarService _isarService;

  GaraCustomersNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadCustomers();
  }

  Future<void> loadCustomers() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final customers = await db.garaCustomers.where().findAll();
      state = AsyncValue.data(customers);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addCustomer(GaraCustomer customer) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.garaCustomers.put(customer);
    });
    await loadCustomers();
  }
}

final garaCustomersProvider = StateNotifierProvider<GaraCustomersNotifier, AsyncValue<List<GaraCustomer>>>((ref) {
  final isarService = ref.watch(garaIsarServiceProvider);
  return GaraCustomersNotifier(isarService);
});

// Vehicles
class GaraVehiclesNotifier extends StateNotifier<AsyncValue<List<GaraVehicle>>> {
  final GaraIsarService _isarService;

  GaraVehiclesNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadVehicles();
  }

  Future<void> loadVehicles() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final vehicles = await db.garaVehicles.where().findAll();
      state = AsyncValue.data(vehicles);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addVehicle(GaraVehicle vehicle) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.garaVehicles.put(vehicle);
      await vehicle.owner.save();
    });
    await loadVehicles();
  }
}

final garaVehiclesProvider = StateNotifierProvider<GaraVehiclesNotifier, AsyncValue<List<GaraVehicle>>>((ref) {
  final isarService = ref.watch(garaIsarServiceProvider);
  return GaraVehiclesNotifier(isarService);
});

// Products (Parts & Services)
class GaraProductsNotifier extends StateNotifier<AsyncValue<List<GaraProduct>>> {
  final GaraIsarService _isarService;

  GaraProductsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final products = await db.garaProducts.where().findAll();
      state = AsyncValue.data(products);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final garaProductsProvider = StateNotifierProvider<GaraProductsNotifier, AsyncValue<List<GaraProduct>>>((ref) {
  final isarService = ref.watch(garaIsarServiceProvider);
  return GaraProductsNotifier(isarService);
});

// Repair Orders
class GaraOrdersNotifier extends StateNotifier<AsyncValue<List<GaraRepairOrder>>> {
  final GaraIsarService _isarService;

  GaraOrdersNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadOrders();
  }

  Future<void> loadOrders() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final orders = await db.garaRepairOrders.where().findAll();
      for (final o in orders) {
        await o.customer.load();
        await o.vehicle.load();
      }
      state = AsyncValue.data(orders);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createOrder(GaraRepairOrder order) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        await db.garaRepairOrders.put(order);
        await order.customer.save();
        await order.vehicle.save();
      });
      await loadOrders();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  
  Future<void> updateOrderWithDetails(GaraRepairOrder order, List<GaraRepairDetail> details) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        await db.garaRepairOrders.put(order);
        for(var d in details) {
          await db.garaRepairDetails.put(d);
          await d.order.save();
          await d.product.save();
        }
      });
      await loadOrders();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final garaOrdersProvider = StateNotifierProvider<GaraOrdersNotifier, AsyncValue<List<GaraRepairOrder>>>((ref) {
  final isarService = ref.watch(garaIsarServiceProvider);
  return GaraOrdersNotifier(isarService);
});

final garaPaidOrdersProvider = FutureProvider<List<GaraRepairOrder>>((ref) async {
  final isarService = ref.watch(garaIsarServiceProvider);
  ref.watch(garaOrdersProvider);
  final db = await isarService.db;
  final orders = await db.garaRepairOrders.where().findAll();
  final paid = orders
      .where((o) => o.status == GaraOrderStatus.COMPLETED || o.status == GaraOrderStatus.DELIVERED)
      .toList();
  for (final o in paid) {
    await o.customer.load();
    await o.vehicle.load();
  }
  return paid;
});

final garaOrderDetailsProvider = FutureProvider.family<List<GaraRepairDetail>, int>((ref, orderId) async {
  final isarService = ref.watch(garaIsarServiceProvider);
  final db = await isarService.db;
  final order = await db.garaRepairOrders.where().idEqualTo(orderId).findFirst();
  if (order == null) return [];
  await order.details.load();
  final details = order.details.toList();
  for (final d in details) {
    await d.product.load();
  }
  return details;
});

// Suppliers
class GaraSuppliersNotifier extends StateNotifier<AsyncValue<List<GaraSupplier>>> {
  final GaraIsarService _isarService;

  GaraSuppliersNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadSuppliers();
  }

  Future<void> loadSuppliers() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final suppliers = await db.garaSuppliers.where().findAll();
      state = AsyncValue.data(suppliers);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addSupplier(GaraSupplier supplier) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.garaSuppliers.put(supplier);
    });
    await loadSuppliers();
  }
}

final garaSuppliersProvider = StateNotifierProvider<GaraSuppliersNotifier, AsyncValue<List<GaraSupplier>>>((ref) {
  final isarService = ref.watch(garaIsarServiceProvider);
  return GaraSuppliersNotifier(isarService);
});

// Inventory
class GaraInventoryNotifier extends StateNotifier<AsyncValue<List<GaraInventoryTransaction>>> {
  final GaraIsarService _isarService;
  final Ref _ref;

  GaraInventoryNotifier(this._isarService, this._ref) : super(const AsyncValue.loading()) {
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final txs = await db.garaInventoryTransactions.where().sortByTransactionDateDesc().findAll();
      state = AsyncValue.data(txs);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createTransaction(GaraInventoryTransaction tx, List<GaraInventoryDetail> details) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        await db.garaInventoryTransactions.put(tx);
        for (var d in details) {
          await db.garaInventoryDetails.put(d);
          await d.transaction.save();
          await d.product.save();

          // Update stock
          if (d.product.value != null && d.product.value!.type == GaraProductType.PART) {
            final product = d.product.value!;
            if (tx.type == GaraInventoryTransactionType.IMPORT) {
              product.currentStock += d.quantity;
            } else {
              product.currentStock -= d.quantity;
            }
            await db.garaProducts.put(product);
          }
        }
      });
      await loadTransactions();
      _ref.read(garaProductsProvider.notifier).loadProducts();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final garaInventoryProvider = StateNotifierProvider<GaraInventoryNotifier, AsyncValue<List<GaraInventoryTransaction>>>((ref) {
  return GaraInventoryNotifier(ref.watch(garaIsarServiceProvider), ref);
});

// Finance
class GaraFinanceNotifier extends StateNotifier<AsyncValue<List<GaraFinanceTransaction>>> {
  final GaraIsarService _isarService;

  GaraFinanceNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final txs = await db.garaFinanceTransactions.where().sortByTransactionDateDesc().findAll();
      state = AsyncValue.data(txs);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createTransaction(GaraFinanceTransaction tx) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        await db.garaFinanceTransactions.put(tx);
        await tx.customer.save();
        await tx.supplier.save();

        if (tx.customer.value != null) {
          final customer = tx.customer.value!;
          if (tx.type == GaraFinanceTransactionType.RECEIPT) {
            customer.currentDebt -= tx.amount;
          } else {
            customer.currentDebt += tx.amount;
          }
          await db.garaCustomers.put(customer);
        }

        if (tx.supplier.value != null) {
          final supplier = tx.supplier.value!;
          if (tx.type == GaraFinanceTransactionType.PAYMENT) {
            supplier.currentDebt -= tx.amount;
          } else {
            supplier.currentDebt += tx.amount;
          }
          await db.garaSuppliers.put(supplier);
        }
      });
      await loadTransactions();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final garaFinanceProvider = StateNotifierProvider<GaraFinanceNotifier, AsyncValue<List<GaraFinanceTransaction>>>((ref) {
  final isarService = ref.watch(garaIsarServiceProvider);
  return GaraFinanceNotifier(isarService);
});

// Dashboard Metrics
final garaDashboardProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final isarService = ref.watch(garaIsarServiceProvider);

  // Recompute whenever underlying data changes
  ref.watch(garaOrdersProvider);
  ref.watch(garaProductsProvider);
  ref.watch(garaCustomersProvider);
  ref.watch(garaSuppliersProvider);
  ref.watch(garaInventoryProvider);
  ref.watch(garaFinanceProvider);
  ref.watch(garaVehiclesProvider);

  final db = await isarService.db;

  final orders = await db.garaRepairOrders.where().findAll();
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  double todayRevenue = 0;
  double totalRevenue = 0;
  int orderCount = 0;
  int inProgress = 0;
  int waiting = 0;
  int delivered = 0;

  for (final o in orders) {
    orderCount++;
    totalRevenue += o.totalAmount;
    if (o.status == GaraOrderStatus.RECEPTION) waiting++;
    if (o.status == GaraOrderStatus.IN_PROGRESS) inProgress++;
    if (o.status == GaraOrderStatus.DELIVERED) delivered++;
    final od = o.orderDate;
    if (od != null &&
        od.year == today.year && od.month == today.month && od.day == today.day) {
      todayRevenue += o.totalAmount;
    }
  }

  double receivable = 0;
  final customers = await db.garaCustomers.where().findAll();
  for (final c in customers) {
    receivable += c.currentDebt;
  }

  double payable = 0;
  final suppliers = await db.garaSuppliers.where().findAll();
  for (final s in suppliers) {
    payable += s.currentDebt;
  }

  double receipts = 0;
  double payments = 0;
  final financeTxs = await db.garaFinanceTransactions.where().findAll();
  for (final t in financeTxs) {
    if (t.type == GaraFinanceTransactionType.RECEIPT) {
      receipts += t.amount;
    } else {
      payments += t.amount;
    }
  }

  final products = await db.garaProducts.where().findAll();
  int partsCount = 0;
  int serviceCount = 0;
  int lowStock = 0;
  double partsValue = 0;
  for (final p in products) {
    if (p.type == GaraProductType.PART) {
      partsCount++;
      if (p.currentStock <= 5) lowStock++;
      partsValue += p.currentStock * p.purchasePrice;
    } else {
      serviceCount++;
    }
  }

  final vehicles = await db.garaVehicles.where().findAll();

  // Calculate profit: total revenue - inventory export costs (COGS)
  double inventoryCosts = 0;
  final invTxs = await db.garaInventoryTransactions.where().findAll();
  for (final tx in invTxs) {
    if (tx.type == GaraInventoryTransactionType.EXPORT) {
      await tx.details.load();
      for (final d in tx.details) {
        inventoryCosts += d.totalAmount;
      }
    }
  }
  final profit = totalRevenue - inventoryCosts;

  return {
    'todayRevenue': todayRevenue,
    'totalRevenue': totalRevenue,
    'orderCount': orderCount,
    'waiting': waiting,
    'inProgress': inProgress,
    'receivable': receivable,
    'payable': payable,
    'cashBalance': receipts - payments,
    'partsCount': partsCount,
    'serviceCount': serviceCount,
    'lowStock': lowStock,
    'partsValue': partsValue,
    'vehicleCount': vehicles.length,
    'delivered': delivered,
    'profit': profit,
    'inventoryCosts': inventoryCosts,
  };
});
