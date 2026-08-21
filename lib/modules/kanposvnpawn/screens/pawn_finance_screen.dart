import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/cash_transaction_provider.dart';
import '../models/pawn_cash_transaction.dart';

class PawnFinanceScreen extends ConsumerStatefulWidget {
  const PawnFinanceScreen({super.key});

  @override
  ConsumerState<PawnFinanceScreen> createState() => _PawnFinanceScreenState();
}

class _PawnFinanceScreenState extends ConsumerState<PawnFinanceScreen> {
  TransactionType? _filterType;
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Widget build(BuildContext context) {
    final txnState = ref.watch(cashTransactionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thu Chi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterDialog,
          ),
        ],
      ),
      body: txnState.when(
        data: (txns) {
          var filtered = txns;
          if (_filterType != null) {
            filtered = filtered.where((t) => t.type == _filterType).toList();
          }
          if (_startDate != null) {
            filtered = filtered.where((t) => t.createdAt != null && t.createdAt!.isAfter(_startDate!)).toList();
          }
          if (_endDate != null) {
            final end = _endDate!.add(const Duration(days: 1));
            filtered = filtered.where((t) => t.createdAt != null && t.createdAt!.isBefore(end)).toList();
          }

          final totalIncome = filtered.where((t) => t.type == TransactionType.income).fold<double>(0, (s, t) => s + (t.amount ?? 0));
          final totalExpense = filtered.where((t) => t.type == TransactionType.expense).fold<double>(0, (s, t) => s + (t.amount ?? 0));

          return Column(
            children: [
              // Summary
              Container(
                color: Colors.grey[100],
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    _summaryCard('Tổng thu', totalIncome, Colors.green),
                    _summaryCard('Tổng chi', totalExpense, Colors.red),
                    _summaryCard('Lãi净', totalIncome - totalExpense,
                        totalIncome >= totalExpense ? Colors.green : Colors.red),
                  ],
                ),
              ),
              // Filter chips
              if (_filterType != null || _startDate != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Row(
                    children: [
                      if (_filterType != null)
                        Chip(
                          label: Text(_filterType == TransactionType.income ? 'Chỉ thu' : 'Chỉ chi'),
                          onDeleted: () => setState(() => _filterType = null),
                        ),
                      if (_startDate != null)
                        Chip(
                          label: Text('${_formatDate(_startDate!)} - ${_formatDate(_endDate ?? DateTime.now())}'),
                          onDeleted: () => setState(() { _startDate = null; _endDate = null; }),
                        ),
                    ],
                  ),
                ),
              // List
              Expanded(
                child: filtered.isEmpty
                    ? const Center(child: Text('Không có giao dịch.'))
                    : ListView.builder(
                        itemCount: filtered.length,
                        itemBuilder: (ctx, i) => _buildTxnRow(filtered[i]),
                      ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTxnRow(PawnCashTransaction t) {
    final isIncome = t.type == TransactionType.income;
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isIncome ? Colors.green[50] : Colors.red[50],
        child: Icon(isIncome ? Icons.add_circle : Icons.remove_circle, color: isIncome ? Colors.green : Colors.red, size: 20),
      ),
      title: Text(t.description ?? t.category ?? '', style: const TextStyle(fontSize: 13)),
      subtitle: Text('${t.documentCode ?? ""} · ${_formatDate(t.createdAt ?? DateTime.now())}', style: TextStyle(fontSize: 11, color: Colors.grey[600])),
      trailing: Text(
        '${isIncome ? "+" : "-"}${_fmt(t.amount ?? 0)}',
        style: TextStyle(fontWeight: FontWeight.bold, color: isIncome ? Colors.green : Colors.red, fontSize: 13),
      ),
    );
  }

  Widget _summaryCard(String label, double value, Color color) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(_fmt(value), style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 14)),
              Text(label, style: TextStyle(fontSize: 10, color: Colors.grey[600])),
            ],
          ),
        ),
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Lọc giao dịch'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Tất cả'),
              leading: Radio<TransactionType?>(
                value: null,
                groupValue: _filterType,
                onChanged: (_) { Navigator.pop(context); setState(() => _filterType = null); },
              ),
            ),
            ListTile(
              title: const Text('Chỉ thu'),
              leading: Radio<TransactionType?>(
                value: TransactionType.income,
                groupValue: _filterType,
                onChanged: (_) { Navigator.pop(context); setState(() => _filterType = TransactionType.income); },
              ),
            ),
            ListTile(
              title: const Text('Chỉ chi'),
              leading: Radio<TransactionType?>(
                value: TransactionType.expense,
                groupValue: _filterType,
                onChanged: (_) { Navigator.pop(context); setState(() => _filterType = TransactionType.expense); },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddDialog() {
    TransactionType type = TransactionType.income;
    String category = TransactionCategories.incomeCategories.first;
    final descCtrl = TextEditingController();
    final amountCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('Thêm Giao Dịch'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SegmentedButton<TransactionType>(
                segments: const [
                  ButtonSegment(value: TransactionType.income, label: Text('Thu')),
                  ButtonSegment(value: TransactionType.expense, label: Text('Chi')),
                ],
                selected: {type},
                onSelectionChanged: (s) => setDialogState(() {
                  type = s.first;
                  category = type == TransactionType.income
                      ? TransactionCategories.incomeCategories.first
                      : TransactionCategories.expenseCategories.first;
                }),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: category,
                isExpanded: true,
                decoration: const InputDecoration(labelText: 'Hạng mục', border: OutlineInputBorder(), isDense: true),
                items: (type == TransactionType.income ? TransactionCategories.incomeCategories : TransactionCategories.expenseCategories)
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) => setDialogState(() => category = v ?? category),
              ),
              const SizedBox(height: 8),
              TextField(controller: amountCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Số tiền', border: OutlineInputBorder(), isDense: true)),
              const SizedBox(height: 8),
              TextField(controller: descCtrl, decoration: const InputDecoration(labelText: 'Mô tả', border: OutlineInputBorder(), isDense: true)),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
            FilledButton(
              onPressed: () {
                final amount = double.tryParse(amountCtrl.text) ?? 0;
                if (amount > 0) {
                  final txn = PawnCashTransaction()
                    ..documentCode = '${type == TransactionType.income ? "PT" : "PC"}-${DateTime.now().millisecondsSinceEpoch}'
                    ..type = type
                    ..amount = amount
                    ..category = category
                    ..description = descCtrl.text
                    ..createdBy = 'Chủ cửa hàng'
                    ..createdAt = DateTime.now();
                  ref.read(cashTransactionProvider.notifier).addTransaction(txn);
                  Navigator.pop(context);
                }
              },
              child: const Text('Thêm'),
            ),
          ],
        ),
      ),
    );
  }

  String _fmt(double v) {
    final s = v.toStringAsFixed(0);
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
      buf.write(s[i]);
    }
    return '$bufđ';
  }

  String _formatDate(DateTime d) => '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
}
