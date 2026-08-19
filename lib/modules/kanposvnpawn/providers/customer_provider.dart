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

  Future<void> loadCustomers() async {
    try {
      state = const AsyncValue.loading();
      final isar = await _isarService.db;
      final customers = await isar.customers.where().findAll();
      state = AsyncValue.data(customers);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addCustomer(Customer customer) async {
    try {
      final isar = await _isarService.db;
      await isar.writeTxn(() async {
        await isar.customers.put(customer);
      });
      await loadCustomers();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateCustomerDebt(Id customerId, double amount) async {
    try {
      final isar = await _isarService.db;
      await isar.writeTxn(() async {
        final customer = await isar.customers.get(customerId);
        if (customer != null) {
          customer.debtAmount = (customer.debtAmount ?? 0) + amount;
          customer.updatedAt = DateTime.now();
          await isar.customers.put(customer);
        }
      });
      await loadCustomers();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
