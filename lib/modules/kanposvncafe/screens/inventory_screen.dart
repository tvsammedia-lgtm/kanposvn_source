import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/cafe_providers.dart';

class InventoryScreen extends ConsumerWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventory = ref.watch(cafeInventoryProvider);
    final txs = ref.watch(cafeInventoryTransactionsProvider);

    final lowStockItems = inventory.where((i) => i.isLowStock).toList();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: const TabBar(
            indicatorColor: Color(0xFFD97706),
            labelColor: Color(0xFFD97706),
            tabs: [
              Tab(icon: Icon(Icons.inventory), text: 'Tồn Kho Nguyên Liệu'),
              Tab(icon: Icon(Icons.history), text: 'Lịch Sử Nhập / Trừ Kho'),
            ],
          ),
        ),
        body: Column(
          children: [
            if (lowStockItems.isNotEmpty)
              Container(
                color: Colors.amber.shade100,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.warning, color: Colors.orange),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'CẢNH BÁO: Có ${lowStockItems.length} nguyên liệu sắp hết (dưới định mức tối thiểu): ${lowStockItems.map((e) => e.name).join(", ")}',
                        style: const TextStyle(
                          color: Colors.brown,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: TabBarView(
                children: [
                  // Tab 1: Inventory list
                  ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: inventory.length,
                    itemBuilder: (ctx, i) {
                      final item = inventory[i];
                      return Card(
                        color: item.isLowStock ? Colors.red.shade50 : null,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: item.isLowStock
                                ? Colors.red.shade100
                                : Colors.blue.shade100,
                            child: Icon(
                              Icons.inventory_2,
                              color: item.isLowStock ? Colors.red : Colors.blue,
                            ),
                          ),
                          title: Text(
                            item.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Đơn vị: ${item.unit} • Định mức tối thiểu: ${item.minStock} ${item.unit}',
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${item.currentStock} ${item.unit}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: item.isLowStock
                                      ? Colors.red
                                      : Colors.green.shade800,
                                ),
                              ),
                              if (item.isLowStock)
                                const Text(
                                  'Sắp hết!',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  // Tab 2: Transactions
                  ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: txs.length,
                    itemBuilder: (ctx, i) {
                      final tx = txs[i];
                      return Card(
                        child: ListTile(
                          dense: true,
                          leading: Icon(
                            tx.quantityChange < 0
                                ? Icons.remove_circle
                                : Icons.add_circle,
                            color: tx.quantityChange < 0
                                ? Colors.red
                                : Colors.green,
                          ),
                          title: Text(
                            '${tx.inventoryItemName} (${tx.type.label})',
                          ),
                          subtitle: Text(
                            '${tx.note} • ${tx.timestamp.hour}:${tx.timestamp.minute}',
                          ),
                          trailing: Text(
                            '${tx.quantityChange > 0 ? "+" : ""}${tx.quantityChange} ${tx.unit}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: tx.quantityChange < 0
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
