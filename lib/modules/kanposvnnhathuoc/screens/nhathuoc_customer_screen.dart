import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/nhathuoc_providers.dart';
import '../models/nhathuoc_customer.dart';

class NhathuocCustomerScreen extends ConsumerStatefulWidget {
  const NhathuocCustomerScreen({super.key});

  @override
  ConsumerState<NhathuocCustomerScreen> createState() => _NhathuocCustomerScreenState();
}

class _NhathuocCustomerScreenState extends ConsumerState<NhathuocCustomerScreen> {
  String _searchQuery = '';

  void _showAddEditDialog({NhathuocCustomer? customer}) {
    final nameCtrl = TextEditingController(text: customer?.name ?? '');
    final phoneCtrl = TextEditingController(text: customer?.phone ?? '');
    final emailCtrl = TextEditingController(text: customer?.email ?? '');
    final addressCtrl = TextEditingController(text: customer?.address ?? '');
    final companyCtrl = TextEditingController(text: customer?.companyName ?? '');
    CustomerType selectedType = customer?.customerType ?? CustomerType.RETAIL;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text(customer != null ? 'Sửa Khách Hàng' : 'Thêm Khách Hàng Mới'),
          content: SizedBox(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _field(nameCtrl, 'Tên khách hàng *'),
                  _field(phoneCtrl, 'Số điện thoại'),
                  _field(emailCtrl, 'Email'),
                  _field(addressCtrl, 'Địa chỉ'),
                  DropdownButtonFormField<CustomerType>(
                    value: selectedType,
                    decoration: const InputDecoration(labelText: 'Loại khách', border: OutlineInputBorder()),
                    items: CustomerType.values.map((t) => DropdownMenuItem(value: t, child: Text(t.label))).toList(),
                    onChanged: (v) => setDialogState(() => selectedType = v ?? CustomerType.RETAIL),
                  ),
                  if (selectedType == CustomerType.BUSINESS) ...[
                    const SizedBox(height: 8),
                    _field(companyCtrl, 'Tên công ty'),
                  ],
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
            ElevatedButton(
              onPressed: () async {
                if (nameCtrl.text.trim().isEmpty) return;
                if (customer != null) {
                  customer.name = nameCtrl.text.trim();
                  customer.phone = phoneCtrl.text.trim();
                  customer.email = emailCtrl.text.trim();
                  customer.address = addressCtrl.text.trim();
                  customer.companyName = companyCtrl.text.trim();
                  customer.customerType = selectedType;
                  customer.updatedAt = DateTime.now();
                  await ref.read(nhathuocCustomersProvider.notifier).addCustomer(customer);
                } else {
                  final newC = NhathuocCustomer()
                    ..customerId = const Uuid().v4()
                    ..name = nameCtrl.text.trim()
                    ..phone = phoneCtrl.text.trim()
                    ..email = emailCtrl.text.trim()
                    ..address = addressCtrl.text.trim()
                    ..companyName = companyCtrl.text.trim()
                    ..customerType = selectedType;
                  await ref.read(nhathuocCustomersProvider.notifier).addCustomer(newC);
                }
                if (mounted) Navigator.pop(ctx);
              },
              child: const Text('Lưu'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(TextEditingController ctrl, String label, {TextInputType? keyboard}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        controller: ctrl,
        keyboardType: keyboard,
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder(), isDense: true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final customersAsync = ref.watch(nhathuocCustomersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Khách Hàng'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.white),
            tooltip: 'Thêm khách hàng',
            onPressed: () => _showAddEditDialog(),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Tìm khách hàng',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => setState(() => _searchQuery = val.toLowerCase()),
            ),
          ),
          Expanded(
            child: customersAsync.when(
              data: (customers) {
                final filtered = customers.where((c) =>
                    c.name.toLowerCase().contains(_searchQuery) ||
                    c.phone.toLowerCase().contains(_searchQuery)).toList();
                if (filtered.isEmpty) return const Center(child: Text('Chưa có khách hàng nào.'));
                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final c = filtered[index];
                    final tierColor = {
                      CustomerType.VIP: Colors.purple,
                      CustomerType.BUSINESS: Colors.blue,
                      CustomerType.RETAIL: Colors.grey,
                    }[c.customerType] ?? Colors.grey;
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: tierColor.withOpacity(0.1),
                          child: Icon(Icons.person, color: tierColor),
                        ),
                        title: Row(
                          children: [
                            Text(c.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(width: 8),
                            Chip(
                              label: Text(c.customerType.label, style: TextStyle(fontSize: 10, color: tierColor)),
                              backgroundColor: tierColor.withOpacity(0.1),
                              padding: EdgeInsets.zero,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (c.phone.isNotEmpty) Text('SĐT: ${c.phone}'),
                            if (c.companyName.isNotEmpty) Text('Cty: ${c.companyName}'),
                            if (c.currentDebt > 0) Text('Nợ: ${c.currentDebt.toStringAsFixed(0)} đ', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                            Text('Điểm: ${c.rewardPoints} | DS: ${c.totalSpent.toStringAsFixed(0)} đ', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                        isThreeLine: true,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.orange),
                              onPressed: () => _showAddEditDialog(customer: c),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () async {
                                final confirm = await showDialog<bool>(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text('Xóa khách hàng?'),
                                    content: Text('Xóa ${c.name}?'),
                                    actions: [
                                      TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Không')),
                                      TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Xóa', style: TextStyle(color: Colors.red))),
                                    ],
                                  ),
                                );
                                if (confirm == true) {
                                  await ref.read(nhathuocCustomersProvider.notifier).deleteCustomer(c.id);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Center(child: Text('Lỗi: $err')),
            ),
          ),
        ],
      ),
    );
  }
}
