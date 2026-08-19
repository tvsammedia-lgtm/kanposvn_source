import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/restaurant_providers.dart';
import '../../../core/widgets/owner_info_bar.dart';

class RestaurantDashboardScreen extends ConsumerWidget {
  const RestaurantDashboardScreen({super.key});

  Widget _buildMetricCard(String title, String value, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 16, color: Colors.grey[700], fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(value, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(restaurantDashboardProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Báo Cáo Doanh Thu Nhà Hàng')),
      body: dashboardAsync.when(
        data: (metrics) {
          final revenue = metrics['revenue'] ?? 0.0;
          final completed = metrics['completedOrders'] ?? 0;

          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OwnerInfoBar(),
                const SizedBox(height: 12),
                const Text('TỔNG QUAN HÔM NAY', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange)),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(child: _buildMetricCard('Tổng Doanh Thu', '${revenue.toStringAsFixed(0)} đ', Colors.orange)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildMetricCard('Số Bàn Đã Thanh Toán', '$completed bàn', Colors.green)),
                  ],
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }
}
