import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/l10n/translations.dart';
import '../../../core/widgets/app_shell.dart';
import 'nhansu_dashboard.dart';
import 'nhansu_employee_screen.dart';
import 'nhansu_attendance_screen.dart';
import 'nhansu_payroll_screen.dart';
import 'nhansu_reports_screen.dart';

class NhanSuShell extends ConsumerWidget {
  const NhanSuShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navItems = [
      NavItem(icon: Icons.dashboard_rounded, label: 'dashboard'.tr),
      NavItem(icon: Icons.people_rounded, label: 'employees'.tr),
      NavItem(icon: Icons.calendar_month_rounded, label: 'attendance'.tr),
      NavItem(icon: Icons.payments_rounded, label: 'payroll'.tr),
      NavItem(icon: Icons.assessment_rounded, label: 'reports'.tr),
    ];

    final screens = [
      const NhanSuDashboard(),
      const NhanSuEmployeeScreen(),
      const NhanSuAttendanceScreen(),
      const NhanSuPayrollScreen(),
      const NhanSuReportsScreen(),
    ];

    return AppShell(
      navItems: navItems,
      child: IndexedStack(
        index: ref.watch(currentScreenIndexProvider),
        children: screens,
      ),
    );
  }
}
