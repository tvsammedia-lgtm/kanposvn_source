import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/vantai_customer.dart';
import '../models/vantai_supplier.dart';
import '../models/vantai_ticket.dart';
import '../providers/vantai_providers.dart';

/// PRD mục 9 + 16-17: Khách hàng (cá nhân/doanh nghiệp, lịch sử, công nợ)
/// và Nhà cung cấp (gara/xăng dầu/lốp/phụ tùng/bảo hiểm).
class VantaiPartnersScreen extends ConsumerWidget {
  const VantaiPartnersScreen({super.key});

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
      [VantaiCustomer? existing]) async {
    final nameCtrl = TextEditingController(text: existing?.name);
    final phoneCtrl = TextEditingController(text: existing?.phone);
    final cccdCtrl = TextEditingController(text: existing?.cccd);

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(existing == null ? 'THÊM KHÁCH HÀNG' : 'SỬA KHÁCH HÀNG'),
        content: SizedBox(
          width: 380,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            TextField(
                controller: nameCtrl,
                autofocus: true,
                decoration: const InputDecoration(
                    labelText: 'Họ tên / Tên công ty *',
                    border: OutlineInputBorder())),
            const SizedBox(height: 8),
            TextField(
                controller: phoneCtrl,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    labelText: 'Điện thoại', border: OutlineInputBorder())),
            const SizedBox(height: 8),
            TextField(
                controller: cccdCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'CCCD (cá nhân)',
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
    if (ok != true) return;
    final c = existing ?? (VantaiCustomer()..customerId = const Uuid().v4());
    c.name = nameCtrl.text.trim();
    c.phone = phoneCtrl.text.trim();
    c.cccd = cccdCtrl.text.trim();
    await ref.read(vantaiCustomersProvider.notifier).upsert(c);
  }

  Future<void> _payDebt(
      BuildContext context, WidgetRef ref, VantaiCustomer customer) async {
    final ctrl = TextEditingController(text: '${customer.currentDebt.toInt()}');
    final amount = await showDialog<double>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('THU NỢ: ${customer.name}'),
        content: TextField(
          controller: ctrl,
          keyboardType: TextInputType.number,
          autofocus: true,
          decoration: const InputDecoration(
              labelText: 'Số tiền thu (đ)', border: OutlineInputBorder()),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          FilledButton(
              onPressed: () =>
                  Navigator.pop(ctx, double.tryParse(ctrl.text.trim()) ?? 0),
              child: const Text('Xác nhận thu')),
        ],
      ),
    );
    if (amount == null || amount <= 0) return;
    await ref.read(vantaiCustomersProvider.notifier).payDebt(customer, amount);
  }

  void _showHistory(BuildContext context, WidgetRef ref, VantaiCustomer c) {
    final tickets = (ref.read(vantaiTicketsProvider).value ?? [])
        .where((t) => t.customer.value?.id == c.id)
        .toList();
    final shipments = (ref.read(vantaiShipmentsProvider).value ?? [])
        .where((s) =>
            s.senderPhone == c.phone ||
            s.receiverPhone == c.phone)
        .toList();
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SizedBox(
        height: 500,
        child: ListView(padding: const EdgeInsets.all(16), children: [
          Text('Lịch sử - ${c.name}',
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          const Text('VÉ ĐÃ MUA',
              style: TextStyle(fontWeight: FontWeight.bold)),
          if (tickets.isEmpty)
            const Padding(
                padding: EdgeInsets.all(8), child: Text('Chưa có vé nào.')),
          ...tickets.map((t) => ListTile(
                dense: true,
                leading: Icon(Icons.airplane_ticket,
                    color: switch (t.status) {
                      TicketStatus.PAID => Colors.green,
                      TicketStatus.RESERVED => Colors.orange,
                      TicketStatus.CANCELLED => Colors.red,
                    }),
                title: Text(
                    '${t.ticketCode} - Ghế ${t.seatNumber} - ${t.route.value?.routeName}'),
                subtitle: Text(
                    '${t.status.label} • ${t.paymentMethod.label} • ${t.price.toInt()}đ • ${(t.departureTime ?? DateTime.now()).toString().substring(0, 16)}'),
              )),
          const Divider(height: 24),
          const Text('HÀNG GỬI / GỬI CHO',
              style: TextStyle(fontWeight: FontWeight.bold)),
          if (shipments.isEmpty)
            const Padding(
                padding: EdgeInsets.all(8), child: Text('Chưa có hàng nào.')),
          ...shipments.map((s) => ListTile(
                dense: true,
                leading:
                    const Icon(Icons.inventory_2, color: Colors.orange),
                title: Text('${s.shipmentCode} → ${s.receiverName}'),
                subtitle: Text(
                    '${s.status.label} • Cước ${VantaiPartnersScreen._money.format(s.shippingFee)}${s.codAmount > 0 ? " • COD ${VantaiPartnersScreen._money.format(s.codAmount)}" : ""}'),
              )),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customersAsync = ref.watch(vantaiCustomersProvider);
    return customersAsync.when(
      data: (customers) => Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.person_add),
          label: const Text('Thêm KH'),
          onPressed: () => _addOrEdit(context, ref),
        ),
        body: customers.isEmpty
            ? const Center(child: Text('Chưa có khách hàng nào.'))
            : ListView(padding: const EdgeInsets.all(12), children: [
                Card(
                  color: Colors.orange[50],
                  child: ListTile(
                    leading: const Icon(Icons.account_balance_wallet,
                        color: Colors.red, size: 32),
                    title: const Text('Tổng công nợ phải thu',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Text(VantaiPartnersScreen._money.format(customers
                        .fold<double>(0, (s, c) => s + c.currentDebt))),
                  ),
                ),
                ...customers.map((c) => ListTile(
                      leading: CircleAvatar(
                          backgroundColor: c.name.contains('Công Ty') ||
                                  c.name.contains('Tour')
                              ? Colors.indigo
                              : Colors.teal,
                          child: Icon(
                              c.name.contains('Công Ty')
                                  ? Icons.business
                                  : Icons.person,
                              color: Colors.white)),
                      title: Text(c.name),
                      subtitle: Text(
                          '${c.phone}${c.cccd.isNotEmpty ? " • CCCD: ${c.cccd}" : ""}'
                          '\nNợ: ${VantaiPartnersScreen._money.format(c.currentDebt)}'),
                      isThreeLine: true,
                      trailing: PopupMenuButton<String>(
                        onSelected: (v) {
                          if (v == 'edit') _addOrEdit(context, ref, c);
                          if (v == 'debt' && c.currentDebt > 0) {
                            _payDebt(context, ref, c);
                          }
                          if (v == 'history') _showHistory(context, ref, c);
                        },
                        itemBuilder: (_) => [
                          const PopupMenuItem(
                              value: 'history', child: Text('Lịch sử')),
                          const PopupMenuItem(value: 'edit', child: Text('Sửa')),
                          if (c.currentDebt > 0)
                            const PopupMenuItem(
                                value: 'debt', child: Text('Thu nợ')),
                        ],
                      ),
                    )),
              ]),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
    );
  }
}

class _SuppliersTab extends ConsumerWidget {
  const _SuppliersTab();

  Future<void> _addOrEdit(BuildContext context, WidgetRef ref,
      [VantaiSupplier? existing]) async {
    final nameCtrl = TextEditingController(text: existing?.name);
    final phoneCtrl = TextEditingController(text: existing?.phone);
    String category = existing?.category.isEmpty != false
        ? 'Gara'
        : existing!.category;
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
            DropdownButtonFormField<String>(
              value: category,
              decoration: const InputDecoration(
                  labelText: 'Loại NCC', border: OutlineInputBorder()),
              items: ['Gara', 'Xăng dầu', 'Lốp xe', 'Phụ tùng', 'Bảo hiểm']
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (v) => category = v ?? category,
            ),
            const SizedBox(height: 8),
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
    if (ok != true) return;
    final s = existing ?? (VantaiSupplier()..supplierId = const Uuid().v4());
    s.name = nameCtrl.text.trim();
    s.phone = phoneCtrl.text.trim();
    s.category = category;
    s.debt = double.tryParse(debtCtrl.text.trim()) ?? 0;
    await ref.read(vantaiSuppliersProvider.notifier).upsert(s);
  }

  Future<void> _payDebt(
      BuildContext context, WidgetRef ref, VantaiSupplier supplier) async {
    final ctrl = TextEditingController(text: '${supplier.debt.toInt()}');
    final amount = await showDialog<double>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('TRẢ NỢ: ${supplier.name}'),
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
              child: const Text('Xác nhận trả')),
        ],
      ),
    );
    if (amount == null || amount <= 0) return;
    await ref.read(vantaiSuppliersProvider.notifier).payDebt(supplier, amount);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suppliersAsync = ref.watch(vantaiSuppliersProvider);
    return suppliersAsync.when(
      data: (suppliers) => Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add_business),
          label: const Text('Thêm NCC'),
          onPressed: () => _addOrEdit(context, ref),
        ),
        body: suppliers.isEmpty
            ? const Center(child: Text('Chưa có NCC nào.'))
            : ListView(padding: const EdgeInsets.all(12), children: [
                Card(
                  color: Colors.red[50],
                  child: ListTile(
                    leading: const Icon(Icons.money_off_csred,
                        color: Colors.deepOrange, size: 32),
                    title: const Text('Tổng công nợ phải trả',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Text(VantaiPartnersScreen._money.format(
                        suppliers.fold<double>(0, (s, x) => s + x.debt))),
                  ),
                ),
                ...suppliers.map((s) => ListTile(
                      leading: Icon(
                        switch (s.category) {
                          'Gara' => Icons.build,
                          'Xăng dầu' => Icons.local_gas_station,
                          'Lốp xe' => Icons.circle_outlined,
                          'Phụ tùng' => Icons.settings_suggest,
                          _ => Icons.shield,
                        },
                        color: Colors.deepOrange,
                      ),
                      title: Text(s.name),
                      subtitle: Text(
                          '${s.category} • ${s.phone}\nNợ: ${VantaiPartnersScreen._money.format(s.debt)}'),
                      isThreeLine: true,
                      trailing: PopupMenuButton<String>(
                        onSelected: (v) {
                          if (v == 'edit') _addOrEdit(context, ref, s);
                          if (v == 'debt' && s.debt > 0) {
                            _payDebt(context, ref, s);
                          }
                        },
                        itemBuilder: (_) => [
                          const PopupMenuItem(value: 'edit', child: Text('Sửa')),
                          if (s.debt > 0)
                            const PopupMenuItem(
                                value: 'debt', child: Text('Trả nợ')),
                        ],
                      ),
                    )),
              ]),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
    );
  }
}
