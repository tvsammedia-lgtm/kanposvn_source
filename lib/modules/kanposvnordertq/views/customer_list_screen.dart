import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/customer_local.dart';
import '../providers/order_provider.dart';

/// Màn hình quản lý Khách Hàng đơn giản: danh sách, thêm mới, xem công nợ.
class CustomerListScreen extends ConsumerStatefulWidget {
  const CustomerListScreen({super.key});

  @override
  ConsumerState<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends ConsumerState<CustomerListScreen> {
  @override
  Widget build(BuildContext context) {
    final service = ref.watch(orderBucketServiceProvider);
    final customersAsync = ref.watch(customerListProvider(service));

    return Scaffold(
      appBar: AppBar(title: const Text('Danh sách Khách Hàng')),
      body: customersAsync.when(
        data: (customers) {
          if (customers.isEmpty) {
            return const Center(child: Text('Chưa có khách hàng. Nhấn + để thêm mới.'));
          }
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(customerListProvider(service));
            },
            child: ListView.builder(
              itemCount: customers.length,
              itemBuilder: (context, index) {
                final c = customers[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text(
                        (c.name ?? '?').isNotEmpty ? (c.name!.substring(0, 1)).toUpperCase() : '?',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(c.name ?? 'Chưa có tên', style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      '${c.customerCode ?? ''} · ${c.phone ?? 'chưa có SĐT'}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => _showCustomerDetail(context, service, c),
                  ),
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Lỗi: $err')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddDialog(context, service),
        icon: const Icon(Icons.person_add),
        label: const Text('Thêm khách'),
      ),
    );
  }

  Future<void> _showAddDialog(BuildContext context, dynamic service) async {
    final nameCtrl = TextEditingController();
    final codeCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final addressCtrl = TextEditingController();

    final saved = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Thêm khách hàng'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: codeCtrl,
                decoration: const InputDecoration(labelText: 'Mã khách *', hintText: 'KH-001'),
              ),
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Tên khách hàng *'),
              ),
              TextField(
                controller: phoneCtrl,
                decoration: const InputDecoration(labelText: 'Số điện thoại'),
              ),
              TextField(
                controller: addressCtrl,
                decoration: const InputDecoration(labelText: 'Địa chỉ'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Hủy')),
          FilledButton(
            onPressed: () async {
              if (codeCtrl.text.trim().isEmpty || nameCtrl.text.trim().isEmpty) {
                ScaffoldMessenger.of(ctx).showSnackBar(
                  const SnackBar(content: Text('Vui lòng nhập Mã khách và Tên khách hàng')),
                );
                return;
              }
              await service.addCustomer(
                customerCode: codeCtrl.text.trim(),
                name: nameCtrl.text.trim(),
                phone: phoneCtrl.text.trim().isEmpty ? null : phoneCtrl.text.trim(),
                address: addressCtrl.text.trim().isEmpty ? null : addressCtrl.text.trim(),
              );
              if (ctx.mounted) Navigator.pop(ctx, true);
            },
            child: const Text('Lưu'),
          ),
        ],
      ),
    );

    if (saved == true && mounted) {
      final service2 = ref.read(orderBucketServiceProvider);
      ref.invalidate(customerListProvider(service2));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã thêm khách hàng mới')),
      );
    }
  }

  Future<void> _showCustomerDetail(BuildContext context, dynamic service, CustomerLocal c) async {
    final debt = await service.getCustomerDebt(c.customerId);
    if (!mounted) return;
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(c.name ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Mã: ${c.customerCode ?? ''} · SĐT: ${c.phone ?? '—'}'),
            Text('Email: ${c.email ?? '—'}'),
            Text('Địa chỉ: ${c.address ?? '—'}'),
            Text('Trạng thái: ${c.status ?? 'ACTIVE'}'),
            const Divider(height: 24),
            Text('Công nợ: ${(debt['total_debt'] as double? ?? 0).toStringAsFixed(0)} đ',
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
            Text('Tổng đơn: ${(debt['total_orders'] as double? ?? 0).toStringAsFixed(0)} đ · Đã trả: ${(debt['total_paid'] as double? ?? 0).toStringAsFixed(0)} đ'),
            Text('Số đơn hàng: ${debt['order_count'] ?? 0}'),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pop(ctx),
                icon: const Icon(Icons.close),
                label: const Text('Đóng'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}