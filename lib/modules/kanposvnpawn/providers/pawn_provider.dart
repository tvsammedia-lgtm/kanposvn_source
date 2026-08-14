import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/pawn_contract.dart';
import '../models/customer.dart';
import '../services/pawn_isar_service.dart';
import 'isar_provider.dart';

final pawnProvider = StateNotifierProvider<PawnNotifier, AsyncValue<List<PawnContract>>>((ref) {
  final isarService = ref.watch(pawnIsarServiceProvider);
  return PawnNotifier(isarService);
});

class PawnNotifier extends StateNotifier<AsyncValue<List<PawnContract>>> {
  final PawnIsarService _isarService;

  PawnNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadContracts();
  }

  Future<Isar> get _db => _isarService.db;

  Future<void> loadContracts() async {
    try {
      state = const AsyncValue.loading();
      final isar = await _db;
      final contracts = await isar.pawnContracts.where().findAll();
      state = AsyncValue.data(contracts);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addContract(PawnContract contract, Customer customer) async {
    try {
      final isar = await _db;
      await isar.writeTxn(() async {
        await isar.customers.put(customer);
        contract.customer.value = customer;
        await isar.pawnContracts.put(contract);
        await contract.customer.save();
      });
      await loadContracts();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateContractStatus(Id contractId, PawnStatus newStatus) async {
    try {
      final isar = await _db;
      await isar.writeTxn(() async {
        final contract = await isar.pawnContracts.get(contractId);
        if (contract != null) {
          contract.status = newStatus;
          contract.updatedAt = DateTime.now();
          await isar.pawnContracts.put(contract);
        }
      });
      await loadContracts();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
