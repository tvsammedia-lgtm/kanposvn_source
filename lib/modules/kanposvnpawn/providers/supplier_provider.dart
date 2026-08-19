import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/supplier.dart';
import '../services/pawn_isar_service.dart';
import 'isar_provider.dart';

final supplierProvider = StateNotifierProvider<SupplierNotifier, AsyncValue<List<Supplier>>>((ref) {
  final isarService = ref.watch(pawnIsarServiceProvider);
  return SupplierNotifier(isarService);
});

class SupplierNotifier extends StateNotifier<AsyncValue<List<Supplier>>> {
  final PawnIsarService _isarService;

  SupplierNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadSuppliers();
  }

  Future<void> loadSuppliers() async {
    try {
      state = const AsyncValue.loading();
      final isar = await _isarService.db;
      final suppliers = await isar.suppliers.where().findAll();
      state = AsyncValue.data(suppliers);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addSupplier(Supplier supplier) async {
    try {
      final isar = await _isarService.db;
      await isar.writeTxn(() async {
        await isar.suppliers.put(supplier);
      });
      await loadSuppliers();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
