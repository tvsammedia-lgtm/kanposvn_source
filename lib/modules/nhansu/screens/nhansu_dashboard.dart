import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/common_widgets.dart';
import '../../../core/db/database_service.dart';
import '../../../core/providers.dart';
import '../../../core/l10n/translations.dart';
import '../../../core/widgets/app_shell.dart';
import '../services/nhansu_seed_data.dart';
import '../../../core/widgets/owner_info_bar.dart';

class NhanSuDashboard extends ConsumerStatefulWidget {
  const NhanSuDashboard({super.key});

  @override
  ConsumerState<NhanSuDashboard> createState() => _NhanSuDashboardState();
}

class _NhanSuDashboardState extends ConsumerState<NhanSuDashboard> {
  @override
  void initState() {
    super.initState();
    NhanSuSeedData.seedIfEmpty();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(databaseServiceProvider);

    final db = DatabaseService.instance;
    final employees = db.getCollection('employees');
    final attendance = db.getCollection('attendance');
    final payrolls = db.getCollection('payrolls');

    final totalEmployees = employees.length;
    final activeEmployees = employees.where((e) => e['status'] != 'inactive').length;
    final now = DateTime.now();
    final currentMonthAttendance = attendance.where((a) =>
        a['year'] == now.year && a['month'] == now.month).toList();
    final presentCount = currentMonthAttendance.where((a) =>
        ((a['workingDays'] as num?) ?? 0) > 0).length;
    final totalMonthSalary = payrolls
        .where((p) => p['year'] == now.year && p['month'] == now.month)
        .fold<double>(0, (sum, p) => sum + ((p['netSalary'] as num?) ?? 0).toDouble());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OwnerInfoBar(),
                const SizedBox(height: 12),
                Text(
                  'hr_overview'.tr,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tháng ${now.month.toString().padLeft(2, '0')}/${now.year}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                ),
                const SizedBox(height: 20),
                GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: constraints.maxWidth > 900
                        ? 4
                        : (constraints.maxWidth > 480 ? 2 : 1),
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    mainAxisExtent: 180,
                  ),
                  children: [
                    KpiCard(
                      title: 'total_staff'.tr,
                      value: '$totalEmployees',
                      subtitle: 'active_staff'.trParams({'count': '$activeEmployees'}),
                      icon: Icons.people_rounded,
                      color: AppColors.primary,
                      onTap: () {
                        ref.read(currentScreenIndexProvider.notifier).state = 1;
                      },
                    ),
                    KpiCard(
                      title: 'attendance_month'.tr,
                      value: '$presentCount',
                      subtitle: 'records'.trParams({'count': '${currentMonthAttendance.length}'}),
                      icon: Icons.calendar_month_rounded,
                      color: AppColors.success,
                      onTap: () {
                        ref.read(currentScreenIndexProvider.notifier).state = 2;
                      },
                    ),
                    KpiCard(
                      title: 'salary_month'.tr,
                      value: AppFormatters.formatCurrencyShort(totalMonthSalary),
                      subtitle: 'payslips'.trParams({'count': '${payrolls.where((p) => p['year'] == now.year && p['month'] == now.month).length}'}),
                      icon: Icons.payments_rounded,
                      color: AppColors.warning,
                      onTap: () {
                        ref.read(currentScreenIndexProvider.notifier).state = 3;
                      },
                    ),
                    KpiCard(
                      title: 'debt'.tr,
                      value: AppFormatters.formatCurrencyShort(0),
                      subtitle: 'no_data_yet'.tr,
                      icon: Icons.receipt_long_rounded,
                      color: AppColors.danger,
                      onTap: () {
                        ref.read(currentScreenIndexProvider.notifier).state = 4;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeader(title: 'latest_employees'.tr),
                      const SizedBox(height: 12),
                      if (employees.isEmpty)
                        EmptyState(
                          icon: Icons.people_outline,
                          title: 'no_employees'.tr,
                          subtitle: 'add_employees_to_manage'.tr,
                        )
                      else
                        ...employees.take(5).map((emp) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor: AppColors.primary.withValues(alpha: 0.15),
                                    child: Text(
                                      ((emp['fullName'] as String?) ?? '?')[0].toUpperCase(),
                                      style: const TextStyle(
                                          color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 13),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          (emp['fullName'] as String?) ?? '',
                                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                                        ),
                                        Text(
                                          '${(emp['employeeCode'] as String?) ?? ''} - ${(emp['position'] as String?) ?? ''}',
                                          style: const TextStyle(color: AppColors.textMuted, fontSize: 11),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
