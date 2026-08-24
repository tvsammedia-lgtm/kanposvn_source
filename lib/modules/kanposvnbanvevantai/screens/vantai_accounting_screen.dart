import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../providers/vantai_providers.dart';
import '../models/vantai_expense.dart';
import '../models/vantai_cashbook.dart';
import '../models/vantai_trip.dart';
import '../services/vantai_business_logic.dart';

/// PRD mục 18-19: Quỹ (phiếu thu/chi, sổ quỹ tiền mặt + ngân hàng)
/// và kế toán chi phí theo khoản mục.
class VantaiAccountingScreen extends ConsumerStatefulWidget {
  const VantaiAccountingScreen({super.key});

  @override
  ConsumerState<VantaiAccountingScreen> createState() =>
      _VantaiAccountingScreenState();
}

class _VantaiAccountingScreenState extends ConsumerState<VantaiAccountingScreen> {
  VantaiTrip? _selectedTrip;
  ExpenseCategory _selectedCategory = ExpenseCategory.FUEL;
  final _amountCtrl = TextEditingController();
  final _descCtrl = TextEditingController();

  static final _money =
      NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0);
  static final _dateFmt = DateFormat('dd/MM/yyyy HH:mm');

  void _submitExpense() async {
    final amount = double.tryParse(_amountCtrl.text) ?? 0;
    if (amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Vui lòng nhập số tiền hợp lệ')));
      return;
    }

    final exp = VantaiExpense()
      ..expenseId = const Uuid().v4()
      ..category = _selectedCategory
      ..amount = amount
      ..description = _descCtrl.text
      ..date = DateTime.now();

    if (_selectedTrip != null) {
      exp.trip.value = _selectedTrip;
    }

    await ref.read(vantaiExpensesProvider.notifier).addExpense(exp);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Lập phiếu chi thành công!'),
          backgroundColor: Colors.green));
      _amountCtrl.clear();
      _descCtrl.clear();
    }
  }

  void _submitCashTx(CashTxType type) async {
    final okAmount = await showDialog<(double, CashAccount, String)>(
      context: context,
      builder: (ctx) {
        final amtCtrl = TextEditingController(text: _amountCtrl.text);
        final noteCtrl = TextEditingController(text: _descCtrl.text);
        var acc = type == CashTxType.THU ? CashAccount.CASH : CashAccount.BANK;
        return AlertDialog(
          title: Text(type == CashTxType.THU ? 'LẬP PHIẾU THU' : 'LẬP PHIẾU CHI'),
          content: StatefulBuilder(
            builder: (ctx, setD) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<CashAccount>(
                  value: acc,
                  decoration: const InputDecoration(
                      labelText: 'Nguồn quỹ', border: OutlineInputBorder()),
                  items: CashAccount.values
                      .map((a) => DropdownMenuItem(value: a, child: Text(a.label)))
                      .toList(),
                  onChanged: (v) => setD(() => acc = v ?? acc),
                ),
                const SizedBox(height: 8),
                TextField(
                    controller: amtCtrl,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: const InputDecoration(
                        labelText: 'Số tiền (đ)', border: OutlineInputBorder())),
                const SizedBox(height: 8),
                TextField(
                    controller: noteCtrl,
                    decoration: const InputDecoration(
                        labelText: 'Lý do / Ghi chú',
                        border: OutlineInputBorder())),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Hủy')),
            FilledButton(
                onPressed: () => Navigator.pop(ctx, (
                      double.tryParse(amtCtrl.text.trim()) ?? 0,
                      acc,
                      noteCtrl.text.trim()
                    )),
                child: const Text('Lưu')),
          ],
        );
      },
    );
    if (okAmount == null || okAmount.$1 <= 0 || !mounted) return;
    await ref
        .read(vantaiCashTxProvider.notifier)
        .addManual(type, okAmount.$2, okAmount.$1, okAmount.$3);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(type == CashTxType.THU
            ? 'Đã lập phiếu thu!'
            : 'Đã lập phiếu chi!'),
        backgroundColor: Colors.green));
    _amountCtrl.clear();
    _descCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    final tripsAsync = ref.watch(vantaiTripsProvider);
    final expensesAsync = ref.watch(vantaiExpensesProvider);
    final cashAsync = ref.watch(vantaiCashTxProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kế Toán & Sổ Quỹ'),
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.receipt_long), text: 'Chi phí'),
            Tab(icon: Icon(Icons.account_balance_wallet), text: 'Sổ quỹ'),
          ]),
        ),
        body: TabBarView(children: [
          // ================= TAB CHI PHÍ =================
          LayoutBuilder(builder: (context, constraints) {
            final form = _buildExpenseForm(tripsAsync);
            final list = _buildExpenseList(expensesAsync);
            if (constraints.maxWidth >= 700) {
              return Row(
                children: [
                  Expanded(flex: 1, child: form),
                  const VerticalDivider(width: 1, thickness: 1),
                  Expanded(flex: 2, child: list),
                ],
              );
            }
            return Column(children: [
              Expanded(flex: 1, child: form),
              const Divider(height: 1, thickness: 1),
              Expanded(flex: 2, child: list),
            ]);
          }),
          // ================= TAB SỔ QUỸ =================
          cashAsync.when(
            data: (txs) {
              final cashBal = VantaiBusinessLogic.cashBalance(txs
                  .map((t) => (isThu: t.type == CashTxType.THU, amount: t.amount))
                  .where((_) => true));
              final cashOnly = VantaiBusinessLogic.cashBalance(txs
                  .where((t) => t.account == CashAccount.CASH)
                  .map((t) => (isThu: t.type == CashTxType.THU, amount: t.amount)));
              final bankOnly = VantaiBusinessLogic.cashBalance(txs
                  .where((t) => t.account == CashAccount.BANK)
                  .map((t) => (isThu: t.type == CashTxType.THU, amount: t.amount)));
              return Column(children: [
                Card(
                  margin: const EdgeInsets.all(12),
                  color: Colors.teal[50],
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      runSpacing: 8,
                      children: [
                        _balanceChip('Quỹ tiền mặt', cashOnly, Colors.teal),
                        _balanceChip('Ngân hàng', bankOnly, Colors.indigo),
                        _balanceChip('Tổng tài sản tiền', cashBal, Colors.blue),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(children: [
                    Expanded(
                      child: FilledButton.icon(
                        style: FilledButton.styleFrom(backgroundColor: Colors.green),
                        icon: const Icon(Icons.south_west),
                        label: const Text('PHIẾU THU'),
                        onPressed: () => _submitCashTx(CashTxType.THU),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton.icon(
                        style: FilledButton.styleFrom(backgroundColor: Colors.red),
                        icon: const Icon(Icons.north_east),
                        label: const Text('PHIẾU CHI'),
                        onPressed: () => _submitCashTx(CashTxType.CHI),
                      ),
                    ),
                  ]),
                ),
                Expanded(
                  child: txs.isEmpty
                      ? const Center(child: Text('Chưa có giao dịch quỹ.'))
                      : ListView.builder(
                          padding: const EdgeInsets.all(12),
                          itemCount: txs.length,
                          itemBuilder: (_, i) {
                            final t = txs[i];
                            final isThu = t.type == CashTxType.THU;
                            return ListTile(
                              leading: Icon(
                                isThu
                                    ? Icons.arrow_downward
                                    : Icons.arrow_upward,
                                color: isThu ? Colors.green : Colors.red,
                              ),
                              title: Text(t.note.isEmpty ? t.refCode : t.note),
                              subtitle: Text(
                                  '${_dateFmt.format(t.createdAt)} • ${t.account.label}'
                                  '${t.refCode.isNotEmpty ? " • ${t.refCode}" : ""}'),
                              trailing: Text(
                                  '${isThu ? "+" : "-"}${_money.format(t.amount)}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: isThu ? Colors.green : Colors.red)),
                            );
                          },
                        ),
                ),
              ]);
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Lỗi: $e')),
          ),
        ]),
      ),
    );
  }

  Widget _balanceChip(String label, double value, Color color) {
    return Chip(
      backgroundColor: color.withValues(alpha: 0.12),
      avatar: Icon(Icons.account_balance, color: color, size: 18),
      label: Text('$label: ${_money.format(value)}',
          style: TextStyle(fontWeight: FontWeight.bold, color: color)),
    );
  }

  Widget _buildExpenseForm(AsyncValue<List<VantaiTrip>> tripsAsync) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Lập Phiếu Chi Mới',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            DropdownButtonFormField<ExpenseCategory>(
              isExpanded: true,
              decoration: const InputDecoration(
                  labelText: 'Loại Chi Phí', border: OutlineInputBorder()),
              value: _selectedCategory,
              items: ExpenseCategory.values
                  .map((c) => DropdownMenuItem(value: c, child: Text(c.label)))
                  .toList(),
              onChanged: (val) =>
                  setState(() => _selectedCategory = val ?? ExpenseCategory.OTHER),
            ),
            const SizedBox(height: 16),
            tripsAsync.when(
              data: (trips) => DropdownButtonFormField<VantaiTrip>(
                isExpanded: true,
                decoration: const InputDecoration(
                    labelText: 'Gắn với Chuyến Xe (Không bắt buộc)',
                    border: OutlineInputBorder()),
                value: _selectedTrip,
                items: [
                  const DropdownMenuItem<VantaiTrip>(
                      value: null, child: Text('Không gắn chuyến')),
                  ...trips.map((t) => DropdownMenuItem(
                        value: t,
                        child: Text(
                          '${t.route.value?.routeName} - ${t.departureTime?.toLocal()}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                ],
                onChanged: (val) => setState(() => _selectedTrip = val),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (_, __) => const Text('Lỗi tải chuyến'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _amountCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Số tiền chi (đ)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.money)),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descCtrl,
              decoration: const InputDecoration(
                  labelText: 'Lý do / Ghi chú', border: OutlineInputBorder()),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, foregroundColor: Colors.white),
                onPressed: _submitExpense,
                child: const Text('Lập Phiếu Chi',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpenseList(AsyncValue<List<VantaiExpense>> expensesAsync) {
    return expensesAsync.when(
      data: (expenses) {
        if (expenses.isEmpty) {
          return const Center(child: Text('Chưa có khoản chi nào.'));
        }
        final sorted = List<VantaiExpense>.from(expenses)
          ..sort((a, b) =>
              (b.date ?? DateTime.now()).compareTo(a.date ?? DateTime.now()));
        final byCat = <ExpenseCategory, double>{};
        for (final e in sorted) {
          byCat[e.category] = (byCat[e.category] ?? 0) + e.amount;
        }
        return Column(children: [
          Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            color: Colors.red[50],
            child: Wrap(
              spacing: 6,
              runSpacing: 4,
              children: byCat.entries
                  .map((e) => Chip(
                        visualDensity: VisualDensity.compact,
                        label: Text('${e.key.label}: ${_money.format(e.value)}',
                            style: const TextStyle(fontSize: 11)),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: sorted.length,
              itemBuilder: (context, index) {
                final exp = sorted[index];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.money_off,
                        color: Colors.red, size: 36),
                    title: Text(
                        exp.description.isNotEmpty
                            ? exp.description
                            : exp.category.label,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(
                        'Loại: ${exp.category.label}\nNgày: ${exp.date != null ? _dateFmt.format(exp.date!) : "-"}'
                        '${exp.trip.value != null ? '\nChuyến: ${exp.trip.value!.route.value?.routeName}' : ''}'),
                    isThreeLine: true,
                    trailing: Text('-${_money.format(exp.amount)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 16)),
                  ),
                );
              },
            ),
          ),
        ]);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, st) => Center(child: Text('Lỗi: $err')),
    );
  }
}
