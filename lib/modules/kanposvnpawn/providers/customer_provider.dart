import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/customer.dart';
import '../services/pawn_isar_service.dart';
import 'isar_provider.dart';

final customerProvider = StateNotifierProvider<CustomerNotifier, AsyncValue<List<Customer>>>((ref) {
  final isarService = ref.watch(pawnIsarServiceProvider);
  return CustomerNotifier(isarService);
});

class CustomerNotifier extends StateNotifier<AsyncValue<List<Customer>>> {
  final PawnIsarService _isarService;

  CustomerNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadCustomers();
  }

  Future<Isar> get _db => _isarService.db;

  Future<void> loadCustomers() async {
    try {
      state = const AsyncValue.loading();
      final isar = await _db;
      final customers = await isar.customers.where().findAll();
      state = AsyncValue.data(customers);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addCustomer(Customer customer) async {
    try {
      final isar = await _db;
      await isar.writeTxn(() async {
        await isar.customers.put(customer);
      });
      await loadCustomers();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
