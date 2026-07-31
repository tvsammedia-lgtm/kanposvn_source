import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/gara_providers.dart';
import '../models/gara_inventory.dart';
import '../models/gara_product.dart';

class GaraInventoryScreen extends ConsumerStatefulWidget {
  const GaraInventoryScreen({super.key});

  @override
  ConsumerState<GaraInventoryScreen> createState() => _GaraInventoryScreenState();
}

class _GaraInventoryScreenState extends ConsumerState<GaraInventoryScreen> {
  void _showImportDialog(BuildContext context, GaraProduct product) {
    final qtyCtrl = TextEditingController(text: '10');
    final priceCtrl = TextEditingController(text: product.purchasePrice.toString());
    
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Nhập Kho: ${product.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: qtyCtrl, decoration: const InputDecoration(labelText: 'Số lượng'), keyboardType: TextInputType.number),
            TextField(controller: priceCtrl, decoration: const InputDecoration(labelText: 'Giá nhập (VNĐ)'), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () async {
              final qty = double.tryParse(qtyCtrl.text) ?? 0;
              final price = double.tryParse(priceCtrl.text) ?? 0;
              if (qty > 0) {
                final tx = GaraInventoryTransaction()
                  ..transactionId = const Uuid().v4()
                  ..documentCode = 'NK-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}'
                  ..type = GaraInventoryTransactionType.IMPORT
                  ..transactionDate = DateTime.now();

                final detail = GaraInventoryDetail()
                  ..quantity = qty
                  ..unitPrice = price
                  ..totalAmount = qty * price;
                detail.product.value = product;
                detail.transaction.value = tx;

                await ref.read(garaInventoryProvider.notifier).createTransaction(tx, [detail]);
                ref.read(garaProductsProvider.notifier).loadProducts(); // Refresh stock
                if (context.mounted) Navigator.pop(ctx);
              }
            },
            child: const Text('Lưu Phiếu Nhập'),
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kho Phụ Tùng'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Tồn Kho Hiện Tại'),
              Tab(text: 'Lịch Sử Nhập/Xuất'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Current Stock
            Consumer(
              builder: (context, ref, child) {
                final productsAsync = ref.watch(garaProductsProvider);
                return productsAsync.when(
                  data: (products) {
                    final parts = products.where((p) => p.type == GaraProductType.PART).toList();
                    return ListView.builder(
                      itemCount: parts.length,
                      itemBuilder: (context, index) {
                        final p = parts[index];
                        return ListTile(
                          leading: const Icon(Icons.settings),
                          title: Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Giá nhập: ${p.purchasePrice} | Giá bán: ${p.retailPrice}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Tồn: ${p.currentStock}', style: const TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold)),
                              const SizedBox(width: 16),
                              ElevatedButton(
                                onPressed: () => _showImportDialog(context, p),
                                child: const Text('Nhập Hàng'),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, st) => Center(child: Text('Lỗi: $err')),
                );
              }
            ),

            // Tab 2: Transaction History
            Consumer(
              builder: (context, ref, child) {
                final inventoryAsync = ref.watch(garaInventoryProvider);
                return inventoryAsync.when(
                  data: (txs) {
                    if (txs.isEmpty) return const Center(child: Text('Chưa có phiếu kho nào.'));
                    return ListView.builder(
                      itemCount: txs.length,
                      itemBuilder: (context, index) {
                        final tx = txs[index];
                        return ListTile(
                          leading: Icon(
                            tx.type == GaraInventoryTransactionType.IMPORT ? Icons.arrow_downward : Icons.arrow_upward,
                            color: tx.type == GaraInventoryTransactionType.IMPORT ? Colors.green : Colors.red,
                          ),
                          title: Text(tx.documentCode),
                          subtitle: Text(tx.transactionDate.toString()),
                          trailing: Text(tx.type.label, style: const TextStyle(fontWeight: FontWeight.bold)),
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, st) => Center(child: Text('Lỗi: $err')),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
