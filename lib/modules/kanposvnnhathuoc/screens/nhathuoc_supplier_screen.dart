import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/nhathuoc_providers.dart';
import '../models/nhathuoc_supplier.dart';

class NhathuocSupplierScreen extends ConsumerStatefulWidget {
  const NhathuocSupplierScreen({super.key});

  @override
  ConsumerState<NhathuocSupplierScreen> createState() => _NhathuocSupplierScreenState();
}

class _NhathuocSupplierScreenState extends ConsumerState<NhathuocSupplierScreen> {
  String _searchQuery = '';

  void _showAddEditDialog({NhathuocSupplier? supplier}) {
    final nameCtrl = TextEditingController(text: supplier?.name ?? '');
    final phoneCtrl = TextEditingController(text: supplier?.phone ?? '');
    final emailCtrl = TextEditingController(text: supplier?.email ?? '');
    final addressCtrl = TextEditingController(text: supplier?.address ?? '');
    final taxCodeCtrl = TextEditingController(text: supplier?.taxCode ?? '');
    final contactCtrl = TextEditingController(text: supplier?.contactPerson ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(supplier != null ? 'Sửa Nhà Cung Cấp' : 'Thêm Nhà Cung Cấp Mới'),
        content: SizedBox(
          width: 450,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _field(nameCtrl, 'Tên NCC *'),
                _field(phoneCtrl, 'Số điện thoại'),
                _field(emailCtrl, 'Email'),
                _field(addressCtrl, 'Địa chỉ'),
                _field(taxCodeCtrl, 'Mã số thuế'),
                _field(contactCtrl, 'Người liên hệ'),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () async {
              if (nameCtrl.text.trim().isEmpty) return;
              if (supplier != null) {
                supplier.name = nameCtrl.text.trim();
                supplier.phone = phoneCtrl.text.trim();
                supplier.email = emailCtrl.text.trim();
                supplier.address = addressCtrl.text.trim();
                supplier.taxCode = taxCodeCtrl.text.trim();
                supplier.contactPerson = contactCtrl.text.trim();
                supplier.updatedAt = DateTime.now();
                await ref.read(nhathuocSuppliersProvider.notifier).addSupplier(supplier);
              } else {
                final newS = NhathuocSupplier()
                  ..supplierId = const Uuid().v4()
                  ..name = nameCtrl.text.trim()
                  ..phone = phoneCtrl.text.trim()
                  ..email = emailCtrl.text.trim()
                  ..address = addressCtrl.text.trim()
                  ..taxCode = taxCodeCtrl.text.trim()
                  ..contactPerson = contactCtrl.text.trim();
                await ref.read(nhathuocSuppliersProvider.notifier).addSupplier(newS);
              }
              if (mounted) Navigator.pop(ctx);
            },
            child: const Text('Lưu'),
          ),
        ],
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
    final suppliersAsync = ref.watch(nhathuocSuppliersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nhà Cung Cấp'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.white),
            tooltip: 'Thêm NCC',
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
                labelText: 'Tìm nhà cung cấp',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => setState(() => _searchQuery = val.toLowerCase()),
            ),
          ),
          Expanded(
            child: suppliersAsync.when(
              data: (suppliers) {
                final filtered = suppliers.where((s) =>
                    s.name.toLowerCase().contains(_searchQuery) ||
                    s.phone.toLowerCase().contains(_searchQuery)).toList();
                if (filtered.isEmpty) return const Center(child: Text('Chưa có nhà cung cấp nào.'));
                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final s = filtered[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue[50],
                          child: const Icon(Icons.business, color: Colors.blue),
                        ),
                        title: Text(s.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (s.phone.isNotEmpty) Text('SĐT: ${s.phone}'),
                            if (s.email.isNotEmpty) Text('Email: ${s.email}'),
                            if (s.address.isNotEmpty) Text('ĐC: ${s.address}'),
                            if (s.currentDebt > 0) Text('Nợ: ${s.currentDebt.toStringAsFixed(0)} đ', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        isThreeLine: true,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.orange),
                              onPressed: () => _showAddEditDialog(supplier: s),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () async {
                                final confirm = await showDialog<bool>(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text('Xóa NCC?'),
                                    content: Text('Xóa ${s.name}?'),
                                    actions: [
                                      TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Không')),
                                      TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Xóa', style: TextStyle(color: Colors.red))),
                                    ],
                                  ),
                                );
                                if (confirm == true) {
                                  await ref.read(nhathuocSuppliersProvider.notifier).deleteSupplier(s.id);
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
