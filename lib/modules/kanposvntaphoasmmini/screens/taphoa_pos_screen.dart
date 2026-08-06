import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/taphoa_providers.dart';

class TapHoaPosScreen extends ConsumerStatefulWidget {
  const TapHoaPosScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TapHoaPosScreen> createState() => _TapHoaPosScreenState();
}

class _TapHoaPosScreenState extends ConsumerState<TapHoaPosScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(tapHoaProductsProvider.notifier).loadProducts();
      ref.read(tapHoaPosCartProvider.notifier).startNewOrder();
    });
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(tapHoaProductsProvider);
    final cart = ref.watch(tapHoaPosCartProvider);

    // Simple search filter
    final searchQuery = _searchController.text.toLowerCase();
    final filteredProducts = products.where((p) {
      return p.productName.toLowerCase().contains(searchQuery) ||
             p.barcode.contains(searchQuery) ||
             p.productCode.toLowerCase().contains(searchQuery);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bán Hàng (POS)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () {
              // TODO: Implement barcode scanner
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tính năng quét mã vạch sẽ cập nhật sau.')),
              );
            },
          ),
        ],
      ),
      body: Row(
        children: [
          // Left Side: Product List
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Tìm theo tên, mã, barcode...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return InkWell(
                        onTap: () {
                          ref.read(tapHoaPosCartProvider.notifier).addItem(product);
                        },
                        child: Card(
                          elevation: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.grey[200],
                                  child: const Icon(Icons.image, size: 50, color: Colors.grey),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.productName,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${product.retailPrice.toStringAsFixed(0)} đ',
                                      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          
          // Right Side: Cart
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[50],
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cart.invoiceNumber,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            ref.read(tapHoaPosCartProvider.notifier).startNewOrder();
                          },
                          child: const Icon(Icons.delete_outline, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        final item = cart.items.toList()[index];
                        return ListTile(
                          title: Text(item.productName),
                          subtitle: Text('${item.price.toStringAsFixed(0)} đ'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed: () {
                                  ref.read(tapHoaPosCartProvider.notifier).updateQuantity(index, item.quantity - 1);
                                },
                              ),
                              Text('${item.quantity.toInt()}'),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                onPressed: () {
                                  ref.read(tapHoaPosCartProvider.notifier).updateQuantity(index, item.quantity + 1);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Tổng tiền', style: TextStyle(fontSize: 16)),
                            Text('${cart.totalAmount.toStringAsFixed(0)} đ', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Giảm giá', style: TextStyle(fontSize: 16)),
                            Text('-${cart.discountAmount.toStringAsFixed(0)} đ', style: const TextStyle(fontSize: 16, color: Colors.red)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Khách cần trả', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            Text(
                              '${cart.finalAmount.toStringAsFixed(0)} đ',
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: cart.items.isEmpty ? null : () async {
                              // Perform checkout
                              await ref.read(tapHoaInvoicesProvider.notifier).saveInvoice(cart);
                              ref.read(tapHoaPosCartProvider.notifier).startNewOrder();
                              
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Thanh toán thành công!')),
                                );
                              }
                            },
                            child: const Text('THANH TOÁN (F9)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
