import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/taphoa_providers.dart';

class TapHoaFinanceScreen extends ConsumerWidget {
  const TapHoaFinanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                        subtitle: Text('${tx.category} - ${tx.paymentMethod}'),
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
        onPressed: () {
          // Show dialog to add new income/expense
        },
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
