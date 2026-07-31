import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/bida_item.dart';
import '../models/bida_inventory_tx.dart';
import 'bida_providers.dart';

class BidaInventoryNotifier extends StateNotifier<AsyncValue<List<BidaInventoryTx>>> {
  final dynamic bidaIsarService;
  final Ref ref;

  BidaInventoryNotifier(this.bidaIsarService, this.ref) : super(const AsyncValue.loading()) {
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    try {
      state = const AsyncValue.loading();
      final db = await bidaIsarService.db;
      final data = await db.bidaInventoryTxs.where().sortByCreatedAtDesc().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addTransaction(BidaItem item, int quantity, BidaInventoryTxType type, String note) async {
    try {
      final db = await bidaIsarService.db;
      await db.writeTxn(() async {
        final tx = BidaInventoryTx()
          ..itemId = item.itemId
          ..itemName = item.name
          ..quantity = type == BidaInventoryTxType.IMPORT ? quantity : -quantity
          ..type = type
          ..note = note
          ..createdAt = DateTime.now();

        await db.bidaInventoryTxs.put(tx);
        
        item.stock += tx.quantity;
        await db.bidaItems.put(item);
      });
      await loadTransactions();
      ref.read(bidaItemsProvider.notifier).loadItems();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final bidaInventoryProvider = StateNotifierProvider<BidaInventoryNotifier, AsyncValue<List<BidaInventoryTx>>>((ref) {
  return BidaInventoryNotifier(ref.watch(bidaIsarServiceProvider), ref);
});
