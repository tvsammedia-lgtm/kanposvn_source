import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/bida_providers.dart';

class BidaDashboardScreen extends ConsumerWidget {
  const BidaDashboardScreen({super.key});

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
    final dashboardAsync = ref.watch(bidaDashboardProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Báo Cáo Doanh Thu Bida')),
      body: dashboardAsync.when(
        data: (metrics) {
          final timeRev = metrics['timeRevenue'] ?? 0.0;
          final itemRev = metrics['itemRevenue'] ?? 0.0;
          final totalRev = metrics['totalRevenue'] ?? 0.0;

          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('TỔNG QUAN DOANH THU', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue)),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(child: _buildMetricCard('Tổng Doanh Thu', '${totalRev.toStringAsFixed(0)} đ', Colors.green)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildMetricCard('Doanh Thu Giờ Chơi', '${timeRev.toStringAsFixed(0)} đ', Colors.orange)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildMetricCard('Doanh Thu Nước/Đồ Ăn', '${itemRev.toStringAsFixed(0)} đ', Colors.purple)),
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
