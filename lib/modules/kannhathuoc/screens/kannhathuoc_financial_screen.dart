import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/l10n/translations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/common_widgets.dart';

class _ExpenseItem {
  final String id;
  final String title;
  final String category;
  final double amount;
  final DateTime date;

  _ExpenseItem({
    required this.id,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
  });
}

class NhaThuocFinancialScreen extends StatefulWidget {
  const NhaThuocFinancialScreen({super.key});

  @override
  State<NhaThuocFinancialScreen> createState() => _NhaThuocFinancialScreenState();
}

class _NhaThuocFinancialScreenState extends State<NhaThuocFinancialScreen> {
  String _selectedPeriod = 'Tháng này';

  final _expenses = [
    _ExpenseItem(id: 'E001', title: 'Tiền thuê mặt bằng', category: 'Thuê nhà', amount: 15000000, date: DateTime(2026, 7, 1)),
    _ExpenseItem(id: 'E002', title: 'Lương nhân viên', category: 'Nhân sự', amount: 25000000, date: DateTime(2026, 7, 5)),
    _ExpenseItem(id: 'E003', title: 'Điện nước', category: 'Tiện ích', amount: 2500000, date: DateTime(2026, 7, 10)),
    _ExpenseItem(id: 'E004', title: 'Vận chuyển hàng hóa', category: 'Vận chuyển', amount: 800000, date: DateTime(2026, 7, 12)),
    _ExpenseItem(id: 'E005', title: 'Quảng cáo Facebook', category: 'Marketing', amount: 3000000, date: DateTime(2026, 7, 15)),
    _ExpenseItem(id: 'E006', title: 'Bảo trì phần mềm POS', category: 'Công nghệ', amount: 500000, date: DateTime(2026, 7, 18)),
    _ExpenseItem(id: 'E007', title: 'Mua dụng cụ y tế', category: 'Trang thiết bị', amount: 1200000, date: DateTime(2026, 7, 20)),
  ];

  double get _totalRevenue => 85000000;
  double get _totalCOGS => 52000000;
  double get _totalExpenses => _expenses.fold(0.0, (sum, e) => sum + e.amount);
  double get _grossProfit => _totalRevenue - _totalCOGS;
  double get _netProfit => _grossProfit - _totalExpenses;
  double get _profitMargin => _totalRevenue > 0 ? (_netProfit / _totalRevenue * 100) : 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text('financial_overview'.tr,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w800,
                            )),
                  ),
                  SegmentedButton<String>(
                    segments: [
                      ButtonSegment(value: 'Tuần này', label: Text('period_this_week'.tr)),
                      ButtonSegment(value: 'Tháng này', label: Text('period_this_month'.tr)),
                      ButtonSegment(value: 'Quý này', label: Text('period_this_quarter'.tr)),
                    ],
                    selected: {_selectedPeriod},
                    onSelectionChanged: (v) => setState(() => _selectedPeriod = v.first),
                    style: SegmentedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 11),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildPnLSummary(),
              const SizedBox(height: 20),
              _buildRevenueChart(),
              const SizedBox(height: 20),
              _buildExpensesList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPnLSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('business_result'.trParams({'period': _selectedPeriod}),
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
          const SizedBox(height: 16),
          _buildPnLRow('sales_revenue'.tr, _totalRevenue, AppColors.primary),
          _buildPnLRow('cogs'.tr, _totalCOGS, AppColors.danger, isDeduction: true),
          const Divider(height: 20),
          _buildPnLRow('gross_profit'.tr, _grossProfit, AppColors.success),
          const SizedBox(height: 8),
          _buildPnLRow('total_expenses'.tr, _totalExpenses, AppColors.warning, isDeduction: true),
          const Divider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('net_profit_label'.tr,
                  style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
              Text(AppFormatters.formatCurrency(_netProfit),
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: _netProfit >= 0 ? AppColors.success : AppColors.danger,
                  )),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: (_netProfit >= 0 ? AppColors.success : AppColors.danger).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('profit_margin'.trParams({'margin': _profitMargin.toStringAsFixed(1)}),
                    style: TextStyle(
                      color: _netProfit >= 0 ? AppColors.success : AppColors.danger,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPnLRow(String label, double amount, Color color, {bool isDeduction = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (isDeduction)
                const Padding(
                  padding: EdgeInsets.only(right: 6),
                  child: Text('-', style: TextStyle(color: AppColors.danger, fontWeight: FontWeight.w700)),
                ),
              Text(label, style: const TextStyle(fontSize: 13)),
            ],
          ),
          Text(AppFormatters.formatCurrency(amount),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: color,
              )),
        ],
      ),
    );
  }

  Widget _buildRevenueChart() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('revenue_7days'.tr,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 20000000,
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        AppFormatters.formatCurrencyShort(rod.toY),
                        const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 50,
                      getTitlesWidget: (value, meta) {
                        return Text(AppFormatters.formatCurrencyShort(value),
                            style: const TextStyle(fontSize: 9, color: AppColors.textMuted));
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final days = AppTranslations.getDayLabels();
                        final idx = value.toInt();
                        return Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(idx < days.length ? days[idx] : '',
                              style: const TextStyle(fontSize: 10, color: AppColors.textMuted)),
                        );
                      },
                    ),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 5000000,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: AppColors.border.withOpacity(0.5),
                    strokeWidth: 1,
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: [
                  _buildBar(0, 12000000),
                  _buildBar(1, 15000000),
                  _buildBar(2, 9000000),
                  _buildBar(3, 18000000),
                  _buildBar(4, 16500000),
                  _buildBar(5, 8000000),
                  _buildBar(6, 6500000),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData _buildBar(int x, double value) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: AppColors.primary,
          width: 28,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
        ),
      ],
    );
  }

  Widget _buildExpensesList() {
    final expenseCategories = AppTranslations.getCategoryMap('expense_categories');
    final categoryColors = {
      'Thuê nhà': AppColors.danger,
      'Nhân sự': AppColors.primary,
      'Tiện ích': AppColors.warning,
      'Vận chuyển': AppColors.info,
      'Marketing': AppColors.accent,
      'Công nghệ': AppColors.success,
      'Trang thiết bị': AppColors.textSecondary,
    };

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('operating_expenses'.tr,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
              const Spacer(),
              StatusBadge(
                label: AppFormatters.formatCurrency(_totalExpenses),
                color: AppColors.danger,
              ),
            ],
          ),
          const SizedBox(height: 14),
          ..._expenses.map((e) {
            final catColor = categoryColors[e.category] ?? AppColors.textSecondary;
            final displayCategory = expenseCategories[e.category] ?? e.category;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: catColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _categoryIcon(e.category),
                      color: catColor,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.title,
                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                        Text('$displayCategory · ${AppFormatters.formatDate(e.date)}',
                            style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
                      ],
                    ),
                  ),
                  Text(AppFormatters.formatCurrency(e.amount),
                      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: AppColors.danger)),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  IconData _categoryIcon(String category) {
    switch (category) {
      case 'Thuê nhà':
        return Icons.home_rounded;
      case 'Nhân sự':
        return Icons.people_rounded;
      case 'Tiện ích':
        return Icons.bolt_rounded;
      case 'Vận chuyển':
        return Icons.local_shipping_rounded;
      case 'Marketing':
        return Icons.campaign_rounded;
      case 'Công nghệ':
        return Icons.computer_rounded;
      case 'Trang thiết bị':
        return Icons.build_rounded;
      default:
        return Icons.receipt_rounded;
    }
  }
}
