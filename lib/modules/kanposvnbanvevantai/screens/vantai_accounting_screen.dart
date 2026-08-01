import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/vantai_providers.dart';
import '../models/vantai_expense.dart';
import '../models/vantai_trip.dart';

class VantaiAccountingScreen extends ConsumerStatefulWidget {
  const VantaiAccountingScreen({super.key});

  @override
  ConsumerState<VantaiAccountingScreen> createState() => _VantaiAccountingScreenState();
}

class _VantaiAccountingScreenState extends ConsumerState<VantaiAccountingScreen> {
  VantaiTrip? _selectedTrip;
  ExpenseCategory _selectedCategory = ExpenseCategory.FUEL;
  final _amountCtrl = TextEditingController();
  final _descCtrl = TextEditingController();

  void _submitExpense() async {
    final amount = double.tryParse(_amountCtrl.text) ?? 0;
    if (amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Vui lòng nhập số tiền hợp lệ')));
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
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Lập phiếu chi thành công!')));
      _amountCtrl.clear();
      _descCtrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final tripsAsync = ref.watch(vantaiTripsProvider);
    final expensesAsync = ref.watch(vantaiExpensesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Sổ Quỹ & Kế Toán Chi Phí')),
      body: LayoutBuilder(
        builder: (context, constraints) {
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
          return Column(
            children: [
              Expanded(flex: 1, child: form),
              const Divider(height: 1, thickness: 1),
              Expanded(flex: 2, child: list),
            ],
          );
        },
      ),
    );
  }

  Widget _buildExpenseForm(AsyncValue<List<VantaiTrip>> tripsAsync) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Lập Phiếu Chi Mới', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            DropdownButtonFormField<ExpenseCategory>(
              isExpanded: true,
              decoration: const InputDecoration(labelText: 'Loại Chi Phí', border: OutlineInputBorder()),
              value: _selectedCategory,
              items: ExpenseCategory.values.map((c) => DropdownMenuItem(value: c, child: Text(c.label))).toList(),
              onChanged: (val) => setState(() => _selectedCategory = val ?? ExpenseCategory.OTHER),
            ),
            const SizedBox(height: 16),
            tripsAsync.when(
              data: (trips) => DropdownButtonFormField<VantaiTrip>(
                isExpanded: true,
                decoration: const InputDecoration(labelText: 'Gắn với Chuyến Xe (Không bắt buộc)', border: OutlineInputBorder()),
                value: _selectedTrip,
                items: [
                  const DropdownMenuItem<VantaiTrip>(value: null, child: Text('Không gắn chuyến')),
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
              decoration: const InputDecoration(labelText: 'Số tiền chi (đ)', border: OutlineInputBorder(), prefixIcon: Icon(Icons.money)),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descCtrl,
              decoration: const InputDecoration(labelText: 'Lý do / Ghi chú', border: OutlineInputBorder()),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                onPressed: _submitExpense,
                child: const Text('Lập Phiếu Chi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
        if (expenses.isEmpty) return const Center(child: Text('Chưa có khoản chi nào.'));
        // Sort by date descending
        final sorted = List<VantaiExpense>.from(expenses)..sort((a, b) => b.date?.compareTo(a.date ?? DateTime.now()) ?? 0);

        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.red[50],
              width: double.infinity,
              child: Text('SỔ NHẬT KÝ CHI TIỀN', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red[900]), textAlign: TextAlign.center),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: sorted.length,
                itemBuilder: (context, index) {
                  final exp = sorted[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.money_off, color: Colors.red, size: 40),
                      title: Text(exp.description.isNotEmpty ? exp.description : exp.category.label, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Loại: ${exp.category.label}\nNgày: ${exp.date?.toLocal()} ${exp.trip.value != null ? '\nChuyến: ${exp.trip.value!.route.value?.routeName}' : ''}'),
                      trailing: Text('-${exp.amount.toStringAsFixed(0)} đ', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 16)),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, st) => Center(child: Text('Lỗi: $err')),
    );
  }
}
