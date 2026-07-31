import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../services/vlxd_isar_service.dart';
import '../services/vlxd_neon_sync_service.dart';
import '../models/vlxd_product.dart';
import '../models/vlxd_order.dart';
import '../models/vlxd_inventory.dart';
import '../models/vlxd_partner.dart';
import '../models/vlxd_finance.dart';

// Inventory Stocks
final vlxdStocksProvider = FutureProvider<List<VlxdInventoryStock>>((ref) async {
  final isarService = ref.watch(vlxdIsarServiceProvider);
  final db = await isarService.db;
  return await db.vlxdInventoryStocks.where().findAll();
});

// Services
final vlxdIsarServiceProvider = Provider<VlxdIsarService>((ref) {
  return VlxdIsarService();
});

final vlxdNeonSyncServiceProvider = Provider<VlxdNeonSyncService>((ref) {
  final isarService = ref.watch(vlxdIsarServiceProvider);
  return VlxdNeonSyncService(isarService);
});

// State Notifiers
class VlxdProductsNotifier extends StateNotifier<AsyncValue<List<VlxdProduct>>> {
  final VlxdIsarService _isarService;

  VlxdProductsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final products = await db.vlxdProducts.where().findAll();
      state = AsyncValue.data(products);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final vlxdProductsProvider = StateNotifierProvider<VlxdProductsNotifier, AsyncValue<List<VlxdProduct>>>((ref) {
  final isarService = ref.watch(vlxdIsarServiceProvider);
  return VlxdProductsNotifier(isarService);
});

// Orders
class VlxdOrdersNotifier extends StateNotifier<AsyncValue<List<VlxdOrder>>> {
  final VlxdIsarService _isarService;

  VlxdOrdersNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadOrders();
  }

  Future<void> loadOrders() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final orders = await db.vlxdOrders.where().findAll();
      state = AsyncValue.data(orders);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createOrder(VlxdOrder order, List<VlxdOrderDetail> details) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        await db.vlxdOrders.put(order);
        for (var d in details) {
          await db.vlxdOrderDetails.put(d);
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

final vlxdOrdersProvider = StateNotifierProvider<VlxdOrdersNotifier, AsyncValue<List<VlxdOrder>>>((ref) {
  final isarService = ref.watch(vlxdIsarServiceProvider);
  return VlxdOrdersNotifier(isarService);
});

// Inventory Transactions
class VlxdInventoryNotifier extends StateNotifier<AsyncValue<List<VlxdInventoryTransaction>>> {
  final VlxdIsarService _isarService;

  VlxdInventoryNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final txs = await db.vlxdInventoryTransactions.where().sortByTransactionDateDesc().findAll();
      state = AsyncValue.data(txs);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createTransaction(VlxdInventoryTransaction tx, List<VlxdInventoryTransactionDetail> details) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        await db.vlxdInventoryTransactions.put(tx);
        await tx.warehouse.save();
        
        for (var d in details) {
          await db.vlxdInventoryTransactionDetails.put(d);
          await d.transaction.save();
          await d.product.save();
          
          // Update current stock
          final stock = await db.vlxdInventoryStocks.filter()
            .warehouse((w) => w.idEqualTo(tx.warehouse.value?.id ?? -1))
            .and()
            .product((p) => p.idEqualTo(d.product.value?.id ?? -1))
            .findFirst();
            
          if (stock != null) {
             if (tx.type == VlxdInventoryTransactionType.IMPORT) {
               stock.currentQuantity += d.quantity;
             } else if (tx.type == VlxdInventoryTransactionType.EXPORT) {
               stock.currentQuantity -= d.quantity;
             }
             await db.vlxdInventoryStocks.put(stock);
          } else if (tx.type == VlxdInventoryTransactionType.IMPORT) {
             final newStock = VlxdInventoryStock()
                ..stockId = DateTime.now().millisecondsSinceEpoch.toString()
                ..currentQuantity = d.quantity;
             newStock.warehouse.value = tx.warehouse.value;
             newStock.product.value = d.product.value;
             await db.vlxdInventoryStocks.put(newStock);
             await newStock.warehouse.save();
             await newStock.product.save();
          }
        }
      });
      await loadTransactions();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final vlxdInventoryProvider = StateNotifierProvider<VlxdInventoryNotifier, AsyncValue<List<VlxdInventoryTransaction>>>((ref) {
  final isarService = ref.watch(vlxdIsarServiceProvider);
  return VlxdInventoryNotifier(isarService);
});

// Partners (Customers & Suppliers)
class VlxdPartnersNotifier extends StateNotifier<AsyncValue<List<VlxdCustomer>>> {
  final VlxdIsarService _isarService;

  VlxdPartnersNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadCustomers();
  }

  Future<void> loadCustomers() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final customers = await db.vlxdCustomers.where().findAll();
      state = AsyncValue.data(customers);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addCustomer(VlxdCustomer customer) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.vlxdCustomers.put(customer);
    });
    await loadCustomers();
  }
}

final vlxdCustomersProvider = StateNotifierProvider<VlxdPartnersNotifier, AsyncValue<List<VlxdCustomer>>>((ref) {
  final isarService = ref.watch(vlxdIsarServiceProvider);
  return VlxdPartnersNotifier(isarService);
});

final vlxdSuppliersProvider = FutureProvider<List<VlxdSupplier>>((ref) async {
  final isarService = ref.watch(vlxdIsarServiceProvider);
  final db = await isarService.db;
  return await db.vlxdSuppliers.where().findAll();
});

// Finance
class VlxdFinanceNotifier extends StateNotifier<AsyncValue<List<VlxdFinanceTransaction>>> {
  final VlxdIsarService _isarService;

  VlxdFinanceNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final txs = await db.vlxdFinanceTransactions.where().sortByTransactionDateDesc().findAll();
      state = AsyncValue.data(txs);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createTransaction(VlxdFinanceTransaction tx) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        await db.vlxdFinanceTransactions.put(tx);
        await tx.customer.save();
        await tx.supplier.save();
        
        // Update customer debt
        if (tx.customer.value != null) {
           final customer = tx.customer.value!;
           // Nếu là phiếu thu tiền của khách -> nợ giảm
           if (tx.type == FinanceTransactionType.RECEIPT) {
              customer.currentDebt -= tx.amount;
           } else {
              customer.currentDebt += tx.amount;
           }
           await db.vlxdCustomers.put(customer);
        }

        // Update supplier debt
        if (tx.supplier.value != null) {
           final supplier = tx.supplier.value!;
           // Nếu chi trả tiền cho NCC -> nợ giảm
           if (tx.type == FinanceTransactionType.PAYMENT) {
              supplier.currentDebt -= tx.amount;
           } else {
              supplier.currentDebt += tx.amount;
           }
           await db.vlxdSuppliers.put(supplier);
        }
      });
      await loadTransactions();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final vlxdFinanceProvider = StateNotifierProvider<VlxdFinanceNotifier, AsyncValue<List<VlxdFinanceTransaction>>>((ref) {
  final isarService = ref.watch(vlxdIsarServiceProvider);
  return VlxdFinanceNotifier(isarService);
});

// Dashboard Metrics
final vlxdDashboardProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final isarService = ref.watch(vlxdIsarServiceProvider);

  // Recompute whenever underlying data changes
  ref.watch(vlxdOrdersProvider);
  ref.watch(vlxdProductsProvider);
  ref.watch(vlxdCustomersProvider);
  ref.watch(vlxdSuppliersProvider);
  ref.watch(vlxdInventoryProvider);
  ref.watch(vlxdStocksProvider);
  ref.watch(vlxdFinanceProvider);

  final db = await isarService.db;

  final orders = await db.vlxdOrders.where().findAll();
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  double todayRevenue = 0;
  double totalRevenue = 0;
  int orderCount = 0;
  int pendingOrders = 0;
  int activeContracts = 0;

  for (final o in orders) {
    if (o.status == OrderStatus.CANCELLED) continue;
    orderCount++;
    totalRevenue += o.totalAmount;
    if (o.isWholesaleContract) activeContracts++;
    if (o.status == OrderStatus.PENDING || o.status == OrderStatus.DELIVERING) {
      pendingOrders++;
    }
    final od = o.orderDate;
    if (od.year == today.year && od.month == today.month && od.day == today.day) {
      todayRevenue += o.totalAmount;
    }
  }

  double receivable = 0;
  final customers = await db.vlxdCustomers.where().findAll();
  for (final c in customers) {
    receivable += c.currentDebt;
  }

  double payable = 0;
  final suppliers = await db.vlxdSuppliers.where().findAll();
  for (final s in suppliers) {
    payable += s.currentDebt;
  }

  double receipts = 0;
  double payments = 0;
  final financeTxs = await db.vlxdFinanceTransactions.where().findAll();
  for (final t in financeTxs) {
    if (t.type == FinanceTransactionType.RECEIPT) {
      receipts += t.amount;
    } else {
      payments += t.amount;
    }
  }

  final products = await db.vlxdProducts.where().findAll();
  final stocks = await db.vlxdInventoryStocks.where().findAll();
  int lowStock = 0;
  double inventoryValue = 0;
  for (final s in stocks) {
    if (s.currentQuantity < s.minQuantity) lowStock++;
    inventoryValue += s.currentQuantity * (s.product.value?.purchasePrice ?? 0);
  }

  return {
    'todayRevenue': todayRevenue,
    'totalRevenue': totalRevenue,
    'orderCount': orderCount,
    'pendingOrders': pendingOrders,
    'activeContracts': activeContracts,
    'receivable': receivable,
    'payable': payable,
    'cashBalance': receipts - payments,
    'productCount': products.length,
    'lowStock': lowStock,
    'inventoryValue': inventoryValue,
  };
});

