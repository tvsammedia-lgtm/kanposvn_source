import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/nhatro_providers.dart';
import '../models/maintenance.dart';

class MaintenanceListScreen extends ConsumerWidget {
  const MaintenanceListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maintsAsync = ref.watch(maintenanceProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Quan Ly Bao Tri')),
      body: maintsAsync.when(
        data: (items) {
          if (items.isEmpty) return const Center(child: Text('Chua co bao tri.'));
          final sorted = List<Maintenance>.from(items)
            ..sort((a, b) => (b.repairDate ?? DateTime(0)).compareTo(a.repairDate ?? DateTime(0)));
          return ListView.builder(
            itemCount: sorted.length,
            itemBuilder: (_, i) => _tile(sorted[i]),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }

  Widget _tile(Maintenance m) {
    final fmt = NumberFormat.currency(locale: 'vi_VN', symbol: 'dd');
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.orange.shade100,
          child: const Icon(Icons.build, color: Colors.orange, size: 20),
        ),
        title: Text(m.equipment ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Phong: ${m.roomUuid?.substring(0, 8) ?? "N/A"}'),
            Text('Noi dung: ${m.content ?? "N/A"}'),
            Text('Don vi: ${m.repairUnit ?? "N/A"} | Nguoi thuc hien: ${m.performer ?? "N/A"}'),
            Text('Ngay: ${_fmtDate(m.repairDate)} | Chi phi: ${fmt.format(m.cost ?? 0)}'),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }

  String _fmtDate(DateTime? d) {
    if (d == null) return 'N/A';
    return '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
  }
}
