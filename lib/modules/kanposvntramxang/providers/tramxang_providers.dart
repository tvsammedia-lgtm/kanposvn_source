import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/core.dart';
import '../models/product.dart';
import '../models/tank.dart';
import '../models/sale.dart';
import '../services/tramxang_isar_service.dart';

final tramXangIsarServiceProvider = Provider<TramXangIsarService>((ref) {
  return TramXangIsarService();
});

// --- Products Provider ---
class TramXangProductsNotifier extends StateNotifier<List<TramXangProduct>> {
  final TramXangIsarService _isar;
  bool _isLoading = false;

  TramXangProductsNotifier(this._isar) : super([]) {
    loadProducts();
  }

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

final tramXangProductsProvider = StateNotifierProvider<TramXangProductsNotifier, List<TramXangProduct>>((ref) {
  return TramXangProductsNotifier(ref.watch(tramXangIsarServiceProvider));
});

// --- Tanks Provider ---
class TramXangTanksNotifier extends StateNotifier<List<TramXangTank>> {
  final TramXangIsarService _isar;
  bool _isLoading = false;

  TramXangTanksNotifier(this._isar) : super([]) {
    loadTanks();
  }

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

final tramXangTanksProvider = StateNotifierProvider<TramXangTanksNotifier, List<TramXangTank>>((ref) {
  return TramXangTanksNotifier(ref.watch(tramXangIsarServiceProvider));
});

// --- Pumps Provider ---
class TramXangPumpsNotifier extends StateNotifier<List<TramXangPump>> {
  final TramXangIsarService _isar;
  bool _isLoading = false;

  TramXangPumpsNotifier(this._isar) : super([]) {
    loadPumps();
  }

  Future<void> loadPumps() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getPumps();
    _isLoading = false;
  }
}

final tramXangPumpsProvider = StateNotifierProvider<TramXangPumpsNotifier, List<TramXangPump>>((ref) {
  return TramXangPumpsNotifier(ref.watch(tramXangIsarServiceProvider));
});

// --- Shift Provider ---
class TramXangShiftNotifier extends StateNotifier<TramXangShift?> {
  final TramXangIsarService _isar;
  bool _isLoading = false;

  TramXangShiftNotifier(this._isar) : super(null) {
    loadActiveShift();
  }

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
  
  Future<void> closeShift(TramXangShift shift) async {
    shift.status = 'CLOSED';
    shift.closedAt = DateTime.now();
    await _isar.saveShift(shift);
    await loadActiveShift();
  }
}

final tramXangActiveShiftProvider = StateNotifierProvider<TramXangShiftNotifier, TramXangShift?>((ref) {
  return TramXangShiftNotifier(ref.watch(tramXangIsarServiceProvider));
});

// --- Sales Provider ---
class TramXangSalesNotifier extends StateNotifier<List<TramXangSale>> {
  final TramXangIsarService _isar;
  bool _isLoading = false;

  TramXangSalesNotifier(this._isar) : super([]) {
    loadSales();
  }

  Future<void> loadSales() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getSales();
    _isLoading = false;
  }

  Future<void> saveSale(TramXangSale sale, List<TramXangSaleLine> lines) async {
    await _isar.saveSale(sale, lines);
    await loadSales();
  }
}

final tramXangSalesProvider = StateNotifierProvider<TramXangSalesNotifier, List<TramXangSale>>((ref) {
  return TramXangSalesNotifier(ref.watch(tramXangIsarServiceProvider));
});
