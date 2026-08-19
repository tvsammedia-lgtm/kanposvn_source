import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:intl/intl.dart';
import '../providers/pos_provider.dart';
import '../providers/barber_service_provider.dart';
import '../models/barber_service.dart';
import '../models/barber_product.dart';
import 'checkout_screen.dart';

class PosScreen extends ConsumerStatefulWidget {
  const PosScreen({super.key});

  @override
  ConsumerState<PosScreen> createState() => _PosScreenState();
}

class _PosScreenState extends ConsumerState<PosScreen> {
  List<BarberService> _services = [];
  List<BarberProduct> _products = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    final isar = await ref.read(barberIsarProvider.future);
    final allServices = await isar.barberServices.where().anyId().findAll();
    final services = allServices.where((s) => s.isActive).toList();
    final allProducts = await isar.barberProducts.where().anyId().findAll();
    final products = allProducts.where((p) => p.isActive).toList();
    setState(() {
      _services = services;
      _products = products;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final posState = ref.watch(posProvider);
    final fmt = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

    return Scaffold(
      appBar: AppBar(
        title: const Text('POS Bán Hàng'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => ref.read(posProvider.notifier).clearCart(),
          )
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Row(
              children: [
                // Left: Services & Products
                Expanded(
                  flex: 2,
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        const TabBar(tabs: [
                          Tab(text: 'DỊCH VỤ'),
                          Tab(text: 'SẢN PHẨM'),
                        ]),
                        Expanded(
                          child: TabBarView(children: [
                            // Services tab
                            GridView.builder(
                              padding: const EdgeInsets.all(12),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, childAspectRatio: 1.6, crossAxisSpacing: 10, mainAxisSpacing: 10),
                              itemCount: _services.length,
                              itemBuilder: (ctx, i) => _itemCard(
                                id: _services[i].serviceId,
                                name: _services[i].name,
                                price: _services[i].price,
                                type: 'Service',
                                color: Colors.blue.shade100,
                                subtitle: '${_services[i].durationMinutes} phút',
                              ),
                            ),
                            // Products tab
                            GridView.builder(
                              padding: const EdgeInsets.all(12),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, childAspectRatio: 1.6, crossAxisSpacing: 10, mainAxisSpacing: 10),
                              itemCount: _products.length,
                              itemBuilder: (ctx, i) => _itemCard(
                                id: _products[i].productId,
                                name: _products[i].name,
                                price: _products[i].sellingPrice,
                                type: 'Product',
                                color: Colors.orange.shade100,
                                subtitle: 'Kho: ${_products[i].stock}',
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
                // Right: Cart
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey.shade100,
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Khách hàng:', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextButton(
                              onPressed: () => ref.read(posProvider.notifier).setCustomer('CUST-01', 'Khách lẻ'),
                              child: Text(posState.invoice.customerName ?? 'Khách lẻ'),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 1),
                      Expanded(
                        child: ListView.builder(
                          itemCount: posState.details.length,
                          itemBuilder: (ctx, i) {
                            final item = posState.details[i];
                            return ListTile(
                              title: Text(item.itemName, style: const TextStyle(fontSize: 13)),
                              subtitle: Text('${item.quantity.toInt()} x ${fmt.format(item.unitPrice)}'),
                              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                                Text(fmt.format(item.total), style: const TextStyle(fontSize: 12)),
                                IconButton(
                                  icon: const Icon(Icons.remove_circle, color: Colors.red, size: 18),
                                  onPressed: () => ref.read(posProvider.notifier).removeItem(item.itemId),
                                ),
                              ]),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        color: Colors.white,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                          _total('Tạm tính:', posState.subTotal, fmt),
                          _total('Giảm giá:', posState.invoice.discount, fmt),
                          const Divider(),
                          _total('Tổng cộng:', posState.total, fmt, bold: true),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14), backgroundColor: Colors.green),
                            onPressed: posState.details.isEmpty ? null : () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => const CheckoutScreen()));
                            },
                            child: const Text('THANH TOÁN', style: TextStyle(fontSize: 16, color: Colors.white)),
                          ),
                        ]),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _itemCard({required String id, required String name, required double price, required String type, required Color color, String? subtitle}) {
    return InkWell(
      onTap: () => ref.read(posProvider.notifier).addItem(id, name, type, price),
      child: Card(
        color: color,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(name, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 4),
          Text(NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(price), style: const TextStyle(fontSize: 12)),
          if (subtitle != null) Text(subtitle, style: TextStyle(fontSize: 10, color: Colors.grey[600])),
        ]),
      ),
    );
  }

  Widget _total(String label, double amount, NumberFormat fmt, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: TextStyle(fontSize: bold ? 16 : 13, fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
        Text(fmt.format(amount), style: TextStyle(fontSize: bold ? 16 : 13, fontWeight: bold ? FontWeight.bold : FontWeight.normal, color: bold ? Colors.red : Colors.black)),
      ]),
    );
  }
}
