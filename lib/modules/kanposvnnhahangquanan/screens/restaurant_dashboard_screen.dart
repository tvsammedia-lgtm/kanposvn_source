import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/restaurant_providers.dart';
import '../../../core/widgets/owner_info_bar.dart';

class RestaurantDashboardScreen extends ConsumerWidget {
  const RestaurantDashboardScreen({super.key});

  static final _money =
      NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0);

  Widget _buildMetricCard(String title, String value, Color color,
      {IconData? icon}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              if (icon != null) ...[
                Icon(icon, size: 20, color: color),
                const SizedBox(width: 6),
              ],
              Flexible(
                child: Text(title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold)),
              ),
            ]),
            const SizedBox(height: 12),
            FittedBox(
              child: Text(value,
                  style: TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold, color: color)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(restaurantDashboardProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard Nhà Hàng')),
      body: dashboardAsync.when(
        data: (metrics) {
          final revToday = (metrics['revenue'] ?? 0.0) as double;
          final cashToday = (metrics['cashToday'] ?? 0.0) as double;
          final bankToday = (metrics['bankToday'] ?? 0.0) as double;
          final debtToday = (metrics['debtToday'] ?? 0.0) as double;
          final completed = (metrics['completedOrders'] ?? 0) as int;
          final servingTables = (metrics['servingTables'] ?? 0) as int;
          final reservedTables = (metrics['reservedTables'] ?? 0) as int;
          final customerDebt = (metrics['customerDebt'] ?? 0.0) as double;
          final revenueMonth = (metrics['revenueMonth'] ?? 0.0) as double;
          final completedMonth = (metrics['completedMonth'] ?? 0) as int;
          final expenseMonth = (metrics['expenseMonth'] ?? 0.0) as double;
          final profitMonth = (metrics['profitMonth'] ?? 0.0) as double;
          final completedYear = (metrics['completedYear'] ?? 0) as int;
          final revenueAll = (metrics['revenueAll'] ?? 0.0) as double;

          final width = MediaQuery.of(context).size.width;
          final cols = width > 900 ? 4 : width > 700 ? 3 : 2;
          final aspect = cols >= 3 ? 2.0 : 1.6;

          Widget metricGrid(List<Widget> cards) => GridView.count(
                crossAxisCount: cols,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: aspect,
                children: cards,
              );

          return ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const OwnerInfoBar(),
              const SizedBox(height: 12),
              Text('TỔNG QUAN HÔM NAY',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[800])),
              const SizedBox(height: 16),
              metricGrid([
                  _buildMetricCard('Doanh thu hôm nay',
                      _money.format(revToday), Colors.orange,
                      icon: Icons.attach_money),
                  _buildMetricCard('Số hóa đơn', '$completed', Colors.blue,
                      icon: Icons.receipt_long),
                  _buildMetricCard('Khách đang ăn', '$servingTables bàn',
                      Colors.red, icon: Icons.restaurant),
                  _buildMetricCard('Đặt trước hôm nay', '$reservedTables bàn',
                      Colors.indigo, icon: Icons.event_available),
                  _buildMetricCard('Tiền mặt', _money.format(cashToday),
                      Colors.green, icon: Icons.payments),
                  _buildMetricCard('Chuyển khoản/QR/Thẻ',
                      _money.format(bankToday), Colors.teal,
                      icon: Icons.qr_code_2),
                  _buildMetricCard('Ghi nợ khách', _money.format(debtToday),
                      Colors.deepOrange, icon: Icons.credit_score),
                  _buildMetricCard('Công nợ phải thu',
                      _money.format(customerDebt), Colors.purple,
                      icon: Icons.account_balance_wallet),
                ],
              ),
              const SizedBox(height: 24),
              Text('THÁNG NÀY',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[800])),
              const SizedBox(height: 16),
              metricGrid([
                  _buildMetricCard('Doanh thu tháng',
                      _money.format(revenueMonth), Colors.orange,
                      icon: Icons.trending_up),
                  _buildMetricCard('Số hóa đơn', '$completedMonth', Colors.blue,
                      icon: Icons.receipt),
                  _buildMetricCard('Chi phí', _money.format(expenseMonth),
                      Colors.red, icon: Icons.money_off),
                  _buildMetricCard(
                      profitMonth >= 0 ? 'Lợi nhuận' : 'Lỗ',
                      _money.format(profitMonth),
                      profitMonth >= 0 ? Colors.green : Colors.red,
                      icon: Icons.savings),
                ],
              ),
              const SizedBox(height: 24),
              Text('NĂM ${DateTime.now().year}',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[800])),
              const SizedBox(height: 16),
              metricGrid([
                  _buildMetricCard('Tổng doanh thu (mọi thời gian)',
                      _money.format(revenueAll), Colors.orange,
                      icon: Icons.stacked_line_chart),
                  _buildMetricCard('Số hóa đơn năm', '$completedYear',
                      Colors.blue, icon: Icons.calendar_month),
                ],
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }
}
