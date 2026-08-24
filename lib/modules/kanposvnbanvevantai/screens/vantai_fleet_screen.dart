import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/vantai_route.dart';
import '../models/vantai_vehicle.dart';
import '../providers/vantai_providers.dart';
import '../services/vantai_business_logic.dart';

/// PRD mục 2-3: Quản lý tuyến xe & đội xe (thay thế màn hình stub cũ).
class VantaiFleetScreen extends ConsumerWidget {
  const VantaiFleetScreen({super.key});

  static final _money =
      NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0);
  static final _dateFmt = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tuyến Xe & Đội Xe'),
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.alt_route), text: 'Tuyến xe'),
            Tab(icon: Icon(Icons.directions_bus), text: 'Đội xe'),
          ]),
        ),
        body: const TabBarView(children: [_RoutesTab(), _VehiclesTab()]),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Tuyến xe
// ---------------------------------------------------------------------------

class _RoutesTab extends ConsumerWidget {
  const _RoutesTab();

  Future<void> _edit(BuildContext context, WidgetRef ref,
      [VantaiRoute? existing]) async {
    final nameCtrl = TextEditingController(text: existing?.routeName);
    final fromCtrl = TextEditingController(text: existing?.startPoint);
    final toCtrl = TextEditingController(text: existing?.endPoint);
    final kmCtrl = TextEditingController(
        text: existing != null && existing.distanceKm > 0
            ? '${existing.distanceKm.toInt()}'
            : '');
    final priceCtrl = TextEditingController(
        text: existing != null && existing.basePrice > 0
            ? '${existing.basePrice.toInt()}'
            : '');
    final timeCtrl = TextEditingController(text: existing?.estimatedTime);

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(existing == null ? 'THÊM TUYẾN XE' : 'SỬA TUYẾN XE'),
        content: SizedBox(
          width: 400,
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              TextField(
                  controller: nameCtrl,
                  autofocus: true,
                  decoration: const InputDecoration(
                      labelText: 'Tên tuyến *', border: OutlineInputBorder())),
              const SizedBox(height: 8),
              Row(children: [
                Expanded(
                    child: TextField(
                        controller: fromCtrl,
                        decoration: const InputDecoration(
                            labelText: 'Điểm đi',
                            border: OutlineInputBorder()))),
                const SizedBox(width: 8),
                Expanded(
                    child: TextField(
                        controller: toCtrl,
                        decoration: const InputDecoration(
                            labelText: 'Điểm đến',
                            border: OutlineInputBorder()))),
              ]),
              const SizedBox(height: 8),
              Row(children: [
                Expanded(
                    child: TextField(
                        controller: kmCtrl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'Số km',
                            border: OutlineInputBorder()))),
                const SizedBox(width: 8),
                Expanded(
                    child: TextField(
                        controller: priceCtrl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'Giá vé chuẩn (đ)',
                            border: OutlineInputBorder()))),
              ]),
              const SizedBox(height: 8),
              TextField(
                  controller: timeCtrl,
                  decoration: const InputDecoration(
                      labelText: 'Thời gian chạy (VD: 8 tiếng)',
                      border: OutlineInputBorder())),
            ]),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Hủy')),
          FilledButton(
              onPressed: nameCtrl.text.trim().isEmpty
                  ? null
                  : () => Navigator.pop(ctx, true),
              child: const Text('Lưu')),
        ],
      ),
    );
    if (ok != true) return;
    final r = existing ?? (VantaiRoute()..routeId = const Uuid().v4());
    r.routeName = nameCtrl.text.trim();
    r.startPoint = fromCtrl.text.trim();
    r.endPoint = toCtrl.text.trim();
    r.distanceKm = double.tryParse(kmCtrl.text.trim()) ?? 0;
    r.basePrice = double.tryParse(priceCtrl.text.trim()) ?? 0;
    r.estimatedTime = timeCtrl.text.trim();
    await ref.read(vantaiRoutesProvider.notifier).upsert(r);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routesAsync = ref.watch(vantaiRoutesProvider);
    return routesAsync.when(
      data: (routes) => Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          label: const Text('Thêm tuyến'),
          onPressed: () => _edit(context, ref),
        ),
        body: routes.isEmpty
            ? const Center(child: Text('Chưa có tuyến nào.'))
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: routes.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (_, i) {
                  final r = routes[i];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.alt_route,
                          color: Colors.teal, size: 32),
                      title: Text(r.routeName,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          '${r.startPoint} → ${r.endPoint}\n${r.distanceKm.toInt()} km • ${r.estimatedTime} • Giá vé: ${VantaiFleetScreen._money.format(r.basePrice)}'),
                      isThreeLine: true,
                      trailing: PopupMenuButton<String>(
                        onSelected: (v) {
                          if (v == 'edit') _edit(context, ref, r);
                          if (v == 'delete') {
                            ref.read(vantaiRoutesProvider.notifier).delete(r);
                          }
                        },
                        itemBuilder: (_) => [
                          const PopupMenuItem(value: 'edit', child: Text('Sửa')),
                          const PopupMenuItem(
                              value: 'delete', child: Text('Xóa')),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
    );
  }
}

// ---------------------------------------------------------------------------
// Đội xe
// ---------------------------------------------------------------------------

class _VehiclesTab extends ConsumerWidget {
  const _VehiclesTab();

  Future<void> _edit(BuildContext context, WidgetRef ref,
      [VantaiVehicle? existing]) async {
    final plateCtrl = TextEditingController(text: existing?.plateNumber);
    final brandCtrl = TextEditingController(text: existing?.brand);
    VehicleType type = existing?.type ?? VehicleType.SLEEPER;
    int seats = existing?.totalSeats ?? 40;
    int year = existing?.manufactureYear ?? DateTime.now().year;

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setD) => AlertDialog(
          title: Text(existing == null ? 'THÊM XE' : 'SỬA XE'),
          content: SizedBox(
            width: 400,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              TextField(
                  controller: plateCtrl,
                  autofocus: true,
                  decoration: const InputDecoration(
                      labelText: 'Biển số *', border: OutlineInputBorder())),
              const SizedBox(height: 8),
              DropdownButtonFormField<VehicleType>(
                value: type,
                isExpanded: true,
                decoration: const InputDecoration(
                    labelText: 'Loại xe', border: OutlineInputBorder()),
                items: VehicleType.values
                    .map((t) => DropdownMenuItem(value: t, child: Text(t.label)))
                    .toList(),
                onChanged: (v) => setD(() => type = v ?? type),
              ),
              const SizedBox(height: 8),
              Row(children: [
                Expanded(
                    child: DropdownButtonFormField<int>(
                  value: seats.clamp(1, 60),
                  decoration: const InputDecoration(
                      labelText: 'Số chỗ/giường', border: OutlineInputBorder()),
                  items: List.generate(60, (i) => i + 1)
                      .map((n) => DropdownMenuItem(
                          value: n, child: Text('$n chỗ')))
                      .toList(),
                  onChanged: (v) => seats = v ?? seats,
                )),
                const SizedBox(width: 8),
                Expanded(
                    child: TextFormField(
                  initialValue: '$year',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Năm SX', border: OutlineInputBorder()),
                  onChanged: (v) => year = int.tryParse(v) ?? year,
                )),
              ]),
              const SizedBox(height: 8),
              TextField(
                  controller: brandCtrl,
                  decoration: const InputDecoration(
                      labelText: 'Hãng xe', border: OutlineInputBorder())),
            ]),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Hủy')),
            FilledButton(
                onPressed: plateCtrl.text.trim().isEmpty
                    ? null
                    : () => Navigator.pop(ctx, true),
                child: const Text('Lưu')),
          ],
        ),
      ),
    );
    if (ok != true) return;
    final v = existing ?? (VantaiVehicle()..vehicleId = const Uuid().v4());
    v.plateNumber = plateCtrl.text.trim();
    v.type = type;
    v.totalSeats = seats;
    v.brand = brandCtrl.text.trim();
    v.manufactureYear = year;
    await ref.read(vantaiVehiclesProvider.notifier).upsert(v);
  }

  Color _statusColor(VehicleStatus s) => switch (s) {
        VehicleStatus.ACTIVE => Colors.green,
        VehicleStatus.MAINTENANCE => Colors.orange,
        VehicleStatus.REPAIR => Colors.red,
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehiclesAsync = ref.watch(vantaiVehiclesProvider);
    final now = DateTime.now();
    return vehiclesAsync.when(
      data: (vehicles) => Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          label: const Text('Thêm xe'),
          onPressed: () => _edit(context, ref),
        ),
        body: vehicles.isEmpty
            ? const Center(child: Text('Chưa có xe nào.'))
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: vehicles.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (_, i) {
                  final v = vehicles[i];
                  final warnDocs = <String>[
                    if (VantaiBusinessLogic.expiringSoon(v.inspectionExpiry, now))
                      'đăng kiểm ${VantaiFleetScreen._dateFmt.format(v.inspectionExpiry!)}',
                    if (VantaiBusinessLogic.expiringSoon(v.insuranceExpiry, now))
                      'bảo hiểm ${VantaiFleetScreen._dateFmt.format(v.insuranceExpiry!)}',
                  ];
                  return Card(
                    child: ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.directions_bus,
                              color: _statusColor(v.status), size: 32),
                          Text('${v.totalSeats} chỗ',
                              style: const TextStyle(fontSize: 10)),
                        ],
                      ),
                      title: Text('${v.plateNumber} • ${v.brand}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          '${v.type.label} • SX ${v.manufactureYear} • ${v.odometerKm.toInt()} km'
                          '\nĐăng kiểm: ${v.inspectionExpiry != null ? VantaiFleetScreen._dateFmt.format(v.inspectionExpiry!) : "-"} • BH: ${v.insuranceExpiry != null ? VantaiFleetScreen._dateFmt.format(v.insuranceExpiry!) : "-"}'
                          '${warnDocs.isNotEmpty ? "\n⚠ Sắp hết hạn: ${warnDocs.join(", ")}" : ""}'),
                      isThreeLine: true,
                      trailing: PopupMenuButton<String>(
                        onSelected: (val) async {
                          switch (val) {
                            case 'edit':
                              await _edit(context, ref, v);
                              break;
                            case 'active':
                            case 'maint':
                            case 'repair':
                              v.status = val == 'active'
                                  ? VehicleStatus.ACTIVE
                                  : val == 'maint'
                                      ? VehicleStatus.MAINTENANCE
                                      : VehicleStatus.REPAIR;
                              await ref
                                  .read(vantaiVehiclesProvider.notifier)
                                  .upsert(v);
                              break;
                          }
                        },
                        itemBuilder: (_) => [
                          const PopupMenuItem(value: 'edit', child: Text('Sửa')),
                          const PopupMenuItem(
                              value: 'active', child: Text('Đang hoạt động')),
                          const PopupMenuItem(
                              value: 'maint', child: Text('Bảo dưỡng')),
                          const PopupMenuItem(
                              value: 'repair', child: Text('Sửa chữa')),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
    );
  }
}
