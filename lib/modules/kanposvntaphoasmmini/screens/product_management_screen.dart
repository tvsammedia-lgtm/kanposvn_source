import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../providers/taphoa_providers.dart';

class TapHoaProductManagementScreen extends ConsumerStatefulWidget {
  const TapHoaProductManagementScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TapHoaProductManagementScreen> createState() => _TapHoaProductManagementScreenState();
}

class _TapHoaProductManagementScreenState extends ConsumerState<TapHoaProductManagementScreen> {
  
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(tapHoaProductsProvider.notifier).loadProducts();
    });
  }

  void _showAddProductDialog() {
    final nameController = TextEditingController();
    final priceController = TextEditingController();
    final codeController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Thêm Hàng Hóa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: codeController,
                decoration: const InputDecoration(labelText: 'Mã hàng / Barcode'),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Tên hàng hóa'),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Giá bán (VND)'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () {
                final product = TapHoaProduct()
                  ..productId = 'PRD_${DateTime.now().millisecondsSinceEpoch}'
                  ..productCode = codeController.text
                  ..barcode = codeController.text
                  ..productName = nameController.text
                  ..retailPrice = double.tryParse(priceController.text) ?? 0
                  ..createdAt = DateTime.now();

                ref.read(tapHoaProductsProvider.notifier).saveProduct(product);
                Navigator.pop(context);
              },
              child: const Text('Lưu'),
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(tapHoaProductsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Hàng Hóa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAddProductDialog,
          ),
        ],
      ),
      body: products.isEmpty
          ? const Center(child: Text('Chưa có hàng hóa nào. Hãy thêm mới!'))
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.inventory_2),
                  ),
                  title: Text(product.productName),
                  subtitle: Text('Mã: ${product.productCode} - Barcode: ${product.barcode}'),
                  trailing: Text(
                    '${product.retailPrice.toStringAsFixed(0)} đ',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddProductDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
