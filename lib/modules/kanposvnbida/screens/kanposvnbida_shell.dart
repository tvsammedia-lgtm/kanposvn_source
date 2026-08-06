import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_management_screen.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../providers/bida_providers.dart';
import '../services/bida_seed_data.dart';
import 'bida_dashboard_screen.dart';
import 'bida_tables_screen.dart';

import 'bida_inventory_screen.dart';

class KanPosVNBidaShell extends ConsumerStatefulWidget {
  const KanPosVNBidaShell({super.key});

  @override
  ConsumerState<KanPosVNBidaShell> createState() => _KanPosVNBidaShellState();
}

class _KanPosVNBidaShellState extends ConsumerState<KanPosVNBidaShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final isarService = ref.read(bidaIsarServiceProvider);
    await BidaSeedData.seedIfEmpty(isarService);
    ref.read(bidaTablesProvider.notifier).loadTables();
    ref.read(bidaItemsProvider.notifier).loadItems();
    ref.read(bidaSessionsProvider.notifier).loadSessions();
    ref.read(bidaDashboardProvider.notifier).loadDashboard();
    setState(() {
      _isInit = true;
    });
  }

  static final Map<String, Set<String>> _roleTabs = {
    EmployeeRoles.cashier: const {'tables'},
    EmployeeRoles.sale: const {'tables'},
    EmployeeRoles.warehouse: const {'inventory'},
    EmployeeRoles.accountant: const {'dashboard'},
  };

  static final List<({String id, Widget screen, IconData icon, String label})>
      _allTabs = [
    (id: 'tables', screen: const BidaTablesScreen(), icon: Icons.grid_view, label: 'Sơ đồ Bàn'),
    (id: 'dashboard', screen: const BidaDashboardScreen(), icon: Icons.dashboard, label: 'Dashboard'),
    (id: 'inventory', screen: const BidaInventoryScreen(), icon: Icons.inventory, label: 'Kho Hàng'),
    (id: 'employees', screen: const EmployeeManagementScreen(), icon: Icons.badge, label: 'Quản Lý NV'),
  ];

  @override
  Widget build(BuildContext context) {
    if (!_isInit) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final auth = ref.watch(authServiceProvider);
    final tabs = _allTabs
        .where((t) => EmployeeRolePolicy.isAllowed(
              isManager: auth.isManager,
              role: auth.employeeRole,
              tabId: t.id,
              roleTabs: _roleTabs,
            ))
        .toList();
    final safeIndex = _selectedIndex < tabs.length ? _selectedIndex : 0;

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
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
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: tabs[safeIndex].screen,
          ),
        ],
      ),
    );
  }
}
