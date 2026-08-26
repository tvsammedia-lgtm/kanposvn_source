import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/bida_partner.dart';
import '../providers/bida_partner_providers.dart';

final _currency = NumberFormat.currency(locale: 'vi_VN', symbol: '');

/// Tab "Khách hàng" — CRUD + tra cứu công nợ + tích điểm.
class BidaCustomerScreen extends ConsumerStatefulWidget {
  const BidaCustomerScreen({super.key});

  @override
  ConsumerState<BidaCustomerScreen> createState() => _BidaCustomerScreenState();
}

class _BidaCustomerScreenState extends ConsumerState<BidaCustomerScreen> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final customersAsync = ref.watch(bidaCustomersProvider);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (v) => setState(() => _search = v.toLowerCase()),
              decoration: InputDecoration(
                hintText: 'Tìm theo tên, SĐT...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          Expanded(
            child: customersAsync.when(
              data: (list) {
                final filtered = _search.isEmpty
                    ? list
                    : list.where((c) =>
                        c.name.toLowerCase().contains(_search) ||
                        c.phone.contains(_search)).toList();
                if (filtered.isEmpty) {
                  return const Center(child: Text('Chưa có khách hàng nào.'));
                }
                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final c = filtered[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: c.isMember ? Colors.amber : Colors.green[50],
                          child: Text(
                            c.name.isNotEmpty ? c.name[0].toUpperCase() : '?',
                            style: TextStyle(
                              color: c.isMember ? Colors.white : const Color(0xFF059669),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Row(
                          children: [
                            Text(c.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                            if (c.isMember) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(4)),
                                child: const Text('MEMBER', style: TextStyle(fontSize: 10, color: Colors.white)),
                              ),
                            ],
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (c.phone.isNotEmpty) Text('SĐT: ${c.phone}'),
                            Text('Điểm: ${c.points} · Đã chi: ${_currency.format(c.totalSpent)}đ'),
                            if (c.debtBalance > 0)
                              Text('Nợ: ${_currency.format(c.debtBalance)}đ',
                                  style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        isThreeLine: true,
                        trailing: PopupMenuButton<String>(
                          onSelected: (v) => _handleAction(v, c),
                          itemBuilder: (_) => [
                            const PopupMenuItem(value: 'edit', child: Text('Sửa')),
                            const PopupMenuItem(value: 'member', child: Text('Toggle thành viên')),
                            const PopupMenuItem(value: 'delete', child: Text('Xóa')),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Lỗi: $e')),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddDialog(context, ref),
        icon: const Icon(Icons.person_add),
        label: const Text('Thêm khách'),
      ),
    );
  }

  void _handleAction(String action, BidaCustomer c) {
    switch (action) {
      case 'edit':
        _showAddDialog(context, ref, existing: c);
        break;
      case 'member':
        ref.read(bidaCustomersProvider.notifier).updateCustomer(c, isMember: !c.isMember);
        break;
      case 'delete':
        _deleteCustomer(c);
        break;
    }
  }

  void _showAddDialog(BuildContext context, WidgetRef ref, {BidaCustomer? existing}) {
    final nameCtrl = TextEditingController(text: existing?.name ?? '');
    final phoneCtrl = TextEditingController(text: existing?.phone ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(existing != null ? 'Sửa khách hàng' : 'Thêm khách hàng mới'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Họ tên *', border: OutlineInputBorder())),
            const SizedBox(height: 8),
            TextField(controller: phoneCtrl, decoration: const InputDecoration(labelText: 'Số điện thoại', border: OutlineInputBorder()), keyboardType: TextInputType.phone),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('HỦY')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF059669)),
            onPressed: () async {
              if (nameCtrl.text.trim().isEmpty) return;
              if (existing != null) {
                await ref.read(bidaCustomersProvider.notifier).updateCustomer(
                  existing, name: nameCtrl.text.trim(), phone: phoneCtrl.text.trim());
              } else {
                await ref.read(bidaCustomersProvider.notifier).addCustomer(
                  name: nameCtrl.text.trim(), phone: phoneCtrl.text.trim());
              }
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: const Text('LƯU', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _deleteCustomer(BidaCustomer c) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xóa khách hàng'),
        content: Text('Xóa "${c.name}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('HỦY')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('XÓA', style: TextStyle(color: Colors.white))),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(bidaCustomersProvider.notifier).deleteCustomer(c);
    }
  }
}
