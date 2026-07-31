import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cafe_customer_supplier.dart';
import '../providers/cafe_providers.dart';

class CustomerSupplierScreen extends ConsumerWidget {
  const CustomerSupplierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customers = ref.watch(cafeCustomersProvider);
    final suppliers = ref.watch(cafeSuppliersProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: const TabBar(
            indicatorColor: Color(0xFFD97706),
            labelColor: Color(0xFFD97706),
            tabs: [
              Tab(icon: Icon(Icons.people), text: 'Khách hàng'),
              Tab(icon: Icon(Icons.factory), text: 'Nhà cung cấp'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _CustomerTab(customers: customers),
            _SupplierTab(suppliers: suppliers),
          ],
        ),
      ),
    );
  }
}

class _CustomerTab extends ConsumerWidget {
  final List<CafeCustomer> customers;
  const _CustomerTab({required this.customers});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: customers.isEmpty
          ? const Center(child: Text('Chưa có khách hàng nào'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: customers.length,
              itemBuilder: (ctx, i) {
                final c = customers[i];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.amber.shade100,
                      child: const Icon(Icons.person, color: Colors.amber),
                    ),
                    title: Text(
                      c.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${c.phone} • Hạng: ${c.tier.label} • Công nợ: ${c.debtAmount.toStringAsFixed(0)}đ',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _confirmDelete(
                        context,
                        ref,
                        c.id,
                        c.name,
                        'khách hàng',
                      ),
                    ),
                    onTap: () => _showCustomerDialog(context, ref, customer: c),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFD97706),
        child: const Icon(Icons.add),
        onPressed: () => _showCustomerDialog(context, ref),
      ),
    );
  }

  void _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    String id,
    String name,
    String type,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xác nhận xoá'),
        content: Text('Xoá $type "$name"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Huỷ'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              ref.read(cafeCustomersProvider.notifier).delete(id);
            },
            child: const Text('Xoá', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class _SupplierTab extends ConsumerWidget {
  final List<CafeSupplier> suppliers;
  const _SupplierTab({required this.suppliers});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: suppliers.isEmpty
          ? const Center(child: Text('Chưa có nhà cung cấp nào'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: suppliers.length,
              itemBuilder: (ctx, i) {
                final s = suppliers[i];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange.shade100,
                      child: const Icon(Icons.factory, color: Colors.orange),
                    ),
                    title: Text(
                      s.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${s.phone} • ${s.address} • Nợ: ${s.debtAmount.toStringAsFixed(0)}đ',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _confirmDelete(
                        context,
                        ref,
                        s.id,
                        s.name,
                        'nhà cung cấp',
                      ),
                    ),
                    onTap: () => _showSupplierDialog(context, ref, supplier: s),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFD97706),
        child: const Icon(Icons.add),
        onPressed: () => _showSupplierDialog(context, ref),
      ),
    );
  }

  void _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    String id,
    String name,
    String type,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xác nhận xoá'),
        content: Text('Xoá $type "$name"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Huỷ'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              ref.read(cafeSuppliersProvider.notifier).delete(id);
            },
            child: const Text('Xoá', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

Future<void> _showCustomerDialog(
  BuildContext context,
  WidgetRef ref, {
  CafeCustomer? customer,
}) async {
  final nameCtl = TextEditingController(text: customer?.name ?? '');
  final phoneCtl = TextEditingController(text: customer?.phone ?? '');
  final debtCtl = TextEditingController(
    text: customer?.debtAmount.toString() ?? '0',
  );
  CustomerTier tier = customer?.tier ?? CustomerTier.dong;

  await showDialog(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setState) => AlertDialog(
        title: Text(customer != null ? 'Sửa khách hàng' : 'Thêm khách hàng'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtl,
                decoration: const InputDecoration(
                  labelText: 'Tên khách hàng *',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: phoneCtl,
                decoration: const InputDecoration(
                  labelText: 'Số điện thoại',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<CustomerTier>(
                value: tier,
                decoration: const InputDecoration(
                  labelText: 'Hạng',
                  border: OutlineInputBorder(),
                ),
                items: CustomerTier.values
                    .map(
                      (t) => DropdownMenuItem(value: t, child: Text(t.label)),
                    )
                    .toList(),
                onChanged: (v) => setState(() => tier = v!),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: debtCtl,
                decoration: const InputDecoration(
                  labelText: 'Công nợ (đ)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Huỷ'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameCtl.text.trim().isEmpty) return;
              final id =
                  customer?.id ??
                  'CUS-${DateTime.now().millisecondsSinceEpoch}';
              ref
                  .read(cafeCustomersProvider.notifier)
                  .save(
                    CafeCustomer(
                      id: id,
                      name: nameCtl.text.trim(),
                      phone: phoneCtl.text.trim(),
                      tier: tier,
                      debtAmount: double.tryParse(debtCtl.text) ?? 0,
                    ),
                  );
              Navigator.pop(ctx);
            },
            child: const Text('Lưu'),
          ),
        ],
      ),
    ),
  );
}

Future<void> _showSupplierDialog(
  BuildContext context,
  WidgetRef ref, {
  CafeSupplier? supplier,
}) async {
  final nameCtl = TextEditingController(text: supplier?.name ?? '');
  final phoneCtl = TextEditingController(text: supplier?.phone ?? '');
  final addrCtl = TextEditingController(text: supplier?.address ?? '');
  final debtCtl = TextEditingController(
    text: supplier?.debtAmount.toString() ?? '0',
  );

  await showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(supplier != null ? 'Sửa nhà cung cấp' : 'Thêm nhà cung cấp'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtl,
              decoration: const InputDecoration(
                labelText: 'Tên nhà cung cấp *',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: phoneCtl,
              decoration: const InputDecoration(
                labelText: 'Số điện thoại',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: addrCtl,
              decoration: const InputDecoration(
                labelText: 'Địa chỉ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: debtCtl,
              decoration: const InputDecoration(
                labelText: 'Công nợ (đ)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: const Text('Huỷ'),
        ),
        ElevatedButton(
          onPressed: () {
            if (nameCtl.text.trim().isEmpty) return;
            final id =
                supplier?.id ?? 'SUP-${DateTime.now().millisecondsSinceEpoch}';
            ref
                .read(cafeSuppliersProvider.notifier)
                .save(
                  CafeSupplier(
                    id: id,
                    name: nameCtl.text.trim(),
                    phone: phoneCtl.text.trim(),
                    address: addrCtl.text.trim(),
                    debtAmount: double.tryParse(debtCtl.text) ?? 0,
                  ),
                );
            Navigator.pop(ctx);
          },
          child: const Text('Lưu'),
        ),
      ],
    ),
  );
}
