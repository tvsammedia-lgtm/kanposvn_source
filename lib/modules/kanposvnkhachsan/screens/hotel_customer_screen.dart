import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:isar/isar.dart';

import '../models/hotel_customer_supplier.dart';
import '../providers/hotel_providers.dart';

class HotelCustomerScreen extends ConsumerStatefulWidget {
  const HotelCustomerScreen({super.key});

  @override
  ConsumerState<HotelCustomerScreen> createState() => _HotelCustomerScreenState();
}

class _HotelCustomerScreenState extends ConsumerState<HotelCustomerScreen> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Khách hàng'),
        backgroundColor: const Color(0xFF0284C7),
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () => setState(() {})),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (v) => setState(() => _search = v.toLowerCase()),
              decoration: InputDecoration(
                hintText: 'Tìm theo tên, SĐT, CCCD...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          Expanded(child: _buildCustomerList()),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddCustomerDialog(context, ref),
        icon: const Icon(Icons.person_add),
        label: const Text('Thêm khách'),
      ),
    );
  }

  Widget _buildCustomerList() {
    return FutureBuilder<List<HotelCustomer>>(
      future: _loadCustomers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        final customers = snapshot.data ?? [];
        if (customers.isEmpty) {
          return const Center(child: Text('Chưa có khách hàng nào.'));
        }
        return ListView.builder(
          itemCount: customers.length,
          itemBuilder: (context, index) {
            final c = customers[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: c.membershipTier == 'VIP' ? Colors.amber : Colors.blue[50],
                  child: Text(c.fullName.isNotEmpty ? c.fullName[0].toUpperCase() : '?',
                      style: TextStyle(color: c.membershipTier == 'VIP' ? Colors.white : Colors.blue, fontWeight: FontWeight.bold)),
                ),
                title: Row(
                  children: [
                    Text(c.fullName, style: const TextStyle(fontWeight: FontWeight.bold)),
                    if (c.membershipTier.isNotEmpty) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: c.membershipTier == 'VIP' ? Colors.amber : Colors.grey[300],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(c.membershipTier, style: TextStyle(fontSize: 10, color: c.membershipTier == 'VIP' ? Colors.white : Colors.grey[700])),
                      ),
                    ],
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (c.phoneNumber.isNotEmpty) Text('SĐT: ${c.phoneNumber}'),
                    if (c.identityNumber.isNotEmpty) Text('CCCD: ${c.identityNumber}'),
                    Text('Lượt ở: ${c.totalVisits} • Đã trả: ${c.totalSpent.toStringAsFixed(0)}đ'),
                    if (c.debt > 0) Text('Công nợ: ${c.debt.toStringAsFixed(0)}đ', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  ],
                ),
                isThreeLine: true,
                trailing: PopupMenuButton<String>(
                  onSelected: (v) => _handleAction(v, c),
                  itemBuilder: (_) => [
                    const PopupMenuItem(value: 'edit', child: Text('Sửa')),
                    const PopupMenuItem(value: 'debt', child: Text('Ghi nhận nợ')),
                    const PopupMenuItem(value: 'delete', child: Text('Xóa')),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<List<HotelCustomer>> _loadCustomers() async {
    final isarService = ref.read(hotelIsarServiceProvider);
    final db = await isarService.db;
    var all = await db.hotelCustomers.where().findAll();
    if (_search.isNotEmpty) {
      all = all.where((c) =>
          c.fullName.toLowerCase().contains(_search) ||
          c.phoneNumber.contains(_search) ||
          c.identityNumber.contains(_search)).toList();
    }
    all.sort((a, b) => b.totalVisits.compareTo(a.totalVisits));
    return all;
  }

  void _handleAction(String action, HotelCustomer customer) {
    switch (action) {
      case 'edit':
        _showAddCustomerDialog(context, ref, existing: customer);
        break;
      case 'debt':
        _showDebtDialog(customer);
        break;
      case 'delete':
        _deleteCustomer(customer);
        break;
    }
  }

  void _showAddCustomerDialog(BuildContext context, WidgetRef ref, {HotelCustomer? existing}) {
    final nameCtrl = TextEditingController(text: existing?.fullName ?? '');
    final phoneCtrl = TextEditingController(text: existing?.phoneNumber ?? '');
    final emailCtrl = TextEditingController(text: existing?.email ?? '');
    final idCtrl = TextEditingController(text: existing?.identityNumber ?? '');
    final addressCtrl = TextEditingController(text: existing?.address ?? '');
    final tierCtrl = TextEditingController(text: existing?.membershipTier ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(existing != null ? 'Sửa khách hàng' : 'Thêm khách hàng mới'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Họ tên *', border: OutlineInputBorder())),
              const SizedBox(height: 8),
              TextField(controller: phoneCtrl, decoration: const InputDecoration(labelText: 'Số điện thoại', border: OutlineInputBorder()), keyboardType: TextInputType.phone),
              const SizedBox(height: 8),
              TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder())),
              const SizedBox(height: 8),
              TextField(controller: idCtrl, decoration: const InputDecoration(labelText: 'CCCD/Hộ chiếu', border: OutlineInputBorder())),
              const SizedBox(height: 8),
              TextField(controller: addressCtrl, decoration: const InputDecoration(labelText: 'Địa chỉ', border: OutlineInputBorder())),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: tierCtrl.text.isEmpty ? null : tierCtrl.text,
                items: ['VIP', 'Gold', 'Silver', 'Normal'].map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                onChanged: (v) => tierCtrl.text = v ?? '',
                decoration: const InputDecoration(labelText: 'Hạng thành viên', border: OutlineInputBorder()),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('HỦY')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () async {
              if (nameCtrl.text.trim().isEmpty) return;
              final isarService = ref.read(hotelIsarServiceProvider);
              final db = await isarService.db;
              await db.writeTxn(() async {
                final c = existing ?? HotelCustomer()..customerId = const Uuid().v4();
                c
                  ..fullName = nameCtrl.text.trim()
                  ..phoneNumber = phoneCtrl.text.trim()
                  ..email = emailCtrl.text.trim()
                  ..identityNumber = idCtrl.text.trim()
                  ..address = addressCtrl.text.trim()
                  ..membershipTier = tierCtrl.text.trim()
                  ..updatedAt = DateTime.now();
                await db.hotelCustomers.put(c);
              });
              if (ctx.mounted) Navigator.pop(ctx);
              setState(() {});
            },
            child: const Text('LƯU', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showDebtDialog(HotelCustomer customer) {
    final ctrl = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Ghi nhận nợ: ${customer.fullName}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Nợ hiện tại: ${customer.debt.toStringAsFixed(0)}đ'),
            const SizedBox(height: 12),
            TextField(
              controller: ctrl,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(labelText: 'Số tiền nợ mới (đ)', border: OutlineInputBorder()),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('HỦY')),
          ElevatedButton(
            onPressed: () async {
              final amount = double.tryParse(ctrl.text) ?? 0;
              final isarService = ref.read(hotelIsarServiceProvider);
              final db = await isarService.db;
              await db.writeTxn(() async {
                final c = await db.hotelCustomers.get(customer.id);
                if (c != null) {
                  c.debt = amount;
                  c.updatedAt = DateTime.now();
                  await db.hotelCustomers.put(c);
                }
              });
              if (ctx.mounted) Navigator.pop(ctx);
              setState(() {});
            },
            child: const Text('LƯU'),
          ),
        ],
      ),
    );
  }

  void _deleteCustomer(HotelCustomer customer) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xóa khách hàng'),
        content: Text('Xóa "${customer.fullName}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('HỦY')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('XÓA', style: TextStyle(color: Colors.white))),
        ],
      ),
    );
    if (confirmed != true) return;
    final isarService = ref.read(hotelIsarServiceProvider);
    final db = await isarService.db;
    await db.writeTxn(() async {
      await db.hotelCustomers.delete(customer.id);
    });
    setState(() {});
  }
}
