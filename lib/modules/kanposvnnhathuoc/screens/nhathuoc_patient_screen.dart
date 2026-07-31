import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/nhathuoc_providers.dart';

class NhathuocPatientScreen extends ConsumerWidget {
  const NhathuocPatientScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patientsAsync = ref.watch(nhathuocPatientsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Quản lý Bệnh Nhân')),
      body: patientsAsync.when(
        data: (patients) {
          if (patients.isEmpty) return const Center(child: Text('Chưa có bệnh nhân nào.'));
          return ListView.builder(
            itemCount: patients.length,
            itemBuilder: (context, index) {
              final p = patients[index];
              final hasAllergy = p.allergies.trim().isNotEmpty;
              return Card(
                margin: const EdgeInsets.all(8),
                color: hasAllergy ? Colors.orange[50] : Colors.white,
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SĐT: ${p.phone}'),
                      if (p.medicalHistory.isNotEmpty) Text('Bệnh nền: ${p.medicalHistory}'),
                      if (hasAllergy) Text('Dị ứng: ${p.allergies}', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
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
