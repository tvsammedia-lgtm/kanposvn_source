import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../providers/gara_providers.dart';
import '../services/gara_seed_data.dart';
import 'gara_reception_screen.dart';
import 'gara_work_order_screen.dart';
import 'gara_inventory_screen.dart';
import 'gara_finance_screen.dart';
import 'gara_dashboard_screen.dart';
import 'gara_ticket_search_screen.dart';
import 'gara_reports_screen.dart';
import 'gara_settings_screen.dart';

class KanPosVNGaraShell extends ConsumerStatefulWidget {
  const KanPosVNGaraShell({super.key});

  @override
  ConsumerState<KanPosVNGaraShell> createState() => _KanPosVNGaraShellState();
}

class _KanPosVNGaraShellState extends ConsumerState<KanPosVNGaraShell> {
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final isarService = ref.read(garaIsarServiceProvider);
    await GaraSeedData.seedIfEmpty(isarService);
    ref.read(garaProductsProvider.notifier).loadProducts();
    setState(() {
      _isInit = true;
    });
  }

  static final Map<String, Set<String>> _roleTabs = {
    EmployeeRoles.cashier: const {'reception', 'finance', 'search'},
    EmployeeRoles.sale: const {'reception', 'workorder', 'search'},
    EmployeeRoles.warehouse: const {'inventory', 'workorder'},
    EmployeeRoles.accountant: const {'dashboard', 'finance', 'report', 'settings'},
  };

  /// Định nghĩa các tab của module (id, icon, label) — thứ tự hiển thị.
  /// Đồng bộ / Quản Lý NV đã chuyển vào trong tab Cài Đặt.
  static final Map<String, ({IconData icon, String label})> _tabDefs = {
    'dashboard': (icon: Icons.dashboard, label: 'Dashboard'),
    'reception': (icon: Icons.car_rental, label: 'Tiếp Nhận'),
    'workorder': (icon: Icons.build, label: 'Lệnh Sửa Chữa'),
    'inventory': (icon: Icons.inventory, label: 'Kho / Phụ Tùng'),
    'finance': (icon: Icons.account_balance_wallet, label: 'Thu Chi'),
    'search': (icon: Icons.receipt_long, label: 'Tra Cứu Phiếu'),
    'report': (icon: Icons.bar_chart, label: 'Báo Cáo'),
    'settings': (icon: Icons.settings, label: 'Cài Đặt'),
  };

  static final Map<String, Widget Function()> _tabScreens = {
    'dashboard': () => const GaraDashboardScreen(),
    'reception': () => const GaraReceptionScreen(),
    'workorder': () => const GaraWorkOrderScreen(),
    'inventory': () => const GaraInventoryScreen(),
    'finance': () => const GaraFinanceScreen(),
    'search': () => const GaraTicketSearchScreen(),
    'report': () => const GaraReportsScreen(),
    'settings': () => const GaraSettingsScreen(),
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

    final selectedIndex = ref.watch(garaTabIndexProvider);
    final auth = ref.watch(authServiceProvider);
    final customTabs = auth.employeeAllowedTabs;
    final tabs = _allTabs.where((t) {
      if (auth.isManager) return true;
      // Tùy chỉnh tab riêng cho nhân viên (Owner check/uncheck trong "Quản Lý NV").
      if (customTabs != null) return customTabs.contains(t.id);
      return EmployeeRolePolicy.isAllowed(
        isManager: false,
        role: auth.employeeRole,
        tabId: t.id,
        roleTabs: _roleTabs,
      );
    }).toList();
    final safeIndex = selectedIndex < tabs.length ? selectedIndex : 0;
    final isDesktop = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: auth.currentModule?.color ?? const Color(0xFF0D9488),
        foregroundColor: Colors.white,
        title: const Text('KanPosVN - Gara Ô Tô',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        actions: const [
          AccountSwitcherButton(foregroundColor: Colors.white),
        ],
      ),
      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              scrollable: true,
              selectedIndex: safeIndex,
              onDestinationSelected: (index) {
                ref.read(garaTabIndexProvider.notifier).state = index;
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
          if (isDesktop) const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: ClipRect(child: tabs[safeIndex].screen),
          ),
        ],
      ),
      bottomNavigationBar: isDesktop
          ? null
          : BottomNavigationBar(
              currentIndex: safeIndex,
              onTap: (index) {
                ref.read(garaTabIndexProvider.notifier).state = index;
              },
              selectedItemColor: const Color(0xFF0D9488),
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: [
                for (final t in tabs)
                  BottomNavigationBarItem(
                    icon: Icon(t.icon),
                    label: t.label,
                  ),
              ],
            ),
    );
  }
}
