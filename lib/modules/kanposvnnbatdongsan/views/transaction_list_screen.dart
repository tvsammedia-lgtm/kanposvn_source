import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/batdongsan_providers.dart';
import 'transaction_form_screen.dart';

class TransactionListScreen extends ConsumerWidget {
  const TransactionListScreen({super.key});

  void _deleteTransaction(BuildContext context, WidgetRef ref, int id) async {
    final repo = ref.read(transactionRepositoryProvider);
    await repo.deleteTransaction(id);
    ref.invalidate(transactionsProvider);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã xoá Giao dịch')),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(transactionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách Giao dịch'),
      ),
      body: asyncValue.when(
        data: (transactions) {
          if (transactions.isEmpty) {
            return const Center(child: Text('Chưa có dữ liệu.'));
          }
          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return ListTile(
                title: Text(transaction.transactionCode ?? 'Không có mã GD'),
                subtitle: Text('Giá chốt: ${transaction.finalPrice ?? 0} tỷ\nTrạng thái: ${transaction.status.name}'),
                isThreeLine: true,
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Xác nhận xoá'),
                        content: const Text('Bạn có chắc chắn muốn xoá?'),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _deleteTransaction(context, ref, transaction.id);
                            },
                            child: const Text('Xoá', style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransactionFormScreen(transaction: transaction)),
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Lỗi: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TransactionFormScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
