import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../models/restaurant_expense_model.dart';
import '../providers/restaurant_providers.dart';

/// XXV. Chi phí: nguyên liệu, lương, điện, nước, gas, thuê mặt bằng...
class RestaurantExpensesScreen extends ConsumerStatefulWidget {
  const RestaurantExpensesScreen({super.key});

  @override
  ConsumerState<RestaurantExpensesScreen> createState() =>
      _RestaurantExpensesScreenState();
}

class _RestaurantExpensesScreenState
    extends ConsumerState<RestaurantExpensesScreen> {
  static final _money =
      NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0);

  Future<void> _addExpense() async {
    RestaurantExpenseCategory category = RestaurantExpenseCategory.OTHER;
    final amountCtrl = TextEditingController();
    final noteCtrl = TextEditingController();

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setD) => AlertDialog(
          title: const Text('THÊM CHI PHÍ'),
          content: SizedBox(
            width: 380,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              DropdownButtonFormField<RestaurantExpenseCategory>(
                value: category,
                isExpanded: true,
                decoration: const InputDecoration(
                    labelText: 'Loại chi phí', border: OutlineInputBorder()),
                items: RestaurantExpenseCategory.values
                    .map((c) => DropdownMenuItem(value: c, child: Text(c.label)))
                    .toList(),
                onChanged: (v) => setD(() => category = v ?? category),
              ),
              const SizedBox(height: 8),
              TextField(
                  controller: amountCtrl,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Số tiền (đ) *',
                      border: OutlineInputBorder())),
              const SizedBox(height: 8),
              TextField(
                  controller: noteCtrl,
                  decoration: const InputDecoration(
                      labelText: 'Ghi chú', border: OutlineInputBorder())),
            ]),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Hủy')),
            FilledButton(
                onPressed:
                    (double.tryParse(amountCtrl.text.trim()) ?? 0) <= 0
                        ? null
                        : () => Navigator.pop(ctx, true),
                child: const Text('Lưu')),
          ],
        ),
      ),
    );
    if (ok != true || !mounted) return;
    await ref.read(restaurantExpensesProvider.notifier).addExpense(
          category,
          double.tryParse(amountCtrl.text.trim()) ?? 0,
          noteCtrl.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final expensesAsync = ref.watch(restaurantExpensesProvider);
    final now = DateTime.now();
    final startMonth = DateTime(now.year, now.month, 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi Phí Vận Hành'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: FilledButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Thêm'),
              onPressed: _addExpense,
            ),
          ),
        ],
      ),
      body: expensesAsync.when(
        data: (expenses) {
          final monthList =
              expenses.where((e) => !e.createdAt.isBefore(startMonth)).toList();
          final totalMonth =
              monthList.fold<double>(0, (s, e) => s + e.amount);
          final byCategory = <RestaurantExpenseCategory, double>{};
          for (final e in monthList) {
            byCategory[e.category] = (byCategory[e.category] ?? 0) + e.amount;
          }
          return Column(children: [
            Card(
              margin: const EdgeInsets.all(12),
              color: Colors.red[50],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('TỔNG CHI PHÍ THÁNG ${now.month}/${now.year}: ${_money.format(totalMonth)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12,
                      runSpacing: 4,
                      children: byCategory.entries
                          .map((e) => Chip(
                                label: Text(
                                    '${e.key.label}: ${_money.format(e.value)}'),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (_, i) {
                  final e = expenses[i];
                  return ListTile(
                    leading: const Icon(Icons.receipt, color: Colors.deepOrange),
                    title: Text('${e.category.label} - ${_money.format(e.amount)}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(
                        '${e.createdAt.toString().substring(0, 16)}${e.note.isNotEmpty ? " • ${e.note}" : ""}'),
                  );
                },
              ),
            ),
          ]);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e')),
      ),
    );
  }
}
