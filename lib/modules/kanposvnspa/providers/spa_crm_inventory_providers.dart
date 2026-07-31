import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/spa_customer.dart';
import '../models/spa_inventory_models.dart';
import '../services/spa_isar_service.dart';
import 'spa_providers.dart';

// Customers
class SpaCustomersNotifier extends StateNotifier<AsyncValue<List<SpaCustomer>>> {
  final SpaIsarService _isarService;
  SpaCustomersNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadCustomers();
  }

  Future<void> loadCustomers() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.spaCustomers.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addCustomer(SpaCustomer cus) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        await db.spaCustomers.put(cus);
      });
      await loadCustomers();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final spaCustomersProvider = StateNotifierProvider<SpaCustomersNotifier, AsyncValue<List<SpaCustomer>>>((ref) {
  return SpaCustomersNotifier(ref.watch(spaIsarServiceProvider));
});

// Products
class SpaProductsNotifier extends StateNotifier<AsyncValue<List<SpaProduct>>> {
  final SpaIsarService _isarService;
  SpaProductsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.spaProducts.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final spaProductsProvider = StateNotifierProvider<SpaProductsNotifier, AsyncValue<List<SpaProduct>>>((ref) {
  return SpaProductsNotifier(ref.watch(spaIsarServiceProvider));
});

// Inventory Transactions
class SpaInventoryNotifier extends StateNotifier<AsyncValue<List<SpaInventoryTx>>> {
  final SpaIsarService _isarService;
  final Ref ref;

  SpaInventoryNotifier(this._isarService, this.ref) : super(const AsyncValue.loading()) {
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.spaInventoryTxs.where().sortByCreatedAtDesc().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addTransaction(SpaProduct product, int quantity, SpaInventoryTxType type, String note) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        final tx = SpaInventoryTx()
          ..productId = product.productId
          ..productName = product.name
          ..quantity = type == SpaInventoryTxType.IMPORT ? quantity : -quantity
          ..type = type
          ..note = note
          ..createdAt = DateTime.now();

        await db.spaInventoryTxs.put(tx);
        
        product.stock += tx.quantity;
        await db.spaProducts.put(product);
      });
      await loadTransactions();
      ref.read(spaProductsProvider.notifier).loadProducts();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final spaInventoryProvider = StateNotifierProvider<SpaInventoryNotifier, AsyncValue<List<SpaInventoryTx>>>((ref) {
  return SpaInventoryNotifier(ref.watch(spaIsarServiceProvider), ref);
});
