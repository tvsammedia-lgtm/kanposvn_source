import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/pawn_repair_order.dart';
import '../services/pawn_isar_service.dart';
import 'isar_provider.dart';

final repairOrderProvider = StateNotifierProvider<RepairOrderNotifier, AsyncValue<List<PawnRepairOrder>>>((ref) {
  final isarService = ref.watch(pawnIsarServiceProvider);
  return RepairOrderNotifier(isarService);
});

class RepairOrderNotifier extends StateNotifier<AsyncValue<List<PawnRepairOrder>>> {
  final PawnIsarService _isarService;

  RepairOrderNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadOrders();
  }

  Future<void> loadOrders() async {
    try {
      state = const AsyncValue.loading();
      final isar = await _isarService.db;
      final orders = await isar.pawnRepairOrders.where().findAll();
      for (final o in orders) {
        await o.customer.load();
      }
      state = AsyncValue.data(orders);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addOrder(PawnRepairOrder order) async {
    try {
      final isar = await _isarService.db;
      await isar.writeTxn(() async {
        await isar.pawnRepairOrders.put(order);
        await order.customer.save();
      });
      await loadOrders();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateOrderStatus(Id orderId, RepairStatus newStatus) async {
    try {
      final isar = await _isarService.db;
      await isar.writeTxn(() async {
        final order = await isar.pawnRepairOrders.get(orderId);
        if (order != null) {
          order.status = newStatus;
          order.updatedAt = DateTime.now();
          if (newStatus == RepairStatus.completed) order.completedDate = DateTime.now();
          if (newStatus == RepairStatus.delivered) order.deliveredDate = DateTime.now();
          await isar.pawnRepairOrders.put(order);
        }
      });
      await loadOrders();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
