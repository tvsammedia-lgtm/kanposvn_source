import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../providers/barber_service_provider.dart';
import '../services/barber_seed_data.dart';
import 'dashboard_screen.dart';
import 'pos_screen.dart';
import 'booking_calendar_screen.dart';
import 'appointment_list_screen.dart';
import 'customer_list_screen.dart';
import 'ai_advisor_screen.dart';
import 'inventory_screen.dart';
import 'report_screen.dart';
import 'barber_settings_screen.dart';

class KanPosVnBarberShell extends ConsumerStatefulWidget {
  const KanPosVnBarberShell({super.key});

  @override
  ConsumerState<KanPosVnBarberShell> createState() =>
      _KanPosVnBarberShellState();
}

class _KanPosVnBarberShellState extends ConsumerState<KanPosVnBarberShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final isar = await ref.read(barberIsarProvider.future);
    await BarberSeedData.seedIfEmpty(isar);
    setState(() {
      _isInit = true;
    });
  }

  static final Map<String, Set<String>> _roleTabs = {
    EmployeeRoles.cashier: const {'pos', 'appointments', 'booking_calendar', 'customers', 'reports'},
    EmployeeRoles.sale: const {'dashboard', 'pos', 'booking_calendar', 'appointments', 'customers', 'ai_advisor', 'reports'},
    EmployeeRoles.warehouse: const {'inventory', 'pos'},
    EmployeeRoles.accountant: const {'dashboard', 'pos', 'booking_calendar', 'appointments', 'customers', 'inventory', 'reports', 'settings'},
  };

  static final Map<String, ({IconData icon, String label})> _tabDefs = {
    'dashboard': (icon: Icons.dashboard, label: 'Dashboard'),
    'pos': (icon: Icons.point_of_sale, label: 'Bán Hàng'),
    'booking_calendar': (icon: Icons.edit_calendar, label: 'Xếp Lịch'),
    'appointments': (icon: Icons.calendar_today, label: 'Lịch Hẹn'),
    'customers': (icon: Icons.people, label: 'Khách Hàng'),
    'ai_advisor': (icon: Icons.face, label: 'AI Tư Vấn'),
    'inventory': (icon: Icons.inventory, label: 'Kho Hàng'),
    'reports': (icon: Icons.bar_chart, label: 'Báo Cáo'),
    'settings': (icon: Icons.settings, label: 'Cài Đặt'),
  };

  static final Map<String, Widget Function()> _tabScreens = {
    'dashboard': () => const DashboardScreen(),
    'pos': () => const PosScreen(),
    'booking_calendar': () => const BookingCalendarScreen(),
    'appointments': () => const AppointmentListScreen(),
    'customers': () => const CustomerListScreen(),
    'ai_advisor': () => const AiAdvisorScreen(),
    'inventory': () => const InventoryScreen(),
    'reports': () => const ReportScreen(),
    'settings': () => const BarberSettingsScreen(),
  };

  static final List<({String id, Widget screen, IconData icon, String label})>
      _allTabs = [
    for (final e in _tabDefs.entries)
      (
        id: e.key,
        screen: _tabScreens[e.key]!(),
        icon: e.value.icon,
        label: e.value.label,
      ),
  ];

  @override
  Widget build(BuildContext context) {
    if (!_isInit) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final auth = ref.watch(authServiceProvider);
    final customTabs = auth.employeeAllowedTabs;
    final tabs = _allTabs.where((t) {
      if (auth.isManager) return true;
      if (customTabs != null) return customTabs.contains(t.id);
      return EmployeeRolePolicy.isAllowed(
        isManager: false,
        role: auth.employeeRole,
        tabId: t.id,
        roleTabs: _roleTabs,
      );
    }).toList();
    final safeIndex = _selectedIndex < tabs.length ? _selectedIndex : 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: auth.currentModule?.color ?? const Color(0xFF475569),
        foregroundColor: Colors.white,
        title: const Text('KanPosVN - Barber Shop',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        actions: const [
          AccountSwitcherButton(foregroundColor: Colors.white),
        ],
      ),
      body: Row(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: NavigationRail(
                selectedIndex: safeIndex,
                onDestinationSelected: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                labelType: NavigationRailLabelType.all,
                destinations: [
                  for (final t in tabs)
                    NavigationRailDestination(
                      icon: Icon(t.icon),
                      label: Text(t.label),
                    ),
                ],
              ),
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: tabs[safeIndex].screen,
          ),
        ],
      ),
    );
  }
}
