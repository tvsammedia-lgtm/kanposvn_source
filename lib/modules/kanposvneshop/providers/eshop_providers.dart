import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/eshop_isar_service.dart';
import '../models/eshop_product.dart';

final eshopIsarServiceProvider = Provider<EshopIsarService>((ref) {
  return EshopIsarService();
});

class EshopProductsNotifier extends StateNotifier<List<KanShopProduct>> {
  final EshopIsarService _isar;
  bool _isLoading = false;

  EshopProductsNotifier(this._isar) : super([]) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getAllProducts();
    _isLoading = false;
  }

  Future<void> addProduct(KanShopProduct product) async {
    await _isar.saveProduct(product);
    await loadProducts();
  }
}

final eshopProductsProvider = StateNotifierProvider<EshopProductsNotifier, List<KanShopProduct>>((ref) {
  return EshopProductsNotifier(ref.watch(eshopIsarServiceProvider));
});
