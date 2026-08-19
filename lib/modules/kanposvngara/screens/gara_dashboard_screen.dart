import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../../../core/router/module_selector_screen.dart';
import '../providers/gara_providers.dart';
import '../../../core/widgets/owner_info_bar.dart';

String _fmtVnd(double value) {
  final isNegative = value < 0;
  final abs = value.abs().toStringAsFixed(0);
  final buf = StringBuffer();
  for (var i = 0; i < abs.length; i++) {
    if (i > 0 && (abs.length - i) % 3 == 0) buf.write('.');
    buf.write(abs[i]);
  }
  return '${isNegative ? '-' : ''}${buf.toString()} đ';
}

class GaraDashboardScreen extends ConsumerWidget {
  const GaraDashboardScreen({super.key});

  Widget _buildMetricCard(String title, String value, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 15, color: Colors.grey[700], fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(garaDashboardProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Gara'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Đăng xuất',
            onPressed: () async {
              await ref.read(authServiceProvider).signOut();
              ref.read(selectedModuleProvider.notifier).state = null;
            },
          ),
        ],
      ),
      body: dashboardAsync.when(
        data: (m) {
          final todayRevenue = m['todayRevenue'] ?? 0.0;
          final totalRevenue = m['totalRevenue'] ?? 0.0;
          final receivable = m['receivable'] ?? 0.0;
          final payable = m['payable'] ?? 0.0;
          final cashBalance = m['cashBalance'] ?? 0.0;
          final partsValue = m['partsValue'] ?? 0.0;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OwnerInfoBar(),
                const SizedBox(height: 12),
                _buildSectionTitle('TỔNG QUAN DOANH THU', Colors.blue),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _buildMetricCard('Doanh Thu Hôm Nay', _fmtVnd(todayRevenue), Colors.blue)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildMetricCard('Tổng Doanh Thu', _fmtVnd(totalRevenue), Colors.green)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildMetricCard('Lệnh Sửa Chữa', '${m['orderCount'] ?? 0}', Colors.teal)),
                  ],
                ),
                const SizedBox(height: 28),
                _buildSectionTitle('TIẾP NHẬN & SỬA CHỮA', Colors.deepOrange),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _buildMetricCard('Chờ Sửa Chữa', '${m['waiting'] ?? 0} xe', Colors.orange)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildMetricCard('Đang Sửa Chữa', '${m['inProgress'] ?? 0} xe', Colors.deepOrange)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildMetricCard('Xe Đã Lưu', '${m['vehicleCount'] ?? 0}', Colors.brown)),
                  ],
                ),
                const SizedBox(height: 28),
                _buildSectionTitle('CÔNG NỢ & DÒNG TIỀN', Colors.purple),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _buildMetricCard('Phải Thu (Khách Hàng)', _fmtVnd(receivable), Colors.red)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildMetricCard('Phải Trả (Nhà Cung Cấp)', _fmtVnd(payable), Colors.deepOrange)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildMetricCard(
                        'Sổ Quỹ',
                        _fmtVnd(cashBalance),
                        cashBalance >= 0 ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                _buildSectionTitle('KHO PHỤ TÙNG', Colors.indigo),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _buildMetricCard('Dịch Vụ', '${m['serviceCount'] ?? 0}', Colors.orange)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildMetricCard('Phụ Tùng', '${m['partsCount'] ?? 0}', Colors.indigo)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildMetricCard('Phụ Tùng Sắp Hết', '${m['lowStock'] ?? 0}', Colors.red)),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _buildMetricCard('Giá Trị Tồn Phụ Tùng', _fmtVnd(partsValue), Colors.purple)),
                    const SizedBox(width: 16),
                    const Expanded(child: SizedBox()),
                    const SizedBox(width: 16),
                    const Expanded(child: SizedBox()),
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
