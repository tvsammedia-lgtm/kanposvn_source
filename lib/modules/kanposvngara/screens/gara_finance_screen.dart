import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/gara_providers.dart';
import '../models/gara_finance.dart';
import '../models/gara_customer.dart';
import '../models/gara_supplier.dart';

class GaraFinanceScreen extends ConsumerStatefulWidget {
  const GaraFinanceScreen({super.key});

  @override
  ConsumerState<GaraFinanceScreen> createState() => _GaraFinanceScreenState();
}

class _GaraFinanceScreenState extends ConsumerState<GaraFinanceScreen> {

  void _showReceiptDialog(BuildContext context, GaraCustomer customer) {
    final amountCtrl = TextEditingController();
    
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Thu Nợ: ${customer.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Nợ hiện tại: ${customer.currentDebt} đ', style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 16),
            TextField(controller: amountCtrl, decoration: const InputDecoration(labelText: 'Số tiền thu (VNĐ)'), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () async {
              final amt = double.tryParse(amountCtrl.text) ?? 0;
              if (amt > 0) {
                final tx = GaraFinanceTransaction()
                  ..transactionId = const Uuid().v4()
                  ..documentCode = 'PT-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}'
                  ..type = GaraFinanceTransactionType.RECEIPT
                  ..amount = amt
                  ..description = 'Thu nợ khách hàng ${customer.name}'
                  ..transactionDate = DateTime.now();

                tx.customer.value = customer;

                await ref.read(garaFinanceProvider.notifier).createTransaction(tx);
                ref.read(garaCustomersProvider.notifier).loadCustomers(); // Refresh debt
                if (context.mounted) Navigator.pop(ctx);
              }
            },
            child: const Text('Lập Phiếu Thu'),
          ),
        ],
      )
    );
  }

  void _showSupplierPaymentDialog(BuildContext context, GaraSupplier supplier) {
    final amountCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Trả Nợ NCC: ${supplier.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Nợ hiện tại: ${supplier.currentDebt} đ', style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 16),
            TextField(controller: amountCtrl, decoration: const InputDecoration(labelText: 'Số tiền trả (VNĐ)'), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () async {
              final amt = double.tryParse(amountCtrl.text) ?? 0;
              if (amt > 0) {
                final tx = GaraFinanceTransaction()
                  ..transactionId = const Uuid().v4()
                  ..documentCode = 'PC-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}'
                  ..type = GaraFinanceTransactionType.PAYMENT
                  ..amount = amt
                  ..description = 'Trả nợ NCC ${supplier.name}'
                  ..transactionDate = DateTime.now();

                tx.supplier.value = supplier;

                await ref.read(garaFinanceProvider.notifier).createTransaction(tx);
                ref.read(garaSuppliersProvider.notifier).loadSuppliers();
                if (context.mounted) Navigator.pop(ctx);
              }
            },
            child: const Text('Lập Phiếu Chi'),
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sổ Quỹ & Công Nợ'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Sổ Quỹ (Thu/Chi)'),
              Tab(text: 'Nợ Khách Hàng'),
              Tab(text: 'Nợ Nhà Cung Cấp'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Sổ Quỹ
            Consumer(
              builder: (context, ref, child) {
                final financeAsync = ref.watch(garaFinanceProvider);
                return financeAsync.when(
                  data: (txs) {
                    if (txs.isEmpty) return const Center(child: Text('Chưa có giao dịch.'));
                    return ListView.builder(
                      itemCount: txs.length,
                      itemBuilder: (context, index) {
                        final tx = txs[index];
                        final dateStr = tx.transactionDate != null
                            ? '${tx.transactionDate!.day.toString().padLeft(2, '0')}/${tx.transactionDate!.month.toString().padLeft(2, '0')}/${tx.transactionDate!.year}'
                            : '';
                        return ListTile(
                          leading: Icon(
                            tx.type == GaraFinanceTransactionType.RECEIPT ? Icons.add_circle : Icons.remove_circle,
                            color: tx.type == GaraFinanceTransactionType.RECEIPT ? Colors.green : Colors.red,
                          ),
                          title: Text(tx.description),
                          subtitle: Text('${tx.documentCode} - $dateStr'),
                          trailing: Text(
                            '${tx.type == GaraFinanceTransactionType.RECEIPT ? "+" : "-"}${tx.amount} đ', 
                            style: TextStyle(fontWeight: FontWeight.bold, color: tx.type == GaraFinanceTransactionType.RECEIPT ? Colors.green : Colors.red)
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, st) => Center(child: Text('Lỗi: $err')),
                );
              }
            ),

            // Tab 2: Công nợ khách hàng
            Consumer(
              builder: (context, ref, child) {
                final customersAsync = ref.watch(garaCustomersProvider);
                return customersAsync.when(
                  data: (customers) {
                    final debtors = customers.where((c) => c.currentDebt > 0).toList();
                    if (debtors.isEmpty) return const Center(child: Text('Không có khách hàng nợ.'));
                    
                    return ListView.builder(
                      itemCount: debtors.length,
                      itemBuilder: (context, index) {
                        final c = debtors[index];
                        return ListTile(
                          leading: const CircleAvatar(child: Icon(Icons.person)),
                          title: Text(c.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(c.phone),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Nợ: ${c.currentDebt} đ', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                              const SizedBox(width: 16),
                              ElevatedButton(
                                onPressed: () => _showReceiptDialog(context, c),
                                child: const Text('Thu Nợ'),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, st) => Center(child: Text('Lỗi: $err')),
                );
              }
            ),

            // Tab 3: Công nợ nhà cung cấp
            Consumer(
              builder: (context, ref, child) {
                final suppliersAsync = ref.watch(garaSuppliersProvider);
                return suppliersAsync.when(
                  data: (suppliers) {
                    final debtors = suppliers.where((s) => s.currentDebt > 0).toList();
                    if (debtors.isEmpty) return const Center(child: Text('Không có nhà cung cấp nợ.'));

                    return ListView.builder(
                      itemCount: debtors.length,
                      itemBuilder: (context, index) {
                        final s = debtors[index];
                        return ListTile(
                          leading: const CircleAvatar(child: Icon(Icons.business)),
                          title: Text(s.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(s.phone),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Nợ: ${s.currentDebt} đ', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                              const SizedBox(width: 16),
                              ElevatedButton(
                                onPressed: () => _showSupplierPaymentDialog(context, s),
                                child: const Text('Trả Nợ'),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, st) => Center(child: Text('Lỗi: $err')),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
