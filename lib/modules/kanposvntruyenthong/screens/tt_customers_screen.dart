import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/tt_partner.dart';
import '../providers/tt_providers.dart';
import '../models/tt_finance.dart';

/// Quản lý khách hàng: thêm/sửa/xóa, thu công nợ, xem điểm thưởng.
class TtCustomersScreen extends ConsumerStatefulWidget {
  const TtCustomersScreen({super.key});

  @override
  ConsumerState<TtCustomersScreen> createState() => _TtCustomersScreenState();
}

class _TtCustomersScreenState extends ConsumerState<TtCustomersScreen> {
  String _query = '';
  final _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _addCustomer([TtCustomer? existing]) async {
    final nameCtrl = TextEditingController(text: existing?.name ?? '');
    final phoneCtrl = TextEditingController(text: existing?.phone ?? '');
    final addressCtrl = TextEditingController(text: existing?.address ?? '');
    TtCustomerType type = existing?.customerType ?? TtCustomerType.LO_LE;
    final isNew = existing == null;

    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(isNew ? 'Thêm khách hàng' : 'Sửa khách hàng'),
          content: SizedBox(
            width: 380,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Tên khách hàng')),
                const SizedBox(height: 8),
                TextField(controller: phoneCtrl, decoration: const InputDecoration(labelText: 'Số điện thoại')),
                const SizedBox(height: 8),
                TextField(controller: addressCtrl, decoration: const InputDecoration(labelText: 'Địa chỉ')),
                const SizedBox(height: 8),
                DropdownButtonFormField<TtCustomerType>(
                  value: type,
                  decoration: const InputDecoration(labelText: 'Phân loại'),
                  items: [for (final t in TtCustomerType.values) DropdownMenuItem(value: t, child: Text(t.label))],
                  onChanged: (v) => setState(() => type = v ?? TtCustomerType.LO_LE),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Hủy')),
            FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Lưu')),
          ],
        ),
      ),
    );
    if (ok != true) return;

    final db = await ref.read(ttIsarServiceProvider).db;
    await db.writeTxn(() async {
      final c = existing ?? TtCustomer()..customerId = const Uuid().v4();
      c
        ..name = nameCtrl.text.trim()
        ..phone = phoneCtrl.text.trim()
        ..address = addressCtrl.text.trim()
        ..customerType = type
        ..updatedAt = DateTime.now();
      if (isNew) c.code = 'KH${((await db.ttCustomers.count()) + 1).toString().padLeft(3, '0')}';
      await db.ttCustomers.put(c);
    });
    await ref.read(ttCustomersProvider.notifier).loadCustomers();
  }

  Future<void> _collectDebt(TtCustomer c) async {
    final amountCtrl = TextEditingController(text: c.currentDebt.toStringAsFixed(0));
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Thu công nợ — ${c.name}'),
        content: TextField(
          controller: amountCtrl,
          decoration: const InputDecoration(labelText: 'Số tiền thu'),
          keyboardType: TextInputType.number,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Hủy')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Thu tiền')),
        ],
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
      ..type = TtReceiptType.CUSTOMER_PAYMENT
      ..amount = amount
      ..paymentMethod = 'Tiền mặt'
      ..date = DateTime.now()
      ..note = 'Thu công nợ ${c.name}'
      ..createdBy = 'customers';
    receipt.customer.value = c;
    await ref.read(ttFinanceProvider.notifier).addReceipt(receipt);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã lập phiếu thu')));
  }

  @override
  Widget build(BuildContext context) {
    final customersAsync = ref.watch(ttCustomersProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF16A34A),
        foregroundColor: Colors.white,
        title: const Text('Khách Hàng', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            tooltip: 'Thêm khách hàng',
            icon: const Icon(Icons.person_add),
            onPressed: _addCustomer,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: TextField(
              controller: _searchCtrl,
              decoration: InputDecoration(
                hintText: 'Tìm tên / SĐT...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          Expanded(
            child: customersAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Lỗi: $e')),
              data: (customers) {
                final filtered = customers.where((c) {
                  final q = _query.trim().toLowerCase();
                  if (q.isEmpty) return true;
                  return c.name.toLowerCase().contains(q) || c.phone.contains(q) || c.code.toLowerCase().contains(q);
                }).toList();
                if (filtered.isEmpty) return const Center(child: Text('Chưa có khách hàng'));
                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, i) {
                    final c = filtered[i];
                    final debt = c.currentDebt;
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: const Color(0xFFDCFCE7),
                          child: Text(c.name.isNotEmpty ? c.name[0] : '?'),
                        ),
                        title: Text(c.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          '${c.code} • ${c.customerType.label}\n${c.phone} • Điểm: ${c.loyaltyPoint.round()}',
                        ),
                        isThreeLine: true,
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Nợ: ${ttFmtMoney(debt)}', style: TextStyle(color: debt > 0 ? Colors.red : Colors.green, fontWeight: FontWeight.bold)),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  tooltip: 'Thu công nợ',
                                  icon: const Icon(Icons.currency_exchange, color: Colors.green),
                                  onPressed: debt > 0 ? () => _collectDebt(c) : null,
                                ),
                                IconButton(
                                  tooltip: 'Sửa',
                                  icon: const Icon(Icons.edit, size: 20),
                                  onPressed: () => _addCustomer(c),
                                ),
                              ],
                            ),
                          ],
                        ),
                        onTap: () => _collectDebt(c),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

String ttFmtMoney(double value) {
  final abs = value.abs().toStringAsFixed(0);
  final buf = StringBuffer();
  for (var i = 0; i < abs.length; i++) {
    if (i > 0 && (abs.length - i) % 3 == 0) buf.write('.');
    buf.write(abs[i]);
  }
  return '${value < 0 ? '-' : ''}${buf.toString()}';
}