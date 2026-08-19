import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/barber_product.dart';
import '../models/barber_inventory_transaction.dart';
import 'barber_service_provider.dart';

class InventoryItem {
  final BarberProduct product;
  final int quantityInStock;
  final int minimumThreshold;

  InventoryItem({
    required this.product,
    required this.quantityInStock,
    required this.minimumThreshold,
  });

  bool get isLowStock => quantityInStock <= minimumThreshold;
}

class InventoryNotifier extends StateNotifier<AsyncValue<List<InventoryItem>>> {
  final Isar isar;
  InventoryNotifier(this.isar) : super(const AsyncValue.loading()) {
    loadInventory();
  }

  Future<void> loadInventory() async {
    state = const AsyncValue.loading();
    try {
      final allProducts = await isar.barberProducts.where().anyId().findAll();
      final products = allProducts.where((p) => p.isActive).toList();
      state = AsyncValue.data(products.map((p) => InventoryItem(
        product: p,
        quantityInStock: p.stock,
        minimumThreshold: p.minimumStock,
      )).toList());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> importStock(String productId, int qty, String reason) async {
    final products = await isar.barberProducts.filter().productIdEqualTo(productId).findAll();
    if (products.isEmpty) return;
    final p = products.first;
    p.stock += qty;
    await isar.writeTxn(() async {
      await isar.barberProducts.put(p);
      await isar.barberInventoryTransactions.put(
        BarberInventoryTransaction()
          ..transactionId = 'ITX-${DateTime.now().millisecondsSinceEpoch}'
          ..type = 'IMPORT'
          ..productId = productId
          ..productName = p.name
          ..quantity = qty
          ..unitCost = p.purchasePrice
          ..totalCost = qty * p.purchasePrice
          ..reason = reason
          ..createdAt = DateTime.now(),
      );
    });
    await loadInventory();
  }

  Future<void> exportStock(String productId, int qty, String reason) async {
    final products = await isar.barberProducts.filter().productIdEqualTo(productId).findAll();
    if (products.isEmpty) return;
    final p = products.first;
    if (p.stock < qty) return;
    p.stock -= qty;
    await isar.writeTxn(() async {
      await isar.barberProducts.put(p);
      await isar.barberInventoryTransactions.put(
        BarberInventoryTransaction()
          ..transactionId = 'ITX-${DateTime.now().millisecondsSinceEpoch}'
          ..type = 'EXPORT'
          ..productId = productId
          ..productName = p.name
          ..quantity = qty
          ..unitCost = p.purchasePrice
          ..totalCost = qty * p.purchasePrice
          ..reason = reason
          ..createdAt = DateTime.now(),
      );
    });
    await loadInventory();
  }

  Future<List<BarberInventoryTransaction>> getTransactions({String? type}) async {
    var txns = await isar.barberInventoryTransactions.where().anyId().findAll();
    if (type != null) {
      txns = txns.where((t) => t.type == type).toList();
    }
    return txns;
  }
}

final inventoryProvider = StateNotifierProvider<InventoryNotifier, AsyncValue<List<InventoryItem>>>((ref) {
  final isar = ref.watch(barberIsarProvider).requireValue;
  return InventoryNotifier(isar);
});
