import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/tramxang_providers.dart';

class TramXangPosScreen extends ConsumerStatefulWidget {
  const TramXangPosScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TramXangPosScreen> createState() => _TramXangPosScreenState();
}

class _TramXangPosScreenState extends ConsumerState<TramXangPosScreen> {
  @override
  Widget build(BuildContext context) {
    final products = ref.watch(tramXangProductsProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('POS Trạm Xăng & Tạp Hóa'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: _buildProductList(products),
          ),
          Expanded(
            flex: 1,
            child: _buildCart(),
          ),
        ],
      ),
    );
  }
  
  Widget _buildProductList(products) {
    if (products.isEmpty) {
      return const Center(child: Text('Chưa có sản phẩm nào.'));
    }
    
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          child: InkWell(
            onTap: () {
              // Add to cart
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(product.name, textAlign: TextAlign.center),
                Text('${product.retailPrice ?? 0} đ'),
              ],
            ),
          ),
        );
      }
    );
  }
  
  Widget _buildCart() {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Giỏ hàng', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const Expanded(
            child: Center(child: Text('Trống')),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                // Checkout
              },
              child: const Text('THANH TOÁN'),
            ),
          )
        ],
      ),
    );
  }
}
