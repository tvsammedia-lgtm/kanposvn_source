import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/vlxd_providers.dart';
import '../models/vlxd_order.dart';
import '../models/vlxd_partner.dart';

class VlxdContractsScreen extends ConsumerStatefulWidget {
  const VlxdContractsScreen({super.key});

  @override
  ConsumerState<VlxdContractsScreen> createState() => _VlxdContractsScreenState();
}

class _VlxdContractsScreenState extends ConsumerState<VlxdContractsScreen> {
  @override
  Widget build(BuildContext context) {
    final ordersAsync = ref.watch(vlxdOrdersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hợp đồng Bán Sỉ (VLXD)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_business),
            tooltip: 'Tạo Hợp Đồng mới',
            onPressed: () => _showCreateContractDialog(context, ref),
          )
        ],
      ),
      body: ordersAsync.when(
        data: (orders) {
          final contracts = orders.where((o) => o.isWholesaleContract).toList();
          if (contracts.isEmpty) {
            return const Center(child: Text('Chưa có hợp đồng nào. Hãy tạo mới.'));
          }
          return ListView.builder(
            itemCount: contracts.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final contract = contracts[index];
              return Card(
                elevation: 2,
                child: ListTile(
                  leading: const CircleAvatar(backgroundColor: Colors.indigo, child: Icon(Icons.assignment, color: Colors.white)),
                  title: Text('${contract.orderCode} - Khách: ${contract.customer.value?.name ?? 'Khách lẻ'}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Trạng thái: ${contract.status.label}'),
                      Text('Tổng tiền: ${contract.totalAmount} đ'),
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                       // Mở form xuất phiếu giao hàng
                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Chức năng Xuất phiếu giao hàng đang phát triển')));
                    },
                    child: const Text('Giao hàng'),
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }

  void _showCreateContractDialog(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Tạo Hợp Đồng Bán Sỉ'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Tên Khách Hàng / Công Trình'),
            ),
            const SizedBox(height: 16),
            const Text('Lưu ý: Sau khi tạo khách hàng, hệ thống sẽ tự sinh Hợp đồng mẫu kèm 200 mặt hàng đầu tiên.', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () async {
              if (nameCtrl.text.isEmpty) return;

              // 1. Tạo Khách hàng
              final customer = VlxdCustomer()
                ..customerId = const Uuid().v4()
                ..name = nameCtrl.text
                ..type = CustomerType.PROJECT;
              await ref.read(vlxdCustomersProvider.notifier).addCustomer(customer);

              // 2. Tạo Hợp đồng
              final order = VlxdOrder()
                ..orderId = const Uuid().v4()
                ..orderCode = 'HD-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}'
                ..isWholesaleContract = true
                ..status = OrderStatus.PENDING
                ..orderDate = DateTime.now();
              order.customer.value = customer;

              // 3. Thêm sản phẩm sỉ mẫu
              final productsData = ref.read(vlxdProductsProvider).valueOrNull ?? [];
              if (productsData.isNotEmpty) {
                 final detail = VlxdOrderDetail()
                   ..quantity = 200
                   ..unitPrice = productsData.first.wholesalePrice > 0 ? productsData.first.wholesalePrice : productsData.first.retailPrice * 0.9
                   ..total = 200 * (productsData.first.wholesalePrice > 0 ? productsData.first.wholesalePrice : productsData.first.retailPrice * 0.9);
                 detail.product.value = productsData.first;
                 
                 order.subTotal = detail.total;
                 order.totalAmount = detail.total;

                 await ref.read(vlxdOrdersProvider.notifier).createOrder(order, [detail]);
                 
                  if (context.mounted) {
                    Navigator.pop(ctx);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã tạo Hợp đồng Bán Sỉ thành công!')));
                  }
              }
            },
            child: const Text('Tạo Hợp Đồng'),
          )
        ],
      )
    );
  }
}
