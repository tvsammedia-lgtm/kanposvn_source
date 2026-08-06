import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/providers.dart';
import '../../core/app_theme.dart';
import '../../core/widgets.dart';
import '../../models/driver.dart';

class DriverListScreen extends ConsumerStatefulWidget {
  const DriverListScreen({super.key});

  @override
  ConsumerState<DriverListScreen> createState() => _DriverListScreenState();
}

class _DriverListScreenState extends ConsumerState<DriverListScreen> {
  String _search = '';
  DriverStatus? _statusFilter;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(driverNotifierProvider);

    return Scaffold(
      backgroundColor: AppTheme.bg900,
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
                    Text('Tài xế', style: Theme.of(context).textTheme.headlineLarge),
                    state.when(
                      data: (l) => Text('${l.length} tài xế',
                          style: Theme.of(context).textTheme.bodyMedium),
                      loading: () => const SizedBox.shrink(),
                      error: (_, __) => const SizedBox.shrink(),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () => context.go('/drivers/new'),
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Thêm tài xế'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Filters
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: AppSearchBar(
                    hint: 'Tìm tên, mã nhân viên...',
                    onChanged: (v) => setState(() => _search = v),
                  ),
                ),
                const SizedBox(width: 12),
                ...[null, DriverStatus.driving, DriverStatus.onLeave, DriverStatus.suspended]
                    .map((s) {
                  final label = s == null
                      ? 'Tất cả'
                      : switch (s) {
                          DriverStatus.driving => 'Đang lái',
                          DriverStatus.onLeave => 'Nghỉ phép',
                          DriverStatus.resigned => 'Nghỉ việc',
                          DriverStatus.suspended => 'Tạm nghỉ',
                        };
                  final isSelected = _statusFilter == s;
                  return Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: FilterChip(
                      label: Text(label),
                      selected: isSelected,
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
              error: (e, _) => Center(
                  child: Text('Lỗi: $e',
                      style: const TextStyle(color: AppTheme.danger))),
              data: (drivers) {
                final filtered = drivers.where((d) {
                  final matchSearch = _search.isEmpty ||
                      d.fullName.toLowerCase().contains(_search.toLowerCase()) ||
                      d.employeeCode.toLowerCase().contains(_search.toLowerCase());
                  final matchStatus = _statusFilter == null || d.status == _statusFilter;
                  return matchSearch && matchStatus;
                }).toList();

                if (filtered.isEmpty) {
                  return const EmptyState(
                    icon: Icons.local_shipping_outlined,
                    title: 'Không có tài xế',
                    subtitle: 'Thêm tài xế mới để bắt đầu',
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) => _DriverCard(
                    driver: filtered[i],
                    onTap: () => context.go('/drivers/${filtered[i].id}'),
                    onDelete: () async {
                      final ok = await showDialog<bool>(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Xóa tài xế'),
                          content: Text('Xóa ${filtered[i].fullName}?'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Hủy')),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context, true),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.danger),
                              child: const Text('Xóa'),
                            ),
                          ],
                        ),
                      );
                      if (ok == true && mounted) {
                        await ref
                            .read(driverNotifierProvider.notifier)
                            .delete(filtered[i].id);
                      }
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
}

class _DriverCard extends StatelessWidget {
  final Driver driver;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _DriverCard({
    required this.driver,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final d = driver;
    final statusLabel = switch (d.status) {
      DriverStatus.driving => 'Đang lái',
      DriverStatus.onLeave => 'Nghỉ phép',
      DriverStatus.resigned => 'Nghỉ việc',
      DriverStatus.suspended => 'Tạm nghỉ',
    };
    final statusColor = switch (d.status) {
      DriverStatus.driving => AppTheme.success,
      DriverStatus.onLeave => AppTheme.warning,
      DriverStatus.resigned => AppTheme.danger,
      DriverStatus.suspended => AppTheme.textMuted,
    };

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.borderColor),
        ),
        child: Row(
          children: [
            // Avatar with truck icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppTheme.primaryBlue.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.primaryBlue.withOpacity(0.3)),
              ),
              child: const Icon(Icons.local_shipping,
                  color: AppTheme.primaryLight, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(d.fullName,
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(width: 8),
                      StatusBadge(label: statusLabel, color: statusColor),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(d.employeeCode,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppTheme.primaryLight,
                              )),
                      if (d.licenseNumber != null) ...[
                        const SizedBox(width: 10),
                        const Icon(Icons.badge_outlined,
                            size: 12, color: AppTheme.textMuted),
                        const SizedBox(width: 4),
                        Text('GPLX: ${d.licenseNumber}',
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      // Vehicle types
                      if (d.canDriveContainer)
                        _VehicleBadge('Container'),
                      if (d.canDriveTractor)
                        _VehicleBadge('Đầu kéo'),
                      if (d.canDriveTruck)
                        _VehicleBadge('Xe tải'),
                      if (d.licenseExpiryDate != null) ...[
                        const SizedBox(width: 4),
                        const Icon(Icons.event, size: 11, color: AppTheme.textMuted),
                        const SizedBox(width: 3),
                        Text('HH: ${d.licenseExpiryDate!.toDisplayDate()}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: d.licenseExpiryDate!
                                              .difference(DateTime.now())
                                              .inDays <
                                          30
                                      ? AppTheme.warning
                                      : AppTheme.textMuted,
                                )),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(d.baseSalary.toVndShort(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppTheme.success,
                        )),
                const SizedBox(height: 4),
                Text('KN: ${d.experienceYears} năm',
                    style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit_outlined,
                          size: 16, color: AppTheme.textMuted),
                      onPressed: onTap,
                      padding: EdgeInsets.zero,
                      constraints:
                          const BoxConstraints(minWidth: 32, minHeight: 32),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline,
                          size: 16, color: AppTheme.danger),
                      onPressed: onDelete,
                      padding: EdgeInsets.zero,
                      constraints:
                          const BoxConstraints(minWidth: 32, minHeight: 32),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _VehicleBadge extends StatelessWidget {
  final String label;
  const _VehicleBadge(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppTheme.accent.withOpacity(0.12),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppTheme.accent.withOpacity(0.3)),
      ),
      child: Text(label,
          style: const TextStyle(color: AppTheme.accent, fontSize: 10)),
    );
  }
}
