import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../core/providers.dart';
import '../../core/app_theme.dart';
import '../../core/widgets.dart';
import '../../models/trip.dart';

class TripListScreen extends ConsumerStatefulWidget {
  const TripListScreen({super.key});

  @override
  ConsumerState<TripListScreen> createState() => _TripListScreenState();
}

class _TripListScreenState extends ConsumerState<TripListScreen> {
  String _search = '';
  TripStatus? _statusFilter;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(tripNotifierProvider);
    final month = ref.watch(selectedMonthProvider);

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddTripDialog(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Tạo chuyến'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phân công chuyến xe',
                        style: Theme.of(context).textTheme.headlineLarge),
                    state.when(
                      data: (l) => Text('${l.length} chuyến',
                          style: Theme.of(context).textTheme.bodyMedium),
                      loading: () => const SizedBox.shrink(),
                      error: (_, __) => const SizedBox.shrink(),
                    ),
                  ],
                ),
                const Spacer(),
                MonthPicker(
                  year: month.year,
                  month: month.month,
                  onPrev: () =>
                      ref.read(selectedMonthProvider.notifier).previousMonth(),
                  onNext: () =>
                      ref.read(selectedMonthProvider.notifier).nextMonth(),
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
                    hint: 'Mã chuyến, khách hàng, tài xế...',
                    onChanged: (v) => setState(() => _search = v),
                  ),
                ),
                const SizedBox(width: 12),
                ...[null, TripStatus.assigned, TripStatus.inProgress,
                    TripStatus.completed, TripStatus.cancelled]
                    .map((s) {
                  final label = s == null
                      ? 'Tất cả'
                      : switch (s) {
                          TripStatus.assigned => 'Chờ',
                          TripStatus.inProgress => 'Đang chạy',
                          TripStatus.completed => 'Hoàn thành',
                          TripStatus.cancelled => 'Hủy',
                        };
                  return Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: FilterChip(
                      label: Text(label),
                      selected: _statusFilter == s,
                      onSelected: (_) => setState(() => _statusFilter = s),
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
              data: (trips) {
                final filtered = trips.where((t) {
                  final matchSearch = _search.isEmpty ||
                      t.tripCode.toLowerCase().contains(_search.toLowerCase()) ||
                      (t.customerName ?? '').toLowerCase().contains(_search.toLowerCase()) ||
                      (t.mainDriverName ?? '').toLowerCase().contains(_search.toLowerCase());
                  final matchStatus = _statusFilter == null || t.status == _statusFilter;
                  return matchSearch && matchStatus;
                }).toList();

                if (filtered.isEmpty) {
                  return const EmptyState(
                    icon: Icons.route_outlined,
                    title: 'Không có chuyến xe',
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) => _TripCard(
                    trip: filtered[i],
                    onDelete: () async {
                      await ref
                          .read(tripNotifierProvider.notifier)
                          .delete(filtered[i].id);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddTripDialog(BuildContext context, WidgetRef ref) {
    final codeCtrl = TextEditingController(
        text: 'CH${const Uuid().v4().substring(0, 6).toUpperCase()}');
    final customerCtrl = TextEditingController();
    final pickupCtrl = TextEditingController();
    final deliveryCtrl = TextEditingController();
    final driverCtrl = TextEditingController();
    final vehicleCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Tạo chuyến xe mới'),
        content: SizedBox(
          width: 500,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: codeCtrl,
                  decoration: const InputDecoration(labelText: 'Mã chuyến'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: customerCtrl,
                  decoration: const InputDecoration(labelText: 'Khách hàng'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: pickupCtrl,
                  decoration: const InputDecoration(labelText: 'Điểm lấy hàng'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: deliveryCtrl,
                  decoration: const InputDecoration(labelText: 'Điểm giao hàng'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: vehicleCtrl,
                  decoration: const InputDecoration(labelText: 'Biển số xe'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: driverCtrl,
                  decoration: const InputDecoration(labelText: 'Tài xế chính'),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () async {
              if (codeCtrl.text.trim().isEmpty) return;
              final t = Trip()
                ..tripCode = codeCtrl.text.trim()
                ..customerName = customerCtrl.text.trim().isEmpty
                    ? null
                    : customerCtrl.text.trim()
                ..pickupPoint = pickupCtrl.text.trim().isEmpty
                    ? null
                    : pickupCtrl.text.trim()
                ..deliveryPoint = deliveryCtrl.text.trim().isEmpty
                    ? null
                    : deliveryCtrl.text.trim()
                ..vehiclePlate = vehicleCtrl.text.trim().isEmpty
                    ? null
                    : vehicleCtrl.text.trim()
                ..mainDriverName = driverCtrl.text.trim().isEmpty
                    ? null
                    : driverCtrl.text.trim()
                ..tripDate = DateTime.now()
                ..status = TripStatus.assigned;

              await ref.read(tripNotifierProvider.notifier).save(t);
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: const Text('Tạo'),
          ),
        ],
      ),
    );
  }
}

class _TripCard extends StatelessWidget {
  final Trip trip;
  final VoidCallback onDelete;

  const _TripCard({required this.trip, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final t = trip;
    final statusLabel = switch (t.status) {
      TripStatus.assigned => 'Chờ xuất bến',
      TripStatus.inProgress => 'Đang chạy',
      TripStatus.completed => 'Hoàn thành',
      TripStatus.cancelled => 'Đã hủy',
    };
    final statusColor = switch (t.status) {
      TripStatus.assigned => AppTheme.warning,
      TripStatus.inProgress => AppTheme.primaryLight,
      TripStatus.completed => AppTheme.success,
      TripStatus.cancelled => AppTheme.danger,
    };

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(t.tripCode,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontFamily: 'monospace',
                        color: AppTheme.primaryLight,
                      )),
              const SizedBox(width: 8),
              StatusBadge(label: statusLabel, color: statusColor),
              const Spacer(),
              if (t.tripDate != null)
                Text(t.tripDate!.toDisplayDate(),
                    style: Theme.of(context).textTheme.bodySmall),
              IconButton(
                icon: const Icon(Icons.delete_outline,
                    size: 16, color: AppTheme.danger),
                onPressed: onDelete,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.business, size: 14, color: AppTheme.textMuted),
              const SizedBox(width: 6),
              Text(t.customerName ?? '—',
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.location_on_outlined,
                        size: 14, color: AppTheme.success),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(t.pickupPoint ?? '—',
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.arrow_forward, size: 14, color: AppTheme.textMuted),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.flag_outlined,
                        size: 14, color: AppTheme.danger),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(t.deliveryPoint ?? '—',
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(height: 1),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.person_outline,
                  size: 13, color: AppTheme.textMuted),
              const SizedBox(width: 4),
              Text(t.mainDriverName ?? '—',
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(width: 16),
              const Icon(Icons.directions_car_outlined,
                  size: 13, color: AppTheme.textMuted),
              const SizedBox(width: 4),
              Text(t.vehiclePlate ?? '—',
                  style: Theme.of(context).textTheme.bodySmall),
              const Spacer(),
              if (t.distanceKm != null) ...[
                const Icon(Icons.route, size: 13, color: AppTheme.textMuted),
                const SizedBox(width: 4),
                Text('${t.distanceKm?.toStringAsFixed(0)} km',
                    style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(width: 12),
              ],
              if (t.revenue != null)
                Text(t.revenue!.toVndShort(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.success,
                          fontWeight: FontWeight.w600,
                        )),
            ],
          ),
        ],
      ),
    );
  }
}
