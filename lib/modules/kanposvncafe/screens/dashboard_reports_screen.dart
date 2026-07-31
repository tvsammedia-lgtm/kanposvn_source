import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/providers.dart';
import '../../../core/auth/auth_service.dart';
import '../models/cafe_table.dart';
import '../models/cafe_order.dart';
import '../providers/cafe_providers.dart';

class DashboardReportsScreen extends ConsumerWidget {
  const DashboardReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(cafeOrdersProvider);
    final tables = ref.watch(cafeTablesProvider);
    final inventory = ref.watch(cafeInventoryProvider);
    final auth = ref.watch(authServiceProvider);
    final currency = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'đ',
      decimalDigits: 0,
    );

    final completedOrders = orders
        .where((o) => o.status == OrderStatus.daThanhToan)
        .toList();
    final todayRevenue = completedOrders.fold<double>(
      0,
      (sum, o) => sum + o.grandTotal,
    );
    final totalProfit =
        todayRevenue * 0.45; // Estimated profit margin after COGS

    final occupiedTables = tables
        .where(
          (t) =>
              t.status != TableStatus.trong &&
              t.status != TableStatus.daThanhToan,
        )
        .length;
    final takeawayOrders = completedOrders
        .where(
          (o) =>
              o.orderType == OrderType.mangDi ||
              o.orderType == OrderType.giaoHang,
        )
        .length;
    final lowStockCount = inventory.where((i) => i.isLowStock).length;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tổng Quan Hoạt Động Kinh Doanh Cafe',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD97706),
              ),
            ),
            const SizedBox(height: 16),
            _buildAccountCard(auth),
            const SizedBox(height: 16),
            // Top Stat Cards Grid
            GridView.count(
              crossAxisCount: MediaQuery.of(context).size.width > 900 ? 4 : 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 2.2,
              children: [
                _buildStatCard(
                  'Doanh Thu Hôm Nay',
                  currency.format(todayRevenue),
                  Icons.monetization_on,
                  Colors.green,
                ),
                _buildStatCard(
                  'Lợi Nhuận Ước Tính',
                  currency.format(totalProfit),
                  Icons.trending_up,
                  Colors.blue,
                ),
                _buildStatCard(
                  'Bàn Đang Phục Vụ',
                  '$occupiedTables bàn',
                  Icons.table_bar,
                  Colors.purple,
                ),
                _buildStatCard(
                  'Đơn Mang Đi / Delivery',
                  '$takeawayOrders đơn',
                  Icons.local_shipping,
                  Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Chart Section
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Biểu Đồ Doanh Thu Theo Khung Giờ (Hôm Nay)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: LineChart(
                        LineChartData(
                          gridData: const FlGridData(show: true),
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (val, _) {
                                  switch (val.toInt()) {
                                    case 1:
                                      return const Text(
                                        '8h',
                                        style: TextStyle(fontSize: 10),
                                      );
                                    case 2:
                                      return const Text(
                                        '10h',
                                        style: TextStyle(fontSize: 10),
                                      );
                                    case 3:
                                      return const Text(
                                        '12h',
                                        style: TextStyle(fontSize: 10),
                                      );
                                    case 4:
                                      return const Text(
                                        '14h',
                                        style: TextStyle(fontSize: 10),
                                      );
                                    case 5:
                                      return const Text(
                                        '16h',
                                        style: TextStyle(fontSize: 10),
                                      );
                                    case 6:
                                      return const Text(
                                        '18h',
                                        style: TextStyle(fontSize: 10),
                                      );
                                    case 7:
                                      return const Text(
                                        '20h',
                                        style: TextStyle(fontSize: 10),
                                      );
                                  }
                                  return const Text('');
                                },
                              ),
                            ),
                            leftTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: const [
                                FlSpot(1, 150),
                                FlSpot(2, 450),
                                FlSpot(3, 850),
                                FlSpot(4, 600),
                                FlSpot(5, 750),
                                FlSpot(6, 1200),
                                FlSpot(7, 950),
                              ],
                              isCurved: true,
                              color: const Color(0xFFD97706),
                              barWidth: 3,
                              isStrokeCapRound: true,
                              dotData: const FlDotData(show: true),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Quick Alerts Card
            if (lowStockCount > 0)
              Card(
                color: Colors.orange.shade50,
                child: ListTile(
                  leading: const Icon(
                    Icons.notifications_active,
                    color: Colors.orange,
                  ),
                  title: Text(
                    'Cảnh báo Tồn kho: Cần nhập gấp $lowStockCount nguyên liệu!',
                  ),
                  subtitle: const Text(
                    'Nhấn vào tab Kho Hàng để xem chi tiết danh sách nguyên liệu chạm ngưỡng tối thiểu.',
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountCard(AuthService auth) {
    final user = auth.user;
    final fullName = (user?['full_name'] ?? user?['name'] ?? '—').toString();
    final email = (user?['email'] ?? '').toString();
    final plan = (user?['subscription_plan'] ?? '').toString();
    final endRaw = user?['subscription_end'];
    final endText = endRaw != null && endRaw.toString().isNotEmpty
        ? DateFormat('dd/MM/yyyy').format(DateTime.parse(endRaw.toString()))
        : 'Không giới hạn';
    final permissions = auth.permissions;

    final initials = fullName
        .trim()
        .split(' ')
        .where((p) => p.isNotEmpty)
        .take(2)
        .map((p) => p[0].toUpperCase())
        .join();

    return Card(
      elevation: 2,
      color: const Color(0xFFFFF7ED),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: const Color(0xFFD97706),
                  child: Text(
                    initials.isEmpty ? '?' : initials,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tài khoản Admin Web',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        fullName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        email,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            _buildInfoRow(
              Icons.workspace_premium,
              'Gói',
              plan.isEmpty ? 'Chưa đăng ký' : plan,
              const Color(0xFFD97706),
            ),
            const SizedBox(height: 8),
            _buildInfoRow(
              Icons.event,
              'Ngày kết thúc',
              endText,
              Colors.red.shade400,
            ),
            const SizedBox(height: 16),
            const Text(
              'Quyền ứng dụng',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: permissions.isEmpty
                  ? const [
                      Chip(
                        label: Text('Không có quyền truy cập ứng dụng nào'),
                      ),
                    ]
                  : permissions.map((p) {
                      final granted = p['granted'] == true || p['can_login'] == true;
                      final appCode = (p['app_code'] ?? '').toString();
                      final roleName = (p['role_name'] ?? '').toString();
                      return Chip(
                        avatar: Icon(
                          granted ? Icons.check_circle : Icons.cancel,
                          size: 16,
                          color: granted ? Colors.green : Colors.grey,
                        ),
                        label: Text(
                          '$appCode · $roleName',
                          style: const TextStyle(fontSize: 11),
                        ),
                        backgroundColor: granted
                            ? Colors.green.withValues(alpha: 0.12)
                            : Colors.grey.withValues(alpha: 0.12),
                      );
                    }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String label,
    String value,
    Color color,
  ) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 8),
        SizedBox(
          width: 110,
          child: Text(
            label,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: color.withAlpha(38),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.grey, fontSize: 11),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
