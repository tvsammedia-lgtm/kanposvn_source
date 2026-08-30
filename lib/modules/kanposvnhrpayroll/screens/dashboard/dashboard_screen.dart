import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/providers.dart';
import '../../core/app_theme.dart';
import '../../core/widgets.dart';
import '../../../../core/widgets/owner_info_bar.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMonth = ref.watch(selectedMonthProvider);
    final statsAsync = ref.watch(dashboardStatsProvider(selectedMonth));

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
              child: const OwnerInfoBar(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          // App Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dashboard',
                          style: Theme.of(context).textTheme.headlineLarge),
                      Text('Tổng quan hoạt động',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const Spacer(),
                  MonthPicker(
                    year: selectedMonth.year,
                    month: selectedMonth.month,
                    onPrev: () =>
                        ref.read(selectedMonthProvider.notifier).previousMonth(),
                    onNext: () =>
                        ref.read(selectedMonthProvider.notifier).nextMonth(),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // Stats grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: statsAsync.when(
              loading: () => const SliverToBoxAdapter(child: LoadingList()),
              error: (e, _) => SliverToBoxAdapter(
                child: Text('Lỗi: $e',
                    style: const TextStyle(color: AppTheme.danger)),
              ),
              data: (stats) {
                final cards = [
                  StatCard(
                    title: 'Tổng nhân viên',
                    value: '${stats['totalEmployees'] ?? 0}',
                    subtitle: 'Đang làm: ${stats['activeEmployees'] ?? 0}',
                    icon: Icons.people,
                    color: AppTheme.primaryLight,
                    onTap: () => context.go('/employees'),
                  ),
                  StatCard(
                    title: 'Tài xế',
                    value: '${stats['totalDrivers'] ?? 0}',
                    subtitle: 'Đang lái xe',
                    icon: Icons.local_shipping,
                    color: AppTheme.accent,
                    onTap: () => context.go('/drivers'),
                  ),
                  StatCard(
                    title: 'Xe hoạt động',
                    value: '${stats['activeVehicles'] ?? 0}',
                    subtitle: 'Bảo dưỡng: ${stats['maintenanceVehicles'] ?? 0}',
                    icon: Icons.directions_car,
                    color: AppTheme.success,
                    onTap: () => context.go('/vehicles'),
                  ),
                  StatCard(
                    title: 'Chuyến tháng này',
                    value: '${stats['totalTrips'] ?? 0}',
                    subtitle: 'Đã hoàn thành',
                    icon: Icons.route,
                    color: const Color(0xFFA855F7),
                    onTap: () => context.go('/trips'),
                  ),
                  StatCard(
                    title: 'Quỹ lương',
                    value: ((stats['totalPayroll'] ?? 0.0) as double).toVndShort(),
                    subtitle: 'Tháng ${selectedMonth.month}/${selectedMonth.year}',
                    icon: Icons.account_balance_wallet,
                    color: AppTheme.warning,
                    onTap: () => context.go('/payroll'),
                  ),
                  StatCard(
                    title: 'Doanh thu',
                    value: ((stats['totalRevenue'] ?? 0.0) as double).toVndShort(),
                    subtitle: 'Lợi nhuận: ${((stats['profit'] ?? 0.0) as double).toVndShort()}',
                    icon: Icons.trending_up,
                    color: AppTheme.success,
                    onTap: () => context.go('/reports'),
                  ),
                ];
                return SliverToBoxAdapter(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final cols =
                          (constraints.maxWidth / 260).ceil().clamp(1, 6);
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: cols,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          mainAxisExtent: 184,
                        ),
                        itemCount: cards.length,
                        itemBuilder: (context, index) => cards[index],
                      );
                    },
                  ),
                );
              },
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 28)),

          // Revenue chart title
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Text('Doanh thu & Chi phí',
                      style: Theme.of(context).textTheme.titleLarge),
                  const Spacer(),
                  _ChartLegend(
                      color: AppTheme.success, label: 'Doanh thu'),
                  const SizedBox(width: 16),
                  _ChartLegend(
                      color: AppTheme.danger, label: 'Chi phí'),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // Bar chart
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 220,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppTheme.borderColor),
                ),
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 500000000,
                    barTouchData: BarTouchData(enabled: true),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (v, _) => Text(
                            'T${v.toInt() + 1}',
                            style: const TextStyle(
                                color: AppTheme.textMuted, fontSize: 10),
                          ),
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 50,
                          getTitlesWidget: (v, _) => Text(
                            '${(v / 1000000).toStringAsFixed(0)}tr',
                            style: const TextStyle(
                                color: AppTheme.textMuted, fontSize: 9),
                          ),
                        ),
                      ),
                      rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (_) => const FlLine(
                        color: AppTheme.borderColor,
                        strokeWidth: 0.5,
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: List.generate(
                      6,
                      (i) => BarChartGroupData(
                        x: i,
                        barRods: [
                          BarChartRodData(
                            toY: (100 + i * 40 + (i % 3) * 20) * 1000000,
                            color: AppTheme.success,
                            width: 10,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(4)),
                          ),
                          BarChartRodData(
                            toY: (60 + i * 25 + (i % 2) * 15) * 1000000,
                            color: AppTheme.danger,
                            width: 10,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(4)),
                          ),
                        ],
                        barsSpace: 4,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 28)),

          // Quick actions
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverToBoxAdapter(
              child: SectionHeader(title: 'Thao tác nhanh'),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverToBoxAdapter(
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _QuickAction(
                    icon: Icons.person_add,
                    label: 'Thêm nhân viên',
                    onTap: () => context.go('/employees/new'),
                    color: AppTheme.primaryLight,
                  ),
                  _QuickAction(
                    icon: Icons.add_road,
                    label: 'Tạo chuyến xe',
                    onTap: () => context.go('/trips'),
                    color: AppTheme.accent,
                  ),
                  _QuickAction(
                    icon: Icons.calculate,
                    label: 'Tính lương',
                    onTap: () => context.go('/payroll'),
                    color: AppTheme.warning,
                  ),
                  _QuickAction(
                    icon: Icons.bar_chart,
                    label: 'Xem báo cáo',
                    onTap: () => context.go('/reports'),
                    color: AppTheme.success,
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 32)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).viewPadding.bottom + 16,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartLegend extends StatelessWidget {
  final Color color;
  final String label;
  const _ChartLegend({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 12,
            height: 12,
            decoration:
                BoxDecoration(color: color, borderRadius: BorderRadius.circular(3))),
        const SizedBox(width: 6),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 10),
            Text(label,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: color)),
          ],
        ),
      ),
    );
  }
}
