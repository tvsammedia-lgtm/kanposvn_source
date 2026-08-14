import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/payment.dart';
import 'xeom_isar_provider.dart';
import 'package:uuid/uuid.dart';

final xeOmPaymentProvider = StateNotifierProvider<XeOmPaymentNotifier, AsyncValue<List<XeOmPayment>>>((ref) {
  final isar = ref.watch(xeOmIsarProvider);
  return XeOmPaymentNotifier(isar);
});

class XeOmPaymentNotifier extends StateNotifier<AsyncValue<List<XeOmPayment>>> {
  final Isar isar;
  final uuid = const Uuid();

  XeOmPaymentNotifier(this.isar) : super(const AsyncValue.loading()) {
    loadPayments();
  }

  Future<void> loadPayments() async {
    try {
      state = const AsyncValue.loading();
      final payments = await isar.xeOmPayments.where().findAll();
      state = AsyncValue.data(payments);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> processPayment(XeOmPayment payment) async {
    try {
      if (payment.uuid == null || payment.uuid!.isEmpty) {
        payment.uuid = uuid.v4();
      }
      payment.createdAt = DateTime.now();
      payment.updatedAt = DateTime.now();
      payment.paidAt = DateTime.now();
      payment.status = PaymentStatus.completed;
      
      // Hoa hồng cố định 20%
      if (payment.amount != null) {
        payment.driverCommission = payment.amount! * 0.2;
      }
      
      await isar.writeTxn(() async {
        await isar.xeOmPayments.put(payment);
      });
      await loadPayments();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
