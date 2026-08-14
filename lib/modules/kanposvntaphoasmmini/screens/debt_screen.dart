import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/taphoa_providers.dart';

class TapHoaDebtScreen extends ConsumerWidget {
  const TapHoaDebtScreen({super.key});

  Future<void> _showPayDialog(
    BuildContext context,
    WidgetRef ref, {
    required bool isCustomer,
    required String partnerId,
    required String partnerName,
    required double maxAmount,
  }) async {
    if (maxAmount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$partnerName không có công nợ phải trả')),
      );
      return;
    }
    final amountController = TextEditingController(text: maxAmount.toStringAsFixed(0));

    await showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(isCustomer ? 'Thu công nợ' : 'Trả nợ'),
        content: Text(
          '$partnerName\nCông nợ hiện tại: ${maxAmount.toStringAsFixed(0)} đ\n\nSố tiền thanh toán:',
        ),
        actions: [
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixText: '₫ ',
            ),
          ),
          TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              final amount = double.tryParse(amountController.text) ?? 0;
              if (amount <= 0 || amount > maxAmount) {
                ScaffoldMessenger.of(dialogContext).showSnackBar(
                  const SnackBar(content: Text('Số tiền không hợp lệ')),
                );
                return;
              }
              ref.read(tapHoaDebtProvider.notifier).payDebt(
                    partnerId: partnerId,
                    isCustomer: isCustomer,
                    partnerName: partnerName,
                    amount: amount,
                  );
              ref.read(tapHoaCustomersProvider.notifier).loadCustomers();
              ref.read(tapHoaSuppliersProvider.notifier).loadSuppliers();
              ref.read(tapHoaCashTransactionsProvider.notifier).loadTransactions();
              Navigator.pop(dialogContext);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        isCustomer ? 'Đã thu $amount đ từ $partnerName' : 'Đã trả $amount đ cho $partnerName')),
              );
            },
            child: const Text('Xác nhận'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customers = ref.watch(tapHoaCustomersProvider);
    final suppliers = ref.watch(tapHoaSuppliersProvider);
    final debt = ref.watch(tapHoaDebtProvider);

    final customerDebt = (debt['customerDebt'] as num?)?.toDouble() ?? 0;
    final supplierDebt = (debt['supplierDebt'] as num?)?.toDouble() ?? 0;

    final debtCustomers =
        customers.where((c) => c.debtAmount > 0).toList()
          ..sort((a, b) => b.debtAmount.compareTo(a.debtAmount));
    final debtSuppliers =
        suppliers.where((s) => s.debtAmount > 0).toList()
          ..sort((a, b) => b.debtAmount.compareTo(a.debtAmount));

    return Scaffold(
      appBar: AppBar(title: const Text('Công Nợ')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Expanded(
                child: _summaryCard(
                  context,
                  label: 'Khách hàng đang nợ',
                  amount: customerDebt,
                  color: Colors.red,
                  icon: Icons.people,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _summaryCard(
                  context,
                  label: 'Nợ nhà cung cấp',
                  amount: supplierDebt,
                  color: Colors.orange,
                  icon: Icons.factory,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text('Khách hàng có công nợ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          if (debtCustomers.isEmpty)
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Không có khách hàng đang nợ', style: TextStyle(color: Colors.grey)),
            ),
          ...debtCustomers.map((c) => Card(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  leading: CircleAvatar(child: Text(c.name.isNotEmpty ? c.name[0] : '?')),
                  title: Text(c.name),
                  subtitle: Text('SĐT: ${c.phone}'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${c.debtAmount.toStringAsFixed(0)} đ',
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                      TextButton(
                        onPressed: () => _showPayDialog(
                          context,
                          ref,
                          isCustomer: true,
                          partnerId: c.customerId,
                          partnerName: c.name,
                          maxAmount: c.debtAmount,
                        ),
                        child: const Text('Thu nợ'),
                      ),
                    ],
                  ),
                ),
              )),
          const SizedBox(height: 16),
          const Text('Nhà cung cấp đang được nợ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          if (debtSuppliers.isEmpty)
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Không có khoản nợ nhà cung cấp',
                  style: TextStyle(color: Colors.grey)),
            ),
          ...debtSuppliers.map((s) => Card(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.factory)),
                  title: Text(s.name),
                  subtitle: Text('SĐT: ${s.phone}'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${s.debtAmount.toStringAsFixed(0)} đ',
                          style: const TextStyle(
                              color: Colors.orange, fontWeight: FontWeight.bold)),
                      TextButton(
                        onPressed: () => _showPayDialog(
                          context,
                          ref,
                          isCustomer: false,
                          partnerId: s.supplierId,
                          partnerName: s.name,
                          maxAmount: s.debtAmount,
                        ),
                        child: const Text('Trả nợ'),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _summaryCard(BuildContext context,
      {required String label, required double amount, required Color color, required IconData icon}) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 4),
            Text(
              '${amount.toStringAsFixed(0)} đ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }
}
