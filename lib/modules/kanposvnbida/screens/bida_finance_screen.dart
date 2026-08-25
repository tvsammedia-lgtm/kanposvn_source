import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/bida_finance.dart';
import '../providers/bida_partner_providers.dart';

final _currency = NumberFormat.currency(locale: 'vi_VN', symbol: '');
final _dateFmt = DateFormat('dd/MM/yyyy HH:mm');

/// Tab "Thu Chi" — quỹ tiền mặt, phiếu thu/chi thủ công.
class BidaFinanceScreen extends ConsumerStatefulWidget {
  const BidaFinanceScreen({super.key});

  @override
  ConsumerState<BidaFinanceScreen> createState() => _BidaFinanceScreenState();
}

class _BidaFinanceScreenState extends ConsumerState<BidaFinanceScreen> {
  String? _filterType; // null = all, 'income', 'expense'
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _startDate = DateTime(now.year, now.month, 1);
    _endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
  }

  @override
  Widget build(BuildContext context) {
    final financeAsync = ref.watch(bidaFinanceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thu - Chi (Quỹ tiền mặt)'),
        backgroundColor: const Color(0xFF059669),
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () => ref.read(bidaFinanceProvider.notifier).loadTransactions()),
        ],
      ),
      body: Column(
        children: [
          _buildFilterBar(),
          _buildSummary(financeAsync),
          const Divider(height: 1),
          Expanded(
            child: financeAsync.when(
              data: (list) {
                final filtered = _filterList(list);
                if (filtered.isEmpty) {
                  return const Center(child: Text('Không có giao dịch trong kỳ'));
                }
                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final t = filtered[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: t.isIncome ? Colors.green[50] : Colors.red[50],
                        child: Icon(
                          t.isIncome ? Icons.arrow_downward : Icons.arrow_upward,
                          color: t.isIncome ? Colors.green : Colors.red,
                          size: 20,
                        ),
                      ),
                      title: Text(t.note.isEmpty ? (t.isIncome ? t.incomeCategory : t.expenseCategory) : t.note,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('${t.isIncome ? t.incomeCategory : t.expenseCategory} · ${_dateFmt.format(t.createdAt)}'),
                      trailing: Text(
                        '${t.isIncome ? '+' : '-'}${_currency.format(t.amount)}đ',
                        style: TextStyle(
                          color: t.isIncome ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Lỗi: $e')),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddDialog(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Thêm phiếu'),
      ),
    );
  }

  Widget _buildFilterBar() {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          _chip('Tất cả', null),
          const SizedBox(width: 6),
          _chip('Thu', 'income'),
          const SizedBox(width: 6),
          _chip('Chi', 'expense'),
          const Spacer(),
          TextButton.icon(
            onPressed: _pickDateRange,
            icon: const Icon(Icons.date_range, size: 18),
            label: Text(_formatDateRange(), style: const TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, String? value) {
    final selected = _filterType == value;
    return FilterChip(
      label: Text(label, style: TextStyle(fontSize: 12, color: selected ? Colors.white : const Color(0xFF059669))),
      selected: selected,
      onSelected: (_) => setState(() => _filterType = value),
      selectedColor: const Color(0xFF059669),
      checkmarkColor: Colors.white,
      visualDensity: VisualDensity.compact,
    );
  }

  String _formatDateRange() {
    if (_startDate == null || _endDate == null) return 'Chọn ngày';
    return '${_startDate!.day}/${_startDate!.month}/${_startDate!.year} - ${_endDate!.day}/${_endDate!.month}/${_endDate!.year}';
  }

  Future<void> _pickDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: _startDate != null && _endDate != null
          ? DateTimeRange(start: _startDate!, end: _endDate!)
          : null,
    );
    if (picked != null && mounted) {
      setState(() {
        _startDate = picked.start;
        _endDate = DateTime(picked.end.year, picked.end.month, picked.end.day, 23, 59, 59);
      });
    }
  }

  Widget _buildSummary(AsyncValue<List<BidaFinanceTx>> async) {
    return async.when(
      data: (list) {
        final filtered = _filterList(list);
        double income = 0, expense = 0;
        for (final t in filtered) {
          if (t.isIncome) {
            income += t.amount;
          } else {
            expense += t.amount;
          }
        }
        final net = income - expense;
        return Container(
          padding: const EdgeInsets.all(12),
          color: Colors.white,
          child: Row(
            children: [
              _summaryItem('Thu', income, Colors.green),
              const SizedBox(width: 16),
              _summaryItem('Chi', expense, Colors.red),
              const SizedBox(width: 16),
              _summaryItem('Thu NET', net, net >= 0 ? Colors.blue : Colors.red),
            ],
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _summaryItem(String label, double amount, Color color) {
    return Expanded(
      child: Column(
        children: [
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          const SizedBox(height: 4),
          Text('${_currency.format(amount)}đ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  List<BidaFinanceTx> _filterList(List<BidaFinanceTx> list) {
    return list.where((t) {
      if (_filterType == 'income' && !t.isIncome) return false;
      if (_filterType == 'expense' && t.isIncome) return false;
      if (_startDate != null && t.createdAt.isBefore(_startDate!)) return false;
      if (_endDate != null && t.createdAt.isAfter(_endDate!)) return false;
      return true;
    }).toList();
  }

  static const _incomeCategories = ['Thu công nợ', 'Thu khác'];
  static const _expenseCategories = [
    'Thuê mặt bằng', 'Điện', 'Nước', 'Internet',
    'Lương', 'Mua hàng', 'Marketing', 'Khấu hao', 'Chi khác'
  ];

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    var isIncome = true;
    final amountCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    String category = _incomeCategories[0];

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setLocal) => AlertDialog(
          title: const Text('Thêm phiếu Thu / Chi'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<bool>(
                        title: const Text('Thu'),
                        value: true,
                        groupValue: isIncome,
                        onChanged: (v) => setLocal(() { isIncome = v!; category = _incomeCategories[0]; }),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<bool>(
                        title: const Text('Chi'),
                        value: false,
                        groupValue: isIncome,
                        onChanged: (v) => setLocal(() { isIncome = v!; category = _expenseCategories[0]; }),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: category,
                  items: (isIncome ? _incomeCategories : _expenseCategories)
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (v) => setLocal(() => category = v ?? ''),
                  decoration: const InputDecoration(labelText: 'Loại thu/chi', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: amountCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(labelText: 'Số tiền (đ)', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descCtrl,
                  decoration: const InputDecoration(labelText: 'Ghi chú', border: OutlineInputBorder()),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('HỦY')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF059669)),
              onPressed: () async {
                final amount = double.tryParse(amountCtrl.text) ?? 0;
                if (amount <= 0) return;
                await ref.read(bidaFinanceProvider.notifier).addTx(
                  isIncome: isIncome,
                  amount: amount,
                  category: category,
                  note: descCtrl.text.trim(),
                );
                if (ctx.mounted) Navigator.pop(ctx);
              },
              child: const Text('LƯU', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
