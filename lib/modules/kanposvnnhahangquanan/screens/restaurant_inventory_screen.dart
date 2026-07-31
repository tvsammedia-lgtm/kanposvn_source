import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/restaurant_inventory_providers.dart';
import '../models/restaurant_inventory_models.dart';

class RestaurantInventoryScreen extends ConsumerStatefulWidget {
  const RestaurantInventoryScreen({super.key});

  @override
  ConsumerState<RestaurantInventoryScreen> createState() => _RestaurantInventoryScreenState();
}

class _RestaurantInventoryScreenState extends ConsumerState<RestaurantInventoryScreen> {
  Future<void> _showImportDialog(BuildContext context, RestaurantIngredient item) async {
    final qtyController = TextEditingController();
    final noteController = TextEditingController();

    await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('Nhập/Xuất kho: ${item.name}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: qtyController,
                decoration: InputDecoration(labelText: 'Số lượng (${item.unit})'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: noteController,
                decoration: const InputDecoration(labelText: 'Ghi chú (Tùy chọn)'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('HỦY'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                final qty = double.tryParse(qtyController.text) ?? 0;
                if (qty > 0) {
                  ref.read(restaurantInventoryTxProvider.notifier).addTransaction(item, qty, RestaurantInventoryTxType.EXPORT, noteController.text);
                }
                Navigator.pop(ctx);
              },
              child: const Text('XUẤT', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                final qty = double.tryParse(qtyController.text) ?? 0;
                if (qty > 0) {
                  ref.read(restaurantInventoryTxProvider.notifier).addTransaction(item, qty, RestaurantInventoryTxType.IMPORT, noteController.text);
                }
                Navigator.pop(ctx);
              },
              child: const Text('NHẬP', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final ingredientsAsync = ref.watch(restaurantIngredientsProvider);
    final txsAsync = ref.watch(restaurantInventoryTxProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Quản Lý Kho Nguyên Liệu')),
      body: Row(
        children: [
          // Left: Current Stock
          Expanded(
            flex: 2,
            child: ingredientsAsync.when(
              data: (items) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('TỒN KHO HIỆN TẠI', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          final isLowStock = item.stock < 10;
                          return Card(
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            color: isLowStock ? Colors.red[50] : Colors.white,
                            child: ListTile(
                              leading: Icon(
                                Icons.kitchen,
                                color: isLowStock ? Colors.red : Colors.blue,
                              ),
                              title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold, color: isLowStock ? Colors.red : Colors.black)),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Tồn: ${item.stock.toStringAsFixed(2)} ${item.unit}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isLowStock ? Colors.red : Colors.green)),
                                  const SizedBox(width: 16),
                                  IconButton(
                                    icon: const Icon(Icons.add_box, color: Colors.blue),
                                    onPressed: () => _showImportDialog(context, item),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Lỗi: $e')),
            ),
          ),
          const VerticalDivider(width: 1, thickness: 1),
          // Right: History
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('NHẬT KÝ KHO', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: txsAsync.when(
                      data: (txs) {
                        if (txs.isEmpty) return const Center(child: Text('Chưa có giao dịch.'));
                        return ListView.builder(
                          itemCount: txs.length,
                          itemBuilder: (context, index) {
                            final tx = txs[index];
                            final isImport = tx.type == RestaurantInventoryTxType.IMPORT;
                            final isAuto = tx.type == RestaurantInventoryTxType.AUTO_DEDUCT;
                            
                            Color txColor = Colors.red;
                            if (isImport) txColor = Colors.green;
                            if (isAuto) txColor = Colors.orange;

                            return ListTile(
                              leading: Icon(
                                isImport ? Icons.arrow_downward : Icons.arrow_upward,
                                color: txColor,
                              ),
                              title: Text('${tx.ingredientName} (${tx.quantity > 0 ? "+" : ""}${tx.quantity})', style: TextStyle(color: txColor, fontWeight: FontWeight.bold)),
                              subtitle: Text('${tx.createdAt.toString().substring(0,16)}\n${tx.type.label} - ${tx.note}'),
                              isThreeLine: true,
                            );
                          },
                        );
                      },
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (e, _) => Center(child: Text('Lỗi: $e')),
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
