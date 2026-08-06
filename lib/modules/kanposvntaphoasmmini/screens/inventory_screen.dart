import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/taphoa_providers.dart';
import 'inventory_import_screen.dart';

class TapHoaInventoryScreen extends ConsumerWidget {
  const TapHoaInventoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventoryItems = ref.watch(tapHoaInventoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Tồn Kho'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const TapHoaInventoryImportScreen()));
            },
            tooltip: 'Nhập hàng',
          ),
        ],
      ),
      body: inventoryItems.isEmpty
          ? const Center(child: Text('Chưa có dữ liệu tồn kho. Vui lòng nhập hàng.'))
          : ListView.builder(
              itemCount: inventoryItems.length,
              itemBuilder: (context, index) {
                final item = inventoryItems[index];
                final isLowStock = item.currentStock <= item.minStock;
                
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Icon(
                      Icons.inventory,
                      color: isLowStock ? Colors.red : Colors.green,
                    ),
                    title: Text(item.productName, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Đơn vị: ${item.unit} - Giá vốn: ${item.costPrice.toStringAsFixed(0)}'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${item.currentStock}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isLowStock ? Colors.red : Colors.black,
                          ),
                        ),
                        if (isLowStock)
                          const Text('Sắp hết', style: TextStyle(color: Colors.red, fontSize: 12)),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
