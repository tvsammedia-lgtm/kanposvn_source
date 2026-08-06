import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/providers.dart';
import '../../core/app_theme.dart';
import '../../core/widgets.dart';

class ReportsScreen extends ConsumerStatefulWidget {
  const ReportsScreen({super.key});

  @override
  ConsumerState<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends ConsumerState<ReportsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedMonth = ref.watch(selectedMonthProvider);

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Báo cáo', style: Theme.of(context).textTheme.headlineLarge),
                    Text('Phân tích & thống kê',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const Spacer(),
                MonthPicker(
                  year: selectedMonth.year,
                  month: selectedMonth.month,
                  onPrev: () => ref.read(selectedMonthProvider.notifier).previousMonth(),
                  onNext: () => ref.read(selectedMonthProvider.notifier).nextMonth(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TabBar(
              controller: _tabs,
              isScrollable: true,
              tabs: const [
                Tab(text: '📊 Tổng quan'),
                Tab(text: '👥 Nhân sự'),
                Tab(text: '💰 Tiền lương'),
                Tab(text: '🚛 Vận tải'),
              ],
            ),
          ),
          const SizedBox(height: 8),

          Expanded(
            child: TabBarView(
              controller: _tabs,
              children: [
                _buildOverviewTab(context, ref, selectedMonth),
                _buildHRTab(context, ref),
                _buildPayrollTab(context, ref, selectedMonth),
                _buildTransportTab(context, ref, selectedMonth),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewTab(BuildContext context, WidgetRef ref, SelectedMonth month) {
    final statsAsync = ref.watch(dashboardStatsProvider(month));
    return statsAsync.when(
      loading: () => const LoadingList(),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
      data: (stats) => SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tóm tắt tháng ${month.month}/${month.year}',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 2.2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _ReportStat(
                    label: 'Tổng nhân viên',
                    value: '${stats['totalEmployees']}',
                    color: AppTheme.primaryLight),
                _ReportStat(
                    label: 'Đang làm việc',
                    value: '${stats['activeEmployees']}',
                    color: AppTheme.success),
                _ReportStat(
                    label: 'Tổng tài xế',
                    value: '${stats['totalDrivers']}',
                    color: AppTheme.accent),
                _ReportStat(
                    label: 'Xe hoạt động',
                    value: '${stats['activeVehicles']}',
                    color: AppTheme.success),
                _ReportStat(
                    label: 'Chuyến tháng này',
                    value: '${stats['totalTrips']}',
                    color: const Color(0xFFA855F7)),
                _ReportStat(
                    label: 'Quỹ lương',
                    value: ((stats['totalPayroll'] ?? 0.0) as double)
                        .toVndShort(),
                    color: AppTheme.warning),
              ],
            ),
            const SizedBox(height: 24),
            Text('Doanh thu vs Chi phí', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            _RevenueExpenseCard(
              revenue: (stats['totalRevenue'] ?? 0.0) as double,
              expenses: (stats['totalExpenses'] ?? 0.0) as double,
              profit: (stats['profit'] ?? 0.0) as double,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHRTab(BuildContext context, WidgetRef ref) {
    final empAsync = ref.watch(employeeListProvider);
    return empAsync.when(
      loading: () => const LoadingList(),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
      data: (employees) {
        // Group by department
        final byDept = <String, int>{};
        for (final e in employees) {
          byDept[e.department] = (byDept[e.department] ?? 0) + 1;
        }

        // Group by gender
        int maleCount = employees.where((e) => e.gender.name == 'male').length;
        int femaleCount = employees.where((e) => e.gender.name == 'female').length;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Phân bổ phòng ban',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              if (byDept.isEmpty)
                const EmptyState(
                    icon: Icons.business, title: 'Chưa có dữ liệu')
              else
                Container(
                  height: 250,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.borderColor),
                  ),
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: byDept.values.isEmpty
                          ? 10
                          : byDept.values.reduce((a, b) => a > b ? a : b) + 2.0,
                      barGroups: byDept.entries.toList().asMap().entries.map((e) {
                        return BarChartGroupData(
                          x: e.key,
                          barRods: [
                            BarChartRodData(
                              toY: e.value.value.toDouble(),
                              color: AppTheme.primaryLight,
                              width: 20,
                              borderRadius:
                                  const BorderRadius.vertical(top: Radius.circular(4)),
                            ),
                          ],
                        );
                      }).toList(),
                      gridData: const FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (v, _) {
                              final list = byDept.keys.toList();
                              if (v.toInt() >= list.length) return const Text('');
                              final dept = list[v.toInt()];
                              return Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  dept.length > 8
                                      ? dept.substring(0, 8)
                                      : dept,
                                  style: const TextStyle(
                                      fontSize: 9,
                                      color: AppTheme.textMuted),
                                ),
                              );
                            },
                          ),
                        ),
                        leftTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 24),
              Text('Giới tính', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              Row(
                children: [
                  _GenderCard(
                      label: 'Nam',
                      count: maleCount,
                      total: employees.length,
                      color: AppTheme.primaryLight),
                  const SizedBox(width: 12),
                  _GenderCard(
                      label: 'Nữ',
                      count: femaleCount,
                      total: employees.length,
                      color: const Color(0xFFEC4899)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPayrollTab(
      BuildContext context, WidgetRef ref, SelectedMonth month) {
    final payrollAsync = ref.watch(payrollByMonthProvider(month));
    return payrollAsync.when(
      loading: () => const LoadingList(),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
      data: (payrolls) {
        if (payrolls.isEmpty) {
          return const EmptyState(
              icon: Icons.account_balance_wallet_outlined,
              title: 'Chưa có dữ liệu lương');
        }

        final totalGross =
            payrolls.fold<double>(0, (s, p) => s + p.grossSalary);
        final totalNet =
            payrolls.fold<double>(0, (s, p) => s + p.netSalary);
        final totalBhxh = payrolls.fold<double>(
            0,
            (s, p) =>
                s +
                p.socialInsurance +
                p.healthInsurance +
                p.unemploymentInsurance);
        final totalTax = payrolls.fold<double>(
            0, (s, p) => s + p.personalIncomeTax);

        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SummaryRow(items: [
                _SummaryItem('Tổng thu nhập', totalGross.toVnd(),
                    AppTheme.primaryLight),
                _SummaryItem('BHXH', totalBhxh.toVnd(), AppTheme.warning),
                _SummaryItem('Thuế TNCN', totalTax.toVnd(), AppTheme.danger),
                _SummaryItem('Thực lĩnh', totalNet.toVnd(), AppTheme.success),
              ]),
              const SizedBox(height: 20),
              Text('Top 10 lương cao nhất',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              ...([...payrolls]
                    ..sort((a, b) => b.netSalary.compareTo(a.netSalary)))
                  .take(10)
                  .toList()
                  .asMap()
                  .entries
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppTheme.surface,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppTheme.borderColor),
                      ),
                      child: Row(
                        children: [
                          Text('#${e.key + 1}',
                              style: const TextStyle(
                                  color: AppTheme.textMuted,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(width: 12),
                          Text(e.value.employeeName,
                              style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(width: 8),
                          Text(e.value.department,
                              style:
                                  Theme.of(context).textTheme.bodySmall),
                          const Spacer(),
                          Text(e.value.netSalary.toVnd(),
                              style: const TextStyle(
                                  color: AppTheme.success,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTransportTab(
      BuildContext context, WidgetRef ref, SelectedMonth month) {
    final tripAsync = ref.watch(tripNotifierProvider);
    return tripAsync.when(
      loading: () => const LoadingList(),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
      data: (trips) {
        final totalRevenue =
            trips.fold<double>(0, (s, t) => s + (t.revenue ?? 0));
        final totalExpenses =
            trips.fold<double>(0, (s, t) => s + (t.expenses ?? 0));
        final totalKm =
            trips.fold<double>(0, (s, t) => s + (t.distanceKm ?? 0));

        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SummaryRow(items: [
                _SummaryItem(
                    'Tổng chuyến', '${trips.length}', AppTheme.primaryLight),
                _SummaryItem(
                    'Tổng km', '${totalKm.toStringAsFixed(0)} km', AppTheme.accent),
                _SummaryItem('Doanh thu', totalRevenue.toVndShort(), AppTheme.success),
                _SummaryItem('Chi phí', totalExpenses.toVndShort(), AppTheme.danger),
              ]),
              const SizedBox(height: 20),
              if (trips.isEmpty)
                const EmptyState(
                    icon: Icons.route_outlined, title: 'Chưa có dữ liệu chuyến xe')
              else ...[
                Text('Doanh thu & chi phí',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 12),
                _RevenueExpenseCard(
                  revenue: totalRevenue,
                  expenses: totalExpenses,
                  profit: totalRevenue - totalExpenses,
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _ReportStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _ReportStat({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w800,
                  )),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}

class _RevenueExpenseCard extends StatelessWidget {
  final double revenue;
  final double expenses;
  final double profit;

  const _RevenueExpenseCard(
      {required this.revenue, required this.expenses, required this.profit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoRow(
                        label: 'Doanh thu',
                        value: revenue.toVnd(),
                        valueColor: AppTheme.success),
                    InfoRow(
                        label: 'Chi phí',
                        value: expenses.toVnd(),
                        valueColor: AppTheme.danger),
                    const Divider(),
                    InfoRow(
                      label: 'Lợi nhuận',
                      value: profit.toVnd(),
                      valueColor: profit >= 0 ? AppTheme.success : AppTheme.danger,
                      bold: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              // Pie chart
              SizedBox(
                width: 120,
                height: 120,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: revenue > 0 ? revenue : 1,
                        color: AppTheme.success,
                        title: 'DT',
                        radius: 40,
                        titleStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                      ),
                      PieChartSectionData(
                        value: expenses > 0 ? expenses : 0,
                        color: AppTheme.danger,
                        title: 'CP',
                        radius: 40,
                        titleStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                    sectionsSpace: 2,
                    centerSpaceRadius: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GenderCard extends StatelessWidget {
  final String label;
  final int count;
  final int total;
  final Color color;

  const _GenderCard(
      {required this.label,
      required this.count,
      required this.total,
      required this.color});

  @override
  Widget build(BuildContext context) {
    final pct = total > 0 ? (count / total * 100).toStringAsFixed(0) : '0';
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Text(label == 'Nam' ? '👨' : '👩',
                style: const TextStyle(fontSize: 28)),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$count người',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: color,
                        )),
                Text('$pct% | $label',
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final List<_SummaryItem> items;
  const _SummaryRow({required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items.map((item) {
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(
                right: items.last == item ? 0 : 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: item.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: item.color.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.label,
                    style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 4),
                Text(item.value,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: item.color,
                          fontWeight: FontWeight.w700,
                        )),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _SummaryItem {
  final String label;
  final String value;
  final Color color;
  const _SummaryItem(this.label, this.value, this.color);
}
