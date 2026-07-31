import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/spa_crm_inventory_providers.dart';

class SpaCustomersScreen extends ConsumerWidget {
  const SpaCustomersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customersAsync = ref.watch(spaCustomersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Hồ Sơ Khách Hàng')),
      body: customersAsync.when(
        data: (customers) {
          if (customers.isEmpty) return const Center(child: Text('Chưa có khách hàng nào.'));
          return ListView.builder(
            itemCount: customers.length,
            itemBuilder: (context, index) {
              final c = customers[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(c.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SĐT: ${c.phone}'),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          if (c.skinType.isNotEmpty) Chip(label: Text(c.skinType), backgroundColor: Colors.blue[50]),
                          const SizedBox(width: 8),
                          if (c.allergies.isNotEmpty) Chip(label: Text(c.allergies), backgroundColor: Colors.red[50]),
                          const SizedBox(width: 8),
                          if (c.medicalCondition.isNotEmpty) Chip(label: Text(c.medicalCondition), backgroundColor: Colors.orange[50]),
                        ],
                      )
                    ],
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e')),
      ),
    );
  }
}
