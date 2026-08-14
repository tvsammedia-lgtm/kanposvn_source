import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/crm_providers.dart';

class CrmLicenseScreen extends ConsumerWidget {
  const CrmLicenseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final licenses = ref.watch(crmLicensesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý License'),
        backgroundColor: const Color(0xFFE11D48),
      ),
      body: licenses.isEmpty
          ? const Center(child: Text('Chưa có License nào được tạo.'))
          : ListView.builder(
              itemCount: licenses.length,
              itemBuilder: (context, index) {
                final lic = licenses[index];
                return ListTile(
                  leading: const Icon(Icons.key, color: Colors.amber),
                  title: Text(lic.licenseKey, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('App: ${lic.appCode} - Gói: ${lic.packageType}'),
                  trailing: Chip(
                    label: Text(lic.status),
                    backgroundColor: lic.status == 'active' ? Colors.green[100] : Colors.red[100],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tạo license mới
        },
        backgroundColor: const Color(0xFFE11D48),
        child: const Icon(Icons.add),
      ),
    );
  }
}
