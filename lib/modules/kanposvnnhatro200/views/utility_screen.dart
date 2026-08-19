import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/nhatro_providers.dart';
import '../models/electric_reading.dart';
import '../models/water_reading.dart';

class UtilityScreen extends ConsumerWidget {
  const UtilityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final electricAsync = ref.watch(electricReadingsProvider);
    final waterAsync = ref.watch(waterReadingsProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dien Nuoc'),
          bottom: const TabBar(tabs: [
            Tab(text: 'DIEN'),
            Tab(text: 'NUOC'),
          ]),
        ),
        body: TabBarView(children: [
          electricAsync.when(
            data: (readings) {
              if (readings.isEmpty) return const Center(child: Text('Chua co chi so dien.'));
              final sorted = List<ElectricReading>.from(readings)
                ..sort((a, b) => (b.month ?? 0).compareTo(a.month ?? 0));
              return ListView.builder(
                itemCount: sorted.length,
                itemBuilder: (_, i) => _electricTile(sorted[i]),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
          ),
          waterAsync.when(
            data: (readings) {
              if (readings.isEmpty) return const Center(child: Text('Chua co chi so nuoc.'));
              final sorted = List<WaterReading>.from(readings)
                ..sort((a, b) => (b.month ?? 0).compareTo(a.month ?? 0));
              return ListView.builder(
                itemCount: sorted.length,
                itemBuilder: (_, i) => _waterTile(sorted[i]),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
          ),
        ]),
      ),
    );
  }

  Widget _electricTile(ElectricReading r) {
    final fmt = NumberFormat.currency(locale: 'vi_VN', symbol: 'dd');
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.amber.shade100,
          child: const Icon(Icons.electric_bolt, color: Colors.amber, size: 20),
        ),
        title: Text('Cong to: ${r.meterNumber ?? "N/A"}', style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Phong: ${r.roomUuid?.substring(0, 8) ?? "N/A"} | Thang: ${r.month}/${r.year}'),
            Text('Cu: ${r.oldIndex}  Moi: ${r.newIndex}  Tieu thu: ${r.consumption} kWh'),
            Text('Don gia: ${fmt.format(r.unitPrice ?? 0)}/kWh = ${fmt.format(r.totalAmount ?? 0)}'),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }

  Widget _waterTile(WaterReading r) {
    final fmt = NumberFormat.currency(locale: 'vi_VN', symbol: 'dd');
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: const Icon(Icons.water_drop, color: Colors.blue, size: 20),
        ),
        title: Text('Dong ho: ${r.meterNumber ?? "N/A"}', style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Phong: ${r.roomUuid?.substring(0, 8) ?? "N/A"} | Thang: ${r.month}/${r.year}'),
            Text('Cu: ${r.oldIndex}  Moi: ${r.newIndex}  Tieu thu: ${r.consumption} m3'),
            Text('Don gia: ${fmt.format(r.unitPrice ?? 0)}/m3 = ${fmt.format(r.totalAmount ?? 0)}'),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
