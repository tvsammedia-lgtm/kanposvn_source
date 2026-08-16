import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/auth/login_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/employees/employee_list_screen.dart';
import '../screens/employees/employee_form_screen.dart';
import '../screens/drivers/driver_list_screen.dart';
import '../screens/drivers/driver_form_screen.dart';
import '../screens/vehicles/vehicle_list_screen.dart';
import '../screens/trips/trip_list_screen.dart';
import '../screens/attendance/attendance_screen.dart';
import '../screens/payroll/payroll_screen.dart';
import '../screens/payroll/salary_entry_screen.dart';
import '../screens/payroll/payroll_edit_screen.dart';
import '../screens/kpi/kpi_screen.dart';
import '../screens/reports/reports_screen.dart';
import '../screens/settings/payroll_settings_screen.dart';
import '../screens/shell/app_shell.dart';
import '../services/auth_service.dart';
import '../../../core/auth/employee_management_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/dashboard',
  redirect: (context, state) {
    final isLoggedIn = AuthService.instance.isLoggedIn;
    final isLoginRoute = state.matchedLocation == '/login';

    if (!isLoggedIn && !isLoginRoute) return '/login';
    if (isLoggedIn && isLoginRoute) return '/dashboard';
    return null;
  },
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: '/dashboard',
          pageBuilder: (c, s) =>
              const NoTransitionPage(child: DashboardScreen()),
        ),
        GoRoute(
          path: '/employees',
          pageBuilder: (c, s) =>
              const NoTransitionPage(child: EmployeeListScreen()),
          routes: [
            GoRoute(
              path: 'new',
              builder: (c, s) => const EmployeeFormScreen(),
            ),
            GoRoute(
              path: ':id',
              builder: (c, s) =>
                  EmployeeFormScreen(employeeId: int.tryParse(s.pathParameters['id']!)),
            ),
          ],
        ),
        GoRoute(
          path: '/drivers',
          pageBuilder: (c, s) =>
              const NoTransitionPage(child: DriverListScreen()),
          routes: [
            GoRoute(
              path: 'new',
              builder: (c, s) => const DriverFormScreen(),
            ),
            GoRoute(
              path: ':id',
              builder: (c, s) =>
                  DriverFormScreen(driverId: int.tryParse(s.pathParameters['id']!)),
            ),
          ],
        ),
        GoRoute(
          path: '/vehicles',
          pageBuilder: (c, s) =>
              const NoTransitionPage(child: VehicleListScreen()),
        ),
        GoRoute(
          path: '/trips',
          pageBuilder: (c, s) =>
              const NoTransitionPage(child: TripListScreen()),
        ),
        GoRoute(
          path: '/attendance',
          pageBuilder: (c, s) =>
              const NoTransitionPage(child: AttendanceScreen()),
        ),
        GoRoute(
          path: '/employee-management',
          pageBuilder: (c, s) =>
              const NoTransitionPage(child: EmployeeManagementScreen()),
        ),
        GoRoute(
          path: '/settings',
          pageBuilder: (c, s) =>
              const NoTransitionPage(child: PayrollSettingsScreen()),
        ),
        GoRoute(
          path: '/payroll',
          pageBuilder: (c, s) =>
              const NoTransitionPage(child: PayrollScreen()),
          routes: [
            GoRoute(
              path: 'entry',
              builder: (c, s) => const SalaryEntryScreen(),
            ),
            GoRoute(
              path: 'entry/employee/:id',
              builder: (c, s) => SalaryEntryScreen(
                employeeId: int.tryParse(s.pathParameters['id']!),
              ),
            ),
            GoRoute(
              path: 'entry/driver/:id',
              builder: (c, s) => SalaryEntryScreen(
                driverId: int.tryParse(s.pathParameters['id']!),
              ),
            ),
            GoRoute(
              path: 'edit/:id',
              builder: (c, s) => PayrollEditScreen(
                payrollId: int.tryParse(s.pathParameters['id']!) ?? 0,
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/kpi',
          pageBuilder: (c, s) => const NoTransitionPage(child: KpiScreen()),
        ),
        GoRoute(
          path: '/reports',
          pageBuilder: (c, s) =>
              const NoTransitionPage(child: ReportsScreen()),
        ),

      ],
    ),
  ],
);

// Navigation items definition
class NavItem {
  final String path;
  final IconData icon;
  final IconData activeIcon;
  final String label;

  const NavItem({
    required this.path,
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}

const navItems = [
  NavItem(
    path: '/dashboard',
    icon: Icons.dashboard_outlined,
    activeIcon: Icons.dashboard,
    label: 'Dashboard',
  ),
  NavItem(
    path: '/employees',
    icon: Icons.people_outline,
    activeIcon: Icons.people,
    label: 'Nhân sự',
  ),
  NavItem(
    path: '/drivers',
    icon: Icons.local_shipping_outlined,
    activeIcon: Icons.local_shipping,
    label: 'Tài xế',
  ),
  NavItem(
    path: '/vehicles',
    icon: Icons.directions_car_outlined,
    activeIcon: Icons.directions_car,
    label: 'Xe',
  ),
  NavItem(
    path: '/trips',
    icon: Icons.route_outlined,
    activeIcon: Icons.route,
    label: 'Chuyến xe',
  ),
  NavItem(
    path: '/attendance',
    icon: Icons.calendar_today_outlined,
    activeIcon: Icons.calendar_today,
    label: 'Chấm công',
  ),
  NavItem(
    path: '/payroll',
    icon: Icons.account_balance_wallet_outlined,
    activeIcon: Icons.account_balance_wallet,
    label: 'Tiền lương',
  ),
  NavItem(
    path: '/kpi',
    icon: Icons.trending_up_outlined,
    activeIcon: Icons.trending_up,
    label: 'KPI',
  ),
  NavItem(
    path: '/reports',
    icon: Icons.bar_chart_outlined,
    activeIcon: Icons.bar_chart,
    label: 'Báo cáo',
  ),
  NavItem(
    path: '/settings',
    icon: Icons.settings_outlined,
    activeIcon: Icons.settings,
    label: 'Cài Đặt',
  ),
  NavItem(
    path: '/employees',
    icon: Icons.badge_outlined,
    activeIcon: Icons.badge,
    label: 'Quản Lý NV',
  ),
];
