import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/restaurant_partner_models.dart';
import '../providers/restaurant_providers.dart';

/// XIV + XV + XXX. Khách hàng & Nhà cung cấp: thông tin, tích điểm, công nợ.
class RestaurantPartnersScreen extends ConsumerWidget {
  const RestaurantPartnersScreen({super.key});

  static final _money =
      NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Khách Hàng & Nhà Cung Cấp'),
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.people), text: 'Khách hàng'),
            Tab(icon: Icon(Icons.local_shipping), text: 'Nhà cung cấp'),
          ]),
        ),
        body: const TabBarView(children: [_CustomersTab(), _SuppliersTab()]),
      ),
    );
  }
}

class _CustomersTab extends ConsumerWidget {
  const _CustomersTab();

  Future<void> _addOrEdit(BuildContext context, WidgetRef ref,
      [RestaurantCustomer? existing]) async {
    final nameCtrl = TextEditingController(text: existing?.name);
    final phoneCtrl = TextEditingController(text: existing?.phone);
    final emailCtrl = TextEditingController(text: existing?.email);
    DateTime? birthday = existing?.birthday;
    double debt = existing?.debt ?? 0;

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setD) => AlertDialog(
          title: Text(existing == null ? 'THÊM KHÁCH HÀNG' : 'SỬA KHÁCH HÀNG'),
          content: SizedBox(
            width: 380,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              TextField(
                  controller: nameCtrl,
                  autofocus: true,
                  decoration: const InputDecoration(
                      labelText: 'Họ tên *', border: OutlineInputBorder())),
              const SizedBox(height: 8),
              TextField(
                  controller: phoneCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      labelText: 'Điện thoại', border: OutlineInputBorder())),
              const SizedBox(height: 8),
              TextField(
                  controller: emailCtrl,
                  decoration: const InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder())),
              const SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.cake),
                title: Text(birthday == null
                    ? 'Chọn sinh nhật'
                    : 'Sinh nhật: ${birthday.toString().substring(0, 10)}'),
                onTap: () async {
                  final d = await showDatePicker(
                      context: ctx,
                      initialDate: birthday ?? DateTime(1995),
                      firstDate: DateTime(1940),
                      lastDate: DateTime.now());
                  if (d != null) setD(() => birthday = d);
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Công nợ phải thu (đ)',
                    border: const OutlineInputBorder()),
                controller:
                    TextEditingController(text: debt > 0 ? '${debt.toInt()}' : ''),
                onChanged: (v) => debt = double.tryParse(v.trim()) ?? 0,
              ),
            ]),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Hủy')),
            FilledButton(
                onPressed: nameCtrl.text.trim().isEmpty
                    ? null
                    : () => Navigator.pop(ctx, true),
                child: const Text('Lưu')),
          ],
        ),
      ),
    );
    if (ok != true || !context.mounted) return;

    final c = existing ?? (RestaurantCustomer()..customerId = const Uuid().v4());
    c.name = nameCtrl.text.trim();
    c.phone = phoneCtrl.text.trim();
    c.email = emailCtrl.text.trim();
    c.birthday = birthday;
    c.debt = debt;
    await ref.read(restaurantCustomersProvider.notifier).upsert(c);
  }

  Future<void> _payDebt(BuildContext context, WidgetRef ref,
      RestaurantCustomer customer) async {
    final ctrl = TextEditingController(text: '${customer.debt.toInt()}');
    final amount = await showDialog<double>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('KHÁCH ${customer.name} TRẢ NỢ'),
        content: TextField(
          controller: ctrl,
          keyboardType: TextInputType.number,
          autofocus: true,
          decoration: const InputDecoration(
              labelText: 'Số tiền trả (đ)', border: OutlineInputBorder()),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          FilledButton(
              onPressed: () => Navigator.pop(
                  ctx, double.tryParse(ctrl.text.trim()) ?? 0),
              child: const Text('Xác nhận')),
        ],
      ),
    );
    if (amount == null || amount <= 0) return;
    await ref.read(restaurantCustomersProvider.notifier).payDebt(customer, amount);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customersAsync = ref.watch(restaurantCustomersProvider);
    return customersAsync.when(
      data: (customers) {
        final totalDebt = customers.fold<double>(0, (s, c) => s + c.debt);
        return Column(children: [
          Card(
            margin: const EdgeInsets.all(12),
            color: Colors.orange[50],
            child: ListTile(
              leading: const Icon(Icons.account_balance_wallet,
                  color: Colors.red, size: 32),
              title: const Text('Tổng công nợ phải thu',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle:
                  Text('${customers.length} khách hàng • ${totalDebt.toInt()} đ'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: customers.length,
              itemBuilder: (_, i) {
                final c = customers[i];
                return ListTile(
                  leading: CircleAvatar(child: Text(c.name.substring(0, 1))),
                  title: Text(c.name),
                  subtitle: Text(
                      '${c.phone}${c.email.isNotEmpty ? " • ${c.email}" : ""}'
                      '\nĐiểm: ${c.points} • Nợ: ${RestaurantPartnersScreen._money.format(c.debt)}'
                      '${c.hasVoucher ? "\nVoucher: ${c.voucherValue.toInt()}đ" : ""}'
                      '${c.birthday != null ? "\nSN: ${c.birthday.toString().substring(0, 10)}" : ""}'),
                  isThreeLine: true,
                  trailing: PopupMenuButton<String>(
                    onSelected: (v) {
                      if (v == 'edit') _addOrEdit(context, ref, c);
                      if (v == 'paydebt') _payDebt(context, ref, c);
                    },
                    itemBuilder: (_) => [
                      const PopupMenuItem(value: 'edit', child: Text('Sửa')),
                      if (c.debt > 0)
                        const PopupMenuItem(
                            value: 'paydebt', child: Text('Thu nợ')),
                    ],
                  ),
                );
              },
            ),
          ),
        ]);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
    );
  }
}

class _SuppliersTab extends ConsumerWidget {
  const _SuppliersTab();

  Future<void> _addOrEdit(BuildContext context, WidgetRef ref,
      [RestaurantSupplier? existing]) async {
    final nameCtrl = TextEditingController(text: existing?.name);
    final phoneCtrl = TextEditingController(text: existing?.phone);
    final addressCtrl = TextEditingController(text: existing?.address);
    final taxCtrl = TextEditingController(text: existing?.taxCode);
    final debtCtrl = TextEditingController(
        text: existing != null && existing.debt > 0
            ? '${existing.debt.toInt()}'
            : '');

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(existing == null ? 'THÊM NHÀ CUNG CẤP' : 'SỬA NCC'),
        content: SizedBox(
          width: 380,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            TextField(
                controller: nameCtrl,
                autofocus: true,
                decoration: const InputDecoration(
                    labelText: 'Tên NCC *', border: OutlineInputBorder())),
            const SizedBox(height: 8),
            TextField(
                controller: phoneCtrl,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    labelText: 'Điện thoại', border: OutlineInputBorder())),
            const SizedBox(height: 8),
            TextField(
                controller: addressCtrl,
                decoration: const InputDecoration(
                    labelText: 'Địa chỉ', border: OutlineInputBorder())),
            const SizedBox(height: 8),
            TextField(
                controller: taxCtrl,
                decoration: const InputDecoration(
                    labelText: 'MST', border: OutlineInputBorder())),
            const SizedBox(height: 8),
            TextField(
                controller: debtCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Công nợ phải trả (đ)',
                    border: OutlineInputBorder())),
          ]),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Hủy')),
          FilledButton(
              onPressed: nameCtrl.text.trim().isEmpty
                  ? null
                  : () => Navigator.pop(ctx, true),
              child: const Text('Lưu')),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;

    final s = existing ?? (RestaurantSupplier()..supplierId = const Uuid().v4());
    s.name = nameCtrl.text.trim();
    s.phone = phoneCtrl.text.trim();
    s.address = addressCtrl.text.trim();
    s.taxCode = taxCtrl.text.trim();
    s.debt = double.tryParse(debtCtrl.text.trim()) ?? 0;
    await ref.read(restaurantSuppliersProvider.notifier).upsert(s);
  }

  Future<void> _payDebt(BuildContext context, WidgetRef ref,
      RestaurantSupplier supplier) async {
    final ctrl = TextEditingController(text: '${supplier.debt.toInt()}');
    final amount = await showDialog<double>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('TRẢ NỢ ${supplier.name}'),
        content: TextField(
          controller: ctrl,
          keyboardType: TextInputType.number,
          autofocus: true,
          decoration: const InputDecoration(
              labelText: 'Số tiền trả (đ)', border: OutlineInputBorder()),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          FilledButton(
              onPressed: () =>
                  Navigator.pop(ctx, double.tryParse(ctrl.text.trim()) ?? 0),
              child: const Text('Xác nhận')),
        ],
      ),
    );
    if (amount == null || amount <= 0) return;
    await ref.read(restaurantSuppliersProvider.notifier).payDebt(supplier, amount);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suppliersAsync = ref.watch(restaurantSuppliersProvider);
    return suppliersAsync.when(
      data: (suppliers) {
        final totalDebt = suppliers.fold<double>(0, (s, x) => s + x.debt);
        final dueSoon = suppliers.where((x) => x.debt > 0).length;
        return Column(children: [
          Card(
            margin: const EdgeInsets.all(12),
            color: Colors.red[50],
            child: ListTile(
              leading: const Icon(Icons.money_off_csred,
                  color: Colors.deepOrange, size: 32),
              title: const Text('Tổng công nợ phải trả',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle:
                  Text('$dueSoon/${suppliers.length} NCC còn nợ • ${totalDebt.toInt()} đ'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: suppliers.length,
              itemBuilder: (_, i) {
                final s = suppliers[i];
                return ListTile(
                  leading: const Icon(Icons.local_shipping),
                  title: Text(s.name),
                  subtitle: Text(
                      '${s.phone.isEmpty ? "-" : s.phone} • MST: ${s.taxCode.isEmpty ? "-" : s.taxCode}\n${s.address}\nNợ: ${RestaurantPartnersScreen._money.format(s.debt)}'),
                  isThreeLine: true,
                  trailing: PopupMenuButton<String>(
                    onSelected: (v) {
                      if (v == 'edit') _addOrEdit(context, ref, s);
                      if (v == 'paydebt') _payDebt(context, ref, s);
                    },
                    itemBuilder: (_) => [
                      const PopupMenuItem(value: 'edit', child: Text('Sửa')),
                      if (s.debt > 0)
                        const PopupMenuItem(
                            value: 'paydebt', child: Text('Trả nợ')),
                    ],
                  ),
                );
              },
            ),
          ),
        ]);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
    );
  }
}
