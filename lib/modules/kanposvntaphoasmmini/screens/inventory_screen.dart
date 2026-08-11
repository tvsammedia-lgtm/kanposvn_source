import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/taphoa_providers.dart';
import 'inventory_import_screen.dart';

class TapHoaInventoryScreen extends ConsumerStatefulWidget {
  const TapHoaInventoryScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TapHoaInventoryScreen> createState() => _TapHoaInventoryScreenState();
}

class _TapHoaInventoryScreenState extends ConsumerState<TapHoaInventoryScreen> {
  String _filter = 'all';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(tapHoaInventoryProvider.notifier).loadInventory();
      ref.read(tapHoaInventoryTransactionsProvider.notifier).loadTransactions();
    });
  }

  void _showTransactions() {
    final transactions = ref.read(tapHoaInventoryTransactionsProvider);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.8,
        builder: (context, scrollController) => Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Lịch sử nhập - xuất',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: transactions.isEmpty
                  ? const Center(child: Text('Chưa có giao dịch'))
                  : ListView.builder(
                      controller: scrollController,
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final tx = transactions[index];
                        final isImport = tx.type == 'IMPORT';
                        final isAdjust = tx.type == 'ADJUSTMENT';
                        return ListTile(
                          leading: Icon(
                            isImport
                                ? Icons.add_circle
                                : isAdjust
                                    ? Icons.tune
                                    : Icons.remove_circle,
                            color: isImport
                                ? Colors.green
                                : isAdjust
                                    ? Colors.orange
                                    : Colors.red,
                          ),
                          title: Text(tx.productName),
                          subtitle: Text(
                              '${tx.timestamp.day}/${tx.timestamp.month}/${tx.timestamp.year} ${tx.timestamp.hour}:${tx.timestamp.minute.toString().padLeft(2, '0')} - ${tx.note.isEmpty ? (isImport ? 'Nhập hàng' : 'Xuất bán') : tx.note}'),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${isImport ? '+' : ''}${tx.quantityChange.toInt()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isImport ? Colors.green : Colors.red,
                                ),
                              ),
                              Text('${tx.oldStock.toInt()} → ${tx.newStock.toInt()}',
                                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final inventoryItems = ref.watch(tapHoaInventoryProvider);
    final products = ref.watch(tapHoaProductsProvider);

    final query = _searchController.text.toLowerCase();
    final filtered = inventoryItems.where((item) {
      if (_filter == 'low' && item.currentStock > item.minStock) return false;
      if (_filter == 'ok' && item.currentStock <= item.minStock) return false;
      if (query.isNotEmpty && !item.productName.toLowerCase().contains(query)) return false;
      return true;
    }).toList();

    final lowCount = inventoryItems.where((i) => i.currentStock <= i.minStock).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Tồn Kho'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'Lịch sử nhập/xuất',
            onPressed: _showTransactions,
          ),
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            tooltip: 'Nhập hàng',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const TapHoaInventoryImportScreen()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Tìm theo tên hàng...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              onChanged: (_) => setState(() {}),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                ChoiceChip(
                  label: const Text('Tất cả'),
                  selected: _filter == 'all',
                  onSelected: (_) => setState(() => _filter = 'all'),
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: Text('Sắp hết ($lowCount)'),
                  selected: _filter == 'low',
                  onSelected: (_) => setState(() => _filter = 'low'),
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Đủ hàng'),
                  selected: _filter == 'ok',
                  onSelected: (_) => setState(() => _filter = 'ok'),
                ),
              ],
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? const Center(child: Text('Không có dữ liệu tồn kho'))
                : ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final item = filtered[index];
                      final isLowStock = item.currentStock <= item.minStock;
                      final product = products
                          .where((p) => p.productId == item.productId)
                          .firstOrNull;
                      final expiryDate = product?.expiryDate;
                      final expiring = expiryDate != null &&
                          expiryDate.isAfter(DateTime.now()) &&
                          expiryDate.difference(DateTime.now()).inDays <= 30;

                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: ListTile(
                          leading: Icon(
                            Icons.inventory,
                            color: isLowStock ? Colors.red : Colors.green,
                          ),
                          title: Text(item.productName,
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Đơn vị: ${item.unit} - Giá vốn: ${item.costPrice.toStringAsFixed(0)} đ'),
                              if (isLowStock)
                                const Text('SẮP HẾT HÀNG',
                                    style: TextStyle(color: Colors.red, fontSize: 12))
                              else if (expiring)
                                Text(
                                  'Sắp hết hạn: ${expiryDate.day}/${expiryDate.month}/${expiryDate.year}',
                                  style: const TextStyle(color: Colors.orange, fontSize: 12),
                                ),
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${item.currentStock.toInt()}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: isLowStock ? Colors.red : Colors.black,
                                ),
                              ),
                              Text(item.unit,
                                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
