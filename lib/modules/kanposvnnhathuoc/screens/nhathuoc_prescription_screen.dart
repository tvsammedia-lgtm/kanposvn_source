import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/nhathuoc_providers.dart';

class NhathuocPrescriptionScreen extends ConsumerWidget {
  const NhathuocPrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templatesAsync = ref.watch(nhathuocPrescriptionTemplatesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Toa Thuốc Mẫu')),
      body: templatesAsync.when(
        data: (templates) {
          if (templates.isEmpty) return const Center(child: Text('Chưa có toa mẫu nào.'));
          return ListView.builder(
            itemCount: templates.length,
            itemBuilder: (context, index) {
              final t = templates[index];
              return ExpansionTile(
                leading: const Icon(Icons.medical_information, color: Colors.blue),
                title: Text(t.diseaseName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                subtitle: Text(t.notes),
                children: t.details.map((d) {
                  return ListTile(
                    leading: const Icon(Icons.medication, color: Colors.green),
                    title: Text(d.medicine.value?.name ?? 'Unknown'),
                    subtitle: Text(d.dosageInstructions),
                    trailing: Text('SL: ${d.defaultQuantity} ${d.medicine.value?.unit ?? ''}'),
                  );
                }).toList(),
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
