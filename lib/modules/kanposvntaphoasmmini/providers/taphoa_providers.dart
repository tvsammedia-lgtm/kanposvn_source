import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../models/invoice.dart';
import '../models/inventory.dart';
import '../models/finance.dart';
import '../models/partner.dart';
import '../services/taphoa_isar_service.dart';
import '../services/taphoa_einvoice_settings.dart';

final tapHoaIsarServiceProvider = Provider<TapHoaIsarService>((ref) {
  return TapHoaIsarService();
});

// Settings
final tapHoaEinvoiceSettingsProvider =
    ChangeNotifierProvider<TapHoaEinvoiceSettingsStore>((ref) {
  final store = TapHoaEinvoiceSettingsStore();
  store.load();
  return store;
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

  Future<void> deleteProduct(String productId) async {
    await _isar.deleteProduct(productId);
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

  /// Thanh toán hoàn chỉnh: lưu HD + trừ kho + ghi thu chi + tích điểm.
  Future<void> checkout(
    TapHoaInvoice invoice,
    List<TapHoaInvoiceItem> items, {
    TapHoaCustomer? customer,
  }) async {
    await _isar.processCheckout(invoice, items, customer: customer);
    await loadInvoices();
  }
}

final tapHoaInvoicesProvider = StateNotifierProvider<TapHoaInvoicesNotifier, List<TapHoaInvoice>>((ref) {
  return TapHoaInvoicesNotifier(ref.watch(tapHoaIsarServiceProvider));
});

// --- POS Cart Provider ---
/// Giỏ hàng dùng `List` thuần (không phải IsarLinks) vì link chỉ lưu được
/// vào DB sau khi `put`, khiến giỏ hàng trong bộ nhớ không bao giờ hiển thị.
class TapHoaPosCartNotifier extends StateNotifier<List<TapHoaInvoiceItem>> {
  TapHoaPosCartNotifier() : super(const []);

  void startNewOrder() {
    state = const [];
  }

  void addItem(TapHoaProduct product, {double quantity = 1}) {
    final index = state.indexWhere((item) => item.productId == product.productId);
    if (index != -1) {
      final updated = [...state];
      updated[index].quantity += quantity;
      updated[index].total =
          (updated[index].price - updated[index].discount) * updated[index].quantity;
      state = updated;
    } else {
      state = [
        ...state,
        TapHoaInvoiceItem()
          ..invoiceItemId = 'ITEM_${DateTime.now().millisecondsSinceEpoch}'
          ..productId = product.productId
          ..productName = product.productName
          ..productCode = product.productCode
          ..price = product.retailPrice
          ..quantity = quantity
          ..total = product.retailPrice * quantity,
      ];
    }
  }

  void updateQuantity(int index, double newQuantity) {
    if (index < 0 || index >= state.length) return;
    final updated = [...state];
    if (newQuantity <= 0) {
      updated.removeAt(index);
    } else {
      updated[index].quantity = newQuantity;
      updated[index].total =
          (updated[index].price - updated[index].discount) * newQuantity;
    }
    state = updated;
  }

  double get totalAmount => state.fold<double>(0, (sum, item) => sum + item.total);
}

final tapHoaPosCartProvider =
    StateNotifierProvider<TapHoaPosCartNotifier, List<TapHoaInvoiceItem>>(
  (ref) => TapHoaPosCartNotifier(),
);

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

  Future<void> deleteCustomer(String customerId) async {
    await _isar.deleteCustomer(customerId);
    await loadCustomers();
  }
}

final tapHoaCustomersProvider = StateNotifierProvider<TapHoaCustomersNotifier, List<TapHoaCustomer>>((ref) {
  return TapHoaCustomersNotifier(ref.watch(tapHoaIsarServiceProvider));
});

// --- Supplier Provider ---
class TapHoaSuppliersNotifier extends StateNotifier<List<TapHoaSupplier>> {
  final TapHoaIsarService _isar;
  bool _isLoading = false;

  TapHoaSuppliersNotifier(this._isar) : super([]) {
    loadSuppliers();
  }

  Future<void> loadSuppliers() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getSuppliers();
    _isLoading = false;
  }

  Future<void> saveSupplier(TapHoaSupplier supplier) async {
    await _isar.saveSupplier(supplier);
    await loadSuppliers();
  }

  Future<void> deleteSupplier(String supplierId) async {
    await _isar.deleteSupplier(supplierId);
    await loadSuppliers();
  }
}

final tapHoaSuppliersProvider = StateNotifierProvider<TapHoaSuppliersNotifier, List<TapHoaSupplier>>((ref) {
  return TapHoaSuppliersNotifier(ref.watch(tapHoaIsarServiceProvider));
});

// --- Inventory Transaction Provider ---
class TapHoaInventoryTransactionsNotifier extends StateNotifier<List<TapHoaInventoryTransaction>> {
  final TapHoaIsarService _isar;
  bool _isLoading = false;

  TapHoaInventoryTransactionsNotifier(this._isar) : super([]) {
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getInventoryTransactions();
    _isLoading = false;
  }
}

final tapHoaInventoryTransactionsProvider =
    StateNotifierProvider<TapHoaInventoryTransactionsNotifier, List<TapHoaInventoryTransaction>>(
  (ref) => TapHoaInventoryTransactionsNotifier(ref.watch(tapHoaIsarServiceProvider)),
);

// --- Debt / Công nợ ---
class TapHoaDebtNotifier extends StateNotifier<Map<String, dynamic>> {
  final TapHoaIsarService _isar;
  bool _isLoading = false;

  TapHoaDebtNotifier(this._isar) : super(const {}) {
    refresh();
  }

  Future<void> refresh() async {
    if (_isLoading) return;
    _isLoading = true;
    final customers = await _isar.getCustomers();
    final suppliers = await _isar.getSuppliers();
    state = {
      'customerDebt': customers.fold<double>(0, (s, c) => s + c.debtAmount),
      'supplierDebt': suppliers.fold<double>(0, (s, p) => s + p.debtAmount),
    };
    _isLoading = false;
  }

  Future<void> payDebt({
    required String partnerId,
    required bool isCustomer,
    required String partnerName,
    required double amount,
  }) async {
    await _isar.processDebtPayment(
      partnerId: partnerId,
      isCustomer: isCustomer,
      partnerName: partnerName,
      amount: amount,
    );
    await refresh();
  }
}

final tapHoaDebtProvider =
    StateNotifierProvider<TapHoaDebtNotifier, Map<String, dynamic>>(
  (ref) => TapHoaDebtNotifier(ref.watch(tapHoaIsarServiceProvider)),
);
