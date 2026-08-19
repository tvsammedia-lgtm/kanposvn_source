import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/bida_providers.dart';
import '../../../core/widgets/owner_info_bar.dart';

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
          final timeRev = (metrics['timeRevenue'] ?? 0.0) as double;
          final itemRev = (metrics['itemRevenue'] ?? 0.0) as double;
          final totalRev = (metrics['totalRevenue'] ?? 0.0) as double;
          final todayRev = (metrics['todayRevenue'] ?? 0.0) as double;
          final todayCount = (metrics['todaySessionCount'] ?? 0) as int;
          final openCount = (metrics['openSessionCount'] ?? 0) as int;
          final activeTables = (metrics['activeTables'] ?? 0) as int;
          final totalTables = (metrics['totalTables'] ?? 0) as int;

          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OwnerInfoBar(),
                const SizedBox(height: 12),
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
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: _buildMetricCard('Doanh Thu Hôm Nay', '${todayRev.toStringAsFixed(0)} đ', Colors.teal)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildMetricCard('Phiên Hôm Nay', '$todayCount', Colors.blue)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildMetricCard('Bàn Đang Chơi', '$activeTables / $totalTables', openCount > 0 ? Colors.red : Colors.grey)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildMetricCard('Phiên Đang Mở', '$openCount', openCount > 0 ? Colors.amber : Colors.grey)),
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
