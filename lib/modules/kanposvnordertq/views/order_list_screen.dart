import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/order_provider.dart';
import 'order_detail_screen.dart';

class OrderListScreen extends ConsumerWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderListAsync = ref.watch(orderListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách Đơn Hàng'),
      ),
      body: orderListAsync.when(
        data: (orders) {
          if (orders.isEmpty) {
            return const Center(child: Text('Chưa có đơn hàng nào trong hệ thống Local (Isar).'));
          }
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 3,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: CircleAvatar(
                    backgroundColor: _getStatusColor(order.status ?? ''),
                    child: const Icon(Icons.receipt, color: Colors.white),
                  ),
                  title: Text('Mã ĐH: ${order.id}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text('Khách: ${order.customerId}'),
                      Text('Ngày tạo: ${order.createdAt.toString().substring(0, 16)}'),
                    ],
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${(order.totalAmount ?? 0).toStringAsFixed(0)} đ', 
                        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(order.status ?? '', style: TextStyle(color: _getStatusColor(order.status ?? ''), fontWeight: FontWeight.w500)),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderDetailScreen(orderId: order.orderId),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Lỗi: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Chức năng tạo đơn Offline có thể làm sau
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Chức năng tạo đơn Offline')));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toUpperCase()) {
      case 'DRAFT': return Colors.grey;
      case 'ON_TRUCK': return Colors.blue;
      case 'DELIVERED': return Colors.green;
      case 'CANCELLED': return Colors.red;
      default: return Colors.orange;
    }
  }
}
