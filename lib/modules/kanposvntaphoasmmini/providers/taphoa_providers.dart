import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../models/invoice.dart';
import '../models/inventory.dart';
import '../models/finance.dart';
import '../models/partner.dart';
import '../services/taphoa_isar_service.dart';

final tapHoaIsarServiceProvider = Provider<TapHoaIsarService>((ref) {
  return TapHoaIsarService();
});

// --- Category Provider ---
class TapHoaCategoriesNotifier extends StateNotifier<List<TapHoaCategory>> {
  final TapHoaIsarService _isar;
  bool _isLoading = false;

  TapHoaCategoriesNotifier(this._isar) : super([]) {
    loadCategories();
  }

  Future<void> loadCategories() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getCategories();
    _isLoading = false;
  }

  Future<void> saveCategory(TapHoaCategory category) async {
    await _isar.saveCategory(category);
    await loadCategories();
  }
}

final tapHoaCategoriesProvider = StateNotifierProvider<TapHoaCategoriesNotifier, List<TapHoaCategory>>((ref) {
  return TapHoaCategoriesNotifier(ref.watch(tapHoaIsarServiceProvider));
});

// --- Product Provider ---
class TapHoaProductsNotifier extends StateNotifier<List<TapHoaProduct>> {
  final TapHoaIsarService _isar;
  bool _isLoading = false;

  TapHoaProductsNotifier(this._isar) : super([]) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getProducts();
    _isLoading = false;
  }

  Future<void> saveProduct(TapHoaProduct product) async {
    await _isar.saveProduct(product);
    await loadProducts();
  }
}

final tapHoaProductsProvider = StateNotifierProvider<TapHoaProductsNotifier, List<TapHoaProduct>>((ref) {
  return TapHoaProductsNotifier(ref.watch(tapHoaIsarServiceProvider));
});

// --- Invoice Provider ---
class TapHoaInvoicesNotifier extends StateNotifier<List<TapHoaInvoice>> {
  final TapHoaIsarService _isar;
  bool _isLoading = false;

  TapHoaInvoicesNotifier(this._isar) : super([]) {
    loadInvoices();
  }

  Future<void> loadInvoices() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getInvoices();
    _isLoading = false;
  }

  Future<void> saveInvoice(TapHoaInvoice invoice) async {
    await _isar.saveInvoice(invoice);
    await loadInvoices();
  }
}

final tapHoaInvoicesProvider = StateNotifierProvider<TapHoaInvoicesNotifier, List<TapHoaInvoice>>((ref) {
  return TapHoaInvoicesNotifier(ref.watch(tapHoaIsarServiceProvider));
});

// --- POS Cart Provider ---
class TapHoaPosCartNotifier extends StateNotifier<TapHoaInvoice> {
  TapHoaPosCartNotifier() : super(TapHoaInvoice()..invoiceNumber = 'HD${DateTime.now().millisecondsSinceEpoch}');

  void startNewOrder() {
    state = TapHoaInvoice()..invoiceNumber = 'HD${DateTime.now().millisecondsSinceEpoch}';
  }

  void addItem(TapHoaProduct product, {double quantity = 1}) {
    final existingItemIndex = state.items.toList().indexWhere((item) => item.productId == product.productId);
    
    // We should create a new invoice to trigger Riverpod state update
    final newInvoice = TapHoaInvoice()
      ..id = state.id
      ..invoiceNumber = state.invoiceNumber
      ..createdAt = state.createdAt
      ..customerId = state.customerId
      ..customerName = state.customerName
      ..paymentMethod = state.paymentMethod
      ..note = state.note;

    final List<TapHoaInvoiceItem> newItems = state.items.toList();
    
    if (existingItemIndex != -1) {
      final existingItem = newItems[existingItemIndex];
      existingItem.quantity += quantity;
      existingItem.total = (existingItem.price - existingItem.discount) * existingItem.quantity;
    } else {
      final newItem = TapHoaInvoiceItem()
        ..invoiceItemId = 'ITEM_${DateTime.now().millisecondsSinceEpoch}'
        ..productId = product.productId
        ..productName = product.productName
        ..productCode = product.productCode
        ..price = product.retailPrice
        ..quantity = quantity
        ..total = product.retailPrice * quantity;
      newItems.add(newItem);
    }
    
    newInvoice.items.addAll(newItems);
    _calculateTotal(newInvoice);
    state = newInvoice;
  }
  
  void updateQuantity(int index, double newQuantity) {
    if (index >= 0 && index < state.items.length) {
      final newInvoice = _cloneInvoice(state);
      final items = newInvoice.items.toList();
      
      if (newQuantity <= 0) {
        items.removeAt(index);
      } else {
        items[index].quantity = newQuantity;
        items[index].total = (items[index].price - items[index].discount) * newQuantity;
      }
      
      newInvoice.items.clear();
      newInvoice.items.addAll(items);
      _calculateTotal(newInvoice);
      state = newInvoice;
    }
  }

  void _calculateTotal(TapHoaInvoice invoice) {
    double total = 0;
    for (var item in invoice.items) {
      total += item.total;
    }
    invoice.totalAmount = total;
    invoice.finalAmount = total - invoice.discountAmount;
  }

  TapHoaInvoice _cloneInvoice(TapHoaInvoice source) {
    final clone = TapHoaInvoice()
      ..id = source.id
      ..invoiceNumber = source.invoiceNumber
      ..createdAt = source.createdAt
      ..customerId = source.customerId
      ..customerName = source.customerName
      ..paymentMethod = source.paymentMethod
      ..note = source.note
      ..totalAmount = source.totalAmount
      ..discountAmount = source.discountAmount
      ..finalAmount = source.finalAmount
      ..amountPaid = source.amountPaid
      ..changeAmount = source.changeAmount;
    clone.items.addAll(source.items.toList());
    return clone;
  }
}

final tapHoaPosCartProvider = StateNotifierProvider<TapHoaPosCartNotifier, TapHoaInvoice>((ref) {
  return TapHoaPosCartNotifier();
});

// --- Inventory Provider ---
class TapHoaInventoryNotifier extends StateNotifier<List<TapHoaInventoryItem>> {
  final TapHoaIsarService _isar;
  bool _isLoading = false;

  TapHoaInventoryNotifier(this._isar) : super([]) {
    loadInventory();
  }

  Future<void> loadInventory() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getInventoryItems();
    _isLoading = false;
  }

  Future<void> saveInventoryItem(TapHoaInventoryItem item) async {
    await _isar.saveInventoryItem(item);
    await loadInventory();
  }
}

final tapHoaInventoryProvider = StateNotifierProvider<TapHoaInventoryNotifier, List<TapHoaInventoryItem>>((ref) {
  return TapHoaInventoryNotifier(ref.watch(tapHoaIsarServiceProvider));
});

// --- Finance Provider ---
class TapHoaCashTransactionsNotifier extends StateNotifier<List<TapHoaCashTransaction>> {
  final TapHoaIsarService _isar;
  bool _isLoading = false;

  TapHoaCashTransactionsNotifier(this._isar) : super([]) {
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getCashTransactions();
    _isLoading = false;
  }

  Future<void> saveTransaction(TapHoaCashTransaction tx) async {
    await _isar.saveCashTransaction(tx);
    await loadTransactions();
  }
}

final tapHoaCashTransactionsProvider = StateNotifierProvider<TapHoaCashTransactionsNotifier, List<TapHoaCashTransaction>>((ref) {
  return TapHoaCashTransactionsNotifier(ref.watch(tapHoaIsarServiceProvider));
});

// --- Customer Provider ---
class TapHoaCustomersNotifier extends StateNotifier<List<TapHoaCustomer>> {
  final TapHoaIsarService _isar;
  bool _isLoading = false;

  TapHoaCustomersNotifier(this._isar) : super([]) {
    loadCustomers();
  }

  Future<void> loadCustomers() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getCustomers();
    _isLoading = false;
  }

  Future<void> saveCustomer(TapHoaCustomer customer) async {
    await _isar.saveCustomer(customer);
    await loadCustomers();
  }
}

final tapHoaCustomersProvider = StateNotifierProvider<TapHoaCustomersNotifier, List<TapHoaCustomer>>((ref) {
  return TapHoaCustomersNotifier(ref.watch(tapHoaIsarServiceProvider));
});
