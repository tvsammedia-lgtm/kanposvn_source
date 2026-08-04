import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/restaurant_providers.dart';
import '../providers/restaurant_inventory_providers.dart';
import '../models/restaurant_order.dart';

class RestaurantKitchenScreen extends ConsumerWidget {
  const RestaurantKitchenScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersAsync = ref.watch(restaurantOrdersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Màn Hình Bếp (KDS)'),
        backgroundColor: Colors.red[800],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Làm mới',
            onPressed: () {
              ref.read(restaurantOrdersProvider.notifier).loadOrders();
            },
          ),
          IconButton(
            icon: const Icon(Icons.bug_report),
            tooltip: 'Debug - Hiện tất cả',
            onPressed: () {
              _showDebugDialog(context, ref);
            },
          ),
          IconButton(
            icon: const Icon(Icons.build),
            tooltip: 'Fix - Reset món chờ nấu',
            onPressed: () {
              _fixPendingOrders(context, ref);
            },
          ),
        ],
      ),
      body: ordersAsync.when(
        data: (orders) {
          // Flatten all details that are PENDING or COOKING
          List<Map<String, dynamic>> kitchenItems = [];
          for (var order in orders) {
            if (order.status == RestaurantOrderStatus.SERVING) {
              for (int i = 0; i < order.details.length; i++) {
                final detail = order.details[i];
                if (detail.status != RestaurantOrderItemStatus.DONE) {
                  kitchenItems.add({
                    'order': order,
                    'detail': detail,
                    'index': i,
                  });
                }
              }
            }
          }

          if (kitchenItems.isEmpty) {
            return const Center(child: Text('Không có món nào đang chờ nấu.', style: TextStyle(fontSize: 18, color: Colors.grey)));
          }
          
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2,
            ),
            itemCount: kitchenItems.length,
            itemBuilder: (context, index) {
              final item = kitchenItems[index];
              final RestaurantOrder order = item['order'];
              final RestaurantOrderDetail detail = item['detail'];
              final int detailIndex = item['index'];
              final isCooking = detail.status == RestaurantOrderItemStatus.COOKING;
              
              return Card(
                color: isCooking ? Colors.orange[50] : Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: isCooking ? Colors.orange : Colors.grey[300]!, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(order.table.value?.name ?? 'Unknown', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                          ),
                          Text(order.createdAt != null ? order.createdAt.toString().substring(11, 16) : '--:--', style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(detail.itemName, textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('x${detail.quantity}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red)),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isCooking ? Colors.green : Colors.orange,
                          ),
                          onPressed: () {
                            final newStatus = isCooking ? RestaurantOrderItemStatus.DONE : RestaurantOrderItemStatus.COOKING;
                            ref.read(restaurantKitchenProvider.notifier).updateItemStatus(order, detailIndex, newStatus);
                          },
                          child: Text(isCooking ? 'XONG (TRỪ KHO)' : 'BẮT ĐẦU NẤU', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }

  void _showDebugDialog(BuildContext context, WidgetRef ref) {
    final ordersAsync = ref.read(restaurantOrdersProvider);
    if (ordersAsync is AsyncData) {
      final orders = ordersAsync.value ?? [];
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Debug - Tất cả Orders'),
          content: SizedBox(
            width: double.maxFinite,
            height: 400,
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Order ID: ${order.orderId}'),
                        Text('Status: ${order.status.label}'),
                        Text('Table: ${order.table.value?.name ?? "N/A"}'),
                        Text('Table ID: ${order.table.value?.id}'),
                        Text('Details count: ${order.details.length}'),
                        const SizedBox(height: 4),
                        ...order.details.map((detail) => Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('  - ${detail.itemName} x${detail.quantity} (${detail.status.label})'),
                        )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Đóng'),
            ),
          ],
        ),
      );
    }
  }

  void _fixPendingOrders(BuildContext context, WidgetRef ref) async {
    final ordersAsync = ref.read(restaurantOrdersProvider);
    if (ordersAsync is AsyncData) {
      final orders = ordersAsync.value ?? [];
      int fixedCount = 0;

      for (var order in orders) {
        if (order.status == RestaurantOrderStatus.SERVING && order.details.isNotEmpty) {
          bool needsFix = false;
          for (var detail in order.details) {
            if (detail.status == RestaurantOrderItemStatus.DONE) {
              detail.status = RestaurantOrderItemStatus.PENDING;
              needsFix = true;
            }
          }
          if (needsFix) {
            await ref.read(restaurantOrdersProvider.notifier).updateOrder(order);
            fixedCount++;
          }
        }
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Đã reset $fixedCount orders về trạng thái chờ nấu'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }
}
