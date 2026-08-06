import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/crm_isar_service.dart';
import '../models/customer.dart';
import '../models/ticket.dart';
import '../models/license.dart';

final crmIsarServiceProvider = Provider<CrmIsarService>((ref) {
  return CrmIsarService();
});

class CrmCustomersNotifier extends StateNotifier<List<CrmCustomer>> {
  final CrmIsarService _isar;
  bool _isLoading = false;

  CrmCustomersNotifier(this._isar) : super([]) {
    loadCustomers();
  }

  Future<void> loadCustomers() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getCustomers();
    _isLoading = false;
  }

  Future<void> saveCustomer(CrmCustomer customer) async {
    await _isar.saveCustomer(customer);
    await loadCustomers();
  }
}

final crmCustomersProvider = StateNotifierProvider<CrmCustomersNotifier, List<CrmCustomer>>((ref) {
  return CrmCustomersNotifier(ref.watch(crmIsarServiceProvider));
});

class CrmTicketsNotifier extends StateNotifier<List<CrmTicket>> {
  final CrmIsarService _isar;

  CrmTicketsNotifier(this._isar) : super([]) {
    loadTickets();
  }

  Future<void> loadTickets() async {
    state = await _isar.getTickets();
  }
}

final crmTicketsProvider = StateNotifierProvider<CrmTicketsNotifier, List<CrmTicket>>((ref) {
  return CrmTicketsNotifier(ref.watch(crmIsarServiceProvider));
});

class CrmLicensesNotifier extends StateNotifier<List<CrmLicense>> {
  final CrmIsarService _isar;

  CrmLicensesNotifier(this._isar) : super([]) {
    loadLicenses();
  }

  Future<void> loadLicenses() async {
    state = await _isar.getLicenses();
  }
}

final crmLicensesProvider = StateNotifierProvider<CrmLicensesNotifier, List<CrmLicense>>((ref) {
  return CrmLicensesNotifier(ref.watch(crmIsarServiceProvider));
});
