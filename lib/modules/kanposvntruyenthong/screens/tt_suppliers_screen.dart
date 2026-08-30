import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/tt_partner.dart';
import '../models/tt_finance.dart';
import '../providers/tt_providers.dart';

/// Quản lý nhà cung cấp + công nợ NCC + thanh toán công nợ.
class TtSuppliersScreen extends ConsumerStatefulWidget {
  const TtSuppliersScreen({super.key});

  @override
  ConsumerState<TtSuppliersScreen> createState() => _TtSuppliersScreenState();
}

class _TtSuppliersScreenState extends ConsumerState<TtSuppliersScreen> {
  String _query = '';
  final _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _addSupplier([TtSupplier? existing]) async {
    final nameCtrl = TextEditingController(text: existing?.name ?? '');
    final phoneCtrl = TextEditingController(text: existing?.phone ?? '');
    final contactCtrl = TextEditingController(text: existing?.contactPerson ?? '');
    final isNew = existing == null;

    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isNew ? 'Thêm nhà cung cấp' : 'Sửa nhà cung cấp'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Tên NCC')),
            const SizedBox(height: 8),
            TextField(controller: contactCtrl, decoration: const InputDecoration(labelText: 'Người liên hệ')),
            const SizedBox(height: 8),
            TextField(controller: phoneCtrl, decoration: const InputDecoration(labelText: 'Số điện thoại')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Hủy')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Lưu')),
        ],
      ),
    );
    if (ok != true) return;

    final db = await ref.read(ttIsarServiceProvider).db;
    await db.writeTxn(() async {
      final s = existing ?? TtSupplier()..supplierId = const Uuid().v4();
      s
        ..name = nameCtrl.text.trim()
        ..phone = phoneCtrl.text.trim()
        ..contactPerson = contactCtrl.text.trim()
        ..updatedAt = DateTime.now();
      await db.ttSuppliers.put(s);
    });
    ref.invalidate(ttSuppliersProvider);
  }

  Future<void> _payDebt(TtSupplier s) async {
    final amountCtrl = TextEditingController(text: s.currentDebt.toStringAsFixed(0));
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Trả công nợ — ${s.name}'),
        content: TextField(
          controller: amountCtrl,
          decoration: const InputDecoration(labelText: 'Số tiền trả'),
          keyboardType: TextInputType.number,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Hủy')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Thanh toán')),
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
      ..receiptNumber = 'PC${no.toString().padLeft(4, '0')}'
      ..type = TtReceiptType.SUPPLIER_PAYMENT
      ..amount = amount
      ..paymentMethod = 'Tiền mặt'
      ..date = DateTime.now()
      ..note = 'Thanh toán công nợ ${s.name}'
      ..createdBy = 'suppliers';
    receipt.supplier.value = s;
    await ref.read(ttFinanceProvider.notifier).addReceipt(receipt);
    ref.invalidate(ttSuppliersProvider);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã thanh toán công nợ')));
  }

  @override
  Widget build(BuildContext context) {
    final suppliersAsync = ref.watch(ttSuppliersProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF16A34A),
        foregroundColor: Colors.white,
        title: const Text('Nhà Cung Cấp', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(tooltip: 'Thêm NCC', icon: const Icon(Icons.local_shipping, color: Colors.white), onPressed: _addSupplier),
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
                hintText: 'Tìm tên NCC...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          Expanded(
            child: suppliersAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Lỗi: $e')),
              data: (suppliers) {
                final filtered = suppliers.where((s) {
                  final q = _query.trim().toLowerCase();
                  if (q.isEmpty) return true;
                  return s.name.toLowerCase().contains(q) || s.phone.contains(q);
                }).toList();
                if (filtered.isEmpty) return const Center(child: Text('Chưa có nhà cung cấp'));
                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, i) {
                    final s = filtered[i];
                    final debt = s.currentDebt;
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: ListTile(
                        leading: CircleAvatar(backgroundColor: const Color(0xFFFFEDD5), child: Text(s.name.isNotEmpty ? s.name[0] : '?')),
                        title: Text(s.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('${s.contactPerson} • ${s.phone}'),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Nợ: ${ttFmtMoney2(debt)}', style: TextStyle(color: debt > 0 ? Colors.orange : Colors.green, fontWeight: FontWeight.bold)),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  tooltip: 'Trả công nợ',
                                  icon: const Icon(Icons.currency_exchange, color: Colors.orange),
                                  onPressed: debt > 0 ? () => _payDebt(s) : null,
                                ),
                                IconButton(tooltip: 'Sửa', icon: const Icon(Icons.edit, size: 20), onPressed: () => _addSupplier(s)),
                              ],
                            ),
                          ],
                        ),
                        onTap: () => _payDebt(s),
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

String ttFmtMoney2(double value) {
  final abs = value.abs().toStringAsFixed(0);
  final buf = StringBuffer();
  for (var i = 0; i < abs.length; i++) {
    if (i > 0 && (abs.length - i) % 3 == 0) buf.write('.');
    buf.write(abs[i]);
  }
  return '${value < 0 ? '-' : ''}${buf.toString()}';
}