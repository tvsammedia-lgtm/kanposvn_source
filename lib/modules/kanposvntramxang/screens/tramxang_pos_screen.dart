import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../models/sale.dart';
import '../providers/tramxang_providers.dart';
import '../services/tramxang_isar_service.dart';

/// POS bán hàng trạm xăng + tạp hóa: giỏ hàng, khách nợ, chiết khấu,
/// thanh toán (tiền mặt / chuyển khoản / QR / ghi nợ).
class TramXangPosScreen extends ConsumerStatefulWidget {
  const TramXangPosScreen({super.key});

  @override
  ConsumerState<TramXangPosScreen> createState() => _TramXangPosScreenState();
}

class _CartLine {
  final TramXangProduct product;
  int qty = 1;

  _CartLine(this.product);

  double get price => product.retailPrice;
}

class _TramXangPosScreenState extends ConsumerState<TramXangPosScreen> {
  final List<_CartLine> _cart = [];
  String _paymentMethod = 'CASH';
  String? _customerId;
  double _discount = 0;
  bool _checkingOut = false;

  String _money(double v) {
    final s = v.toStringAsFixed(0);
    return s.replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+$)'), (m) => '${m[1]}.');
  }

  void _reloadStocks() {
    ref.invalidate(tramXangInventoryTxProvider);
    ref.read(tramXangTanksProvider.notifier).loadTanks();
    ref.read(tramXangPumpNozzlesProvider.notifier).loadNozzles();
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(tramXangProductsProvider);
    final customers = ref.watch(tramXangCustomersProvider);
    final shift = ref.watch(tramXangActiveShiftProvider);
    final invTxs = ref.watch(tramXangInventoryTxProvider);

    final stockMap = <String, double>{};
    if (invTxs is AsyncData) {
      for (final tx in invTxs.value ?? const []) {
        stockMap[tx.productId] = (stockMap[tx.productId] ?? 0) + tx.inQty - tx.outQty;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('POS Bán Hàng')),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: [
                if (shift == null)
                  MaterialBanner(
                    backgroundColor: const Color(0xFFFFF3E0),
                    content: const Text('Chưa mở ca bán hàng.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          _openShiftNow();
                        },
                        child: const Text('MỞ CA NGAY'),
                      ),
                    ],
                  ),
                Expanded(child: _buildProductGrid(products, stockMap)),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: _buildCartPanel(customers, shift),
          ),
        ],
      ),
    );
  }

  Future<void> _openShiftNow() async {
    await ref.read(tramXangActiveShiftProvider.notifier).openShift(
          TramXangShift()
            ..shiftId =
                'shift_${DateTime.now().millisecondsSinceEpoch}'
            ..employeeId = 'EMP_OWNER'
            ..openedAt = DateTime.now()
            ..openingCash = 200000
            ..status = 'OPEN',
        );
  }

  Widget _buildProductGrid(
      List<TramXangProduct> products, Map<String, double> stockMap) {
    if (products.isEmpty) {
      return const Center(child: Text('Chưa có sản phẩm nào.'));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.9,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final p = products[index];
        final stock = stockMap[p.productId] ?? 0;
        final outOfStock = p.trackInventory && stock <= 0;
        return Card(
          color: outOfStock ? const Color(0xFFFAFAFA) : null,
          child: InkWell(
            onTap: outOfStock
                ? null
                : () {
                    setState(() {
                      _CartLine? line;
                      for (final l in _cart) {
                        if (l.product.productId == p.productId) {
                          line = l;
                          break;
                        }
                      }
                      if (line != null) {
                        line.qty++;
                      } else {
                        _cart.add(_CartLine(p));
                      }
                    });
                  },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_basket, size: 32, color: Colors.orange),
                  const SizedBox(height: 4),
                  Text(
                    p.name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                  ),
                  Text('${_money(p.retailPrice)} đ',
                      style: const TextStyle(color: Colors.orange, fontSize: 12)),
                  Text(
                    outOfStock ? 'Hết hàng' : 'Tồn: ${_money(stock)}',
                    style: TextStyle(
                        color: outOfStock ? Colors.red : Colors.grey,
                        fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCartPanel(
      List<TramXangCustomer> customers, TramXangShift? shift) {
    final subtotal = _cart.fold<double>(0, (s, l) => s + l.price * l.qty);
    final total = subtotal - _discount;

    return Container(
      color: const Color(0xFFF5F5F5),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const Text('Giỏ hàng',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          Expanded(
            child: _cart.isEmpty
                ? const Center(child: Text('Chưa có sản phẩm.\nChạm vào sản phẩm để thêm.', textAlign: TextAlign.center))
                : ListView.builder(
                    itemCount: _cart.length,
                    itemBuilder: (context, i) {
                      final line = _cart[i];
                      return ListTile(
                        dense: true,
                        leading: IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () => setState(() {
                            if (line.qty > 1) {
                              line.qty--;
                            } else {
                              _cart.removeAt(i);
                            }
                          }),
                        ),
                        title: Text(line.product.name,
                            maxLines: 1, overflow: TextOverflow.ellipsis),
                        subtitle: Text('${_money(line.price)} x ${line.qty}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(_money(line.price * line.qty)),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () => setState(() => line.qty++),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          const Divider(),
          Row(
            children: [
              const Text('Chiết khấu (đ): '),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (v) =>
                      setState(() => _discount = double.tryParse(v) ?? 0),
                  decoration: const InputDecoration(isDense: true),
                ),
              ),
            ],
          ),
          DropdownButtonFormField<String>(
            initialValue: _customerId,
            decoration: const InputDecoration(
                labelText: 'Khách hàng (tùy chọn)', isDense: true),
            items: [
              const DropdownMenuItem(value: null, child: Text('Khách lẻ')),
              for (final c in customers)
                DropdownMenuItem(
                    value: c.customerId, child: Text('${c.name} (${c.code})')),
            ],
            onChanged: (v) => setState(() => _customerId = v),
          ),
          Wrap(
            spacing: 4,
            children: [
              for (final m in [
                ('CASH', 'Tiền mặt'),
                ('TRANSFER', 'Chuyển khoản'),
                ('QR', 'QR Code'),
                ('DEBT', 'Ghi nợ'),
              ])
                ChoiceChip(
                  label: Text(m.$2),
                  selected: _paymentMethod == m.$1,
                  onSelected: (_) => setState(() => _paymentMethod = m.$1),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Tổng (chưa thuế):',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(_money(total),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 4),
          ElevatedButton.icon(
            icon: _checkingOut
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.payment),
            label: const Text('THANH TOÁN'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed:
                _cart.isEmpty || _checkingOut ? null : () => _checkout(),
          ),
        ],
      ),
    );
  }

  Future<void> _checkout() async {
    TramXangCustomer? customer;
    if (_customerId != null) {
      for (final c in ref.read(tramXangCustomersProvider)) {
        if (c.customerId == _customerId) {
          customer = c;
          break;
        }
      }
    }
    setState(() => _checkingOut = true);
    try {
      final sale = await ref.read(tramXangSalesProvider.notifier).createSale(
            items: [
              for (final l in _cart)
                TramXangSaleItem(
                  product: l.product,
                  quantity: l.qty.toDouble(),
                  unitPrice: l.price,
                ),
            ],
            paymentMethod: _paymentMethod,
            customer: customer,
            discount: _discount,
          );
      _reloadStocks();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'Đã lưu hóa đơn ${sale.saleNo} - ${_money(sale.total)} đ'),
        backgroundColor: Colors.green,
      ));
      setState(() {
        _cart.clear();
        _discount = 0;
        _customerId = null;
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$e'), backgroundColor: Colors.red));
    } finally {
      if (mounted) setState(() => _checkingOut = false);
    }
  }
}