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
}
