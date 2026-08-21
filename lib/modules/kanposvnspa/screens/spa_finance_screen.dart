import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/spa_expense.dart';
import '../models/spa_session.dart';
import '../providers/spa_providers.dart';
import '../providers/spa_operations_providers.dart';

/// Bảng thu chi & P&L (spec §17-§20).
class SpaFinanceScreen extends ConsumerStatefulWidget {
  const SpaFinanceScreen({super.key});

  @override
  ConsumerState<SpaFinanceScreen> createState() => _SpaFinanceScreenState();
}

class _SpaFinanceScreenState extends ConsumerState<SpaFinanceScreen> {
  DateTime _month = DateTime(DateTime.now().year, DateTime.now().month);

  @override
  Widget build(BuildContext context) {
    final currency =
        NumberFormat.currency(locale: 'vi_VN', symbol: '₫', decimalDigits: 0);
    final expensesAsync = ref.watch(spaExpensesProvider);
    final sessionsAsync = ref.watch(spaSessionsProvider);

    final monthEnd = DateTime(_month.year, _month.month + 1, 0, 23, 59, 59);

    final sessions = sessionsAsync.value ?? [];
    final revenue = sessions
        .where((s) =>
            s.status == SpaSessionStatus.COMPLETED &&
            s.totalAmount > 0 &&
            s.startTime != null &&
            !s.startTime!.isBefore(_month) &&
            s.startTime!.isBefore(monthEnd))
        .fold<double>(0, (sum, s) => sum + s.totalAmount);

    final expenses = (expensesAsync.value ?? [])
        .where((e) =>
            !e.spentAt.isBefore(_month) && e.spentAt.isBefore(monthEnd))
        .toList();
    final otherRevenue = expenses
        .where((e) => e.type == SpaExpenseType.REVENUE)
        .fold<double>(0, (s, e) => s + e.amount);
    final totalExpense = expenses
        .where((e) => e.type != SpaExpenseType.REVENUE)
        .fold<double>(0, (sum, e) => sum + e.amount);
    final profit = revenue + otherRevenue - totalExpense;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thu Chi / P&L'),
        actions: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => setState(() =>
                _month = DateTime(_month.year, _month.month - 1)),
          ),
          Center(
              child: Text(DateFormat('MM/yyyy').format(_month),
                  style: const TextStyle(fontWeight: FontWeight.bold))),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () => setState(
                () => _month = DateTime(_month.year, _month.month + 1)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Thêm'),
        onPressed: () => _showAddDialog(context),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // P&L summary (§20)
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14)),
            color: const Color(0xff24134a),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _Row('Doanh thu dịch vụ', currency.format(revenue),
                      valueColor: Colors.greenAccent),
                  if (otherRevenue > 0)
                    _Row('Doanh thu khác (bán lẻ...)',
                        '+ ${currency.format(otherRevenue)}',
                        valueColor: Colors.greenAccent),
                  _Row('Tổng chi phí', '- ${currency.format(totalExpense)}',
                      valueColor: Colors.redAccent),
                  const Divider(color: Colors.white24),
                  _Row(
                    'Lợi nhuận ròng',
                    currency.format(profit),
                    valueColor:
                        profit >= 0 ? Colors.greenAccent : Colors.redAccent,
                    bold: true,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text('Chi tiết thu chi (${expenses.length})',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          if (expenses.isEmpty)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: Text('Chưa có khoản thu chi nào')),
            )
          else
            ...expenses.map((e) => Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Icon(
                      e.type == SpaExpenseType.FIXED
                          ? Icons.lock
                          : e.type == SpaExpenseType.REVENUE
                              ? Icons.trending_up
                              : Icons.sync_alt,
                      color: e.type == SpaExpenseType.REVENUE
                          ? Colors.green
                          : Colors.red,
                    ),
                    title: Text(e.content,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text(
                        '${DateFormat('dd/MM').format(e.spentAt)} • ${e.category.isEmpty ? e.type.label : e.category}'),
                    trailing: Text(
                      (e.type == SpaExpenseType.REVENUE ? '+ ' : '- ') +
                          currency.format(e.amount.abs()),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: e.type == SpaExpenseType.REVENUE
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ),
                )),
        ],
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    final contentCtrl = TextEditingController();
    final amountCtrl = TextEditingController();
    SpaExpenseType type = SpaExpenseType.VARIABLE;
    String category = 'Mỹ phẩm';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDState) => AlertDialog(
          title: const Text('Thêm khoản thu chi'),
          content: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: contentCtrl,
                  decoration:
                      const InputDecoration(labelText: 'Nội dung'),
                ),
                TextField(
                  controller: amountCtrl,
                  decoration:
                      const InputDecoration(labelText: 'Số tiền (₫)'),
                  keyboardType: TextInputType.number,
                ),
                DropdownButtonFormField<SpaExpenseType>(
                  initialValue: type,
                  decoration: const InputDecoration(labelText: 'Loại'),
                  items: SpaExpenseType.values
                      .map((t) => DropdownMenuItem(
                          value: t, child: Text(t.label)))
                      .toList(),
                  onChanged: (v) => setDState(() => type = v!),
                ),
                DropdownButtonFormField<String>(
                  initialValue: category,
                  decoration:
                      const InputDecoration(labelText: 'Danh mục'),
                  items: const [
                    'Thuê nhà',
                    'Điện nước',
                    'Lương',
                    'Marketing',
                    'Mỹ phẩm',
                    'Thiết bị',
                    'Khác'
                  ]
                      .map((c) =>
                          DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (v) => setDState(() => category = v!),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx), child: const Text('Huỷ')),
            ElevatedButton(
              onPressed: () {
                final amount =
                    double.tryParse(amountCtrl.text.replaceAll(',', '')) ?? 0;
                if (contentCtrl.text.isEmpty || amount <= 0) return;
                ref.read(spaExpensesProvider.notifier).add(SpaExpense()
                  ..expenseId = const Uuid().v4()
                  ..content = contentCtrl.text
                  ..amount = amount
                  ..type = type
                  ..category = category
                  ..spentAt = DateTime.now());
                Navigator.pop(ctx);
              },
              child: const Text('Lưu'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  final bool bold;
  const _Row(this.label, this.value,
      {this.valueColor, this.bold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  color: Colors.white70,
                  fontWeight: bold ? FontWeight.bold : null)),
          Text(value,
              style: TextStyle(
                  color: valueColor ?? Colors.white,
                  fontSize: bold ? 18 : 15,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
