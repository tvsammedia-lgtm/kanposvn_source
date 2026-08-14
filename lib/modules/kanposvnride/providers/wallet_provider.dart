import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../models/ride_transaction.dart';
import '../models/ride_user.dart';
import 'ride_isar_provider.dart';

final walletProvider = StateNotifierProvider<WalletNotifier, AsyncValue<List<RideTransaction>>>((ref) {
  final isar = ref.watch(rideIsarProvider);
  return WalletNotifier(isar);
});

class WalletNotifier extends StateNotifier<AsyncValue<List<RideTransaction>>> {
  final Isar isar;
  final uuid = const Uuid();
  final String currentUserUuid = 'PASSENGER-001'; // Giả lập user đăng nhập hiện tại

  WalletNotifier(this.isar) : super(const AsyncValue.loading()) {
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    try {
      state = const AsyncValue.loading();
      final txs = await isar.rideTransactions
          .where()
          .userUuidEqualTo(currentUserUuid)
          .sortByCreatedAtDesc()
          .findAll();
      state = AsyncValue.data(txs);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<double> getBalance() async {
    final user = await isar.rideUsers.where().uuidEqualTo(currentUserUuid).findFirst();
    return user?.walletBalance ?? 0.0;
  }

  Future<void> topUp(double amount) async {
    try {
      final tx = RideTransaction()
        ..uuid = uuid.v4()
        ..userUuid = currentUserUuid
        ..amount = amount
        ..type = TransactionType.topup
        ..description = 'Nạp tiền vào ví'
        ..createdAt = DateTime.now()
        ..syncStatus = TransactionSyncStatus.pending;

      await isar.writeTxn(() async {
        // 1. Lưu transaction
        await isar.rideTransactions.put(tx);
        
        // 2. Cập nhật số dư User
        var user = await isar.rideUsers.where().uuidEqualTo(currentUserUuid).findFirst();
        user ??= RideUser()
            ..uuid = currentUserUuid
            ..fullName = 'Khách hàng A'
            ..walletBalance = 0;
        user.walletBalance += amount;
        await isar.rideUsers.put(user);
      });
      await loadTransactions();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<bool> payForRide(double amount, String bookingUuid) async {
    final balance = await getBalance();
    if (balance < amount) return false; // Không đủ tiền

    try {
      final tx = RideTransaction()
        ..uuid = uuid.v4()
        ..userUuid = currentUserUuid
        ..amount = -amount // Số âm vì là thanh toán
        ..type = TransactionType.payment
        ..description = 'Thanh toán chuyến đi $bookingUuid'
        ..createdAt = DateTime.now()
        ..syncStatus = TransactionSyncStatus.pending;

      await isar.writeTxn(() async {
        await isar.rideTransactions.put(tx);
        final user = await isar.rideUsers.where().uuidEqualTo(currentUserUuid).findFirst();
        if (user != null) {
          user.walletBalance -= amount;
          await isar.rideUsers.put(user);
        }
      });
      await loadTransactions();
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}
