import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/statistics_provider.dart';
import '../../../core/widgets/owner_info_bar.dart';
import 'revenue_report_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsyncValue = ref.watch(xeOmStatisticsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Bảng Điều Khiển (Dashboard)')),
      body: statsAsyncValue.when(
        data: (stats) {
          return RefreshIndicator(
            onRefresh: () async {
              return ref.refresh(xeOmStatisticsProvider);
            },
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const OwnerInfoBar(),
                const SizedBox(height: 12),
                const Text('THỐNG KÊ HÔM NAY', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
                const SizedBox(height: 16),
                
                Row(
                  children: [
                    Expanded(child: _buildStatCard('Tổng Cuốc Xe', '${stats.totalBookingsToday}', Icons.local_taxi, Colors.blue)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildStatCard('Đang Chạy', '${stats.activeBookings}', Icons.run_circle, Colors.orange)),
                  ],
                ),
                const SizedBox(height: 16),
                
                _buildStatCard('Tổng Doanh Thu', '${stats.totalRevenueToday} đ', Icons.attach_money, Colors.green),
                const SizedBox(height: 16),
                
                _buildStatCard('Hoa Hồng Thu Được', '${stats.totalCommissionToday} đ', Icons.account_balance_wallet, Colors.purple),
                
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const RevenueReportScreen()));
                  },
                  icon: const Icon(Icons.bar_chart),
                  label: const Text('XEM BÁO CÁO CHI TIẾT'),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                )
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }
}
