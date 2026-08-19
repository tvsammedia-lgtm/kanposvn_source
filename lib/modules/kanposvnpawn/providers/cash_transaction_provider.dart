import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/pawn_cash_transaction.dart';
import '../services/pawn_isar_service.dart';
import 'isar_provider.dart';

final cashTransactionProvider = StateNotifierProvider<CashTransactionNotifier, AsyncValue<List<PawnCashTransaction>>>((ref) {
  final isarService = ref.watch(pawnIsarServiceProvider);
  return CashTransactionNotifier(isarService);
});

class CashTransactionNotifier extends StateNotifier<AsyncValue<List<PawnCashTransaction>>> {
  final PawnIsarService _isarService;

  CashTransactionNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    try {
      state = const AsyncValue.loading();
      final isar = await _isarService.db;
      final txns = await isar.pawnCashTransactions.where().sortByCreatedAtDesc().findAll();
      state = AsyncValue.data(txns);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addTransaction(PawnCashTransaction txn) async {
    try {
      final isar = await _isarService.db;
      await isar.writeTxn(() async {
        await isar.pawnCashTransactions.put(txn);
      });
      await loadTransactions();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
