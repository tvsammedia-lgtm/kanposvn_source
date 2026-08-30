import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/tt_finance.dart';
import '../models/tt_partner.dart';
import '../providers/tt_providers.dart';

/// Tab "Thu Chi": phiếu thu + phiếu chi + sổ quỹ nhanh.
class TtFinanceScreen extends ConsumerStatefulWidget {
  const TtFinanceScreen({super.key});

  @override
  ConsumerState<TtFinanceScreen> createState() => _TtFinanceScreenState();
}

class _TtFinanceScreenState extends ConsumerState<TtFinanceScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tab;

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  Future<void> _createReceipt() async {
    final amountCtrl = TextEditingController();
    final noteCtrl = TextEditingController();
    TtReceiptType type = TtReceiptType.OTHER_INCOME;
    TtCustomer? customer;
    TtSupplier? supplier;

    final customers = await ttLoadCustomersForUi(ref);
    final suppliers = await ref.read(ttSuppliersProvider.future);

    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Lập phiếu thu'),
          content: SizedBox(
            width: 380,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<TtReceiptType>(
                  value: type,
                  decoration: const InputDecoration(labelText: 'Loại phiếu thu'),
                  items: [for (final t in TtReceiptType.values) DropdownMenuItem(value: t, child: Text(t.label))],
                  onChanged: (v) => setState(() => type = v ?? TtReceiptType.OTHER_INCOME),
                ),
                const SizedBox(height: 8),
                if (type == TtReceiptType.CUSTOMER_PAYMENT && customers.isNotEmpty)
                  DropdownButtonFormField<TtCustomer>(
                    value: customer,
                    decoration: const InputDecoration(labelText: 'Khách hàng'),
                    items: [for (final c in customers) DropdownMenuItem(value: c, child: Text(c.name))],
                    onChanged: (v) => setState(() => customer = v),
                  ),
                if (type == TtReceiptType.SUPPLIER_PAYMENT && suppliers.isNotEmpty)
                  DropdownButtonFormField<TtSupplier>(
                    value: supplier,
                    decoration: const InputDecoration(labelText: 'Nhà cung cấp'),
                    items: [for (final s in suppliers) DropdownMenuItem(value: s, child: Text(s.name))],
                    onChanged: (v) => setState(() => supplier = v),
                  ),
                const SizedBox(height: 8),
                TextField(controller: amountCtrl, decoration: const InputDecoration(labelText: 'Số tiền (đ)'), keyboardType: TextInputType.number),
                const SizedBox(height: 8),
                TextField(controller: noteCtrl, decoration: const InputDecoration(labelText: 'Ghi chú')),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Hủy')),
            FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Lưu phiếu thu')),
          ],
        ),
      ),
    );
    if (ok != true) return;
    final amount = double.tryParse(amountCtrl.text.replaceAll(',', '.')) ?? 0;
    if (amount <= 0) return;

    final db = await ref.read(ttIsarServiceProvider).db;
    final no = (await db.ttReceipts.count()) + 1;
    final receipt = TtReceipt()
      ..receiptId = const Uuid().v4()
      ..receiptNumber = 'PT${no.toString().padLeft(4, '0')}'
      ..type = type
      ..amount = amount
      ..paymentMethod = 'Tiền mặt'
      ..date = DateTime.now()
      ..note = noteCtrl.text.trim()
      ..createdBy = 'finance';
    if (customer != null) receipt.customer.value = customer;
    if (supplier != null) receipt.supplier.value = supplier;
    await ref.read(ttFinanceProvider.notifier).addReceipt(receipt);
  }

  Future<void> _createExpense() async {
    final amountCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final cats = await ref.read(ttExpenseCategoriesProvider.future);
    TtExpenseCategory? category = cats.isNotEmpty ? cats.first : null;

    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Lập phiếu chi'),
        content: SizedBox(
          width: 380,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<TtExpenseCategory>(
                value: category,
                decoration: const InputDecoration(labelText: 'Nhóm chi phí'),
                items: [for (final c in cats) DropdownMenuItem(value: c, child: Text(c.name))],
                onChanged: (v) => category = v,
              ),
              const SizedBox(height: 8),
              TextField(controller: amountCtrl, decoration: const InputDecoration(labelText: 'Số tiền (đ)'), keyboardType: TextInputType.number),
              const SizedBox(height: 8),
              TextField(controller: descCtrl, decoration: const InputDecoration(labelText: 'Mô tả')),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Hủy')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Lưu phiếu chi')),
        ],
      ),
    );
    if (ok != true) return;
    final amount = double.tryParse(amountCtrl.text.replaceAll(',', '.')) ?? 0;
    if (amount <= 0 || category == null) return;

    final db = await ref.read(ttIsarServiceProvider).db;
    final no = (await db.ttExpenses.count()) + 1;
    final expense = TtExpense()
      ..expenseId = const Uuid().v4()
      ..expenseNumber = 'PC${no.toString().padLeft(4, '0')}'
      ..amount = amount
      ..paymentMethod = 'Tiền mặt'
      ..date = DateTime.now()
      ..description = descCtrl.text.trim()
      ..createdBy = 'finance';
    expense.category.value = category;
    await db.writeTxn(() async {
      await db.ttExpenses.put(expense);
      await expense.category.save();
    });
    ref.invalidate(ttExpensesProvider);
    ref.invalidate(ttDashboardProvider);
  }

  @override
  Widget build(BuildContext context) {
    final receiptsAsync = ref.watch(ttFinanceProvider);
    final expensesAsync = ref.watch(ttExpensesProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF16A34A),
        foregroundColor: Colors.white,
        title: const Text('Thu Chi & Quỹ', style: TextStyle(fontWeight: FontWeight.bold)),
        bottom: TabBar(
          controller: _tab,
          tabs: const [
            Tab(text: 'Phiếu Thu'),
            Tab(text: 'Phiếu Chi'),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Lập phiếu thu',
            icon: const Icon(Icons.login, color: Colors.white),
            onPressed: _createReceipt,
          ),
        ],
      ),
      body: TabBarView(
        controller: _tab,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: _createReceipt,
                    icon: const Icon(Icons.add),
                    label: const Text('Lập Phiếu Thu'),
                  ),
                ),
              ),
              Expanded(
                child: receiptsAsync.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, st) => Center(child: Text('Lỗi: $e')),
                  data: (receipts) {
                    if (receipts.isEmpty) return const Center(child: Text('Chưa có phiếu thu'));
                    return ListView.builder(
                      itemCount: receipts.length,
                      itemBuilder: (context, i) {
                        final r = receipts[i];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.green.shade100,
                            child: const Icon(Icons.login, color: Colors.green),
                          ),
                          title: Text(r.receiptNumber, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('${r.type.label} • ${ttDay(r.date)}\n${r.customer.value?.name ?? r.supplier.value?.name ?? r.note}'),
                          isThreeLine: true,
                          trailing: Text(ttFmtMoney3(r.amount), style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(backgroundColor: Colors.orange),
                    onPressed: _createExpense,
                    icon: const Icon(Icons.add),
                    label: const Text('Lập Phiếu Chi'),
                  ),
                ),
              ),
              Expanded(
                child: expensesAsync.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, st) => Center(child: Text('Lỗi: $e')),
                  data: (expenses) {
                    if (expenses.isEmpty) return const Center(child: Text('Chưa có phiếu chi'));
                    return ListView.builder(
                      itemCount: expenses.length,
                      itemBuilder: (context, i) {
                        final e = expenses[i];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.orange.shade100,
                            child: const Icon(Icons.logout, color: Colors.orange),
                          ),
                          title: Text(e.expenseNumber, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('${e.category.value?.name ?? ''} • ${ttDay(e.date)}\n${e.description}'),
                          isThreeLine: true,
                          trailing: Text(ttFmtMoney3(e.amount), style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String ttDay(DateTime d) =>
    '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';

String ttFmtMoney3(double value) {
  final abs = value.abs().toStringAsFixed(0);
  final buf = StringBuffer();
  for (var i = 0; i < abs.length; i++) {
    if (i > 0 && (abs.length - i) % 3 == 0) buf.write('.');
    buf.write(abs[i]);
  }
  return '${value < 0 ? '-' : ''}${buf.toString()}đ';
}