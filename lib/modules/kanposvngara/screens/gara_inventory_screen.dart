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
                        final isLow = p.currentStock <= 5;
                        return Card(
                          color: isLow ? Colors.red[50] : null,
                          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: ListTile(
                            leading: Icon(Icons.settings, color: isLow ? Colors.red : Colors.blue),
                            title: Text(p.name, style: TextStyle(fontWeight: FontWeight.bold, color: isLow ? Colors.red : Colors.black)),
                            subtitle: Text('SKU: ${p.sku} | Nhập: ${p.purchasePrice} đ | Bán: ${p.retailPrice} đ'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Tồn: ${p.currentStock.toInt()}', style: TextStyle(fontSize: 16, color: isLow ? Colors.red : Colors.green, fontWeight: FontWeight.bold)),
                                const SizedBox(width: 8),
                                if (isLow) const Icon(Icons.warning, color: Colors.red, size: 20),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () => _showImportDialog(context, p),
                                  child: const Text('Nhập Hàng'),
                                )
                              ],
                            ),
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
                        final isImport = tx.type == GaraInventoryTransactionType.IMPORT;
                        final dateStr = tx.transactionDate != null
                            ? '${tx.transactionDate!.day.toString().padLeft(2, '0')}/${tx.transactionDate!.month.toString().padLeft(2, '0')}/${tx.transactionDate!.year}'
                            : '';
                        return ListTile(
                          leading: Icon(
                            isImport ? Icons.arrow_downward : Icons.arrow_upward,
                            color: isImport ? Colors.green : Colors.red,
                          ),
                          title: Text(tx.documentCode, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('$dateStr — ${tx.type.label}'),
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
