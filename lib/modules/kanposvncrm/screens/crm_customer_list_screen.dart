import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/crm_providers.dart';

class CrmCustomerListScreen extends ConsumerWidget {
  const CrmCustomerListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customers = ref.watch(crmCustomersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Khách hàng'),
        backgroundColor: const Color(0xFFE11D48),
      ),
      body: customers.isEmpty
          ? const Center(child: Text('Chưa có khách hàng nào'))
          : ListView.builder(
              itemCount: customers.length,
              itemBuilder: (context, index) {
                final c = customers[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFE11D48),
                      child: Icon(Icons.business, color: Colors.white),
                    ),
                    title: Text(c.companyName, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Đại diện: ${c.representativeName}'),
                        Text('SĐT: ${c.phone} - Email: ${c.email}'),
                      ],
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    isThreeLine: true,
                    onTap: () {
                      // Navigate to details
                    },
                  ),
                );
              },
            ),
    );
  }
}
