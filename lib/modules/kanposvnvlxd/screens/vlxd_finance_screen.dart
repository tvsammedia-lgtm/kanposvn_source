import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/vlxd_providers.dart';
import '../models/vlxd_finance.dart';
import '../models/vlxd_partner.dart';

class VlxdFinanceScreen extends ConsumerStatefulWidget {
  const VlxdFinanceScreen({super.key});

  @override
  ConsumerState<VlxdFinanceScreen> createState() => _VlxdFinanceScreenState();
}

class _VlxdFinanceScreenState extends ConsumerState<VlxdFinanceScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Thu Chi & Công Nợ'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Sổ Quỹ (Thu/Chi)'),
              Tab(text: 'Khách hàng (Phải thu)'),
              Tab(text: 'Nhà Cung cấp (Phải trả)'),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_card),
              tooltip: 'Tạo Phiếu Thu/Chi',
              onPressed: () => _showCreateTransactionDialog(context, ref),
            )
          ],
        ),
        body: const TabBarView(
          children: [
            _FinanceHistoryTab(),
            _CustomerDebtTab(),
            _SupplierDebtTab(),
          ],
        ),
      ),
    );
  }

  void _showCreateTransactionDialog(BuildContext context, WidgetRef ref) {
    final amountCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    FinanceTransactionType type = FinanceTransactionType.RECEIPT;
    VlxdCustomer? selectedCustomer;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('Tạo Phiếu Thu / Chi'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<FinanceTransactionType>(
                    value: type,
                    items: FinanceTransactionType.values.map((t) => DropdownMenuItem(value: t, child: Text(t.label))).toList(),
                    onChanged: (v) => setState(() => type = v!),
                    decoration: const InputDecoration(labelText: 'Loại Phiếu'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: amountCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Số tiền (VNĐ)'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: descCtrl,
                    decoration: const InputDecoration(labelText: 'Lý do / Mô tả'),
                  ),
                  const SizedBox(height: 16),
                  if (type == FinanceTransactionType.RECEIPT)
                     ElevatedButton(
                       onPressed: () async {
                           await ref.read(vlxdCustomersProvider.notifier).loadCustomers();
                           // Load customers logic is async, we can just grab current state
                          final state = ref.read(vlxdCustomersProvider);
                          if (state.hasValue && state.value!.isNotEmpty) {
                             setState(() { selectedCustomer = state.value!.first; });
                          } else {
                              if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Chưa có khách hàng nào để thu tiền')));
                          }
                       },
                       child: Text(selectedCustomer == null ? 'Chọn Khách Hàng' : 'Thu từ: ${selectedCustomer!.name}'),
                     )
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
              ElevatedButton(
                onPressed: () {
                  if (amountCtrl.text.isEmpty) return;
                  final amount = double.tryParse(amountCtrl.text) ?? 0;
                  if (amount <= 0) return;

                  final tx = VlxdFinanceTransaction()
                    ..transactionId = const Uuid().v4()
                    ..documentCode = '${type == FinanceTransactionType.RECEIPT ? "PT" : "PC"}-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}'
                    ..type = type
                    ..amount = amount
                    ..description = descCtrl.text
                    ..transactionDate = DateTime.now();

                  if (selectedCustomer != null && type == FinanceTransactionType.RECEIPT) {
                     tx.customer.value = selectedCustomer;
                  }

                  ref.read(vlxdFinanceProvider.notifier).createTransaction(tx);
                  Navigator.pop(ctx);
                },
                child: const Text('Lưu Phiếu'),
              )
            ],
          );
        }
      )
    );
  }
}

class _FinanceHistoryTab extends ConsumerWidget {
  const _FinanceHistoryTab();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final financeAsync = ref.watch(vlxdFinanceProvider);
    return financeAsync.when(
      data: (txs) {
        if (txs.isEmpty) return const Center(child: Text('Chưa có giao dịch thu chi.'));
        return ListView.builder(
          itemCount: txs.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final tx = txs[index];
            final isReceipt = tx.type == FinanceTransactionType.RECEIPT;
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: isReceipt ? Colors.green : Colors.red,
                  child: Icon(isReceipt ? Icons.arrow_downward : Icons.arrow_upward, color: Colors.white),
                ),
                title: Text('${tx.documentCode} - ${tx.amount} đ', style: TextStyle(color: isReceipt ? Colors.green : Colors.red, fontWeight: FontWeight.bold)),
                subtitle: Text(tx.description.isNotEmpty ? tx.description : tx.type.label),
                trailing: Text(tx.customer.value?.name ?? tx.supplier.value?.name ?? ''),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, st) => Center(child: Text('Lỗi: $err')),
    );
  }
}

class _CustomerDebtTab extends ConsumerWidget {
  const _CustomerDebtTab();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customersAsync = ref.watch(vlxdCustomersProvider);
    return customersAsync.when(
      data: (customers) {
        if (customers.isEmpty) return const Center(child: Text('Chưa có danh sách khách hàng.'));
        return ListView.builder(
          itemCount: customers.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final customer = customers[index];
            return Card(
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(customer.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('SĐT: ${customer.phone}'),
                trailing: Text('Nợ: ${customer.currentDebt} đ', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, st) => Center(child: Text('Lỗi: $err')),
    );
  }
}

class _SupplierDebtTab extends ConsumerWidget {
  const _SupplierDebtTab();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suppliersAsync = ref.watch(vlxdSuppliersProvider);
    return suppliersAsync.when(
      data: (suppliers) {
        if (suppliers.isEmpty) return const Center(child: Text('Chưa có nhà cung cấp.'));
        return ListView.builder(
          itemCount: suppliers.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final sup = suppliers[index];
            return Card(
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.business)),
                title: Text(sup.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                trailing: Text('Phải trả: ${sup.currentDebt} đ', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, st) => Center(child: Text('Lỗi: $err')),
    );
  }
}
