import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/customer_provider.dart';

class CustomerListScreen extends ConsumerWidget {
  const CustomerListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerState = ref.watch(customerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách Khách hàng'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Mở form thêm khách hàng mới
            },
          )
        ],
      ),
      body: customerState.when(
        data: (customers) {
          if (customers.isEmpty) {
            return const Center(child: Text('Chưa có khách hàng nào.'));
          }
          return ListView.builder(
            itemCount: customers.length,
            itemBuilder: (context, index) {
              final customer = customers[index];
              return ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(customer.name),
                subtitle: Text(customer.phone),
                trailing: Text('${customer.rewardPoints} điểm'),
                onTap: () {
                  // TODO: Xem chi tiết khách hàng
                },
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
