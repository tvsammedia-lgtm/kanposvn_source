import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import '../providers/app_providers.dart';
import '../models/isar_models.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
    final db = ref.watch(dbProvider);
    final tables = ref.watch(tablesProvider);
    final syncState = ref.watch(syncNotifierProvider);

    // Calculate metrics
    final activeTablesCount = tables.where((t) => t.status == TableStatus.occupied || t.status == TableStatus.serving || t.status == TableStatus.ordering || t.status == TableStatus.pendingPayment).length;
    final emptyTablesCount = tables.where((t) => t.status == TableStatus.empty).length;

    final todayOrders = db.orders.where((o) {
      final now = DateTime.now();
      return o.createdAt.year == now.year && o.createdAt.month == now.month && o.createdAt.day == now.day && o.paymentStatus == 'PAID';
    }).toList();

    final todayRevenue = todayOrders.fold(0.0, (sum, o) => sum + o.totalAmount);
    final monthRevenue = db.orders.where((o) => o.paymentStatus == 'PAID').fold(0.0, (sum, o) => sum + o.totalAmount);
    final totalExpenses = db.expenses.where((e) => e.type == 'EXPENSE').fold(0.0, (sum, e) => sum + e.amount);
    final totalProfit = (monthRevenue - totalExpenses).clamp(0.0, 999999999.0);

    final lowStockItems = db.inventory.where((i) => i.isLowStock).toList();
    final takeawayOrders = db.orders.where((o) => o.type == OrderType.takeaway).length;
    final deliveryOrders = db.orders.where((o) => o.type == OrderType.delivery).length;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Banner
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF4A2C2A), Color(0xFF6B4226)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'KÀN CAFE & TRÀ SỮA POS',
                          style: TextStyle(color: Colors.amberAccent, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Hệ thống quản lý bán hàng Offline-First • Kiểm tra đăng nhập trên Admin Web',
                          style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: syncState.isSyncing
                        ? null
                        : () async {
                            final res = await ref.read(syncNotifierProvider.notifier).triggerSync();
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(res.message),
                                  backgroundColor: res.success ? Colors.green : Colors.red,
                                ),
                              );
                            }
                          },
                    icon: syncState.isSyncing
                        ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                        : const Icon(Icons.cloud_sync, color: Colors.brown),
                    label: Text(
                      syncState.isSyncing ? 'Đang đồng bộ...' : 'Đồng bộ Cloud (${syncState.pendingCount})',
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Top Stat Cards Grid matching PRD Section 34
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth > 1100
                    ? 4
                    : constraints.maxWidth > 700
                        ? 2
                        : 1;
                return GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 1.8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildStatCard(
                      title: 'Doanh thu hôm nay',
                      value: currency.format(todayRevenue),
                      subtitle: '${todayOrders.length} đơn hàng đã hoàn tất',
                      icon: Icons.monetization_on,
                      color: const Color(0xFF2E7D32),
                    ),
                    _buildStatCard(
                      title: 'Doanh thu tháng',
                      value: currency.format(monthRevenue),
                      subtitle: 'Lợi nhuận ước tính: ${currency.format(totalProfit)}',
                      icon: Icons.trending_up,
                      color: const Color(0xFF1565C0),
                    ),
                    _buildStatCard(
                      title: 'Trạng thái Bàn',
                      value: '$activeTablesCount / ${tables.length} Có khách',
                      subtitle: '$emptyTablesCount bàn trống khả dụng',
                      icon: Icons.table_restaurant,
                      color: const Color(0xFFD84315),
                    ),
                    _buildStatCard(
                      title: 'Đơn Mang đi & Giao hàng',
                      value: '$takeawayOrders Mang đi | $deliveryOrders Ship',
                      subtitle: 'Grab, ShopeeFood, BeFood, Gojek',
                      icon: Icons.two_wheeler,
                      color: const Color(0xFF6A1B9A),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 24),

            // Charts & Low Stock Alerts Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Revenue Bar Chart
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Expanded(
                              child: Text(
                                'Biểu Đồ Doanh Thu Theo Giờ (Hôm Nay)',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4A2C2A)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Icon(Icons.bar_chart, color: Colors.brown),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 220,
                          child: BarChart(
                            BarChartData(
                              alignment: BarChartAlignment.spaceAround,
                              maxY: 500000,
                              barTouchData: BarTouchData(enabled: false),
                              titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (val, meta) {
                                      const hours = ['8h', '10h', '12h', '14h', '16h', '18h', '20h'];
                                      int idx = val.toInt();
                                      if (idx >= 0 && idx < hours.length) {
                                        return Text(hours[idx], style: const TextStyle(fontSize: 12));
                                      }
                                      return const Text('');
                                    },
                                  ),
                                ),
                                leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              ),
                              borderData: FlBorderData(show: false),
                              barGroups: [
                                _makeBarGroup(0, 120000),
                                _makeBarGroup(1, 240000),
                                _makeBarGroup(2, 450000),
                                _makeBarGroup(3, 180000),
                                _makeBarGroup(4, 320000),
                                _makeBarGroup(5, 410000),
                                _makeBarGroup(6, 290000),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),

                // Low Stock Alerts Card matching PRD section 34
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 8,
                          runSpacing: 4,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 24),
                                SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    'Cảnh Báo Tồn Kho',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4A2C2A)),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: lowStockItems.isNotEmpty ? Colors.red.shade100 : Colors.green.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '${lowStockItems.length} Món sắp hết',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: lowStockItems.isNotEmpty ? Colors.red.shade800 : Colors.green.shade800,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        if (lowStockItems.isEmpty)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 24),
                            child: Center(
                              child: Text('Tất cả nguyên liệu kho đều đầy đủ!'),
                            ),
                          )
                        else
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: lowStockItems.length,
                            separatorBuilder: (ctx, i) => const Divider(height: 12),
                            itemBuilder: (ctx, i) {
                              final item = lowStockItems[i];
                              return ListTile(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                leading: const CircleAvatar(
                                  backgroundColor: Color(0xFFFFEBEE),
                                  child: Icon(Icons.inventory_2, color: Colors.red, size: 18),
                                ),
                                title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: Text('Tồn: ${item.currentStock} ${item.unit} (Tối thiểu: ${item.minStock} ${item.unit})'),
                                trailing: Text(
                                  item.supplierName ?? 'NCC',
                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _makeBarGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: const Color(0xFF6B4226),
          width: 18,
          borderRadius: BorderRadius.circular(6),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: TextStyle(fontSize: 13, color: Colors.grey.shade700)),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2C1A1D)),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.grey), overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
