import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/vlxd_providers.dart';
import '../models/vlxd_inventory.dart';

class VlxdInventoryScreen extends ConsumerStatefulWidget {
  const VlxdInventoryScreen({super.key});

  @override
  ConsumerState<VlxdInventoryScreen> createState() => _VlxdInventoryScreenState();
}

class _VlxdInventoryScreenState extends ConsumerState<VlxdInventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quản lý Kho hàng (VLXD)'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Tồn kho hiện tại'),
              Tab(text: 'Lịch sử giao dịch (Nhập/Xuất)'),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Tạo phiếu Nhập/Xuất',
              onPressed: () => _showCreateTransactionDialog(context, ref),
            )
          ],
        ),
        body: const TabBarView(
          children: [
            _StockListTab(),
            _TransactionHistoryTab(),
          ],
        ),
      ),
    );
  }

  void _showCreateTransactionDialog(BuildContext context, WidgetRef ref) {
    // Basic dialog for creating a transaction
    // In a real app, this would be a full screen with product search and quantity input
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Tạo Phiếu Kho'),
        content: const Text('Giao diện chi tiết tạo phiếu nhập/xuất sẽ được thêm sau. Hiện tại có thể bấm để sinh dữ liệu mẫu.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Đóng')),
          ElevatedButton(
            onPressed: () async {
              final productsData = ref.read(vlxdProductsProvider).valueOrNull ?? [];
              if (productsData.isNotEmpty) {
                final product = productsData.first;
                final tx = VlxdInventoryTransaction()
                  ..transactionId = const Uuid().v4()
                  ..documentCode = 'PN-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}'
                  ..type = VlxdInventoryTransactionType.IMPORT
                  ..transactionDate = DateTime.now();
                
                final detail = VlxdInventoryTransactionDetail()
                  ..quantity = 100 // Nhập 100
                  ..unitPrice = product.purchasePrice
                  ..totalAmount = 100 * product.purchasePrice;
                detail.product.value = product;

                ref.read(vlxdInventoryProvider.notifier).createTransaction(tx, [detail]);
                final _ = ref.refresh(vlxdStocksProvider); // Refresh stocks
                
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã tạo phiếu nhập mẫu!')));
              }
            },
            child: const Text('Tạo phiếu mẫu (100 sp đầu tiên)'),
          )
        ],
      )
    );
  }
}

class _StockListTab extends ConsumerWidget {
  const _StockListTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stocksAsync = ref.watch(vlxdStocksProvider);

    return stocksAsync.when(
      data: (stocks) {
        if (stocks.isEmpty) return const Center(child: Text('Kho trống. Chưa có giao dịch nhập.'));
        return ListView.builder(
          itemCount: stocks.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final stock = stocks[index];
            final product = stock.product.value;
            return Card(
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.inventory_2)),
                title: Text(product?.productName ?? 'N/A', style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Tồn: ${stock.currentQuantity} ${product?.unit ?? ""}'),
                trailing: Text(stock.warehouse.value?.name ?? 'Kho chính'),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, st) => Center(child: Text('Lỗi: $err')),
    );
  }
}

class _TransactionHistoryTab extends ConsumerWidget {
  const _TransactionHistoryTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txsAsync = ref.watch(vlxdInventoryProvider);

    return txsAsync.when(
      data: (txs) {
        if (txs.isEmpty) return const Center(child: Text('Chưa có lịch sử giao dịch.'));
        return ListView.builder(
          itemCount: txs.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final tx = txs[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: tx.type == VlxdInventoryTransactionType.IMPORT ? Colors.green : Colors.orange,
                  child: Icon(
                    tx.type == VlxdInventoryTransactionType.IMPORT ? Icons.download : Icons.upload,
                    color: Colors.white
                  ),
                ),
                title: Text('${tx.documentCode} - ${tx.type.label}'),
                subtitle: Text('Ngày: _formatDate(tx.transactionDate)'), // Date placeholder
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, st) => Center(child: Text('Lỗi: $err')),
    );
  }
}
