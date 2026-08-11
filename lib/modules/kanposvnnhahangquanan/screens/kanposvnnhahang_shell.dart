import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_management_screen.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../../../core/router/module_selector_screen.dart';
import '../providers/restaurant_providers.dart';
import '../providers/restaurant_inventory_providers.dart';
import '../services/restaurant_seed_data.dart';
import 'restaurant_dashboard_screen.dart';
import 'restaurant_tables_screen.dart';
import 'restaurant_kitchen_screen.dart';
import 'restaurant_inventory_screen.dart';
import 'bill_search_screen.dart';
import 'sales_report_screen.dart';
import 'restaurant_reports_screen.dart';

class KanPosVNRestaurantShell extends ConsumerStatefulWidget {
  const KanPosVNRestaurantShell({super.key});

  @override
  ConsumerState<KanPosVNRestaurantShell> createState() => _KanPosVNRestaurantShellState();
}

class _KanPosVNRestaurantShellState extends ConsumerState<KanPosVNRestaurantShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final isarService = ref.read(restaurantIsarServiceProvider);
    await RestaurantSeedData.seedIfEmpty(isarService);
    ref.read(restaurantTablesProvider.notifier).loadTables();
    ref.read(restaurantMenuProvider.notifier).loadMenu();
    ref.read(restaurantOrdersProvider.notifier).loadOrders();
    ref.read(restaurantDashboardProvider.notifier).loadDashboard();
    
    // Phase 2
    ref.read(restaurantIngredientsProvider.notifier).loadIngredients();
    ref.read(restaurantInventoryTxProvider.notifier).loadTransactions();

    setState(() {
      _isInit = true;
    });
  }

  static final Map<String, Set<String>> _roleTabs = {
    EmployeeRoles.cashier: const {'tables', 'kitchen', 'search'},
    EmployeeRoles.sale: const {'tables', 'kitchen'},
    EmployeeRoles.warehouse: const {'inventory'},
    EmployeeRoles.accountant: const {'dashboard', 'search', 'report', 'report_common'},
  };

  static final List<({String id, Widget screen, IconData icon, String label})>
      _allTabs = [
    (id: 'tables', screen: const RestaurantTablesScreen(), icon: Icons.grid_view, label: 'Sơ đồ Bàn'),
    (id: 'kitchen', screen: const RestaurantKitchenScreen(), icon: Icons.kitchen, label: 'Bếp'),
    (id: 'inventory', screen: const RestaurantInventoryScreen(), icon: Icons.inventory, label: 'Kho Hàng'),
    (id: 'dashboard', screen: const RestaurantDashboardScreen(), icon: Icons.dashboard, label: 'Dashboard'),
    (id: 'search', screen: const BillSearchScreen(), icon: Icons.receipt_long, label: 'Tìm Bill'),
    (id: 'report', screen: const SalesReportScreen(), icon: Icons.bar_chart, label: 'Báo Cáo'),
    (id: 'report_common', screen: const RestaurantReportsScreen(), icon: Icons.description, label: 'Báo Cáo Chung'),
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
        title: const Text('Quản lý Nhà hàng Quán ăn'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Thoát',
            onPressed: () async {
              await ref.read(authServiceProvider).signOut();
              ref.read(selectedModuleProvider.notifier).state = null;
            },
          ),
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
          Expanded(child: tabs[safeIndex].screen),
        ],
      ),
    );
  }
}
