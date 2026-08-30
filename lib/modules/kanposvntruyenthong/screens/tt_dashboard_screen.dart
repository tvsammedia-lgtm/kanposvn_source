import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../../../core/router/module_selector_screen.dart' show selectedModuleProvider;
import '../../../core/widgets/owner_info_bar.dart';
import '../providers/tt_providers.dart';

String ttFmtVnd(double value) {
  final isNegative = value < 0;
  final abs = value.abs().toStringAsFixed(0);
  final buf = StringBuffer();
  for (var i = 0; i < abs.length; i++) {
    if (i > 0 && (abs.length - i) % 3 == 0) buf.write('.');
    buf.write(abs[i]);
  }
  return '${isNegative ? '-' : ''}${buf.toString()} đ';
}

class TtDashboardScreen extends ConsumerWidget {
  const TtDashboardScreen({super.key});

  Widget _buildMetricCard(String title, String value, Color color, {IconData? icon}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 8),
            ],
            Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.grey[700], fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: color),
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
    final dashboardAsync = ref.watch(ttDashboardProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF16A34A),
        foregroundColor: Colors.white,
        title: const Text('Dashboard Sạp Rau Củ Quả', style: TextStyle(fontWeight: FontWeight.bold)),
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
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OwnerInfoBar(),
                const SizedBox(height: 16),
                _buildSectionTitle('TỔNG QUAN DOANH THU', const Color(0xFF16A34A)),
                const SizedBox(height: 12),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final width = (constraints.maxWidth - 32) / 3;
                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        SizedBox(width: width, child: _buildMetricCard('Doanh Thu Hôm Nay', ttFmtVnd(m['todayRevenue'] ?? 0), const Color(0xFF16A34A), icon: Icons.today)),
                        SizedBox(width: width, child: _buildMetricCard('Đã Thu Hôm Nay', ttFmtVnd(m['todayCollected'] ?? 0), const Color(0xFF0891B2), icon: Icons.payments)),
                        SizedBox(width: width, child: _buildMetricCard('Doanh Thu Tháng', ttFmtVnd(m['monthRevenue'] ?? 0), const Color(0xFF2563EB), icon: Icons.calendar_month)),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('CHI PHÍ & LỢI NHUẬN', const Color(0xFFD97706)),
                const SizedBox(height: 12),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final width = (constraints.maxWidth - 32) / 3;
                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        SizedBox(width: width, child: _buildMetricCard('Chi Phí Hôm Nay', ttFmtVnd(m['todayExpense'] ?? 0), const Color(0xFFEA580C), icon: Icons.local_grocery_store)),
                        SizedBox(width: width, child: _buildMetricCard('Lãi Tạm Tính', ttFmtVnd(m['todayProfit'] ?? 0), (m['todayProfit'] ?? 0) >= 0 ? const Color(0xFF16A34A) : Colors.red, icon: Icons.trending_up)),
                        SizedBox(width: width, child: _buildMetricCard('Lợi Nhuận Tháng', ttFmtVnd(m['monthProfit'] ?? 0), (m['monthProfit'] ?? 0) >= 0 ? const Color(0xFF16A34A) : Colors.red, icon: Icons.account_balance)),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('CÔNG NỢ & DÒNG TIỀN', const Color(0xFFDC2626)),
                const SizedBox(height: 12),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final width = (constraints.maxWidth - 32) / 3;
                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        SizedBox(width: width, child: _buildMetricCard('Công Nợ Khách Hàng', ttFmtVnd(m['receivable'] ?? 0), const Color(0xFFDC2626), icon: Icons.people)),
                        SizedBox(width: width, child: _buildMetricCard('Công Nợ NCC', ttFmtVnd(m['payable'] ?? 0), const Color(0xFFB45309), icon: Icons.local_shipping)),
                        SizedBox(width: width, child: _buildMetricCard('Sổ Quỹ', ttFmtVnd(m['cashBalance'] ?? 0), (m['cashBalance'] ?? 0) >= 0 ? const Color(0xFF16A34A) : Colors.red, icon: Icons.account_balance_wallet)),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('KHO HÀNG & CẢNH BÁO', const Color(0xFF7C3AED)),
                const SizedBox(height: 12),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final width = (constraints.maxWidth - 32) / 3;
                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        SizedBox(width: width, child: _buildMetricCard('Giá Trị Tồn Kho', ttFmtVnd(m['inventoryValue'] ?? 0), const Color(0xFF7C3AED), icon: Icons.inventory)),
                        SizedBox(width: width, child: _buildMetricCard('Hàng Sắp Hết', '${m['lowStock'] ?? 0}', const Color(0xFFEA580C), icon: Icons.warning_amber)),
                        SizedBox(width: width, child: _buildMetricCard('Hết Hàng', '${m['outOfStock'] ?? 0}', Colors.red, icon: Icons.remove_circle_outline)),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 12),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final width = (constraints.maxWidth - 32) / 3;
                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        SizedBox(width: width, child: _buildMetricCard('Sắp Hết Hạn (7 ngày)', '${m['soonExpiring'] ?? 0}', const Color(0xFFF59E0B), icon: Icons.hourglass_bottom)),
                        SizedBox(width: width, child: _buildMetricCard('Đã Hết Hạn', '${m['expired'] ?? 0}', Colors.red, icon: Icons.event_busy)),
                        SizedBox(width: width, child: _buildMetricCard('Điểm Đã Tích', '${(m['loyaltyPointOut'] ?? 0).round()} pts', const Color(0xFF0891B2), icon: Icons.stars)),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    'Số hóa đơn bán: ${m['salesCount'] ?? 0}   •   Số phiếu nhập: ${m['purchaseCount'] ?? 0}',
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
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