import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../providers/isar_provider.dart';
import '../providers/pawn_provider.dart';
import '../providers/customer_provider.dart';
import '../providers/product_provider.dart';
import '../services/pawn_seed_data.dart';
import 'pawn/pawn_list_screen.dart';
import 'customer/customer_list_screen.dart';
import 'pawn_finance_screen.dart';
import 'pawn_settings_screen.dart';
import 'pawn_dashboard_screen.dart';

class KanPosVnPawnShell extends ConsumerStatefulWidget {
  const KanPosVnPawnShell({super.key});

  @override
  ConsumerState<KanPosVnPawnShell> createState() => _KanPosVnPawnShellState();
}

class _KanPosVnPawnShellState extends ConsumerState<KanPosVnPawnShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final isarService = ref.read(pawnIsarServiceProvider);
    await PawnSeedData.seedIfEmpty(isarService);
    ref.read(pawnProvider.notifier).loadContracts();
    ref.read(customerProvider.notifier).loadCustomers();
    ref.read(productProvider.notifier).loadProducts();
    setState(() {
      _isInit = true;
    });
  }

  static final Map<String, Set<String>> _roleTabs = {
    EmployeeRoles.cashier: const {'dashboard', 'pawn', 'customer', 'finance'},
    EmployeeRoles.sale: const {'dashboard', 'pawn', 'customer'},
    EmployeeRoles.warehouse: const {'customer'},
    EmployeeRoles.accountant: const {'dashboard', 'pawn', 'customer', 'finance', 'settings'},
  };

  static final Map<String, ({IconData icon, String label})> _tabDefs = {
    'dashboard': (icon: Icons.dashboard, label: 'Dashboard'),
    'pawn': (icon: Icons.monetization_on, label: 'Hợp Đồng'),
    'customer': (icon: Icons.people, label: 'Khách Hàng'),
    'finance': (icon: Icons.account_balance_wallet, label: 'Thu Chi'),
    'settings': (icon: Icons.settings, label: 'Cài Đặt'),
  };

  static final Map<String, Widget Function()> _tabScreens = {
    'dashboard': () => const PawnDashboardScreen(),
    'pawn': () => const PawnListScreen(),
    'customer': () => const CustomerListScreen(),
    'finance': () => const PawnFinanceScreen(),
    'settings': () => const PawnSettingsScreen(),
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
    final isDesktop = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: auth.currentModule?.color ?? const Color(0xFFB45309),
        foregroundColor: Colors.white,
        title: const Text('KanPosVN - Cầm Đồ',
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
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectedItemColor: const Color(0xFFB45309),
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
