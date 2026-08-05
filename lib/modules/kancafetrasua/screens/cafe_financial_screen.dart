import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../../../core/l10n/translations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/id_generator.dart';
import '../../../core/db/database_service.dart';
import '../../../core/widgets/common_widgets.dart';

final financialPeriodProvider = StateProvider<String>((ref) => 'today');

class CafeFinancialScreen extends ConsumerWidget {
  const CafeFinancialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(databaseServiceProvider);
    final db = DatabaseService.instance;
    final orders = db.getCollection('orders');
    final expenses = db.getCollection('expenses');
    final period = ref.watch(financialPeriodProvider);

    final filteredOrders = _filterByPeriod(orders, period);
    final filteredExpenses = _filterByPeriod(expenses, period);

    final revenue = filteredOrders
        .where((o) => o['paymentStatus'] == 'paid')
        .fold<double>(0, (sum, o) => sum + (o['totalAmount'] ?? 0).toDouble());

    final totalExpenses = filteredExpenses.fold<double>(
        0, (sum, e) => sum + (e['amount'] ?? 0).toDouble());

    final netProfit = revenue - totalExpenses;

    final dineInRevenue = filteredOrders
        .where((o) => o['type'] == 'dineIn' && o['paymentStatus'] == 'paid')
        .fold<double>(0, (sum, o) => sum + (o['totalAmount'] ?? 0).toDouble());

    final takeawayRevenue = filteredOrders
        .where((o) => o['type'] == 'takeaway' && o['paymentStatus'] == 'paid')
        .fold<double>(0, (sum, o) => sum + (o['totalAmount'] ?? 0).toDouble());

    final deliveryRevenue = filteredOrders
        .where((o) => o['type'] == 'delivery' && o['paymentStatus'] == 'paid')
        .fold<double>(0, (sum, o) => sum + (o['totalAmount'] ?? 0).toDouble());

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'financial_overview'.tr,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              _buildPeriodSelector(ref, period),
            ],
          ),
          const SizedBox(height: 24),
          GridView.count(
            crossAxisCount: _getCrossAxisCount(context),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.8,
            children: [
              KpiCard(
                title: 'revenue'.tr,
                value: AppFormatters.formatCurrencyShort(revenue),
                subtitle: '${filteredOrders.where((o) => o['paymentStatus'] == 'paid').length} đơn',
                icon: Icons.trending_up_rounded,
                color: AppColors.success,
              ),
              KpiCard(
                title: 'expenses_label'.tr,
                value: AppFormatters.formatCurrencyShort(totalExpenses),
                subtitle: 'expenses_count'.trParams({'count': filteredExpenses.length.toString()}),
                icon: Icons.trending_down_rounded,
                color: AppColors.danger,
              ),
              KpiCard(
                title: 'profit'.tr,
                value: AppFormatters.formatCurrencyShort(netProfit),
                subtitle: netProfit >= 0 ? 'profit_positive'.tr : 'profit_negative'.tr,
                icon: Icons.account_balance_rounded,
                color: netProfit >= 0 ? AppColors.primary : AppColors.warning,
              ),
              KpiCard(
                title: 'orders'.tr,
                value: '${filteredOrders.length}',
                subtitle:
                    'TB: ${filteredOrders.isNotEmpty ? AppFormatters.formatCurrency(revenue / filteredOrders.length) : AppFormatters.formatCurrency(0)}/đơn',
                icon: Icons.receipt_long_rounded,
                color: AppColors.accent,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: _buildRevenueByType(
                    context, dineInRevenue, takeawayRevenue, deliveryRevenue, revenue),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: _buildExpenseList(context, filteredExpenses),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _filterByPeriod(
      List<Map<String, dynamic>> items, String period) {
    final now = DateTime.now();
    return items.where((item) {
      final dateStr = item['createdAt'] ?? item['date'];
      if (dateStr == null) return false;
      final date = DateTime.tryParse(dateStr);
      if (date == null) return false;

      switch (period) {
        case 'today':
          return date.year == now.year &&
              date.month == now.month &&
              date.day == now.day;
        case 'week':
          final weekAgo = now.subtract(const Duration(days: 7));
          return date.isAfter(weekAgo);
        case 'month':
          return date.year == now.year && date.month == now.month;
        case 'year':
          return date.year == now.year;
        default:
          return true;
      }
    }).toList();
  }

  Widget _buildPeriodSelector(WidgetRef ref, String currentPeriod) {
    final periods = [
      ('today', 'period_today'.tr),
      ('week', 'period_this_week'.tr),
      ('month', 'period_this_month'.tr),
      ('year', 'period_this_year'.tr),
    ];

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: periods.map((p) {
          final isSelected = currentPeriod == p.$1;
          return GestureDetector(
            onTap: () =>
                ref.read(financialPeriodProvider.notifier).state = p.$1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.surface : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ]
                    : null,
              ),
              child: Text(
                p.$2,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 288;
    if (width > 1200) return 4;
    if (width > 800) return 3;
    if (width > 500) return 2;
    return 1;
  }

  Widget _buildRevenueByType(
    BuildContext context,
    double dineInRevenue,
    double takeawayRevenue,
    double deliveryRevenue,
    double totalRevenue,
  ) {
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
          SectionHeader(title: 'revenue_by_type'.tr),
          const SizedBox(height: 20),
          _buildRevenueBar(
              context, 'order_type_dine_in'.tr, dineInRevenue, totalRevenue, AppColors.primary),
          const SizedBox(height: 16),
          _buildRevenueBar(
              context, 'order_type_takeaway'.tr, takeawayRevenue, totalRevenue, AppColors.warning),
          const SizedBox(height: 16),
          _buildRevenueBar(context, 'order_type_delivery'.tr, deliveryRevenue, totalRevenue,
              AppColors.accent),
        ],
      ),
    );
  }

  Widget _buildRevenueBar(
    BuildContext context,
    String label,
    double amount,
    double total,
    Color color,
  ) {
    final percentage = total > 0 ? amount / total : 0.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
            Text(
              AppFormatters.formatCurrencyShort(amount),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: percentage,
            backgroundColor: AppColors.surfaceAlt,
            color: color,
            minHeight: 8,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${(percentage * 100).toStringAsFixed(1)}%',
          style: TextStyle(
            fontSize: 11,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildExpenseList(
      BuildContext context, List<Map<String, dynamic>> expenses) {
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
              SectionHeader(title: 'expenses_label'.tr),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.add_circle_outline, size: 20),
                onPressed: () => _showAddExpenseDialog(context),
                tooltip: 'add_expense'.tr,
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (expenses.isEmpty)
            Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Text(
                  'no_expenses'.tr,
                  style: const TextStyle(color: AppColors.textMuted),
                ),
              ),
            )
          else
            ...expenses.take(10).map((expense) {
              final amount = (expense['amount'] ?? 0).toDouble();
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.danger.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.receipt_long_rounded,
                        size: 16,
                        color: AppColors.danger,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            expense['description'] ?? '',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            expense['category'] ?? '',
                            style: const TextStyle(
                              fontSize: 11,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '-${AppFormatters.formatCurrency(amount)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: AppColors.danger,
                      ),
                    ),
                  ],
                ),
              );
            }),
        ],
      ),
    );
  }

  void _showAddExpenseDialog(BuildContext context) {
    final descController = TextEditingController();
    final amountController = TextEditingController();
    final categoryController = TextEditingController(text: 'Nguyên liệu');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('add_expense'.tr),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: descController,
                decoration: InputDecoration(hintText: 'expense_description'.tr),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'expense_amount'.tr),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: categoryController.text,
                isExpanded: true,
                decoration: InputDecoration(labelText: 'category'.tr),
                items: [
                  DropdownMenuItem(
                      value: 'Nguyên liệu', child: Text('categories'.trParams({'key': 'ingredients'}))),
                  DropdownMenuItem(
                      value: 'Nhân viên', child: Text('categories'.trParams({'key': 'staff'}))),
                  DropdownMenuItem(
                      value: 'Thuê mặt bằng', child: Text('categories'.trParams({'key': 'rent'}))),
                  DropdownMenuItem(
                      value: 'Điện nước', child: Text('categories'.trParams({'key': 'utilities'}))),
                  DropdownMenuItem(value: 'Khác', child: Text('categories'.trParams({'key': 'other'}))),
                ],
                onChanged: (v) => categoryController.text = v ?? '',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('cancel'.tr),
          ),
          ElevatedButton(
            onPressed: () {
              if (descController.text.isEmpty ||
                  amountController.text.isEmpty) {
                return;
              }
              final expense = {
                'id': IdGenerator.generateId('EXP'),
                'description': descController.text,
                'amount': double.tryParse(amountController.text) ?? 0,
                'category': categoryController.text,
                'date': DateTime.now().toIso8601String(),
                'createdAt': DateTime.now().toIso8601String(),
              };
              DatabaseService.instance
                  .saveItem('expenses', expense['id'] as String, expense);
              Navigator.pop(ctx);
            },
            child: Text('add'.tr),
          ),
        ],
      ),
    );
  }
}
