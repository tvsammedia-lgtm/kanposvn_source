import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../core/providers.dart';
import '../../core/module_enum.dart';
import '../../core/widgets/common_widgets.dart';
import '../../core/l10n/translations.dart';

final dashboardModuleProvider = Provider<AppModule?>((ref) {
  return ref.watch(authServiceProvider).currentModule;
});

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final module = ref.watch(dashboardModuleProvider);
    final auth = ref.watch(authServiceProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${'hello'.tr}, ${auth.user?['full_name'] ?? 'User'}',
                      style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 4),
                    Text('overview_module'.trParams({'module': module?.label ?? "KanPosVN"}),
                      style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: (module?.color ?? AppColors.primary).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: (module?.color ?? AppColors.primary).withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(module?.icon ?? Icons.store,
                        color: module?.color ?? AppColors.primary, size: 16),
                      const SizedBox(width: 8),
                      Text(module?.label ?? 'KanPosVN',
                        style: TextStyle(color: module?.color ?? AppColors.primary,
                          fontWeight: FontWeight.w600, fontSize: 13)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: _buildModuleDashboard(context, ref, module),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleDashboard(BuildContext context, WidgetRef ref, AppModule? module) {
    switch (module) {
      case AppModule.nhanSu:
        return const _NhanSuDashboard();
      default:
        return Center(child: Text('no_data'.tr));
    }
  }
}

class _NhanSuDashboard extends StatelessWidget {
  const _NhanSuDashboard();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: _getCrossAxisCount(context),
      crossAxisSpacing: 16, mainAxisSpacing: 16,
      childAspectRatio: 2.0,
      children: [
        KpiCard(title: 'employees'.tr, value: '24', icon: Icons.people, color: AppColors.info),
        KpiCard(title: 'attendance_month'.tr, value: '92%', icon: Icons.calendar_today, color: AppColors.success),
        KpiCard(title: 'salary_month'.tr, value: '185 tr', icon: Icons.account_balance_wallet, color: AppColors.warning),
        KpiCard(title: 'remaining_leave'.tr, value: '72 ngày', icon: Icons.event_busy, color: AppColors.danger),
      ],
    );
  }
}

int _getCrossAxisCount(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width > 1200) return 4;
  if (width > 800) return 3;
  if (width > 500) return 2;
  return 1;
}
