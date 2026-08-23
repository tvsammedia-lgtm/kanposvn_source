import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../models/gym_product.dart';
import '../providers/gym_providers.dart';

final _money = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0);

/// POS mini bán nước uống, phụ kiện... (PRD §15) — tự trừ kho khi bán.
class GymPosScreen extends ConsumerStatefulWidget {
  const GymPosScreen({super.key});

  @override
  ConsumerState<GymPosScreen> createState() => _GymPosScreenState();
}

class _GymPosScreenState extends ConsumerState<GymPosScreen> {
  final Map<String, int> _cart = {}; // productId -> qty

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(gymProductsProvider);
    double total = 0;
    for (final e in _cart.entries) {
      final p = products.where((x) => x.productId == e.key).firstOrNull;
      if (p != null) total += p.price * e.value;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Bán Hàng POS')),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 220,
                childAspectRatio: 0.95,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (_, i) => _productCard(products[i]),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  Expanded(
                    child: Text('Tổng: ${_money.format(total)}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  FilledButton.icon(
                    onPressed: _cart.isEmpty ? null : _checkout,
                    icon: const Icon(Icons.payments),
                    label: const Text('THANH TOÁN'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _productCard(GymProduct p) {
    final qty = _cart[p.productId] ?? 0;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Icon(_iconFor(p.category),
                    size: 40, color: Colors.blue.shade300),
              ),
            ),
            Text(p.name,
                maxLines: 1, overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600)),
            Text('${_money.format(p.price)} • Tồn: ${p.stock}',
                style: TextStyle(
                    fontSize: 12,
                    color: p.stock > 0 ? Colors.grey : Colors.red)),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: qty <= 0
                      ? null
                      : () => setState(() {
                            final v = qty - 1;
                            v == 0
                                ? _cart.remove(p.productId)
                                : _cart[p.productId] = v;
                          }),
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Text('$qty',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: qty >= p.stock
                      ? null
                      : () => setState(() => _cart[p.productId] = qty + 1),
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _checkout() async {
    final products = ref.read(gymProductsProvider);
    int items = 0;
    for (final e in _cart.entries) {
      final p = products.where((x) => x.productId == e.key).firstOrNull;
      if (p != null) {
        await ref.read(gymProductsProvider.notifier).sellProduct(p, e.value);
        items += e.value;
      }
    }
    if (!mounted) return;
    setState(() => _cart.clear());
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text('Đã bán $items sản phẩm — tồn kho đã cập nhật, sẵn sàng sync')));
  }

  IconData _iconFor(String c) => switch (c) {
        'supplement' => Icons.fitness_center,
        'clothing' => Icons.checkroom,
        'accessory' => icons_water_bottle,
        _ => Icons.local_drink,
      };
}

const icons_water_bottle = Icons.sports_bar;
