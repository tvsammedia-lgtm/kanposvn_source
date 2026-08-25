import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../models/bida_partner.dart';
import '../models/bida_reservation.dart';
import '../models/bida_finance.dart';
import '../services/bida_isar_service.dart';
import 'bida_providers.dart';

// ══════════════ KHÁCH HÀNG ══════════════

class BidaCustomersNotifier extends StateNotifier<AsyncValue<List<BidaCustomer>>> {
  final BidaIsarService _isarService;
  BidaCustomersNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadCustomers();
  }

  Future<void> loadCustomers() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.bidaCustomers.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addCustomer({
    required String name,
    required String phone,
    bool isMember = false,
  }) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.bidaCustomers.put(BidaCustomer()
        ..customerId = const Uuid().v4()
        ..name = name
        ..phone = phone
        ..isMember = isMember);
    });
    await loadCustomers();
  }

  Future<void> updateCustomer(BidaCustomer c, {
    String? name,
    String? phone,
    bool? isMember,
    double? debtBalance,
  }) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      if (name != null) c.name = name;
      if (phone != null) c.phone = phone;
      if (isMember != null) c.isMember = isMember;
      if (debtBalance != null) c.debtBalance = debtBalance;
      c.updatedAt = DateTime.now();
      await db.bidaCustomers.put(c);
    });
    await loadCustomers();
  }

  Future<void> deleteCustomer(BidaCustomer c) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.bidaCustomers.delete(c.id);
    });
    await loadCustomers();
  }
}
final bidaCustomersProvider = StateNotifierProvider<BidaCustomersNotifier, AsyncValue<List<BidaCustomer>>>((ref) {
  return BidaCustomersNotifier(ref.watch(bidaIsarServiceProvider));
});

// ══════════════ ĐẶT BÀN ══════════════

class BidaReservationsNotifier extends StateNotifier<AsyncValue<List<BidaReservation>>> {
  final BidaIsarService _isarService;
  BidaReservationsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadReservations();
  }

  Future<void> loadReservations() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.bidaReservations.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addReservation({
    required String customerName,
    required String customerPhone,
    required int guestCount,
    String? tableId,
    String? tableType,
    DateTime? expectedArrival,
    double deposit = 0,
    String note = '',
  }) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.bidaReservations.put(BidaReservation()
        ..reservationId = const Uuid().v4()
        ..customerName = customerName
        ..customerPhone = customerPhone
        ..guestCount = guestCount
        ..tableId = tableId
        ..tableType = tableType
        ..expectedArrival = expectedArrival
        ..deposit = deposit
        ..note = note);
    });
    await loadReservations();
  }

  Future<void> cancelReservation(BidaReservation r) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      r.status = BidaReservationStatus.CANCELLED;
      r.updatedAt = DateTime.now();
      await db.bidaReservations.put(r);
    });
    await loadReservations();
  }

  Future<void> checkInReservation(BidaReservation r) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      r.status = BidaReservationStatus.CHECKED_IN;
      r.updatedAt = DateTime.now();
      await db.bidaReservations.put(r);
    });
    await loadReservations();
  }
}
final bidaReservationsProvider = StateNotifierProvider<BidaReservationsNotifier, AsyncValue<List<BidaReservation>>>((ref) {
  return BidaReservationsNotifier(ref.watch(bidaIsarServiceProvider));
});

// ══════════════ PHIẾU THU / CHI ══════════════

class BidaFinanceNotifier extends StateNotifier<AsyncValue<List<BidaFinanceTx>>> {
  final BidaIsarService _isarService;
  BidaFinanceNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.bidaFinanceTxs.where().sortByCreatedAtDesc().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addTx({
    required bool isIncome,
    required double amount,
    required String category,
    String note = '',
  }) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.bidaFinanceTxs.put(BidaFinanceTx()
        ..financeId = 'tx_${DateTime.now().millisecondsSinceEpoch}'
        ..isIncome = isIncome
        ..amount = amount
        ..incomeCategory = isIncome ? category : ''
        ..expenseCategory = isIncome ? '' : category
        ..note = note);
    });
    await loadTransactions();
  }
}
final bidaFinanceProvider = StateNotifierProvider<BidaFinanceNotifier, AsyncValue<List<BidaFinanceTx>>>((ref) {
  return BidaFinanceNotifier(ref.watch(bidaIsarServiceProvider));
});

// ══════════════ NHÀ CUNG CẤP ══════════════

class BidaSuppliersNotifier extends StateNotifier<AsyncValue<List<BidaSupplier>>> {
  final BidaIsarService _isarService;
  BidaSuppliersNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadSuppliers();
  }

  Future<void> loadSuppliers() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.bidaSuppliers.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final bidaSuppliersProvider = StateNotifierProvider<BidaSuppliersNotifier, AsyncValue<List<BidaSupplier>>>((ref) {
  return BidaSuppliersNotifier(ref.watch(bidaIsarServiceProvider));
});
