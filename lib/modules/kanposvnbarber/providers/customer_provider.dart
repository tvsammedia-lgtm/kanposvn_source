import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/barber_customer.dart';
import 'barber_service_provider.dart';

class CustomerNotifier extends StateNotifier<AsyncValue<List<BarberCustomer>>> {
  final Ref ref;

  CustomerNotifier(this.ref) : super(const AsyncValue.loading()) {
    loadCustomers();
  }

  Future<void> loadCustomers() async {
    try {
      state = const AsyncValue.loading();
      final dbService = await ref.read(barberDbServiceProvider.future);
      final customers = await dbService.getCustomers();
      state = AsyncValue.data(customers);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addCustomer(BarberCustomer customer) async {
    try {
      final dbService = await ref.read(barberDbServiceProvider.future);
      await dbService.saveCustomer(customer);
      await loadCustomers();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final customerProvider = StateNotifierProvider<CustomerNotifier, AsyncValue<List<BarberCustomer>>>((ref) {
  return CustomerNotifier(ref);
});
