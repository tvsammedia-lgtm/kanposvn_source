import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/nhatro_providers.dart';
import '../models/tenant.dart';

class TenantListScreen extends ConsumerWidget {
  const TenantListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tenantsAsync = ref.watch(tenantsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Danh Sách Khách Thuê')),
      body: tenantsAsync.when(
        data: (tenants) {
          if (tenants.isEmpty) return const Center(child: Text('Chưa có khách thuê.'));
          return ListView.builder(
            itemCount: tenants.length,
            itemBuilder: (_, i) => _tenantTile(tenants[i]),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e')),
      ),
    );
  }

  Widget _tenantTile(Tenant t) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green.shade100,
          child: Text((t.fullName ?? '?')[0], style: TextStyle(color: Colors.green.shade800)),
        ),
        title: Text(t.fullName ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SĐT: ${t.phone ?? 'N/A'} | CCCD: ${t.cccd ?? 'N/A'}'),
            Text('Nghề: ${t.occupation ?? 'N/A'} | Địa chỉ: ${t.permanentAddress ?? 'N/A'}'),
            if (t.licensePlate != null && t.licensePlate!.isNotEmpty)
              Text('Xe: ${t.licensePlate}'),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
