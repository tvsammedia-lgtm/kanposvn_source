import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import '../../core/app_theme.dart';
import '../../core/widgets.dart';
import '../../models/vehicle.dart';

class VehicleListScreen extends ConsumerStatefulWidget {
  const VehicleListScreen({super.key});

  @override
  ConsumerState<VehicleListScreen> createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends ConsumerState<VehicleListScreen> {
  String _search = '';
  VehicleType? _typeFilter;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(vehicleNotifierProvider);

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddVehicleDialog(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Thêm xe'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Quản lý xe', style: Theme.of(context).textTheme.headlineLarge),
                state.when(
                  data: (l) => Text('${l.length} xe',
                      style: Theme.of(context).textTheme.bodyMedium),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: AppSearchBar(
                    hint: 'Biển số, số khung...',
                    onChanged: (v) => setState(() => _search = v),
                  ),
                ),
                const SizedBox(width: 12),
                ...[null, VehicleType.tractor, VehicleType.mooc,
                    VehicleType.container, VehicleType.truck]
                    .map((t) {
                  final label = t == null
                      ? 'Tất cả'
                      : switch (t) {
                          VehicleType.tractor => 'Đầu kéo',
                          VehicleType.mooc => 'Mooc',
                          VehicleType.container => 'Container',
                          VehicleType.truck => 'Xe tải',
                        };
                  return Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: FilterChip(
                      label: Text(label),
                      selected: _typeFilter == t,
                      onSelected: (_) => setState(() => _typeFilter = t),
                      selectedColor: AppTheme.primaryBlue.withOpacity(0.3),
                      checkmarkColor: AppTheme.primaryLight,
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 12),

          Expanded(
            child: state.when(
              loading: () => const Padding(
                  padding: EdgeInsets.all(24), child: LoadingList()),
              error: (e, _) => Center(child: Text('Lỗi: $e')),
              data: (vehicles) {
                final filtered = vehicles.where((v) {
                  final matchSearch = _search.isEmpty ||
                      v.licensePlate.toLowerCase().contains(_search.toLowerCase()) ||
                      (v.chassisNumber ?? '').toLowerCase().contains(_search.toLowerCase());
                  final matchType = _typeFilter == null || v.vehicleType == _typeFilter;
                  return matchSearch && matchType;
                }).toList();

                if (filtered.isEmpty) {
                  return const EmptyState(
                    icon: Icons.directions_car_outlined,
                    title: 'Không có xe',
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) => _VehicleCard(vehicle: filtered[i]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddVehicleDialog(BuildContext context, WidgetRef ref) {
    final plateCtrl = TextEditingController();
    VehicleType type = VehicleType.tractor;
    VehicleStatus status = VehicleStatus.active;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setS) => AlertDialog(
          title: const Text('Thêm xe mới'),
          content: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: plateCtrl,
                  decoration: const InputDecoration(labelText: 'Biển số *'),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<VehicleType>(
                  value: type,
                  decoration: const InputDecoration(labelText: 'Loại xe'),
                  dropdownColor: AppTheme.bg800,
                  items: VehicleType.values
                      .map((t) => DropdownMenuItem(
                            value: t,
                            child: Text(switch (t) {
                              VehicleType.tractor => 'Đầu kéo',
                              VehicleType.mooc => 'Mooc',
                              VehicleType.container => 'Container',
                              VehicleType.truck => 'Xe tải',
                            }),
                          ))
                      .toList(),
                  onChanged: (v) => setS(() => type = v!),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Hủy')),
            ElevatedButton(
              onPressed: () async {
                if (plateCtrl.text.trim().isEmpty) return;
                final v = Vehicle()
                  ..licensePlate = plateCtrl.text.trim()
                  ..vehicleType = type
                  ..status = status;
                await ref.read(vehicleNotifierProvider.notifier).save(v);
                if (ctx.mounted) Navigator.pop(ctx);
              },
              child: const Text('Thêm'),
            ),
          ],
        ),
      ),
    );
  }
}

class _VehicleCard extends StatelessWidget {
  final Vehicle vehicle;
  const _VehicleCard({required this.vehicle});

  @override
  Widget build(BuildContext context) {
    final v = vehicle;
    final typeLabel = switch (v.vehicleType) {
      VehicleType.tractor => 'Đầu kéo',
      VehicleType.mooc => 'Mooc',
      VehicleType.container => 'Container',
      VehicleType.truck => 'Xe tải',
    };
    final typeColor = switch (v.vehicleType) {
      VehicleType.tractor => AppTheme.primaryLight,
      VehicleType.mooc => AppTheme.accent,
      VehicleType.container => const Color(0xFFA855F7),
      VehicleType.truck => AppTheme.warning,
    };
    final statusLabel = switch (v.status) {
      VehicleStatus.active => 'Hoạt động',
      VehicleStatus.maintenance => 'Bảo dưỡng',
      VehicleStatus.broken => 'Hỏng',
      VehicleStatus.inactive => 'Ngừng hoạt động',
    };
    final statusColor = switch (v.status) {
      VehicleStatus.active => AppTheme.success,
      VehicleStatus.maintenance => AppTheme.warning,
      VehicleStatus.broken => AppTheme.danger,
      VehicleStatus.inactive => AppTheme.textMuted,
    };

    // Check registration expiry
    final regExpired = v.registrationExpiry != null &&
        v.registrationExpiry!.difference(DateTime.now()).inDays < 30;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: regExpired ? AppTheme.warning.withOpacity(0.5) : AppTheme.borderColor,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: typeColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: typeColor.withOpacity(0.3)),
            ),
            child: Center(
              child: Text(typeLabel,
                  style: TextStyle(
                      color: typeColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(v.licensePlate,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontFamily: 'monospace', letterSpacing: 1)),
                    const SizedBox(width: 8),
                    StatusBadge(label: statusLabel, color: statusColor),
                    if (regExpired) ...[
                      const SizedBox(width: 6),
                      StatusBadge(label: 'HH đăng kiểm', color: AppTheme.warning),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    if (v.brand != null)
                      Text(v.brand!,
                          style: Theme.of(context).textTheme.bodySmall),
                    if (v.manufacturingYear != null) ...[
                      const SizedBox(width: 8),
                      Text('Năm: ${v.manufacturingYear}',
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                    if (v.loadCapacity != null) ...[
                      const SizedBox(width: 8),
                      Text('${v.loadCapacity}T',
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    if (v.hasGps)
                      const Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: Icon(Icons.gps_fixed,
                            size: 13, color: AppTheme.success),
                      ),
                    if (v.hasEtc)
                      const Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: Icon(Icons.toll,
                            size: 13, color: AppTheme.accent),
                      ),
                    if (v.registrationExpiry != null)
                      Text(
                        'ĐK: ${v.registrationExpiry!.toDisplayDate()}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: regExpired
                                  ? AppTheme.warning
                                  : AppTheme.textMuted,
                            ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
