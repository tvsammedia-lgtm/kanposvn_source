import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/auth/auth_service.dart';
import '../models/tt_order.dart';
import '../models/tt_partner.dart';
import '../models/tt_product.dart';
import '../providers/tt_providers.dart';
import 'tt_receipt_frame.dart';

class TtPurchaseScreen extends ConsumerStatefulWidget {
  const TtPurchaseScreen({super.key});

  @override
  ConsumerState<TtPurchaseScreen> createState() => _TtPurchaseScreenState();
}

class _PurLine {
  final TtProduct product;
  double quantity;
  double unitPrice;
  String unit;
  DateTime? expiryDate;

  _PurLine({
    required this.product,
    required this.quantity,
    required this.unitPrice,
    required this.unit,
    this.expiryDate,
  });

  double get amount => quantity * unitPrice;
}

class _TtPurchaseScreenState extends ConsumerState<TtPurchaseScreen> {
  final List<_PurLine> _lines = [];
  TtSupplier? _supplier;
  double _discount = 0;
  double _paid = 0;
  TtPaymentMethod _method = TtPaymentMethod.CASH;
  String _note = '';
  String _query = '';
  final _searchCtrl = TextEditingController();

  double get _subtotal => _lines.fold<double>(0, (s, l) => s + l.amount);
  double get _total => (_subtotal - _discount).clamp(0, double.infinity);
  double get _debt => (_total - _paid).clamp(0, double.infinity);

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_lines.isEmpty) return;
    if (_paid <= 0) _paid = _total;

    final db = await ref.read(ttIsarServiceProvider).db;
    final uuid = const Uuid();
    final no = (await db.ttPurchaseInvoices.count()) + 1;
    final invoiceNumber = 'PNB${no.toString().padLeft(4, '0')}';

    final invoice = TtPurchaseInvoice()
      ..purchaseId = uuid.v4()
      ..invoiceNumber = invoiceNumber
      ..purchaseDate = DateTime.now()
      ..totalAmount = _total
      ..discount = _discount
      ..paidAmount = _paid
      ..debtAmount = _debt
      ..paymentMethod = _method
      ..note = _note
      ..createdBy = 'purchase';
    if (_supplier != null) invoice.supplier.value = _supplier;

    final items = <TtPurchaseItem>[
      for (final line in _lines)
        TtPurchaseItem()
          ..quantity = line.quantity
          ..unit = line.unit
          ..unitPrice = line.unitPrice
          ..discount = 0
          ..amount = line.amount
          ..expiryDate = line.expiryDate
          ..product.value = line.product,
    ];

    final suppliers = <TtSupplier>[];
    if (_supplier != null) suppliers.add(_supplier!);
    final created = await ref.read(ttPurchasesProvider.notifier).createPurchase(invoice, items, suppliers);

    final printIt = await showDialog<bool>(
      context: context,
      builder: (context) => TtReceiptPreviewDialog(
        title: 'PHIẾU NHẬP HÀNG',
        number: invoiceNumber,
        lines: [
          for (final line in _lines)
            '${line.product.name}  ${formatQty(line.quantity)} ${line.unit} × ${formatMoney(line.unitPrice)} = ${formatMoney(line.amount)}',
        ],
        totals: {
          'Tạm tính': _subtotal,
          'Giảm giá': _discount,
          'Tổng tiền': _total,
          'Đã trả ($_method.label)': _paid,
          if (_debt > 0) 'Còn nợ NCC': _debt,
        },
        customer: _supplier?.name,
        meta: {'Số phiếu': invoiceNumber, 'ID': created.purchaseId},
      ),
    );
    if (printIt == true) {
      await TtReceiptFrame.printReceipt(
        storeName: await _storeName(),
        title: 'PHIẾU NHẬP HÀNG',
        number: invoiceNumber,
        lines: [
          for (final line in _lines)
            '${line.product.name}  ${formatQty(line.quantity)} ${line.unit} × ${formatMoney(line.unitPrice)} = ${formatMoney(line.amount)}',
        ],
        totals: {
          'Tạm tính': _subtotal,
          'Giảm giá': _discount,
          'Tổng tiền': _total,
          'Đã trả ($_method.label)': _paid,
          if (_debt > 0) 'Còn nợ NCC': _debt,
        },
        customer: _supplier?.name,
      );
    }

    setState(() {
      _lines.clear();
      _supplier = null;
      _discount = 0;
      _paid = 0;
      _note = '';
    });
  }

  Future<String> _storeName() async {
    try {
      return (await AuthService.loadSavedStoreName()) ?? 'SẠP RAU CỦ QUẢ';
    } catch (_) {
      return 'SẠP RAU CỦ QUẢ';
    }
  }

  Future<void> _pickSupplier() async {
    final suppliers = await ref.read(ttSuppliersProvider.future);
    final picked = await showModalBottomSheet<TtSupplier>(
      context: context,
      builder: (context) => ListView(
        shrinkWrap: true,
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text('Chọn nhà cung cấp', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          for (final s in suppliers)
            ListTile(
              leading: const Icon(Icons.local_shipping),
              title: Text(s.name),
              subtitle: Text('${s.contactPerson} • ${s.phone}'),
              onTap: () => Navigator.pop(context, s),
            ),
        ],
      ),
    );
    if (picked != null) setState(() => _supplier = picked);
  }

  Future<void> _addLine(TtProduct p) async {
    final priceCtrl = TextEditingController(text: p.defaultPurchasePrice.toStringAsFixed(0));
    final qtyCtrl = TextEditingController(text: '1.0');
    final expiryCtrl = TextEditingController();
    DateTime? expiry;
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Nhập ${p.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: priceCtrl,
              decoration: const InputDecoration(labelText: 'Đơn giá nhập (đ)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: qtyCtrl,
              decoration: InputDecoration(labelText: 'Số lượng (${p.purchaseUnit})'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: expiryCtrl,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Hạn sử dụng (${p.shelfLifeDays > 0 ? 'tự động ${p.shelfLifeDays} ngày' : 'tùy chọn'})',
                suffixIcon: const Icon(Icons.event),
              ),
              onTap: () async {
                final d = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now().add(Duration(days: p.shelfLifeDays > 0 ? p.shelfLifeDays : 7)),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (d != null) {
                  expiry = d;
                  expiryCtrl.text = '${d.day}/${d.month}/${d.year}';
                }
              },
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Hủy')),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
    if (result != true) return;
    setState(() {
      _lines.add(_PurLine(
        product: p,
        quantity: double.tryParse(qtyCtrl.text.replaceAll(',', '.')) ?? 1,
        unitPrice: double.tryParse(priceCtrl.text.replaceAll(',', '.')) ?? p.defaultPurchasePrice,
        unit: p.purchaseUnit,
        expiryDate: expiry ?? (p.shelfLifeDays > 0 ? DateTime.now().add(Duration(days: p.shelfLifeDays)) : null),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(ttProductsProvider);
    final isDesktop = MediaQuery.of(context).size.width > 900;

    final list = productsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Lỗi: $e')),
      data: (products) {
        final filtered = products.where((p) {
          final q = _query.trim().toLowerCase();
          if (q.isEmpty) return true;
          return p.name.toLowerCase().contains(q) || p.sku.toLowerCase().contains(q);
        }).toList();
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: filtered.length,
          itemBuilder: (context, i) {
            final p = filtered[i];
            final inCart = _lines.where((l) => l.product.id == p.id).firstOrNull;
            return ListTile(
              leading: const Icon(Icons.inventory, color: Color(0xFF16A34A)),
              title: Text(p.name),
              subtitle: Text('Giá nhập: ${formatMoney(p.defaultPurchasePrice)}đ / ${p.purchaseUnit} • HSD: ${p.shelfLifeDays} ngày'),
              trailing: inCart != null
                  ? Chip(label: Text(formatQty(inCart.quantity)), backgroundColor: Colors.green.shade100)
                  : const Icon(Icons.add_circle_outline, color: Color(0xFF16A34A)),
              onTap: () => _addLine(p),
            );
          },
        );
      },
    );

    final formPanel = Container(
      width: isDesktop ? 340 : double.infinity,
      color: const Color(0xFFF0FDF4),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _pickSupplier,
                  icon: const Icon(Icons.local_shipping),
                  label: Text(_supplier?.name ?? 'Chọn NCC'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DropdownButtonFormField<TtPaymentMethod>(
                  value: _method,
                  decoration: const InputDecoration(isDense: true, labelText: 'Trả bằng'),
                  items: [
                    for (final m in TtPaymentMethod.values)
                      DropdownMenuItem(value: m, child: Text(m.label)),
                  ],
                  onChanged: (v) => setState(() => _method = v ?? TtPaymentMethod.CASH),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: _lines.isEmpty
                ? const Center(child: Text('Chưa có mặt hàng nào', style: TextStyle(color: Colors.grey)))
                : ListView.builder(
                    itemCount: _lines.length,
                    itemBuilder: (context, i) {
                      final line = _lines[i];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 6),
                        child: ListTile(
                          dense: true,
                          title: Text(line.product.name),
                          subtitle: Text('${formatQty(line.quantity)} ${line.unit} × ${formatMoney(line.unitPrice)}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline, color: Colors.red),
                            onPressed: () => setState(() => _lines.remove(line)),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          const Divider(),
          Row(
            children: [
              const Text('Tạm tính:', style: TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(formatMoney(_subtotal), style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text('Chiết khấu:'),
              const Spacer(),
              SizedBox(
                width: 100,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(isDense: true, hintText: '0'),
                  onChanged: (v) => setState(() => _discount = double.tryParse(v.replaceAll(',', '.')) ?? 0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text('Đã trả NCC:', style: TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              SizedBox(
                width: 100,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(isDense: true, hintText: '0'),
                  onChanged: (v) => setState(() => _paid = double.tryParse(v.replaceAll(',', '.')) ?? 0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text('Tổng:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const Spacer(),
              Text(formatMoney(_total), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green)),
            ],
          ),
          if (_debt > 0)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text('Sẽ ghi công nợ NCC: ${formatMoney(_debt)}', style: const TextStyle(color: Colors.orange, fontSize: 12)),
            ),
          const SizedBox(height: 8),
          TextField(
            decoration: const InputDecoration(labelText: 'Ghi chú', isDense: true),
            onChanged: (v) => _note = v,
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 46,
            child: FilledButton.icon(
              style: FilledButton.styleFrom(backgroundColor: const Color(0xFF16A34A)),
              onPressed: _lines.isEmpty ? null : _save,
              icon: const Icon(Icons.save),
              label: const Text('LƯU PHIẾU NHẬP', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF16A34A),
        foregroundColor: Colors.white,
        title: const Text('Nhập Hàng', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  color: Colors.white,
                  child: TextField(
                    controller: _searchCtrl,
                    decoration: InputDecoration(
                      hintText: 'Tìm sản phẩm để nhập...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onChanged: (v) => setState(() => _query = v),
                  ),
                ),
                Expanded(child: list),
              ],
            ),
          ),
          if (isDesktop) const VerticalDivider(thickness: 1, width: 1),
          formPanel,
        ],
      ),
    );
  }
}

String formatMoney(double value) {
  final abs = value.abs().toStringAsFixed(0);
  final buf = StringBuffer();
  for (var i = 0; i < abs.length; i++) {
    if (i > 0 && (abs.length - i) % 3 == 0) buf.write('.');
    buf.write(abs[i]);
  }
  return buf.toString();
}

String formatQty(double value) {
  if (value == value.roundToDouble()) return value.round().toString();
  return value.toString();
}