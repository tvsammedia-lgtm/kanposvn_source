import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../providers/restaurant_providers.dart';
import '../providers/restaurant_inventory_providers.dart';
import '../services/restaurant_seed_data.dart';
import 'restaurant_dashboard_screen.dart';
import 'restaurant_tables_screen.dart';
import 'restaurant_reservations_screen.dart';
import 'restaurant_kitchen_screen.dart';
import 'restaurant_inventory_screen.dart';
import 'restaurant_partners_screen.dart';
import 'restaurant_expenses_screen.dart';
import 'bill_search_screen.dart';
import 'sales_report_screen.dart';
import 'restaurant_reports_screen.dart';
import 'restaurant_settings_screen.dart';

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
    try {
      final isarService = ref.read(restaurantIsarServiceProvider);
      await RestaurantSeedData.seedIfEmpty(isarService);
      ref.read(restaurantTablesProvider.notifier).loadTables();
      ref.read(restaurantMenuProvider.notifier).loadMenu();
      ref.read(restaurantOrdersProvider.notifier).loadOrders();
      ref.read(restaurantDashboardProvider.notifier).loadDashboard();

      // Phase 2
      ref.read(restaurantIngredientsProvider.notifier).loadIngredients();
      ref.read(restaurantInventoryTxProvider.notifier).loadTransactions();

      // Phase 3: đặt bàn, khách hàng, NCC, chi phí, khuyến mãi
      ref.read(restaurantReservationsProvider.notifier).load();
      ref.read(restaurantCustomersProvider.notifier).loadCustomers();
      ref.read(restaurantSuppliersProvider.notifier).loadSuppliers();
      ref.read(restaurantExpensesProvider.notifier).loadExpenses();
      ref.read(restaurantPromotionsProvider.notifier).load();
    } catch (_) {}
    if (mounted) {
      setState(() {
        _isInit = true;
      });
    }
  }

  static final Map<String, Set<String>> _roleTabs = {
    EmployeeRoles.cashier: const {'tables', 'reservations', 'kitchen', 'partners', 'search'},
    EmployeeRoles.sale: const {'tables', 'reservations', 'kitchen'},
    EmployeeRoles.warehouse: const {'inventory', 'partners'},
    EmployeeRoles.accountant: const {
      'dashboard',
      'expenses',
      'partners',
      'search',
      'report',
      'report_common',
      'settings'
    },
  };

  /// Định nghĩa các tab của module (id, icon, label) — thứ tự hiển thị.
  /// Quản Lý NV đã chuyển vào trong tab Cài Đặt.
  static final Map<String, ({IconData icon, String label})> _tabDefs = {
    'tables': (icon: Icons.grid_view, label: 'Sơ đồ Bàn'),
    'reservations': (icon: Icons.event_available, label: 'Đặt Bàn'),
    'kitchen': (icon: Icons.kitchen, label: 'Bếp'),
    'inventory': (icon: Icons.inventory, label: 'Kho Hàng'),
    'dashboard': (icon: Icons.dashboard, label: 'Dashboard'),
    'partners': (icon: Icons.people, label: 'KH & NCC'),
    'expenses': (icon: Icons.money_off, label: 'Chi Phí'),
    'search': (icon: Icons.receipt_long, label: 'Tìm Bill'),
    'report': (icon: Icons.bar_chart, label: 'Báo Cáo'),
    'report_common': (icon: Icons.description, label: 'Báo Cáo Chung'),
    'settings': (icon: Icons.settings, label: 'Cài Đặt'),
  };

  static final Map<String, Widget Function()> _tabScreens = {
    'tables': () => const RestaurantTablesScreen(),
    'reservations': () => const RestaurantReservationsScreen(),
    'kitchen': () => const RestaurantKitchenScreen(),
    'inventory': () => const RestaurantInventoryScreen(),
    'dashboard': () => const RestaurantDashboardScreen(),
    'partners': () => const RestaurantPartnersScreen(),
    'expenses': () => const RestaurantExpensesScreen(),
    'search': () => const BillSearchScreen(),
    'report': () => const SalesReportScreen(),
    'report_common': () => const RestaurantReportsScreen(),
    'settings': () => const RestaurantSettingsScreen(),
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
      // Tùy chỉnh tab riêng cho nhân viên (Owner check/uncheck trong "Quản Lý NV").
      if (customTabs != null) return customTabs.contains(t.id);
      return EmployeeRolePolicy.isAllowed(
        isManager: false,
        role: auth.employeeRole,
        tabId: t.id,
        roleTabs: _roleTabs,
      );
    }).toList();
    final safeIndex = tabs.isNotEmpty ? (_selectedIndex < tabs.length ? _selectedIndex : 0) : 0;
    final isDesktop = MediaQuery.of(context).size.width > 600;

    if (tabs.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Quản lý Nhà hàng Quán ăn'),
        ),
        body: const Center(child: Text('Không có quyền truy cập tab nào.\nLiên hệ quản trị viên để được cấp quyền.', textAlign: TextAlign.center)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Nhà hàng Quán ăn'),
        actions: [
          const AccountSwitcherButton(),
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
          Expanded(child: ClipRect(child: tabs[safeIndex].screen)),
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
              selectedItemColor: const Color(0xFFEF4444),
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
