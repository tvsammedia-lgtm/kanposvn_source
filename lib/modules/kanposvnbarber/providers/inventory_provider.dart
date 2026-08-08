import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/barber_product.dart';

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
  InventoryNotifier() : super(const AsyncValue.loading()) {
    loadInventory();
  }

  Future<void> loadInventory() async {
    state = const AsyncValue.loading();
    
    // Giả lập load dữ liệu kho
    await Future.delayed(const Duration(milliseconds: 500));
    
    final mockData = [
      InventoryItem(
        product: BarberProduct()..name = 'Sáp vuốt tóc Volcanic'..category = 'Wax',
        quantityInStock: 5, // Sắp hết
        minimumThreshold: 10,
      ),
      InventoryItem(
        product: BarberProduct()..name = 'Dầu gội Clear Men'..category = 'Shampoo',
        quantityInStock: 25, // Bình thường
        minimumThreshold: 10,
      ),
      InventoryItem(
        product: BarberProduct()..name = 'Thuốc nhuộm LOréal đen'..category = 'Color',
        quantityInStock: 2, // Sắp hết
        minimumThreshold: 5,
      ),
    ];
    
    state = AsyncValue.data(mockData);
  }
}

final inventoryProvider = StateNotifierProvider<InventoryNotifier, AsyncValue<List<InventoryItem>>>((ref) {
  return InventoryNotifier();
});
