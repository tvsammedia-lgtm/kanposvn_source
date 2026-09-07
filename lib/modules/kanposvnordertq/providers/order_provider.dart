import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/order_local.dart';
import '../models/order_item_local.dart';
import '../repositories/order_repository.dart';
import '../services/order_tq_isar_service.dart';

final orderBucketServiceProvider = Provider<OrderTQIsarService>((ref) {
  throw UnimplementedError('OrderTQIsarService must be overridden in tests or initialized at startup');
});

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  final service = ref.watch(orderBucketServiceProvider);
  return IsarOrderRepository(service);
});

/// Repository triển khai dựa trên OrderTQIsarService.
class IsarOrderRepository implements OrderRepository {
  final OrderTQIsarService _service;

  IsarOrderRepository(this._service);

  @override
  Future<void> createOrder(OrderLocal order) async {
    final isar = await _service.db;
    await isar.writeTxn(() async => await isar.orderLocals.put(order));
  }

  @override
  Future<void> updateOrder(OrderLocal order) async {
    final isar = await _service.db;
    order.updatedAt = DateTime.now();
    order.syncedAt = null;
    await isar.writeTxn(() async => await isar.orderLocals.put(order));
  }

  @override
  Future<OrderLocal?> getOrder(String orderId) => _service.getOrder(orderId);

  @override
  Future<List<OrderLocal>> getOrders() => _service.getOrders();

  @override
  Future<void> changeStatus(String orderId, String newStatus) async {
    await _service.changeOrderStatus(orderId, newStatus, userId: 'admin', role: 'ADMIN');
  }

  @override
  Future<void> syncOrders() async {
    await _service.pushSyncTasks();
  }
}

final orderDetailProvider = FutureProvider.family<({OrderLocal? order, List<OrderItemLocal> items}), String>((ref, orderId) async {
  final service = ref.watch(orderBucketServiceProvider);
  final order = await service.getOrder(orderId);
  if (order == null) return (order: null, items: <OrderItemLocal>[]);
  final items = await service.getOrderItems(orderId);
  return (order: order, items: items);
});