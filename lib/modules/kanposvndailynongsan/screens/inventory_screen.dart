import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/nongsan_providers.dart';
import 'package:intl/intl.dart';

class InventoryScreen extends ConsumerWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lotsAsync = ref.watch(nongsanLotsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản Lý Kho - Lô Hàng'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Nhập kho mới
            },
            icon: const Icon(Icons.add_box),
            label: const Text('Nhập Kho'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: lotsAsync.when(
        data: (lots) {
          if (lots.isEmpty) {
            return const Center(child: Text('Kho trống.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: lots.length,
            itemBuilder: (context, index) {
              final lot = lots[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12.0),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.inventory_2),
                  ),
                  title: Text('Mã Lô: ${lot.lotId}'),
                  subtitle: Text(
                      'Ngày nhập: ${DateFormat('dd/MM/yyyy').format(lot.importDate)}\n'
                      'Sản phẩm ID: ${lot.productId}'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Tồn: ${lot.currentQuantity.toStringAsFixed(1)}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                      Text('Ban đầu: ${lot.initialQuantity.toStringAsFixed(1)}'),
                    ],
                  ),
                  isThreeLine: true,
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
