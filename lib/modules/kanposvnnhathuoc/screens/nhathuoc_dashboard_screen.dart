import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../../../core/router/module_selector_screen.dart';
import '../providers/nhathuoc_providers.dart';

class NhathuocDashboardScreen extends ConsumerWidget {
  const NhathuocDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final financeAsync = ref.watch(nhathuocFinanceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Báo Cáo Tài Chính'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(nhathuocFinanceProvider.notifier).calculateMetrics();
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Thoát',
            onPressed: () async {
              await ref.read(authServiceProvider).signOut();
              ref.read(selectedModuleProvider.notifier).state = null;
            },
          ),
        ],
      ),
      body: financeAsync.when(
        data: (metrics) {
          final revenue = metrics['revenue'] ?? 0;
          final cogs = metrics['cogs'] ?? 0;
          final profit = metrics['profit'] ?? 0;
          final inventory = metrics['inventory'] ?? 0;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Báo Cáo Lãi Lỗ (P&L)', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _buildMetricCard('Doanh Thu', revenue, Colors.green)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildMetricCard('Giá Vốn', cogs, Colors.orange)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildMetricCard('Lợi Nhuận Gộp', profit, profit >= 0 ? Colors.blue : Colors.red)),
                  ],
                ),
                const SizedBox(height: 32),
                const Text('Bảng Cân Đối Kế Toán (Tài Sản)', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 4,
                        color: Colors.purple[50],
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Giá Trị Tồn Kho', style: TextStyle(fontSize: 18, color: Colors.purple)),
                              const SizedBox(height: 8),
                              Text('${inventory.toStringAsFixed(0)} đ', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.purple)),
                              const SizedBox(height: 8),
                              const Text('Đây là số tiền vốn đang nằm trong các hộp thuốc trên kệ.', style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox()), // Placeholder cho chart sau này
                  ],
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

  Widget _buildMetricCard(String title, double value, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(side: BorderSide(color: color, width: 2), borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 18, color: color, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text('${value.toStringAsFixed(0)} đ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }
}
