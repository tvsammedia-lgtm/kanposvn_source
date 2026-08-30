import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../providers/tt_providers.dart';
import '../services/tt_seed_data.dart';
import 'tt_dashboard_screen.dart';
import 'tt_pos_screen.dart';
import 'tt_purchase_screen.dart';
import 'tt_inventory_screen.dart';
import 'tt_customers_screen.dart';
import 'tt_suppliers_screen.dart';
import 'tt_finance_screen.dart';
import 'tt_loyalty_screen.dart';
import 'tt_reports_screen.dart';
import 'tt_settings_screen.dart';

class KanPosVNTruyenthongShell extends ConsumerStatefulWidget {
  const KanPosVNTruyenthongShell({super.key});

  @override
  ConsumerState<KanPosVNTruyenthongShell> createState() => _KanPosVNTruyenthongShellState();
}

class _KanPosVNTruyenthongShellState extends ConsumerState<KanPosVNTruyenthongShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    try {
      final isarService = ref.read(ttIsarServiceProvider);
      await TtSeedData.seedIfEmpty(isarService);
      ref.read(ttProductsProvider.notifier).loadProducts();
    } catch (_) {
      // DB schema mismatch hoặc lỗi khác → vẫn cho vào shell (tab sẽ báo lỗi nếu cần)
    }
    if (mounted) {
      setState(() {
        _isInit = true;
      });
    }
  }

  static final Map<String, Set<String>> _roleTabs = {
    EmployeeRoles.cashier: const {'pos', 'reports'},
    EmployeeRoles.sale: const {'pos', 'customers', 'reports'},
    EmployeeRoles.warehouse: const {'inventory', 'purchase', 'pos'},
    EmployeeRoles.accountant: const {'dashboard', 'purchase', 'finance', 'reports', 'customers', 'suppliers', 'loyalty', 'settings'},
  };

  /// Định nghĩa các tab của module (id, icon, label) — thứ tự hiển thị.
  static final Map<String, ({IconData icon, String label})> _tabDefs = {
    'dashboard': (icon: Icons.dashboard, label: 'Dashboard'),
    'pos': (icon: Icons.point_of_sale, label: 'Bán Hàng'),
    'purchase': (icon: Icons.add_business, label: 'Nhập Hàng'),
    'inventory': (icon: Icons.inventory, label: 'Kho Hàng'),
    'customers': (icon: Icons.people, label: 'Khách Hàng'),
    'suppliers': (icon: Icons.local_shipping, label: 'Nhà Cung Cấp'),
    'finance': (icon: Icons.account_balance_wallet, label: 'Thu Chi'),
    'loyalty': (icon: Icons.stars, label: 'Điểm Thưởng'),
    'reports': (icon: Icons.bar_chart, label: 'Báo Cáo'),
    'settings': (icon: Icons.settings, label: 'Cài Đặt'),
  };

  static final Map<String, Widget Function()> _tabScreens = {
    'dashboard': () => const TtDashboardScreen(),
    'pos': () => const TtPosScreen(),
    'purchase': () => const TtPurchaseScreen(),
    'inventory': () => const TtInventoryScreen(),
    'customers': () => const TtCustomersScreen(),
    'suppliers': () => const TtSuppliersScreen(),
    'finance': () => const TtFinanceScreen(),
    'loyalty': () => const TtLoyaltyScreen(),
    'reports': () => const TtReportsScreen(),
    'settings': () => const TtSettingsScreen(),
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
    final safeIndex = tabs.isNotEmpty ? (_selectedIndex < tabs.length ? _selectedIndex : 0) : 0;
    final isDesktop = MediaQuery.of(context).size.width > 600;

    if (tabs.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: auth.currentModule?.color ?? const Color(0xFF16A34A),
          foregroundColor: Colors.white,
          title: const Text('KanPosVN - Sạp Rau Củ Quả',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        body: const Center(child: Text('Không có quyền truy cập tab nào.\nLiên hệ quản trị viên để được cấp quyền.', textAlign: TextAlign.center)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: auth.currentModule?.color ?? const Color(0xFF16A34A),
        foregroundColor: Colors.white,
        title: const Text('KanPosVN - Sạp Rau Củ Quả',
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
              selectedItemColor: const Color(0xFF16A34A),
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