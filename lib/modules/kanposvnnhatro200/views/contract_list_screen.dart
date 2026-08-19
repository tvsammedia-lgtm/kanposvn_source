import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/nhatro_providers.dart';
import '../models/contract.dart';
import '../models/room.dart';
import '../models/tenant.dart';

class ContractListScreen extends ConsumerWidget {
  const ContractListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contractsAsync = ref.watch(contractsProvider);
    final roomsAsync = ref.watch(roomsProvider);
    final tenantsAsync = ref.watch(tenantsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Danh Sach Hop Dong')),
      body: contractsAsync.when(
        data: (contracts) => roomsAsync.when(
          data: (rooms) => tenantsAsync.when(
            data: (tenants) {
              if (contracts.isEmpty) return const Center(child: Text('Chua co hop dong.'));
              final roomMap = {for (final r in rooms) r.uuid: r};
              final tenantMap = {for (final t in tenants) t.uuid: t};
              return ListView.builder(
                itemCount: contracts.length,
                itemBuilder: (_, i) => _tile(contracts[i], roomMap, tenantMap),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }

  Widget _tile(Contract c, Map<String?, Room> rm, Map<String?, Tenant> tm) {
    final room = rm[c.roomUuid];
    final tenant = tm[c.tenantUuid];
    final now = DateTime.now();
    final isExpired = c.endDate != null && c.endDate!.isBefore(now);
    final daysLeft = c.endDate != null ? c.endDate!.difference(now).inDays : 0;
    final color = isExpired ? Colors.red : (daysLeft < 30 ? Colors.orange : Colors.green);
    final status = isExpired ? 'Het han' : (daysLeft < 30 ? 'Sap het han' : 'Con hieu luc');
    final fmt = NumberFormat.currency(locale: 'vi_VN', symbol: 'dd');

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.shade100,
          child: Icon(Icons.description, color: color, size: 20),
        ),
        title: Text(c.contractNumber ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Phong: ${room?.roomCode ?? c.roomUuid ?? "N/A"}'),
            Text('KH: ${tenant?.fullName ?? c.tenantUuid ?? "N/A"}'),
            Text('Tien: ${fmt.format(c.rentPrice ?? 0)}/thang | Chu ky: ${c.paymentCycleMonths ?? 1} thang'),
            Text('${_fmtDate(c.startDate)} - ${_fmtDate(c.endDate)}'),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(color: color.shade100, borderRadius: BorderRadius.circular(12)),
          child: Text(status, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold)),
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
