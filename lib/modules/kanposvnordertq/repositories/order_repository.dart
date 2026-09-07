import '../models/order_local.dart';

abstract class OrderRepository {
  Future<void> createOrder(OrderLocal order);
  Future<void> updateOrder(OrderLocal order);
  Future<OrderLocal?> getOrder(String orderId);
  Future<List<OrderLocal>> getOrders();
  Future<void> changeStatus(String orderId, String newStatus);
  Future<void> syncOrders();
}
