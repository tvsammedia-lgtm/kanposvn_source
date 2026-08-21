import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/spa_expense.dart';
import '../models/spa_inventory_models.dart';
import '../providers/spa_crm_inventory_providers.dart';
import '../providers/spa_providers.dart';
import '../providers/spa_operations_providers.dart';

/// POS bán sản phẩm lẻ (spec §13) + thanh toán đa phương thức (§14).
class SpaProductPosScreen extends ConsumerStatefulWidget {
  const SpaProductPosScreen({super.key});

  @override
  ConsumerState<SpaProductPosScreen> createState() =>
      _SpaProductPosScreenState();
}

class _SpaProductPosScreenState extends ConsumerState<SpaProductPosScreen> {
  final Map<String, int> _cart = {}; // productId -> qty
  String _search = '';

  static final _currency =
      NumberFormat.currency(locale: 'vi_VN', symbol: '₫', decimalDigits: 0);

  static const _paymentMethods = [
    'Tiền mặt',
    'Chuyển khoản',
    'QR Code',
    'Ví điện tử',
    'Thẻ',
  ];

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(spaProductsProvider);
    final products = (productsAsync.value ?? [])
        .where((p) =>
            _search.isEmpty ||
            p.name.toLowerCase().contains(_search.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bán Sản Phẩm'),
        actions: [
          IconButton(
            icon: Stack(children: [
              const Icon(Icons.shopping_cart),
              if (_cart.isNotEmpty)
                Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text('${_cart.length}',
                        style:
                            const TextStyle(fontSize: 10, color: Colors.white)),
                  ),
                ),
            ]),
            onPressed: _cart.isEmpty ? null : () => _showCartSheet(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm sản phẩm...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
                isDense: true,
              ),
              onChanged: (v) => setState(() => _search = v),
            ),
          ),
          Expanded(
            child: productsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Lỗi: $e')),
              data: (_) => GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: .78,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: products.length,
                itemBuilder: (_, i) {
                  final p = products[i];
                  final inCart = _cart[p.productId] ?? 0;
                  return InkWell(
                    onTap: () => setState(() {
                      if (p.stock > inCart) _cart[p.productId] = inCart + 1;
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: inCart > 0
                              ? const BorderSide(color: Colors.pink, width: 2)
                              : BorderSide.none),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Center(
                                child: Icon(_categoryIcon(p.category.label),
                                    size: 40, color: Colors.pink.shade300),
                              ),
                            ),
                            Text(p.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                            Text(_currency.format(p.price),
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600])),
                            Text(
                                'Kho: ${p.stock} ${p.unit}'
                                '${inCart > 0 ? ' • Giỏ: $inCart' : ''}',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: p.stock <= 5
                                        ? Colors.red
                                        : Colors.green)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _categoryIcon(String cat) => switch (cat) {
        'Chăm sóc da' => Icons.spa,
        'Tinh dầu' => Icons.water_drop,
        _ => Icons.inventory_2,
      };

  void _showCartSheet(BuildContext context) {
    final products = ref.read(spaProductsProvider).value ?? [];
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        double total = _calcTotal(products);
        return StatefulBuilder(
          builder: (ctx, setSState) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(ctx).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Giỏ hàng',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ..._cart.entries.map((e) {
                  final p =
                      products.firstWhere((x) => x.productId == e.key);
                  return ListTile(
                    dense: true,
                    title: Text(p.name),
                    subtitle: Text(_currency.format(p.price)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            icon: const Icon(Icons.remove_circle_outline,
                                size: 20),
                            onPressed: () => setSState(() {
                                  if (e.value <= 1) {
                                    _cart.remove(e.key);
                                  } else {
                                    _cart[e.key] = e.value - 1;
                                  }
                                  total = _calcTotal(products);
                                })),
                        Text('${e.value}'),
                        IconButton(
                            icon: const Icon(Icons.add_circle_outline,
                                size: 20),
                            onPressed: () => setSState(() {
                                  if (e.value < p.stock) {
                                    _cart[e.key] = e.value + 1;
                                  }
                                  total = _calcTotal(products);
                                })),
                        Text(_currency.format(p.price * e.value),
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  );
                }),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Tổng cộng',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(_currency.format(total),
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink)),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14)),
                    icon: const Icon(Icons.payments),
                    label: const Text('Thanh toán'),
                    onPressed: () {
                      Navigator.pop(ctx);
                      _showPaymentDialog(context, total);
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  double _calcTotal(List products) {
    double t = 0;
    for (final e in _cart.entries) {
      final p = products.firstWhere((x) => x.productId == e.key);
      t += p.price * e.value;
    }
    return t;
  }

  void _showPaymentDialog(BuildContext context, double total) {
    final splits = <String, double>{_paymentMethods.first: total};

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDState) {
          final sumPaid = splits.values.fold<double>(0, (s, v) => s + v);
          return AlertDialog(
            title: const Text('Thanh toán đa phương thức'),
            content: SizedBox(
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...splits.entries.map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: DropdownButtonFormField<String>(
                                initialValue: e.key,
                                decoration: const InputDecoration(isDense: true),
                                items: _paymentMethods
                                    .where((m) =>
                                        !splits.containsKey(m) || m == e.key)
                                    .map((m) => DropdownMenuItem(
                                        value: m, child: Text(m)))
                                    .toList(),
                                onChanged: (v) => setDState(() {
                                  if (v != null && v != e.key) {
                                    final old = Map.of(splits);
                                    splits.clear();
                                    old.forEach((k, val) {
                                      splits[k == e.key ? v : k] = val;
                                    });
                                  }
                                }),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                initialValue: e.value.toStringAsFixed(0),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    isDense: true, suffixText: '₫'),
                                onChanged: (v) => splits[e.key] =
                                    double.tryParse(v.replaceAll(',', '')) ??
                                        0,
                              ),
                            ),
                          ],
                        ),
                      )),
                  TextButton.icon(
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Thêm phương thức'),
                    onPressed: splits.length >= _paymentMethods.length
                        ? null
                        : () => setDState(() {
                              final next = _paymentMethods
                                  .firstWhere((m) => !splits.containsKey(m));
                              splits[next] = 0;
                            }),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cần trả: ${_currency.format(total)}'),
                      Text(
                        'Đã trả: ${_currency.format(sumPaid)}'
                        '${sumPaid < total ? ' (Thiếu)' : ''}',
                        style: TextStyle(
                            color:
                                sumPaid >= total ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Huỷ')),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white),
                onPressed: sumPaid >= total && total > 0
                    ? () async {
                        await _completeSale(total, splits);
                        if (context.mounted) Navigator.pop(ctx);
                      }
                    : null,
                child: const Text('Xác nhận'),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _completeSale(double total, Map<String, dynamic> splits) async {
    final db = await ref.read(spaIsarServiceProvider).db;
    final products = ref.read(spaProductsProvider).value ?? [];

    await db.writeTxn(() async {
      // Xuất kho từng sản phẩm trong giỏ
      for (final e in _cart.entries) {
        final p = products.firstWhere((x) => x.productId == e.key);
        await db.spaInventoryTxs.put(SpaInventoryTx()
          ..productId = p.productId
          ..productName = p.name
          ..quantity = -e.value
          ..type = SpaInventoryTxType.EXPORT
          ..note = 'Bán lẻ tại quầy'
          ..createdAt = DateTime.now());
        p.stock -= e.value;
        await db.spaProducts.put(p);
      }
      // Ghi nhận doanh thu bán lẻ vào P&L
      await db.spaExpenses.put(SpaExpense()
        ..expenseId = const Uuid().v4()
        ..content = 'Bán lẻ sản phẩm (${_cart.length} mặt hàng)'
        ..amount = total
        ..type = SpaExpenseType.REVENUE
        ..category = 'Bán sản phẩm'
        ..spentAt = DateTime.now()
        ..notes = jsonEncode(splits));
    });

    ref.read(spaProductsProvider.notifier).loadProducts();
    ref.read(spaInventoryProvider.notifier).loadTransactions();
    ref.read(spaExpensesProvider.notifier).load();
    if (mounted) setState(() => _cart.clear());

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Đã bán thành công! Doanh thu: ${_currency.format(total)}'),
        backgroundColor: Colors.green,
      ));
    }
  }
}
