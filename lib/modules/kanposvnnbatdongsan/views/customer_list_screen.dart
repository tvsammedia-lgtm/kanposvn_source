import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/batdongsan_providers.dart';
import 'customer_form_screen.dart';
import '../models/customer.dart';

class CustomerListScreen extends ConsumerWidget {
  final CustomerType type;
  
  const CustomerListScreen({super.key, required this.type});

  void _deleteCustomer(BuildContext context, WidgetRef ref, int id) async {
    final repo = ref.read(customerRepositoryProvider);
    await repo.deleteCustomer(id);
    ref.invalidate(customersProvider);
    ref.invalidate(buyersProvider);
    ref.invalidate(sellersProvider);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã xoá khách hàng')),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = type == CustomerType.buyer ? ref.watch(buyersProvider) : ref.watch(sellersProvider);
    final title = type == CustomerType.buyer ? 'Khách Mua' : 'Khách Bán';

    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách $title'),
      ),
      body: asyncValue.when(
        data: (customers) {
          if (customers.isEmpty) {
            return const Center(child: Text('Chưa có dữ liệu.'));
          }
          return ListView.builder(
            itemCount: customers.length,
            itemBuilder: (context, index) {
              final customer = customers[index];
              return ListTile(
                title: Text(customer.name ?? 'Không có tên'),
                subtitle: Text('${customer.phone ?? ''} - ${customer.email ?? ''}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Xác nhận xoá'),
                        content: const Text('Bạn có chắc chắn muốn xoá?'),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _deleteCustomer(context, ref, customer.id);
                            },
                            child: const Text('Xoá', style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomerFormScreen(customer: customer, defaultType: type)),
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Lỗi: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CustomerFormScreen(defaultType: type)),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
