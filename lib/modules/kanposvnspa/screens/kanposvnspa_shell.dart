import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_management_screen.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../providers/spa_providers.dart';
import '../providers/spa_crm_inventory_providers.dart';
import '../services/spa_seed_data.dart';
import 'spa_dashboard_screen.dart';
import 'spa_beds_screen.dart';
import 'spa_customers_screen.dart';
import 'spa_inventory_screen.dart';
import 'spa_sales_report_screen.dart';
import 'spa_sync_screen.dart';

class KanPosVNSpaShell extends ConsumerStatefulWidget {
  const KanPosVNSpaShell({super.key});

  @override
  ConsumerState<KanPosVNSpaShell> createState() => _KanPosVNSpaShellState();
}

class _KanPosVNSpaShellState extends ConsumerState<KanPosVNSpaShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final isarService = ref.read(spaIsarServiceProvider);
    await SpaSeedData.seedIfEmpty(isarService);
    ref.read(spaBedsProvider.notifier).loadBeds();
    ref.read(spaServicesProvider.notifier).loadServices();
    ref.read(spaTechsProvider.notifier).loadTechs();
    ref.read(spaSessionsProvider.notifier).loadSessions();
    ref.read(spaDashboardProvider.notifier).loadDashboard();
    // Load Phase 2 providers
    ref.read(spaCustomersProvider.notifier).loadCustomers();
    ref.read(spaProductsProvider.notifier).loadProducts();
    ref.read(spaInventoryProvider.notifier).loadTransactions();
    
    setState(() {
      _isInit = true;
    });
  }

  static final Map<String, Set<String>> _roleTabs = {
    EmployeeRoles.cashier: const {'beds', 'customers'},
    EmployeeRoles.sale: const {'beds', 'customers'},
    EmployeeRoles.warehouse: const {'inventory'},
    EmployeeRoles.accountant: const {'dashboard', 'report'},
  };

  static final List<({String id, Widget screen, IconData icon, String label})>
      _allTabs = [
    (id: 'beds', screen: const SpaBedsScreen(), icon: Icons.grid_view, label: 'Sơ đồ Giường'),
    (id: 'dashboard', screen: const SpaDashboardScreen(), icon: Icons.dashboard, label: 'Dashboard'),
    (id: 'customers', screen: const SpaCustomersScreen(), icon: Icons.people, label: 'Khách Hàng'),
    (id: 'inventory', screen: const SpaInventoryScreen(), icon: Icons.local_pharmacy, label: 'Kho Dược Liệu'),
    (id: 'sync', screen: const SpaSyncScreen(), icon: Icons.sync, label: 'Đồng Bộ'),
    (id: 'report', screen: const SpaSalesReportScreen(), icon: Icons.bar_chart, label: 'Báo Cáo'),
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
      appBar: AppBar(
        title: const Text('Quản lý Spa'),
        actions: [
          const AccountSwitcherButton(),
        ],
      ),
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
