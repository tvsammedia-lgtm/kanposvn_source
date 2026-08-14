import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/vlxd_providers.dart';
import '../models/vlxd_product.dart';
import '../models/vlxd_order.dart';
import '../services/vlxd_receipt_printer.dart';
import '../../../core/printer/printer_actions.dart';
import '../../../core/printer/receipt_print_mode.dart';

class VlxdPosScreen extends ConsumerStatefulWidget {
  const VlxdPosScreen({super.key});

  @override
  ConsumerState<VlxdPosScreen> createState() => _VlxdPosScreenState();
}

class _VlxdPosScreenState extends ConsumerState<VlxdPosScreen> {
  final List<VlxdOrderDetail> _cart = [];
  String _searchQuery = '';

  void _addToCart(VlxdProduct product) {
    setState(() {
      final existingIndex = _cart.indexWhere((item) => item.product.value?.id == product.id);
      if (existingIndex >= 0) {
        _cart[existingIndex].quantity += 1;
        _cart[existingIndex].total = _cart[existingIndex].quantity * _cart[existingIndex].unitPrice;
      } else {
        final detail = VlxdOrderDetail()
          ..quantity = 1
          ..unitPrice = product.retailPrice
          ..total = product.retailPrice;
        detail.product.value = product;
        _cart.add(detail);
      }
    });
  }

  void _updateQuantity(int index, double newQty) {
    if (newQty <= 0) {
      setState(() {
        _cart.removeAt(index);
      });
    } else {
      setState(() {
        _cart[index].quantity = newQty;
        _cart[index].total = newQty * _cart[index].unitPrice;
      });
    }
  }

  double get _cartTotal => _cart.fold(0.0, (sum, item) => sum + item.total);

  void _processPayment(ReceiptPrintMode mode) async {
    if (_cart.isEmpty) return;

    final order = VlxdOrder()
      ..orderId = const Uuid().v4()
      ..orderCode = 'POS-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}'
      ..subTotal = _cartTotal
      ..totalAmount = _cartTotal
      ..paidAmount = _cartTotal
      ..paymentMethod = PaymentMethod.CASH
      ..status = OrderStatus.COMPLETED
      ..orderDate = DateTime.now();

    await ref.read(vlxdOrdersProvider.notifier).createOrder(order, _cart);

    if (mounted) {
      try {
        await printReceiptByMode(
          context,
          ref,
          await buildVlxdReceiptData(
            order,
            List<VlxdOrderDetail>.from(_cart),
          ),
          mode,
          pdfFilename: 'HoaDon_${order.orderCode}.pdf',
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('In hóa đơn thất bại: $e')));
      }
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Thanh toán thành công!')));
      setState(() {
        _cart.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final productsAsyncValue = ref.watch(vlxdProductsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bán Lẻ / POS'),
      ),
      body: Row(
        children: [
          // Bên trái: Danh sách sản phẩm
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm vật tư...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onChanged: (val) {
                      setState(() {
                        _searchQuery = val.toLowerCase();
                      });
                    },
                  ),
                ),
                Expanded(
                  child: productsAsyncValue.when(
                    data: (products) {
                      final filtered = products.where((p) => p.productName.toLowerCase().contains(_searchQuery)).toList();
                      if (filtered.isEmpty) return const Center(child: Text('Không tìm thấy sản phẩm.'));
                      return GridView.builder(
                        padding: const EdgeInsets.all(8),
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 180,
                          childAspectRatio: 0.85,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          final product = filtered[index];
                          return InkWell(
                            onTap: () => _addToCart(product),
                            borderRadius: BorderRadius.circular(8),
                            child: Card(
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.construction, size: 40, color: Colors.blueGrey),
                                    const SizedBox(height: 8),
                                    Text(product.productName, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
                                    const Spacer(),
                                    Text('${product.retailPrice} đ', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
                                    Text(product.unit, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                                  ],
                                ),
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
          ),
          const VerticalDivider(width: 1, thickness: 1),
          // Bên phải: Giỏ hàng
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey[200],
                  width: double.infinity,
                  child: const Text('Giỏ hàng', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: _cart.isEmpty
                      ? const Center(child: Text('Chưa có mặt hàng nào'))
                      : ListView.builder(
                          itemCount: _cart.length,
                          itemBuilder: (context, index) {
                            final item = _cart[index];
                            final product = item.product.value;
                            return ListTile(
                              title: Text(product?.productName ?? 'Sản phẩm'),
                              subtitle: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle_outline),
                                    onPressed: () => _updateQuantity(index, item.quantity - 1),
                                  ),
                                  Text('${item.quantity} ${product?.unit ?? ""}'),
                                  IconButton(
                                    icon: const Icon(Icons.add_circle_outline),
                                    onPressed: () => _updateQuantity(index, item.quantity + 1),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.edit, size: 16),
                                    onPressed: () {
                                      // ignore: todo
                                      // TODO: Hỗ trợ nhập số thập phân
                                    },
                                  )
                                ],
                              ),
                              trailing: Text('${item.total} đ', style: const TextStyle(fontWeight: FontWeight.bold)),
                            );
                          },
                        ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, -2))],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Tổng cộng:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('$_cartTotal đ', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 44,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: _cart.isEmpty
                                    ? null
                                    : () => _processPayment(
                                          ReceiptPrintMode.thermal80,
                                        ),
                                icon: const Icon(Icons.print, size: 16),
                                label: const Text('IN BILL 80mm',
                                    style: TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: SizedBox(
                              height: 44,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: _cart.isEmpty
                                    ? null
                                    : () => _processPayment(
                                          ReceiptPrintMode.pdf,
                                        ),
                                icon: const Icon(Icons.picture_as_pdf, size: 16),
                                label: const Text('IN PDF',
                                    style: TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _cart.isEmpty
                              ? null
                              : () => _processPayment(ReceiptPrintMode.auto),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          child: const Text('Thanh Toán', style: TextStyle(fontSize: 18, color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
