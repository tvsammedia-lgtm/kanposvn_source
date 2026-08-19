import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/pawn_contract.dart';
import '../models/customer.dart';
import '../models/pawn_cash_transaction.dart';
import '../services/pawn_isar_service.dart';
import '../services/pawn_interest_calculator.dart';
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
      for (final c in contracts) {
        await c.customer.load();
      }
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

  /// Thu lãi: cập nhật paidInterest và lastInterestCollectionDate.
  Future<void> collectInterest(Id contractId, double amount) async {
    try {
      final isar = await _db;
      await isar.writeTxn(() async {
        final contract = await isar.pawnContracts.get(contractId);
        if (contract != null) {
          contract.paidInterest = (contract.paidInterest ?? 0) + amount;
          contract.totalInterestCollected = (contract.totalInterestCollected ?? 0) + amount;
          contract.lastInterestCollectionDate = DateTime.now();
          contract.updatedAt = DateTime.now();
          await isar.pawnContracts.put(contract);
        }
      });

      // Tạo phiếu thu lãi trong sổ quỹ
      final contract = await (await _db).pawnContracts.get(contractId);
      if (contract != null) {
        await _db.then((isar) async {
          await isar.writeTxn(() async {
            final tx = PawnCashTransaction()
              ..documentCode = 'TL-${DateTime.now().millisecondsSinceEpoch}'
              ..type = TransactionType.income
              ..amount = amount
              ..category = 'Thu lãi cầm đồ'
              ..description = 'Thu lãi HĐ ${contract.contractNumber}'
              ..createdBy = 'Chủ cửa hàng'
              ..createdAt = DateTime.now();
            await isar.pawnCashTransactions.put(tx);
          });
        });
      }
      await loadContracts();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Gia hạn: cộng thêm tháng, cập nhật dueDate, tăng renewalCount.
  Future<void> extendContract(Id contractId, int months) async {
    try {
      final isar = await _db;
      await isar.writeTxn(() async {
        final contract = await isar.pawnContracts.get(contractId);
        if (contract != null) {
          final currentDue = contract.dueDate ?? DateTime.now();
          contract.dueDate = PawnInterestCalculator.extendDueDate(currentDue, months);
          contract.renewalCount = (contract.renewalCount ?? 0) + 1;
          contract.status = PawnStatus.active;
          contract.updatedAt = DateTime.now();
          await isar.pawnContracts.put(contract);
        }
      });
      await loadContracts();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Chuộc: tất toán — thu đủ gốc + lãi, đánh dấu redeemed.
  Future<void> redeemContract(Id contractId, double paidAmount) async {
    try {
      final isar = await _db;
      await isar.writeTxn(() async {
        final contract = await isar.pawnContracts.get(contractId);
        if (contract != null) {
          contract.paidInterest = contract.totalInterest;
          contract.status = PawnStatus.redeemed;
          contract.updatedAt = DateTime.now();
          await isar.pawnContracts.put(contract);

          // Tạo phiếu thu chuộc
          final tx = PawnCashTransaction()
            ..documentCode = 'TC-${DateTime.now().millisecondsSinceEpoch}'
            ..type = TransactionType.income
            ..amount = paidAmount
            ..category = 'Thu lãi cầm đồ'
            ..description = 'Thu chuộc HĐ ${contract.contractNumber}'
            ..createdBy = 'Chủ cửa hàng'
            ..createdAt = DateTime.now();
          await isar.pawnCashTransactions.put(tx);
        }
      });
      await loadContracts();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Thanh lý: bán thanh lý tài sản, đánh dấu liquidated.
  Future<void> liquidateContract(Id contractId, double sellPrice) async {
    try {
      final isar = await _db;
      await isar.writeTxn(() async {
        final contract = await isar.pawnContracts.get(contractId);
        if (contract != null) {
          contract.status = PawnStatus.liquidated;
          contract.updatedAt = DateTime.now();
          await isar.pawnContracts.put(contract);

          // Ghi nhận doanh thu thanh lý
          final tx = PawnCashTransaction()
            ..documentCode = 'TL-${DateTime.now().millisecondsSinceEpoch}'
            ..type = TransactionType.income
            ..amount = sellPrice
            ..category = 'Bán hàng'
            ..description = 'Thanh lý HĐ ${contract.contractNumber} - ${contract.description}'
            ..createdBy = 'Chủ cửa hàng'
            ..createdAt = DateTime.now();
          await isar.pawnCashTransactions.put(tx);
        }
      });
      await loadContracts();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
