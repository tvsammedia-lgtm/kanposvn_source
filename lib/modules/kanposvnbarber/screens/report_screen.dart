import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../providers/report_provider.dart';

class ReportScreen extends ConsumerWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportState = ref.watch(reportProvider);
    final fmt = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

    if (reportState.isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Báo Cáo')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final maxY = reportState.monthlyRevenue.isEmpty
        ? 100000.0
        : reportState.monthlyRevenue.reduce((a, b) => a > b ? a : b) * 1.2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Báo Cáo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(reportProvider.notifier).loadReportData(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(reportProvider.notifier).loadReportData(),
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            // KPI cards
            Row(children: [
              _kpi('Tổng doanh thu', fmt.format(reportState.totalRevenue), Colors.green, Icons.trending_up),
              _kpi('Thu tháng này', fmt.format(reportState.monthRevenue), Colors.blue, Icons.show_chart),
              _kpi('Chi tháng này', fmt.format(reportState.monthExpenses), Colors.orange, Icons.bar_chart),
            ]),
            Row(children: [
              _kpi('Lợi nhuận', fmt.format(reportState.monthProfit),
                  reportState.monthProfit >= 0 ? Colors.teal : Colors.red, Icons.pie_chart),
              _kpi('Tổng KH', '${reportState.totalCustomers}', Colors.purple, Icons.people),
              _kpi('Hóa đơn', '${reportState.totalInvoices}', Colors.indigo, Icons.receipt_long),
            ]),

            const SizedBox(height: 20),
            const Text('Doanh Thu 6 Tháng Gần Nhất', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            // Bar chart
            SizedBox(
              height: 250,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: maxY,
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          '${rod.toY.toStringAsFixed(0)}đ',
                          const TextStyle(color: Colors.white, fontSize: 12),
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          final idx = value.toInt();
                          if (idx >= 0 && idx < reportState.monthLabels.length) {
                            return SideTitleWidget(
                              meta: meta,
                              child: Text(reportState.monthLabels[idx], style: const TextStyle(fontSize: 11)),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 45,
                        getTitlesWidget: (value, meta) {
                          if (value == 0) return const SizedBox();
                          return Text('${(value / 1000000).toStringAsFixed(0)}M',
                              style: const TextStyle(fontSize: 10));
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: maxY > 0 ? (maxY / 5) : 100000,
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: reportState.monthlyRevenue.asMap().entries.map((entry) {
                    return BarChartGroupData(
                      x: entry.key,
                      barRods: [
                        BarChartRodData(
                          toY: entry.value,
                          color: entry.value > 0 ? Colors.blue : Colors.grey.shade300,
                          width: 22,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4), topRight: Radius.circular(4)),
                        )
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 20),
            _sectionTitle('BẢNG CHI TIẾT', Colors.teal),
            _tableRow('Tháng', 'Doanh thu', isHeader: true),
            for (int i = 0; i < reportState.monthlyRevenue.length; i++)
              _tableRow(reportState.monthLabels[i], fmt.format(reportState.monthlyRevenue[i])),
          ],
        ),
      ),
    );
  }

  Widget _kpi(String label, String value, Color color, IconData icon) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 4),
            Text(value, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(fontSize: 10, color: Colors.grey[600]), textAlign: TextAlign.center),
          ]),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: color)),
    );
  }

  Widget _tableRow(String col1, String col2, {bool isHeader = false}) {
    final style = TextStyle(
      fontSize: 13,
      fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
      color: isHeader ? Colors.teal : Colors.black87,
    );
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: isHeader ? Colors.teal.shade50 : null,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(children: [
        Expanded(child: Text(col1, style: style)),
        Text(col2, style: style),
      ]),
    );
  }
}
