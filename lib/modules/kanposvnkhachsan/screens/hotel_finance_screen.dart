import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:isar/isar.dart';

import '../models/hotel_finance_accounting.dart';
import '../providers/hotel_providers.dart';

class HotelFinanceScreen extends ConsumerStatefulWidget {
  const HotelFinanceScreen({super.key});

  @override
  ConsumerState<HotelFinanceScreen> createState() => _HotelFinanceScreenState();
}

class _HotelFinanceScreenState extends ConsumerState<HotelFinanceScreen> {
  DateTime? _startDate;
  DateTime? _endDate;
  CashTransactionType? _filterType;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _startDate = DateTime(now.year, now.month, 1);
    _endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thu - Chi (Quỹ tiền mặt)'),
        backgroundColor: const Color(0xFF0284C7),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(() {}),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFilterBar(),
          _buildSummary(),
          const Divider(height: 1),
          Expanded(child: _buildTransactionList()),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddTransactionDialog(context, ref),
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
          _filterChip('Tất cả', _filterType == null, () => setState(() => _filterType = null)),
          const SizedBox(width: 6),
          _filterChip('Thu', _filterType == CashTransactionType.INCOME, () => setState(() => _filterType = CashTransactionType.INCOME)),
          const SizedBox(width: 6),
          _filterChip('Chi', _filterType == CashTransactionType.EXPENSE, () => setState(() => _filterType = CashTransactionType.EXPENSE)),
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

  Widget _filterChip(String label, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF0284C7) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF0284C7)),
        ),
        child: Text(label, style: TextStyle(color: selected ? Colors.white : const Color(0xFF0284C7), fontSize: 12, fontWeight: FontWeight.bold)),
      ),
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

  Widget _buildSummary() {
    return FutureBuilder<Map<String, double>>(
      future: _loadSummary(),
      builder: (context, snapshot) {
        final data = snapshot.data;
        final income = data?['income'] ?? 0;
        final expense = data?['expense'] ?? 0;
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
    );
  }

  Widget _summaryItem(String label, double amount, Color color) {
    return Expanded(
      child: Column(
        children: [
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          const SizedBox(height: 4),
          Text('${amount.toStringAsFixed(0)} đ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  Future<Map<String, double>> _loadSummary() async {
    final isarService = ref.read(hotelIsarServiceProvider);
    final db = await isarService.db;
    final query = db.hotelCashTransactions.filter()
        .createdAtBetween(_startDate ?? DateTime(2020), _endDate ?? DateTime.now());
    final transactions = await query.findAll();
    double income = 0, expense = 0;
    for (final t in transactions) {
      if (t.type == CashTransactionType.INCOME) {
        income += t.amount;
      } else {
        expense += t.amount;
      }
    }
    return {'income': income, 'expense': expense};
  }

  Widget _buildTransactionList() {
    return FutureBuilder<List<HotelCashTransaction>>(
      future: _loadTransactions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        final transactions = snapshot.data ?? [];
        if (transactions.isEmpty) {
          return const Center(child: Text('Không có giao dịch trong kỳ'));
        }
        return ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final t = transactions[index];
            final isIncome = t.type == CashTransactionType.INCOME;
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: isIncome ? Colors.green[50] : Colors.red[50],
                child: Icon(isIncome ? Icons.arrow_downward : Icons.arrow_upward, color: isIncome ? Colors.green : Colors.red, size: 20),
              ),
              title: Text(t.description.isEmpty ? t.category : t.description, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${t.category} • ${_fmt(t.createdAt)}'),
              trailing: Text(
                '${isIncome ? '+' : '-'}${t.amount.toStringAsFixed(0)} đ',
                style: TextStyle(color: isIncome ? Colors.green : Colors.red, fontWeight: FontWeight.bold, fontSize: 15),
              ),
            );
          },
        );
      },
    );
  }

  Future<List<HotelCashTransaction>> _loadTransactions() async {
    final isarService = ref.read(hotelIsarServiceProvider);
    final db = await isarService.db;
    var query = db.hotelCashTransactions.filter()
        .createdAtBetween(_startDate ?? DateTime(2020), _endDate ?? DateTime.now());
    if (_filterType != null) {
      query = query.typeEqualTo(_filterType!);
    }
    return query.sortByCreatedAtDesc().findAll();
  }

  static const _incomeCategories = ['Tiền phòng', 'Dịch vụ', 'Giặt ủi', 'Mini Bar', 'Bán hàng', 'Khác'];
  static const _expenseCategories = ['Điện', 'Nước', 'Internet', 'Lương', 'Thuê nhà', 'Khấu hao', 'Vệ sinh', 'Giặt', 'Marketing', 'Thuế', 'Thanh toán NCC', 'Khác'];

  void _showAddTransactionDialog(BuildContext context, WidgetRef ref) {
    var type = CashTransactionType.INCOME;
    final amountCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    String category = _incomeCategories[0];
    final createdByCtrl = TextEditingController(text: 'Lễ tân');

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setLocalState) => AlertDialog(
          title: const Text('Thêm phiếu Thu / Chi'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<CashTransactionType>(
                        title: const Text('Thu'),
                        value: CashTransactionType.INCOME,
                        groupValue: type,
                        onChanged: (v) => setLocalState(() {
                          type = v!;
                          category = _incomeCategories[0];
                        }),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<CashTransactionType>(
                        title: const Text('Chi'),
                        value: CashTransactionType.EXPENSE,
                        groupValue: type,
                        onChanged: (v) => setLocalState(() {
                          type = v!;
                          category = _expenseCategories[0];
                        }),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: category,
                  items: (type == CashTransactionType.INCOME ? _incomeCategories : _expenseCategories)
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (v) => setLocalState(() => category = v ?? ''),
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
                const SizedBox(height: 8),
                TextField(
                  controller: createdByCtrl,
                  decoration: const InputDecoration(labelText: 'Người thực hiện', border: OutlineInputBorder()),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('HỦY')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () async {
                final amount = double.tryParse(amountCtrl.text) ?? 0;
                if (amount <= 0) return;
                final txn = HotelCashTransaction()
                  ..transactionId = const Uuid().v4()
                  ..type = type
                  ..amount = amount
                  ..category = category
                  ..description = descCtrl.text.trim()
                  ..createdBy = createdByCtrl.text.trim()
                  ..createdAt = DateTime.now();
                final isarService = ref.read(hotelIsarServiceProvider);
                final db = await isarService.db;
                await db.writeTxn(() async {
                  await db.hotelCashTransactions.put(txn);
                });
                if (ctx.mounted) Navigator.pop(ctx);
                setState(() {});
              },
              child: const Text('LƯU', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  String _fmt(DateTime t) => '${t.day.toString().padLeft(2, '0')}/${t.month.toString().padLeft(2, '0')} ${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';
}
