import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/nhathuoc_providers.dart';
import '../models/nhathuoc_expense.dart';

class NhathuocExpenseScreen extends ConsumerStatefulWidget {
  const NhathuocExpenseScreen({super.key});

  @override
  ConsumerState<NhathuocExpenseScreen> createState() => _NhathuocExpenseScreenState();
}

class _NhathuocExpenseScreenState extends ConsumerState<NhathuocExpenseScreen> {
  ExpenseType? _filterType;
  DateTime? _filterFrom;
  DateTime? _filterTo;

  void _showAddDialog() {
    final amountCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    ExpenseType selectedType = ExpenseType.EXPENSE;
    ExpenseCategory selectedCategory = ExpenseCategory.OTHER_EXPENSE;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('Thêm Phiếu Thu Chi'),
          content: SizedBox(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<ExpenseType>(
                          title: const Text('Thu'),
                          value: ExpenseType.INCOME,
                          groupValue: selectedType,
                          onChanged: (v) => setDialogState(() {
                            selectedType = v!;
                            if (v == ExpenseType.INCOME) selectedCategory = ExpenseCategory.SALES;
                          }),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<ExpenseType>(
                          title: const Text('Chi'),
                          value: ExpenseType.EXPENSE,
                          groupValue: selectedType,
                          onChanged: (v) => setDialogState(() {
                            selectedType = v!;
                            if (v == ExpenseType.EXPENSE) selectedCategory = ExpenseCategory.OTHER_EXPENSE;
                          }),
                        ),
                      ),
                    ],
                  ),
                  DropdownButtonFormField<ExpenseCategory>(
                    value: selectedCategory,
                    decoration: const InputDecoration(labelText: 'Loại', border: OutlineInputBorder()),
                    items: (selectedType == ExpenseType.INCOME
                        ? [ExpenseCategory.SALES, ExpenseCategory.DEBT_COLLECTION, ExpenseCategory.OTHER_INCOME]
                        : [ExpenseCategory.IMPORT_DRUGS, ExpenseCategory.SALARY, ExpenseCategory.ELECTRICITY, ExpenseCategory.WATER, ExpenseCategory.RENT, ExpenseCategory.MARKETING, ExpenseCategory.DEPRECIATION, ExpenseCategory.OTHER_EXPENSE]
                    ).map((c) => DropdownMenuItem(value: c, child: Text(c.label))).toList(),
                    onChanged: (v) => setDialogState(() => selectedCategory = v ?? ExpenseCategory.OTHER_EXPENSE),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: amountCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Số tiền (đ) *', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: descCtrl,
                    decoration: const InputDecoration(labelText: 'Mô tả', border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
            ElevatedButton(
              onPressed: () async {
                final amount = double.tryParse(amountCtrl.text) ?? 0;
                if (amount <= 0) return;
                final expense = NhathuocExpense()
                  ..expenseId = const Uuid().v4()
                  ..type = selectedType
                  ..category = selectedCategory
                  ..amount = amount
                  ..description = descCtrl.text.trim()
                  ..createdAt = DateTime.now();
                await ref.read(nhathuocExpensesProvider.notifier).addExpense(expense);
                ref.read(nhathuocFinanceProvider.notifier).calculateMetrics();
                if (mounted) Navigator.pop(ctx);
              },
              child: const Text('Lưu'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final expensesAsync = ref.watch(nhathuocExpensesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thu Chi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.white),
            tooltip: 'Thêm phiếu',
            onPressed: _showAddDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          // Filters
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.grey[100],
            child: Row(
              children: [
                DropdownButtonFormField<ExpenseType?>(
                  value: _filterType,
                  decoration: const InputDecoration(labelText: 'Loại', border: OutlineInputBorder(), isDense: true),
                  items: [
                    const DropdownMenuItem<ExpenseType?>(value: null, child: Text('Tất cả')),
                    ...ExpenseType.values.map((t) => DropdownMenuItem(value: t, child: Text(t.label))),
                  ],
                  onChanged: (v) => setState(() => _filterType = v),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextButton.icon(
                    icon: const Icon(Icons.calendar_today),
                    label: Text(_filterFrom != null ? 'Từ: ${_filterFrom!.toIso8601String().substring(0,10)}' : 'Từ ngày'),
                    onPressed: () async {
                      final d = await showDatePicker(context: context, initialDate: DateTime.now().subtract(const Duration(days: 30)), firstDate: DateTime(2020), lastDate: DateTime.now());
                      setState(() => _filterFrom = d);
                    },
                  ),
                ),
                Expanded(
                  child: TextButton.icon(
                    icon: const Icon(Icons.calendar_today),
                    label: Text(_filterTo != null ? 'Đến: ${_filterTo!.toIso8601String().substring(0,10)}' : 'Đến ngày'),
                    onPressed: () async {
                      final d = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime.now());
                      setState(() => _filterTo = d);
                    },
                  ),
                ),
              ],
            ),
          ),
          // Summary
          expensesAsync.when(
            data: (expenses) {
              double totalIncome = 0;
              double totalExpense = 0;
              for (var e in expenses) {
                if (e.type == ExpenseType.INCOME) {
                  totalIncome += e.amount;
                } else {
                  totalExpense += e.amount;
                }
              }
              return Container(
                padding: const EdgeInsets.all(12),
                color: Colors.blue[50],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(children: [
                      const Text('Tổng Thu', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                      Text('${totalIncome.toStringAsFixed(0)} đ', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
                    ]),
                    Column(children: [
                      const Text('Tổng Chi', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                      Text('${totalExpense.toStringAsFixed(0)} đ', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
                    ]),
                    Column(children: [
                      const Text('NET', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('${(totalIncome - totalExpense).toStringAsFixed(0)} đ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: (totalIncome - totalExpense) >= 0 ? Colors.green : Colors.red)),
                    ]),
                  ],
                ),
              );
            },
            loading: () => const SizedBox(),
            error: (_, __) => const SizedBox(),
          ),
          // List
          Expanded(
            child: expensesAsync.when(
              data: (expenses) {
                var filtered = expenses;
                if (_filterType != null) {
                  filtered = filtered.where((e) => e.type == _filterType).toList();
                }
                if (_filterFrom != null) {
                  filtered = filtered.where((e) => e.createdAt.isAfter(_filterFrom!)).toList();
                }
                if (_filterTo != null) {
                  filtered = filtered.where((e) => e.createdAt.isBefore(_filterTo!.add(const Duration(days: 1)))).toList();
                }
                filtered.sort((a, b) => b.createdAt.compareTo(a.createdAt));
                if (filtered.isEmpty) return const Center(child: Text('Chưa có giao dịch.'));
                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final e = filtered[index];
                    final isIncome = e.type == ExpenseType.INCOME;
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isIncome ? Colors.green[50] : Colors.red[50],
                        child: Icon(isIncome ? Icons.arrow_downward : Icons.arrow_upward, color: isIncome ? Colors.green : Colors.red),
                      ),
                      title: Text(e.category.label, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(e.description.isNotEmpty ? e.description : e.createdAt.toIso8601String().substring(0,16)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${isIncome ? '+' : '-'}${e.amount.toStringAsFixed(0)} đ',
                            style: TextStyle(fontWeight: FontWeight.bold, color: isIncome ? Colors.green : Colors.red, fontSize: 16),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, size: 18),
                            onPressed: () async {
                              final confirm = await showDialog<bool>(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text('Xóa phiếu?'),
                                  content: const Text('Xóa giao dịch này?'),
                                  actions: [
                                    TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Không')),
                                    TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Xóa', style: TextStyle(color: Colors.red))),
                                  ],
                                ),
                              );
                              if (confirm == true) {
                                await ref.read(nhathuocExpensesProvider.notifier).deleteExpense(e.id);
                                ref.read(nhathuocFinanceProvider.notifier).calculateMetrics();
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Center(child: Text('Lỗi: $err')),
            ),
          ),
        ],
      ),
    );
  }
}
