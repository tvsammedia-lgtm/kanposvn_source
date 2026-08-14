import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/customer_provider.dart';

class CustomerListScreen extends ConsumerWidget {
  const CustomerListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerState = ref.watch(customerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Khách Hàng'),
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
                leading: CircleAvatar(child: Text(customer.fullName?.substring(0, 1) ?? '')),
                title: Text(customer.fullName ?? 'Không tên'),
                subtitle: Text('SĐT: ${customer.phone ?? ""} - CCCD: ${customer.cccd ?? ""}'),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }
}
