import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/app_providers.dart';
import '../models/isar_models.dart';

class TakeawayDeliveryScreen extends ConsumerWidget {
  const TakeawayDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
    final db = ref.watch(dbProvider);

    final takeawayList = db.orders.where((o) => o.type == OrderType.takeaway).toList();
    final deliveryList = db.orders.where((o) => o.type == OrderType.delivery).toList();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F6F0),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text('Quản Lý Đơn Mang Đi & Giao Hàng', style: TextStyle(color: Color(0xFF4A2C2A), fontWeight: FontWeight.bold)),
          bottom: const TabBar(
            labelColor: Color(0xFF4A2C2A),
            indicatorColor: Color(0xFF4A2C2A),
            tabs: [
              Tab(icon: Icon(Icons.shopping_bag), text: 'Mang Đi (Take Away)'),
              Tab(icon: Icon(Icons.two_wheeler), text: 'Giao Hàng (Delivery App)'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Takeaway list
            _buildOrderList(context, takeawayList, currency, isDelivery: false),

            // Tab 2: Delivery list
            _buildOrderList(context, deliveryList, currency, isDelivery: true),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList(BuildContext context, List<OrderModel> orders, NumberFormat currency, {required bool isDelivery}) {
    if (orders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(isDelivery ? Icons.two_wheeler : Icons.shopping_bag_outlined, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 12),
            Text(
              isDelivery ? 'Chưa có đơn hàng giao App nào!' : 'Chưa có đơn hàng mang đi nào!',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (ctx, i) {
        final order = orders[i];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            contentPadding: const EdgeInsets.all(14),
            leading: CircleAvatar(
              backgroundColor: isDelivery ? Colors.purple.shade100 : Colors.amber.shade100,
              child: Icon(
                isDelivery ? Icons.delivery_dining : Icons.takeout_dining,
                color: isDelivery ? Colors.purple : Colors.brown,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${order.orderCode} • ${order.customerName ?? "Khách lẻ"}', style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(currency.format(order.totalAmount), style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2E7D32))),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text('Món: ${order.items.map((it) => "${it.quantity}x ${it.productName}").join(", ")}'),
                if (isDelivery && order.deliveryPartner != null)
                  Text('Đơn vị giao: ${order.deliveryPartner} | Phí ship: ${currency.format(order.deliveryFee)}', style: const TextStyle(color: Colors.deepOrange)),
                Text('Thanh toán: ${order.paymentMethod} (${order.paymentStatus})', style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
        );
      },
    );
  }
}
