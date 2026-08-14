import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/customer.dart';
import 'xeom_isar_provider.dart';
import 'package:uuid/uuid.dart';

final xeOmCustomerProvider = StateNotifierProvider<XeOmCustomerNotifier, AsyncValue<List<XeOmCustomer>>>((ref) {
  final isar = ref.watch(xeOmIsarProvider);
  return XeOmCustomerNotifier(isar);
});

class XeOmCustomerNotifier extends StateNotifier<AsyncValue<List<XeOmCustomer>>> {
  final Isar isar;
  final uuid = const Uuid();

  XeOmCustomerNotifier(this.isar) : super(const AsyncValue.loading()) {
    loadCustomers();
  }

  Future<void> loadCustomers() async {
    try {
      state = const AsyncValue.loading();
      final customers = await isar.xeOmCustomers.where().findAll();
      state = AsyncValue.data(customers);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addCustomer(XeOmCustomer customer) async {
    try {
      if (customer.uuid == null || customer.uuid!.isEmpty) {
        customer.uuid = uuid.v4();
      }
      customer.createdAt = DateTime.now();
      customer.updatedAt = DateTime.now();
      
      await isar.writeTxn(() async {
        await isar.xeOmCustomers.put(customer);
      });
      await loadCustomers();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
