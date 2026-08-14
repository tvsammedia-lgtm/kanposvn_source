import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/driver_provider.dart';

class DriverListScreen extends ConsumerWidget {
  const DriverListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final driverState = ref.watch(xeOmDriverProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Quản lý Tài Xế')),
      body: driverState.when(
        data: (drivers) {
          if (drivers.isEmpty) {
            return const Center(child: Text('Chưa có tài xế nào.'));
          }
          return ListView.builder(
            itemCount: drivers.length,
            itemBuilder: (context, index) {
              final driver = drivers[index];
              return ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(driver.fullName ?? 'Tài xế không tên'),
                subtitle: Text('SĐT: ${driver.phone ?? "N/A"} - Trạng thái: ${driver.status.name}'),
                trailing: const Icon(Icons.chevron_right),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Thêm tài xế mới
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
