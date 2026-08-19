import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/eshop_product.dart';
import '../providers/eshop_providers.dart';
import 'eshop_product_detail_screen.dart';
import 'eshop_cart_screen.dart';
import '../../../core/widgets/owner_info_bar.dart';

class EshopDashboardScreen extends ConsumerWidget {
  const EshopDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(eshopProductsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('KanShop'),
        backgroundColor: const Color(0xFFF97316), // Orange
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const EshopCartScreen()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFF97316)),
              child: Text('KanShop Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Trang chủ'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Danh Mục'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const OwnerInfoBar(),
          const SizedBox(height: 12),
          Expanded(
            child: products.isEmpty
                ? const Center(child: Text('Chưa có sản phẩm nào.'))
                : GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final p = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EshopProductDetailScreen(product: p),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.grey[200],
                                  width: double.infinity,
                                  child: const Icon(Icons.image, size: 50, color: Colors.grey),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      p.name,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${p.salePrice}đ',
                                      style: const TextStyle(color: Color(0xFFF97316), fontWeight: FontWeight.bold),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a dummy product for testing
          ref.read(eshopProductsProvider.notifier).addProduct(
            KanShopProduct()
              ..productId = 'PROD_${DateTime.now().millisecondsSinceEpoch}'
              ..name = 'Điện thoại Samsung Galaxy S24 Ultra'
              ..salePrice = 29000000
              ..stockQuantity = 10
              ..description = 'Sản phẩm mới nhất của Samsung',
          );
        },
        backgroundColor: const Color(0xFFF97316),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
