import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../core/providers.dart';
import '../../core/widgets/common_widgets.dart';
import '../../core/utils/formatters.dart';
import '../../shared/models/expense_model.dart';
import '../../core/utils/id_generator.dart';
import '../../core/l10n/translations.dart';

class FinancialScreen extends ConsumerStatefulWidget {
  const FinancialScreen({super.key});

  @override
  ConsumerState<FinancialScreen> createState() => _FinancialScreenState();
}

class _FinancialScreenState extends ConsumerState<FinancialScreen> {
  String _selectedPeriod = 'period_this_month'.tr;
  final List<String> _periods = ['period_today'.tr, 'period_this_week'.tr, 'period_this_month'.tr, 'period_this_quarter'.tr, 'period_this_year'.tr];

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseServiceProvider);
    final expenses = db.getCollection('expenses').map((e) => ExpenseModel.fromJson(e)).toList();
    final totalExpense = expenses.fold<double>(0, (sum, e) => sum + e.amount);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('financial_overview'.tr, style: Theme.of(context).textTheme.headlineMedium),
                const Spacer(),
                DropdownButton<String>(
                  value: _selectedPeriod,
                  items: _periods.map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
                  onChanged: (v) => setState(() => _selectedPeriod = v ?? _selectedPeriod),
                  underline: const SizedBox(),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: KpiCard(
                  title: 'total_income'.tr, value: AppFormatters.formatCurrency(totalExpense * 3),
                  icon: Icons.trending_up, color: AppColors.success,
                )),
                const SizedBox(width: 16),
                Expanded(child: KpiCard(
                  title: 'total_expenses'.tr, value: AppFormatters.formatCurrency(totalExpense),
                  icon: Icons.trending_down, color: AppColors.danger,
                )),
                const SizedBox(width: 16),
                Expanded(child: KpiCard(
                  title: 'net_profit'.tr, value: AppFormatters.formatCurrency(totalExpense * 2),
                  icon: Icons.account_balance, color: AppColors.info,
                )),
              ],
            ),
            const SizedBox(height: 24),
            SectionHeader(
              title: 'recent_expenses'.tr,
              trailing: ElevatedButton.icon(
                onPressed: () => _showAddExpenseDialog(context),
                icon: const Icon(Icons.add, size: 16),
                label: Text('add_expense'.tr),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  final expense = expenses[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: Container(
                        width: 40, height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.danger.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.receipt, color: AppColors.danger, size: 20),
                      ),
                      title: Text(expense.title),
                      subtitle: Text('${expense.category} - ${AppFormatters.formatDate(expense.date)}'),
                      trailing: Text(AppFormatters.formatCurrency(expense.amount),
                        style: const TextStyle(color: AppColors.danger, fontWeight: FontWeight.bold)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddExpenseDialog(BuildContext context) {
    final titleCtrl = TextEditingController();
    final amountCtrl = TextEditingController();
    final notesCtrl = TextEditingController();
    String category = 'Chi phí chung';

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('add_expense'.tr),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleCtrl, decoration: InputDecoration(labelText: 'expense_title'.tr)),
            const SizedBox(height: 12),
            TextField(controller: amountCtrl, decoration: InputDecoration(labelText: 'expense_amount'.tr),
              keyboardType: TextInputType.number),
            const SizedBox(height: 12),
            TextField(controller: notesCtrl, decoration: InputDecoration(labelText: 'expense_notes'.tr)),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('cancel'.tr)),
          ElevatedButton(onPressed: () {
            final amount = double.tryParse(amountCtrl.text) ?? 0;
            if (titleCtrl.text.isNotEmpty && amount > 0) {
              final expense = ExpenseModel(
                id: IdGenerator.generateId('EXP'),
                title: titleCtrl.text, category: category,
                amount: amount, date: DateTime.now(),
                notes: notesCtrl.text,
              );
              ref.read(databaseServiceProvider).saveItem('expenses', expense.id, expense.toJson());
              Navigator.pop(ctx);
            }
          }, child: Text('save'.tr)),
        ],
      ),
    );
  }
}
