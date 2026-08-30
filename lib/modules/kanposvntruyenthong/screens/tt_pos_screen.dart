import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../../../core/auth/auth_service.dart';
import '../models/tt_order.dart';
import '../models/tt_partner.dart';
import '../models/tt_product.dart';
import '../models/tt_stock.dart';
import '../providers/tt_providers.dart';
import 'tt_receipt_frame.dart';

class TtPosScreen extends ConsumerStatefulWidget {
  const TtPosScreen({super.key});

  @override
  ConsumerState<TtPosScreen> createState() => _TtPosScreenState();
}

class _CartLine {
  final TtProduct product;
  double quantity;
  double unitPrice;
  double costPrice;
  String lotId;
  String unit;

  _CartLine({
    required this.product,
    required this.quantity,
    required this.unitPrice,
    required this.costPrice,
    required this.lotId,
    required this.unit,
  });

  double get amount => quantity * unitPrice;
}

class _TtPosScreenState extends ConsumerState<TtPosScreen> {
  final List<_CartLine> _cart = [];
  TtCustomer? _customer;
  TtPaymentMethod _method = TtPaymentMethod.CASH;
  double _discount = 0;
  double _paid = 0;
  double _redeemPoints = 0;
  String _note = '';
  String _query = '';
  final _searchCtrl = TextEditingController();

  double get _subtotal => _cart.fold<double>(0, (s, l) => s + l.amount);
  double get _loyaltyDiscount => _redeemPoints * 1000;
  double get _total => (_subtotal - _discount - _loyaltyDiscount).clamp(0, double.infinity);
  double get _debt => (_total - _paid).clamp(0, double.infinity);

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _checkout() async {
    if (_cart.isEmpty) return;
    if (_method == TtPaymentMethod.DEBT) {
      if (_customer == null) {
        _showMsg('Ghi công nợ cần chọn khách hàng.');
        return;
      }
      _paid = _total * 0.3; // Thanh toán min 30%
    } else if (_paid <= 0) {
      _paid = _total;
    }

    final db = await ref.read(ttIsarServiceProvider).db;
    final uuid = const Uuid();
    final salesNo = (await db.ttSalesInvoices.count()) + 1;
    final invoiceNumber = 'HDB${salesNo.toString().padLeft(4, '0')}';
    final totalCost = _cart.fold<double>(0, (s, l) => s + l.costPrice * l.quantity);

    final invoice = TtSalesInvoice()
      ..invoiceId = uuid.v4()
      ..invoiceNumber = invoiceNumber
      ..saleDate = DateTime.now()
      ..subtotal = _subtotal
      ..discount = _discount
      ..loyaltyDiscount = _loyaltyDiscount
      ..totalAmount = _total
      ..costAmount = totalCost
      ..paidAmount = _paid
      ..debtAmount = _debt
      ..paymentMethod = _method
      ..status = _debt > 0 ? TtSaleStatus.DEBT : TtSaleStatus.COMPLETED
      ..note = _note
      ..createdBy = 'pos';
    if (_customer != null) {
      invoice.customer.value = _customer;
    }

    final items = <TtSalesItem>[];
    for (final line in _cart) {
      final item = TtSalesItem()
        ..quantity = line.quantity
        ..unit = line.unit
        ..unitPrice = line.unitPrice
        ..costPrice = line.costPrice
        ..discount = 0
        ..amount = line.amount;
      item.product.value = line.product;
      final lot = await db.ttStockLots.where().filter().product((p) => p.idEqualTo(line.product.id)).findFirst();
      item.lotId = lot?.lotId ?? '';
      items.add(item);
    }

    final buyers = <TtCustomer>[];
    if (_customer != null) buyers.add(_customer!);
    final created = await ref.read(ttSalesProvider.notifier).createSale(invoice, items, buyers);

    final printed = await showDialog<bool>(
      context: context,
      builder: (context) => TtReceiptPreviewDialog(
        title: 'HÓA ĐƠN BÁN LẺ',
        number: invoiceNumber,
        lines: [
          for (final line in _cart)
            '${line.product.name}  ${formatQty(line.quantity)} ${line.unit} × ${formatMoney(line.unitPrice)} = ${formatMoney(line.amount)}',
        ],
        totals: {
          'Tạm tính': _subtotal,
          'Giảm giá': _discount,
          'Điểm thưởng (${_redeemPoints.round()} đ)': _loyaltyDiscount,
          'Tổng tiền': _total,
          'Đã trả ($_method.label)': _paid,
          if (_debt > 0) 'Còn nợ': _debt,
        },
        customer: _customer?.name,
        footer: 'Cảm ơn quý khách!',
        meta: {
          'ID': created.invoiceId,
          'Số HĐ': invoiceNumber,
        },
      ),
    );
    if (printed == true) {
      await TtReceiptFrame.printReceipt(
        storeName: await _storeName(),
        title: 'HÓA ĐƠN BÁN LẺ',
        number: invoiceNumber,
        lines: [
          for (final line in _cart)
            '${line.product.name}  ${formatQty(line.quantity)} ${line.unit} × ${formatMoney(line.unitPrice)} = ${formatMoney(line.amount)}',
        ],
        totals: {
          'Tạm tính': _subtotal,
          'Giảm giá': _discount,
          'Điểm thưởng (${_redeemPoints.round()} đ)': _loyaltyDiscount,
          'Tổng tiền': _total,
          'Đã trả ($_method.label)': _paid,
          if (_debt > 0) 'Còn nợ': _debt,
        },
        customer: _customer?.name,
      );
    }

    setState(() {
      _cart.clear();
      _customer = null;
      _discount = 0;
      _paid = 0;
      _redeemPoints = 0;
      _note = '';
    });
  }

  Future<String> _storeName() async {
    try {
      final n = await AuthService.loadSavedStoreName();
      return n ?? 'SẠP RAU CỦ QUẢ';
    } catch (_) {
      return 'SẠP RAU CỦ QUẢ';
    }
  }

  void _showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void _addToCart(TtProduct p, {double qty = 1}) {
    setState(() {
      final existing = _cart.where((l) => l.product.id == p.id).firstOrNull;
      if (existing != null) {
        existing.quantity += qty;
      } else {
        _cart.add(_CartLine(
          product: p,
          quantity: qty,
          unitPrice: p.defaultSalePrice,
          costPrice: p.defaultPurchasePrice,
          lotId: '',
          unit: p.saleUnit,
        ));
      }
    });
  }

  Future<void> _editLine(_CartLine line) async {
    final priceCtrl = TextEditingController(text: line.unitPrice.toStringAsFixed(0));
    final qtyCtrl = TextEditingController(text: line.quantity.toString());
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(line.product.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: priceCtrl,
              decoration: const InputDecoration(labelText: 'Đơn giá (đ)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: qtyCtrl,
              decoration: const InputDecoration(labelText: 'Số lượng'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Hủy')),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
    if (result != true) return;
    setState(() {
      line.unitPrice = double.tryParse(priceCtrl.text.replaceAll(',', '.')) ?? line.unitPrice;
      line.quantity = double.tryParse(qtyCtrl.text.replaceAll(',', '.')) ?? line.quantity;
      if (line.quantity <= 0) _cart.remove(line);
    });
  }

  Future<void> _pickCustomer() async {
    final customers = await ttLoadCustomersForUi(ref);
    final picked = await showModalBottomSheet<TtCustomer>(
      context: context,
      builder: (context) => ListView(
        shrinkWrap: true,
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text('Chọn khách hàng', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          for (final c in customers)
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(c.name),
              subtitle: Text('${c.customerType.label} • Điểm: ${c.loyaltyPoint.round()}'),
              trailing: c == _customer ? const Icon(Icons.check, color: Colors.green) : null,
              onTap: () => Navigator.pop(context, c),
            ),
        ],
      ),
    );
    if (picked != null) {
      setState(() => _customer = picked);
    }
  }

  Future<void> _pickMethod() async {
    final picked = await showModalBottomSheet<TtPaymentMethod>(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ListTile(title: Text('Phương thức thanh toán', style: TextStyle(fontWeight: FontWeight.bold))),
          for (final m in TtPaymentMethod.values)
            ListTile(
              leading: Icon(m == TtPaymentMethod.CASH
                  ? Icons.payments
                  : m == TtPaymentMethod.TRANSFER
                      ? Icons.account_balance
                      : m == TtPaymentMethod.QR
                          ? Icons.qr_code
                          : Icons.receipt_long),
              title: Text(m.label),
              trailing: m == _method ? const Icon(Icons.check, color: Colors.green) : null,
              onTap: () => Navigator.pop(context, m),
            ),
        ],
      ),
    );
    if (picked != null) setState(() => _method = picked);
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(ttProductsProvider);
    final isDesktop = MediaQuery.of(context).size.width > 900;

    final grid = productsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Lỗi: $e')),
      data: (products) {
        final filtered = products.where((p) {
          final q = _query.trim().toLowerCase();
          if (q.isEmpty) return true;
          return p.name.toLowerCase().contains(q) || p.sku.toLowerCase().contains(q) || p.barcode.toLowerCase().contains(q);
        }).toList();
        return GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: isDesktop ? 1.1 : 0.9,
          ),
          itemCount: filtered.length,
          itemBuilder: (context, i) {
            final p = filtered[i];
            return Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  _addToCart(p);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(_productIcon(p.category.value?.name), color: const Color(0xFF16A34A)),
                      const SizedBox(height: 4),
                      Text(
                        p.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text('${formatMoney(p.defaultSalePrice)} đ/${p.saleUnit}'),
                      Text(
                        'Nhập: ${formatMoney(p.defaultPurchasePrice)}',
                        style: const TextStyle(color: Colors.grey, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );

    final cartPanel = Container(
      width: isDesktop ? 340 : double.infinity,
      color: const Color(0xFFF0FDF4),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _pickCustomer,
                  icon: const Icon(Icons.person_add),
                  label: Text(_customer?.name ?? 'Khách lẻ'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _pickMethod,
                  icon: const Icon(Icons.payment),
                  label: Text(_method.label),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: _cart.isEmpty
                ? const Center(child: Text('Chưa có sản phẩm nào', style: TextStyle(color: Colors.grey)))
                : ListView.builder(
                    itemCount: _cart.length,
                    itemBuilder: (context, i) {
                      final line = _cart[i];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 6),
                        child: ListTile(
                          dense: true,
                          title: Text(line.product.name),
                          subtitle: Text('${formatQty(line.quantity)} ${line.unit} × ${formatMoney(line.unitPrice)}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, size: 18),
                                onPressed: () => _editLine(line),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete_outline, size: 18, color: Colors.red),
                                onPressed: () => setState(() => _cart.remove(line)),
                              ),
                            ],
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
              const Text('Giảm giá:'),
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
          if (_customer != null && _customer!.loyaltyPoint > 0) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                Text('Đổi điểm (${_customer!.loyaltyPoint.round()} đ):'),
                const Spacer(),
                SizedBox(
                  width: 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(isDense: true, hintText: '0'),
                    onChanged: (v) {
                      final pts = double.tryParse(v.replaceAll(',', '.')) ?? 0;
                      setState(() => _redeemPoints = pts.clamp(0, _customer!.loyaltyPoint));
                    },
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 4),
          Row(
            children: [
              const Text('Tổng:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const Spacer(),
              Text(formatMoney(_total), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green)),
            ],
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: const InputDecoration(labelText: 'Khách đưa (Tiền mặt)', isDense: true),
            keyboardType: TextInputType.number,
            onChanged: (v) {
              if (_method != TtPaymentMethod.DEBT) {
                setState(() => _paid = double.tryParse(v.replaceAll(',', '.')) ?? 0);
              }
            },
          ),
          if (_method == TtPaymentMethod.DEBT)
            const Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text('Ghi công nợ: thanh toán 30% ngay', style: TextStyle(color: Colors.orange, fontSize: 12)),
            ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 46,
            child: FilledButton.icon(
              style: FilledButton.styleFrom(backgroundColor: const Color(0xFF16A34A)),
              onPressed: _cart.isEmpty ? null : _checkout,
              icon: const Icon(Icons.point_of_sale),
              label: const Text('THANH TOÁN', style: TextStyle(fontWeight: FontWeight.bold)),
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
        title: const Text('Bán Hàng', style: TextStyle(fontWeight: FontWeight.bold)),
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
                      hintText: 'Tìm sản phẩm, mã, barcode...',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchCtrl.clear();
                          setState(() => _query = '');
                        },
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onChanged: (v) => setState(() => _query = v),
                  ),
                ),
                Expanded(child: grid),
              ],
            ),
          ),
          if (isDesktop) const VerticalDivider(thickness: 1, width: 1),
          cartPanel,
        ],
      ),
    );
  }

  IconData _productIcon(String? category) {
    switch (category ?? '') {
      case 'Rau lá':
        return Icons.eco;
      case 'Củ':
        return Icons.agriculture;
      case 'Quả':
        return Icons.apple;
      case 'Đậu':
        return Icons.eco_outlined;
      case 'Nấm':
        return Icons.umbrella;
      default:
        return Icons.local_mall;
    }
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