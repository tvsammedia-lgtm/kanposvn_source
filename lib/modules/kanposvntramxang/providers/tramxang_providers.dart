import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../models/tank.dart';
import '../models/sale.dart';
import '../models/inventory.dart';
import '../services/tramxang_isar_service.dart';

final tramXangIsarServiceProvider = Provider<TramXangIsarService>((ref) {
  return TramXangIsarService();
});

// ---------------------------------------------------------------------------
// Đảm bảo dữ liệu mẫu đã được nạp + làm mới toàn bộ provider khi mở module.
// ---------------------------------------------------------------------------
class TramXangBootstrapNotifier extends StateNotifier<bool> {
  final TramXangIsarService _isar;
  final Ref _ref;
  bool _seeding = false;

  TramXangBootstrapNotifier(this._isar, this._ref) : super(false);

  Future<void> seedAndRefresh({bool force = false}) async {
    if (_seeding) return;
    _seeding = true;
    try {
      if (force) {
        await _isar.resetAndSeed();
      } else {
        await _isar.ensureSeeded();
      }
      await _ref.read(tramXangProductsProvider.notifier).loadProducts();
      await _ref.read(tramXangTanksProvider.notifier).loadTanks();
      await _ref.read(tramXangPumpsProvider.notifier).loadPumps();
      await _ref.read(tramXangPumpNozzlesProvider.notifier).loadNozzles();
      await _ref.read(tramXangCustomersProvider.notifier).loadCustomers();
      await _ref.read(tramXangSuppliersProvider.notifier).loadSuppliers();
      await _ref.read(tramXangCategoriesProvider.notifier).loadCategories();
      await _ref.read(tramXangActiveShiftProvider.notifier).loadActiveShift();
      await _ref.read(tramXangSalesProvider.notifier).loadSales();
      await _ref.read(tramXangPurchasesProvider.notifier).loadPurchases();
      await _ref.read(tramXangTankReadingsProvider.notifier).loadReadings();
      state = true;
    } finally {
      _seeding = false;
    }
  }
}

final tramXangBootstrapProvider =
    StateNotifierProvider<TramXangBootstrapNotifier, bool>((ref) {
  return TramXangBootstrapNotifier(
      ref.watch(tramXangIsarServiceProvider), ref);
});

// ---------------------------------------------------------------------------
// Categories
// ---------------------------------------------------------------------------
class TramXangCategoriesNotifier extends StateNotifier<List<TramXangCategory>> {
  final TramXangIsarService _isar;
  bool _isLoading = false;

  TramXangCategoriesNotifier(this._isar) : super([]);

  Future<void> loadCategories() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getCategories();
    _isLoading = false;
  }

  Future<void> saveCategory(TramXangCategory category) async {
    await _isar.saveCategory(category);
    await loadCategories();
  }
}

final tramXangCategoriesProvider =
    StateNotifierProvider<TramXangCategoriesNotifier, List<TramXangCategory>>(
        (ref) {
  return TramXangCategoriesNotifier(ref.watch(tramXangIsarServiceProvider));
});

// ---------------------------------------------------------------------------
// Products
// ---------------------------------------------------------------------------
class TramXangProductsNotifier extends StateNotifier<List<TramXangProduct>> {
  final TramXangIsarService _isar;
  bool _isLoading = false;

  TramXangProductsNotifier(this._isar) : super([]);

  Future<void> loadProducts() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getProducts();
    _isLoading = false;
  }

  Future<void> saveProduct(TramXangProduct product) async {
    await _isar.saveProduct(product);
    await loadProducts();
  }
}

final tramXangProductsProvider =
    StateNotifierProvider<TramXangProductsNotifier, List<TramXangProduct>>(
        (ref) {
  return TramXangProductsNotifier(ref.watch(tramXangIsarServiceProvider));
});

// ---------------------------------------------------------------------------
// Tanks & Tank readings
// ---------------------------------------------------------------------------
class TramXangTanksNotifier extends StateNotifier<List<TramXangTank>> {
  final TramXangIsarService _isar;
  bool _isLoading = false;

  TramXangTanksNotifier(this._isar) : super([]);

  Future<void> loadTanks() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getTanks();
    _isLoading = false;
  }

  Future<void> saveTank(TramXangTank tank) async {
    await _isar.saveTank(tank);
    await loadTanks();
  }
}

final tramXangTanksProvider =
    StateNotifierProvider<TramXangTanksNotifier, List<TramXangTank>>((ref) {
  return TramXangTanksNotifier(ref.watch(tramXangIsarServiceProvider));
});

class TramXangTankReadingsNotifier
    extends StateNotifier<List<TramXangTankReading>> {
  final TramXangIsarService _isar;
  bool _isLoading = false;

  TramXangTankReadingsNotifier(this._isar) : super([]);

  Future<void> loadReadings() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getTankReadings();
    _isLoading = false;
  }
}

final tramXangTankReadingsProvider =
    StateNotifierProvider<TramXangTankReadingsNotifier, List<TramXangTankReading>>(
        (ref) {
  return TramXangTankReadingsNotifier(ref.watch(tramXangIsarServiceProvider));
});

// ---------------------------------------------------------------------------
// Pumps & Nozzles
// ---------------------------------------------------------------------------
class TramXangPumpsNotifier extends StateNotifier<List<TramXangPump>> {
  final TramXangIsarService _isar;
  bool _isLoading = false;

  TramXangPumpsNotifier(this._isar) : super([]);

  Future<void> loadPumps() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getPumps();
    _isLoading = false;
  }
}

final tramXangPumpsProvider =
    StateNotifierProvider<TramXangPumpsNotifier, List<TramXangPump>>((ref) {
  return TramXangPumpsNotifier(ref.watch(tramXangIsarServiceProvider));
});

class TramXangPumpNozzlesNotifier extends StateNotifier<List<TramXangPumpNozzle>> {
  final TramXangIsarService _isar;
  bool _isLoading = false;

  TramXangPumpNozzlesNotifier(this._isar) : super([]);

  Future<void> loadNozzles() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getPumpNozzles();
    _isLoading = false;
  }

  Future<void> saveNozzle(TramXangPumpNozzle nozzle) async {
    await _isar.savePumpNozzle(nozzle);
    await loadNozzles();
  }
}

final tramXangPumpNozzlesProvider =
    StateNotifierProvider<TramXangPumpNozzlesNotifier, List<TramXangPumpNozzle>>(
        (ref) {
  return TramXangPumpNozzlesNotifier(ref.watch(tramXangIsarServiceProvider));
});

// ---------------------------------------------------------------------------
// Shifts
// ---------------------------------------------------------------------------
class TramXangShiftNotifier extends StateNotifier<TramXangShift?> {
  final TramXangIsarService _isar;
  bool _isLoading = false;

  TramXangShiftNotifier(this._isar) : super(null);

  Future<void> loadActiveShift() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getActiveShift();
    _isLoading = false;
  }

  Future<void> openShift(TramXangShift shift) async {
    await _isar.saveShift(shift);
    await loadActiveShift();
  }

  Future<TramXangShift> closeShiftWithCash(TramXangShift shift, double actualCash) async {
    final closed = await _isar.closeShiftWithCash(shift, actualCash);
    await loadActiveShift();
    return closed;
  }
}

final tramXangActiveShiftProvider =
    StateNotifierProvider<TramXangShiftNotifier, TramXangShift?>((ref) {
  return TramXangShiftNotifier(ref.watch(tramXangIsarServiceProvider));
});

// ---------------------------------------------------------------------------
// Customers & Suppliers
// ---------------------------------------------------------------------------
class TramXangCustomersNotifier extends StateNotifier<List<TramXangCustomer>> {
  final TramXangIsarService _isar;
  bool _isLoading = false;

  TramXangCustomersNotifier(this._isar) : super([]);

  Future<void> loadCustomers() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getCustomers();
    _isLoading = false;
  }

  Future<void> saveCustomer(TramXangCustomer customer) async {
    await _isar.saveCustomer(customer);
    await loadCustomers();
  }
}

final tramXangCustomersProvider =
    StateNotifierProvider<TramXangCustomersNotifier, List<TramXangCustomer>>(
        (ref) {
  return TramXangCustomersNotifier(ref.watch(tramXangIsarServiceProvider));
});

class TramXangSuppliersNotifier extends StateNotifier<List<TramXangSupplier>> {
  final TramXangIsarService _isar;
  bool _isLoading = false;

  TramXangSuppliersNotifier(this._isar) : super([]);

  Future<void> loadSuppliers() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getSuppliers();
    _isLoading = false;
  }

  Future<void> saveSupplier(TramXangSupplier supplier) async {
    await _isar.saveSupplier(supplier);
    await loadSuppliers();
  }
}

final tramXangSuppliersProvider =
    StateNotifierProvider<TramXangSuppliersNotifier, List<TramXangSupplier>>(
        (ref) {
  return TramXangSuppliersNotifier(ref.watch(tramXangIsarServiceProvider));
});

// ---------------------------------------------------------------------------
// Sales
// ---------------------------------------------------------------------------
class TramXangSalesNotifier extends StateNotifier<List<TramXangSale>> {
  final TramXangIsarService _isar;
  bool _isLoading = false;

  TramXangSalesNotifier(this._isar) : super([]);

  Future<void> loadSales() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getSales();
    _isLoading = false;
  }

  Future<TramXangSale> createSale({
    required List<TramXangSaleItem> items,
    required String paymentMethod,
    TramXangCustomer? customer,
    double discount = 0,
  }) async {
    final sale = await _isar.createSale(
      items: items,
      paymentMethod: paymentMethod,
      customer: customer,
      discount: discount,
    );
    await loadSales();
    return sale;
  }
}

final tramXangSalesProvider =
    StateNotifierProvider<TramXangSalesNotifier, List<TramXangSale>>((ref) {
  return TramXangSalesNotifier(ref.watch(tramXangIsarServiceProvider));
});

// ---------------------------------------------------------------------------
// Purchases
// ---------------------------------------------------------------------------
class TramXangPurchasesNotifier extends StateNotifier<List<TramXangPurchase>> {
  final TramXangIsarService _isar;
  bool _isLoading = false;

  TramXangPurchasesNotifier(this._isar) : super([]);

  Future<void> loadPurchases() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getPurchases();
    _isLoading = false;
  }

  Future<TramXangPurchase> importInventory({
    required TramXangProduct product,
    required double quantity,
    required double unitCost,
    required TramXangSupplier supplier,
    double taxRate = 10,
    String invoiceNo = '',
    String warehouseId = 'SHOP',
    TramXangTank? tank,
  }) async {
    final purchase = await _isar.importInventory(
      product: product,
      quantity: quantity,
      unitCost: unitCost,
      supplier: supplier,
      taxRate: taxRate,
      invoiceNo: invoiceNo,
      warehouseId: warehouseId,
      tank: tank,
    );
    await loadPurchases();
    return purchase;
  }
}

final tramXangPurchasesProvider =
    StateNotifierProvider<TramXangPurchasesNotifier, List<TramXangPurchase>>(
        (ref) {
  return TramXangPurchasesNotifier(ref.watch(tramXangIsarServiceProvider));
});

// ---------------------------------------------------------------------------
// Khác (tra cứu trực tiếp qua service trong UI)
// ---------------------------------------------------------------------------
final tramXangShiftTotalsProvider =
    FutureProvider.family<TramXangShiftTotals, String>((ref, shiftId) {
  return ref.watch(tramXangIsarServiceProvider).getShiftTotals(shiftId);
});

final tramXangSaleLinesProvider =
    FutureProvider.family<List<TramXangSaleLine>, String>((ref, saleId) {
  return ref.watch(tramXangIsarServiceProvider).getSaleLines(saleId: saleId);
});

final tramXangTankReconProvider =
    FutureProvider<List<TramXangTankRecon>>((ref) {
  return ref.watch(tramXangIsarServiceProvider).getTankReconciliation();
});

final tramXangInventoryTxProvider =
    FutureProvider<List<TramXangInventoryTransaction>>((ref) {
  return ref.watch(tramXangIsarServiceProvider).getInventoryTransactions();
});