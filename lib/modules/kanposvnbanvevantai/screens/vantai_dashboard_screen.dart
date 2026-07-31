import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/vantai_providers.dart';

class VantaiDashboardScreen extends ConsumerWidget {
  const VantaiDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(vantaiDashboardProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Báo Cáo Hoạt Động (Dashboard)'),
      ),
      body: dashboardAsync.when(
        data: (metrics) {
          final totalRev = metrics['totalRevenue'] ?? 0.0;
          final totalExp = metrics['totalExpenses'] ?? 0.0;
          final netProfit = metrics['netProfit'] ?? 0.0;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('BÁO CÁO KẾT QUẢ KINH DOANH (P&L)', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue)),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(child: _buildPNLCard('Tổng Doanh Thu', '${totalRev.toStringAsFixed(0)} đ', Colors.green)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildPNLCard('Tổng Chi Phí', '-${totalExp.toStringAsFixed(0)} đ', Colors.red, isNegative: true)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildPNLCard('Lợi Nhuận Ròng', '${netProfit.toStringAsFixed(0)} đ', Colors.blue, isNegative: netProfit < 0)),
                  ],
                ),
                const SizedBox(height: 32),
                const Text('Chi tiết Doanh Thu', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _buildMetricCard('Bán Vé (${metrics['ticketCount'] ?? 0} vé)', '${metrics['ticketRevenue']?.toStringAsFixed(0) ?? 0} đ', Colors.orange)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildMetricCard('Ký Gửi (${metrics['shipmentCount'] ?? 0} đơn)', '${metrics['shipmentRevenue']?.toStringAsFixed(0) ?? 0} đ', Colors.purple)),
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

  Widget _buildPNLCard(String title, String value, Color color, {bool isNegative = false}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 18, color: color, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(value,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: isNegative ? Colors.red : color)),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(side: BorderSide(color: color, width: 2), borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 18, color: color, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(value, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }
}
