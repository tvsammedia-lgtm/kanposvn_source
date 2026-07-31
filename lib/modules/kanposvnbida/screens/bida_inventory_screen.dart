import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/bida_providers.dart';
import '../providers/bida_inventory_providers.dart';
import '../models/bida_item.dart';
import '../models/bida_inventory_tx.dart';

class BidaInventoryScreen extends ConsumerStatefulWidget {
  const BidaInventoryScreen({super.key});

  @override
  ConsumerState<BidaInventoryScreen> createState() => _BidaInventoryScreenState();
}

class _BidaInventoryScreenState extends ConsumerState<BidaInventoryScreen> {

  Future<void> _showImportDialog(BuildContext context, BidaItem item) async {
    final qtyController = TextEditingController();
    final noteController = TextEditingController();

    await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('Nhập/Xuất hàng: ${item.name}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: qtyController,
                decoration: const InputDecoration(labelText: 'Số lượng'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                final qty = int.tryParse(qtyController.text) ?? 0;
                if (qty > 0) {
                  ref.read(bidaInventoryProvider.notifier).addTransaction(item, qty, BidaInventoryTxType.EXPORT, noteController.text);
                }
                Navigator.pop(ctx);
              },
              child: const Text('XUẤT (TRỪ KHO)', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                final qty = int.tryParse(qtyController.text) ?? 0;
                if (qty > 0) {
                  ref.read(bidaInventoryProvider.notifier).addTransaction(item, qty, BidaInventoryTxType.IMPORT, noteController.text);
                }
                Navigator.pop(ctx);
              },
              child: const Text('NHẬP (CỘNG KHO)', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final itemsAsync = ref.watch(bidaItemsProvider);
    final txsAsync = ref.watch(bidaInventoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Quản Lý Kho Hàng Bida')),
      body: Row(
        children: [
          // Left: Current Stock
          Expanded(
            flex: 2,
            child: itemsAsync.when(
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
                                item.category == BidaItemCategory.DRINK ? Icons.local_drink : Icons.fastfood,
                                color: isLowStock ? Colors.red : Colors.blue,
                              ),
                              title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold, color: isLowStock ? Colors.red : Colors.black)),
                              subtitle: Text('Giá bán: ${item.price} đ'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Tồn: ${item.stock}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isLowStock ? Colors.red : Colors.green)),
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
                    child: Text('NHẬT KÝ NHẬP/XUẤT', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: txsAsync.when(
                      data: (txs) {
                        if (txs.isEmpty) return const Center(child: Text('Chưa có giao dịch.'));
                        return ListView.builder(
                          itemCount: txs.length,
                          itemBuilder: (context, index) {
                            final tx = txs[index];
                            final isImport = tx.type == BidaInventoryTxType.IMPORT;
                            return ListTile(
                              leading: Icon(
                                isImport ? Icons.arrow_downward : Icons.arrow_upward,
                                color: isImport ? Colors.green : Colors.red,
                              ),
                              title: Text('${tx.itemName} (${isImport ? "+" : ""}${tx.quantity})', style: TextStyle(color: isImport ? Colors.green : Colors.red, fontWeight: FontWeight.bold)),
                              subtitle: Text('${tx.createdAt.toString().substring(0,16)}\n${tx.note}'),
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
