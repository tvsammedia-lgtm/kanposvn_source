import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../providers/vantai_providers.dart';
import '../../../core/widgets/owner_info_bar.dart';

/// PRD mục 1: Dashboard vận tải.
class VantaiDashboardScreen extends ConsumerWidget {
  const VantaiDashboardScreen({super.key});

  static final _money =
      NumberFormat.compact(locale: 'vi_VN');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(vantaiDashboardProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Báo Cáo Hoạt Động (Dashboard)')),
      body: dashboardAsync.when(
        data: (metrics) {
          final revToday = (metrics['revToday'] ?? 0.0) as double;
          final soldToday = (metrics['soldToday'] ?? 0) as int;
          final revMonth = (metrics['revMonth'] ?? 0.0) as double;
          final tripsRunning = (metrics['tripsRunning'] ?? 0) as int;
          final tripsScheduledToday =
              (metrics['tripsScheduledToday'] ?? 0) as int;
          final vMaint = (metrics['vehiclesMaintenance'] ?? 0) as int;
          final vRepair = (metrics['vehiclesRepair'] ?? 0) as int;
          final shipActive = (metrics['shipmentsActive'] ?? 0) as int;
          final codCollected = (metrics['codCollected'] ?? 0.0) as double;
          final debtKH = (metrics['debtKH'] ?? 0.0) as double;
          final debtNCC = (metrics['debtNCC'] ?? 0.0) as double;
          final expMonth = (metrics['expMonth'] ?? 0.0) as double;
          final totalRevenue = (metrics['totalRevenue'] ?? 0.0) as double;
          final netProfit = (metrics['netProfit'] ?? 0.0) as double;
          final revenueByRoute =
              (metrics['revenueByRoute'] as Map<String, double>? ?? {});

          return ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const OwnerInfoBar(),
              const SizedBox(height: 12),
              Text('TỔNG QUAN HÔM NAY',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[800])),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.1,
                children: [
                  _card('Doanh thu vé hôm nay', '${_money.format(revToday)}đ',
                      Colors.green, Icons.airplane_ticket),
                  _card('Vé đã bán hôm nay', '$soldToday vé', Colors.orange,
                      Icons.confirmation_number),
                  _card('Chuyến đang chạy', '$tripsRunning chuyến',
                      Colors.blue, Icons.directions_bus),
                  _card('Chuyến sắp chạy', '$tripsScheduledToday chuyến',
                      Colors.indigo, Icons.schedule),
                ],
              ),
              const SizedBox(height: 8),
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.1,
                children: [
                  _card('Xe bảo dưỡng', '$vMaint xe', Colors.deepOrange,
                      Icons.build),
                  _card('Xe sửa chữa', '$vRepair xe', Colors.red,
                      Icons.handyman),
                  _card('Hàng đang vận chuyển', '$shipActive đơn', Colors.purple,
                      Icons.inventory_2),
                  _card('COD đã thu hộ', '${_money.format(codCollected)}đ',
                      Colors.cyan, Icons.local_atm),
                  _card('Công nợ khách hàng', '${_money.format(debtKH)}đ',
                      Colors.pink, Icons.people),
                  _card('Công nợ NCC', '${_money.format(debtNCC)}đ',
                      Colors.brown, Icons.local_shipping),
                  _card('Doanh thu tháng (vé)', '${_money.format(revMonth)}đ',
                      Colors.teal, Icons.trending_up),
                  _card('Chi phí tháng', '${_money.format(expMonth)}đ',
                      Colors.redAccent, Icons.money_off),
                ],
              ),
              const SizedBox(height: 16),
              Text('KẾT QUẢ KINH DOANH THÁNG NÀY',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[800])),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(child: _pnlCard('Tổng Doanh Thu',
                    '${_money.format(totalRevenue)} đ', Colors.green)),
                const SizedBox(width: 12),
                Expanded(child: _pnlCard('Chi Phí',
                    '-${_money.format(expMonth)} đ', Colors.red)),
                const SizedBox(width: 12),
                Expanded(child: _pnlCard('Lợi Nhuận',
                    '${_money.format(netProfit)} đ',
                    netProfit >= 0 ? Colors.blue : Colors.red)),
              ]),
              const SizedBox(height: 16),
              if (revenueByRoute.isNotEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Doanh thu theo tuyến (vé + hàng hóa)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 220,
                          child: BarChart(
                            BarChartData(
                              gridData:
                                  const FlGridData(show: true, drawVerticalLine: false),
                              borderData: FlBorderData(show: false),
                              titlesData: FlTitlesData(
                                leftTitles: const AxisTitles(),
                                rightTitles: const AxisTitles(),
                                topTitles: const AxisTitles(),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 64,
                                    getTitlesWidget: (v, meta) {
                                      final i = v.toInt();
                                      if (i < 0 ||
                                          i >= revenueByRoute.keys.length) {
                                        return const SizedBox();
                                      }
                                      final name = revenueByRoute.keys
                                          .elementAt(i);
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4),
                                        child: Text(name.split(' ').first,
                                            style: const TextStyle(
                                                fontSize: 9)),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              barGroups: [
                                for (var i = 0;
                                    i < revenueByRoute.length;
                                    i++)
                                  BarChartGroupData(x: i, barRods: [
                                    BarChartRodData(
                                      toY: revenueByRoute.values.elementAt(i),
                                      width: 22,
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.teal,
                                    ),
                                  ]),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }

  Widget _card(String title, String value, Color color, IconData icon) {
    return Card(
      elevation: 3,
      shape:
          RoundedRectangleBorder(side: BorderSide(color: color, width: 1.5), borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(icon, size: 18, color: color),
              const SizedBox(width: 6),
              Flexible(
                  child: Text(title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]))),
            ]),
            const SizedBox(height: 6),
            FittedBox(
              child: Text(value,
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold, color: color)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pnlCard(String title, String value, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: color, width: 2),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Text(title, style: TextStyle(fontSize: 15, color: color, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          FittedBox(
            child: Text(value,
                style: TextStyle(
                    fontSize: 26, fontWeight: FontWeight.bold, color: color)),
          ),
        ]),
      ),
    );
  }
}
