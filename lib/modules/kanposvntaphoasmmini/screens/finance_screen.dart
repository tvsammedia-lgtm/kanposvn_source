import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/finance.dart';
import '../providers/taphoa_providers.dart';

class TapHoaFinanceScreen extends ConsumerStatefulWidget {
  const TapHoaFinanceScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TapHoaFinanceScreen> createState() => _TapHoaFinanceScreenState();
}

class _TapHoaFinanceScreenState extends ConsumerState<TapHoaFinanceScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(tapHoaCashTransactionsProvider.notifier).loadTransactions();
    });
  }

  Future<void> _showAddDialog() async {
    String type = 'INCOME';
    final titleController = TextEditingController();
    final amountController = TextEditingController();
    final categoryController = TextEditingController();
    final noteController = TextEditingController();
    String paymentMethod = 'Tiền mặt';

    await showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogContext, setDialogState) => AlertDialog(
          title: const Text('Thêm phiếu thu / chi'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(value: 'INCOME', label: Text('Thu')),
                    ButtonSegment(value: 'EXPENSE', label: Text('Chi')),
                  ],
                  selected: {type},
                  onSelectionChanged: (value) =>
                      setDialogState(() => type = value.first),
                ),
                const SizedBox(height: 12),
                TextField(controller: titleController,
                    decoration: const InputDecoration(labelText: 'Tiêu đề *')),
                TextField(controller: amountController,
                    decoration: const InputDecoration(
                        labelText: 'Số tiền (đ) *', prefixText: '₫ '),
                    keyboardType: TextInputType.number),
                TextField(controller: categoryController,
                    decoration: const InputDecoration(
                        labelText: 'Danh mục',
                        hintText: 'VD: Điện nước, Mặt bằng, Lương...')),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  initialValue: paymentMethod,
                  decoration: const InputDecoration(
                      labelText: 'Phương thức', border: OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: 'Tiền mặt', child: Text('Tiền mặt')),
                    DropdownMenuItem(value: 'Chuyển khoản', child: Text('Chuyển khoản')),
                    DropdownMenuItem(value: 'QR Code', child: Text('QR Code')),
                  ],
                  onChanged: (value) =>
                      setDialogState(() => paymentMethod = value ?? 'Tiền mặt'),
                ),
                TextField(controller: noteController,
                    decoration: const InputDecoration(labelText: 'Ghi chú')),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text('Hủy')),
            ElevatedButton(
              onPressed: () {
                final amount = double.tryParse(amountController.text) ?? 0;
                if (titleController.text.trim().isEmpty || amount <= 0) {
                  ScaffoldMessenger.of(dialogContext).showSnackBar(
                    const SnackBar(content: Text('Vui lòng nhập tiêu đề và số tiền')),
                  );
                  return;
                }
                final tx = TapHoaCashTransaction()
                  ..transactionId = 'CTX_${DateTime.now().millisecondsSinceEpoch}'
                  ..title = titleController.text
                  ..type = type
                  ..category = categoryController.text.isEmpty
                      ? (type == 'INCOME' ? 'Thu khác' : 'Chi khác')
                      : categoryController.text
                  ..amount = amount
                  ..paymentMethod = paymentMethod
                  ..timestamp = DateTime.now()
                  ..performerName = 'Thu ngân'
                  ..note = noteController.text;
                ref.read(tapHoaCashTransactionsProvider.notifier).saveTransaction(tx);
                Navigator.pop(dialogContext);
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
    final transactions = ref.watch(tapHoaCashTransactionsProvider);

    double totalIncome = 0;
    double totalExpense = 0;
    for (var tx in transactions) {
      if (tx.type == 'INCOME') totalIncome += tx.amount;
      if (tx.type == 'EXPENSE') totalExpense += tx.amount;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thu Chi & Tài Chính'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSummaryBox('Tổng thu', totalIncome, Colors.green),
                _buildSummaryBox('Tổng chi', totalExpense, Colors.red),
                _buildSummaryBox('Tồn quỹ', totalIncome - totalExpense, Colors.blue),
              ],
            ),
          ),
          Expanded(
            child: transactions.isEmpty
                ? const Center(child: Text('Chưa có giao dịch thu chi nào.'))
                : ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final tx = transactions[index];
                      final isIncome = tx.type == 'INCOME';
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: isIncome ? Colors.green[100] : Colors.red[100],
                          child: Icon(
                            isIncome ? Icons.arrow_downward : Icons.arrow_upward,
                            color: isIncome ? Colors.green : Colors.red,
                          ),
                        ),
                        title: Text(tx.title),
                        subtitle: Text(
                            '${tx.category} - ${tx.paymentMethod}\n${tx.timestamp.day}/${tx.timestamp.month}/${tx.timestamp.year} ${tx.timestamp.hour}:${tx.timestamp.minute.toString().padLeft(2, '0')}'),
                        isThreeLine: true,
                        trailing: Text(
                          '${isIncome ? '+' : '-'}${tx.amount.toStringAsFixed(0)} đ',
                          style: TextStyle(
                            color: isIncome ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSummaryBox(String label, double amount, Color color) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          '${amount.toStringAsFixed(0)} đ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }
}
