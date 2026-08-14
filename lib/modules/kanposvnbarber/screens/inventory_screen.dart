import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/inventory_provider.dart';

class InventoryScreen extends ConsumerWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventoryState = ref.watch(inventoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Kho'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Mở form nhập kho
            },
          )
        ],
      ),
      body: inventoryState.when(
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('Kho trống.'));
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                color: item.isLowStock ? Colors.red.shade50 : Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: Icon(
                    Icons.inventory_2,
                    color: item.isLowStock ? Colors.red : Colors.blue,
                  ),
                  title: Text(item.product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Danh mục: ${item.product.category}'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Tồn kho: ${item.quantityInStock}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: item.isLowStock ? Colors.red : Colors.black,
                        ),
                      ),
                      if (item.isLowStock)
                        const Text('Sắp hết!', style: TextStyle(color: Colors.red, fontSize: 12)),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }
}
