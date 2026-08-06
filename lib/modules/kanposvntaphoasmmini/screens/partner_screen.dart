import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/taphoa_providers.dart';

class TapHoaPartnerScreen extends ConsumerWidget {
  const TapHoaPartnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customers = ref.watch(tapHoaCustomersProvider);
    
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Đối Tác & Công Nợ'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Khách hàng'),
              Tab(text: 'Nhà cung cấp'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab Khách hàng
            customers.isEmpty
                ? const Center(child: Text('Chưa có dữ liệu khách hàng.'))
                : ListView.builder(
                    itemCount: customers.length,
                    itemBuilder: (context, index) {
                      final c = customers[index];
                      return ListTile(
                        leading: CircleAvatar(child: Text(c.name.isNotEmpty ? c.name[0] : '?')),
                        title: Text(c.name),
                        subtitle: Text('SĐT: ${c.phone} - Hạng: ${c.memberTier}'),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text('Công nợ', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            Text(
                              '${c.debtAmount.toStringAsFixed(0)} đ',
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
            // Tab Nhà cung cấp
            const Center(child: Text('Tính năng quản lý Nhà cung cấp đang được phát triển.')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.person_add),
        ),
      ),
    );
  }
}
