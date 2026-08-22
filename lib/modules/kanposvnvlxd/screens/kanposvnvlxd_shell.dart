import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../providers/vlxd_providers.dart';
import '../services/vlxd_seed_data.dart';
import 'vlxd_pos_screen.dart';
import 'vlxd_materials_screen.dart';
import 'vlxd_material_categories_screen.dart';
import 'vlxd_inventory_screen.dart';
import 'vlxd_contracts_screen.dart';
import 'vlxd_finance_screen.dart';
import 'vlxd_dashboard_screen.dart';
import 'vlxd_sales_report_screen.dart';
import 'vlxd_reports_screen.dart';
import 'vlxd_settings_screen.dart';

class KanPosVNVlxdShell extends ConsumerStatefulWidget {
  const KanPosVNVlxdShell({super.key});

  @override
  ConsumerState<KanPosVNVlxdShell> createState() => _KanPosVNVlxdShellState();
}

class _KanPosVNVlxdShellState extends ConsumerState<KanPosVNVlxdShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final isarService = ref.read(vlxdIsarServiceProvider);
    await VlxdSeedData.seedIfEmpty(isarService);
    ref.read(vlxdProductsProvider.notifier).loadProducts();
    setState(() {
      _isInit = true;
    });
  }

  static final Map<String, Set<String>> _roleTabs = {
    EmployeeRoles.cashier: const {'pos', 'finance', 'report', 'reports'},
    EmployeeRoles.sale: const {'pos', 'contracts', 'finance', 'report', 'reports', 'materials'},
    EmployeeRoles.warehouse: const {'inventory', 'materials', 'material_categories', 'pos'},
    EmployeeRoles.accountant: const {'dashboard', 'finance', 'contracts', 'report', 'reports', 'materials', 'material_categories', 'settings'},
  };

  /// Định nghĩa các tab của module (id, icon, label) — thứ tự hiển thị.
  /// Quản Lý NV đã chuyển vào trong tab Cài Đặt.
  static final Map<String, ({IconData icon, String label})> _tabDefs = {
    'dashboard': (icon: Icons.dashboard, label: 'Dashboard'),
    'pos': (icon: Icons.point_of_sale, label: 'Bán Lẻ'),
    'contracts': (icon: Icons.assignment, label: 'Hợp Đồng Sỉ'),
    'material_categories': (icon: Icons.category, label: 'Nhóm VT'),
    'materials': (icon: Icons.widgets, label: 'Vật tư'),
    'inventory': (icon: Icons.inventory, label: 'Kho Hàng'),
    'finance': (icon: Icons.account_balance_wallet, label: 'Thu Chi & Nợ'),
    'report': (icon: Icons.bar_chart, label: 'Báo Cáo'),
    'reports': (icon: Icons.folder_shared, label: 'Báo Cáo Chung'),
    'settings': (icon: Icons.settings, label: 'Cài Đặt'),
  };

  static final Map<String, Widget Function()> _tabScreens = {
    'dashboard': () => const VlxdDashboardScreen(),
    'pos': () => const VlxdPosScreen(),
    'contracts': () => const VlxdContractsScreen(),
    'material_categories': () => const VlxdMaterialCategoriesScreen(),
    'materials': () => const VlxdMaterialsScreen(),
    'inventory': () => const VlxdInventoryScreen(),
    'finance': () => const VlxdFinanceScreen(),
    'report': () => const VlxdSalesReportScreen(),
    'reports': () => const VlxdReportsScreen(),
    'settings': () => const VlxdSettingsScreen(),
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
    final safeIndex = _selectedIndex < tabs.length ? _selectedIndex : 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: auth.currentModule?.color ?? const Color(0xFF6366F1),
        foregroundColor: Colors.white,
        title: const Text('KanPosVN - Vật Liệu Xây Dựng',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        actions: const [
          AccountSwitcherButton(foregroundColor: Colors.white),
        ],
      ),
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              selectedIndex: safeIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              scrollable: true,
              destinations: [
                for (final t in tabs)
                  NavigationRailDestination(
                    icon: Icon(t.icon),
                    label: Text(t.label),
                  ),
              ],
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
