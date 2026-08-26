import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../providers/bida_providers.dart';
import '../providers/bida_partner_providers.dart';
import '../services/bida_seed_data.dart';
import 'bida_dashboard_screen.dart';
import 'bida_tables_screen.dart';
import 'bida_inventory_screen.dart';
import 'bida_settings_screen.dart';
import 'bida_dat_ban_screen.dart';
import 'bida_active_sessions_screen.dart';
import 'bida_customer_screen.dart';
import 'bida_finance_screen.dart';
import 'bida_crystal_reports_screen.dart';
import 'bida_bill_search_screen.dart';

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
    ref.read(bidaCustomersProvider.notifier).loadCustomers();
    ref.read(bidaReservationsProvider.notifier).loadReservations();
    ref.read(bidaFinanceProvider.notifier).loadTransactions();
    setState(() {
      _isInit = true;
    });
  }

  static final Map<String, Set<String>> _roleTabs = {
    EmployeeRoles.cashier: const {'tables', 'sessions', 'bills'},
    EmployeeRoles.sale: const {'tables', 'sessions', 'customers'},
    EmployeeRoles.warehouse: const {'inventory'},
    EmployeeRoles.accountant: const {'dashboard', 'finance', 'reports', 'settings', 'bills'},
  };

  /// Định nghĩa các tab của module (id, icon, label) — thứ tự hiển thị.
  static final Map<String, ({IconData icon, String label})> _tabDefs = {
    'tables': (icon: Icons.grid_view, label: 'Sơ đồ Bàn'),
    'sessions': (icon: Icons.sports_bar, label: 'Đang Chơi'),
    'datban': (icon: Icons.book_online, label: 'Đặt Bàn'),
    'customers': (icon: Icons.people, label: 'Khách hàng'),
    'dashboard': (icon: Icons.dashboard, label: 'Dashboard'),
    'finance': (icon: Icons.account_balance, label: 'Thu Chi'),
    'reports': (icon: Icons.description, label: 'Báo cáo'),
    'bills': (icon: Icons.receipt_long, label: 'Tìm hóa đơn'),
    'inventory': (icon: Icons.inventory, label: 'Kho Hàng'),
    'settings': (icon: Icons.settings, label: 'Cài Đặt'),
  };

  static final Map<String, Widget Function()> _tabScreens = {
    'tables': () => const BidaTablesScreen(),
    'sessions': () => const BidaActiveSessionsScreen(),
    'datban': () => const BidaDatBanScreen(),
    'customers': () => const BidaCustomerScreen(),
    'dashboard': () => const BidaDashboardScreen(),
    'finance': () => const BidaFinanceScreen(),
    'reports': () => const BidaCrystalReportsScreen(),
    'bills': () => const BidaBillSearchScreen(),
    'inventory': () => const BidaInventoryScreen(),
    'settings': () => const BidaSettingsScreen(),
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
        backgroundColor: auth.currentModule?.color ?? const Color(0xFF059669),
        foregroundColor: Colors.white,
        title: const Text('KanPosVN - Quản Lý Bida',
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
              selectedItemColor: auth.currentModule?.color ?? const Color(0xFF059669),
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
