import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/product.dart';
import '../services/pawn_isar_service.dart';
import 'isar_provider.dart';

final productProvider = StateNotifierProvider<ProductNotifier, AsyncValue<List<Product>>>((ref) {
  final isarService = ref.watch(pawnIsarServiceProvider);
  return ProductNotifier(isarService);
});

class ProductNotifier extends StateNotifier<AsyncValue<List<Product>>> {
  final PawnIsarService _isarService;

  ProductNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadProducts();
  }

  Future<Isar> get _db => _isarService.db;

  Future<void> loadProducts() async {
    try {
      state = const AsyncValue.loading();
      final isar = await _db;
      final products = await isar.products.where().findAll();
      state = AsyncValue.data(products);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      final isar = await _db;
      await isar.writeTxn(() async {
        await isar.products.put(product);
      });
      await loadProducts();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
