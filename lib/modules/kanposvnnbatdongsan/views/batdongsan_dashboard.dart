import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_management_screen.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/widgets/account_switcher_button.dart';

import '../../../core/providers.dart';
import '../providers/batdongsan_providers.dart';
import '../services/batdongsan_seed_data.dart';
import 'property_list_screen.dart';
import 'batdongsan_sales_report_screen.dart';
import 'batdongsan_settings_screen.dart';

class BatDongSanDashboard extends ConsumerStatefulWidget {
  const BatDongSanDashboard({super.key});

  @override
  ConsumerState<BatDongSanDashboard> createState() => _BatDongSanDashboardState();
}

class _BatDongSanDashboardState extends ConsumerState<BatDongSanDashboard> {
  int _selectedIndex = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    await BatDongSanSeedData.seedIfEmpty();
    ref.invalidate(propertiesProvider);
    ref.invalidate(transactionsProvider);
    ref.invalidate(customersProvider);
    ref.invalidate(buyersProvider);
    ref.invalidate(sellersProvider);
    ref.invalidate(brokersProvider);
    if (mounted) {
      setState(() {
        _isInit = true;
      });
    }
  }

  static final Map<String, Set<String>> _roleTabs = {
    EmployeeRoles.cashier: const {'pos', 'finance', 'report', 'reports'},
    EmployeeRoles.sale: const {'pos', 'contracts', 'finance', 'report', 'reports', 'materials'},
    EmployeeRoles.warehouse: const {'inventory', 'materials', 'material_categories', 'pos'},
    EmployeeRoles.accountant: const {'dashboard', 'finance', 'contracts', 'report', 'reports', 'materials', 'material_categories', 'settings'},
  };

  static final Map<String, ({IconData icon, String label})> _tabDefs = {
    'dashboard': (icon: Icons.dashboard, label: 'Dashboard'),
    'pos': (icon: Icons.point_of_sale, label: 'Bán Lẻ'),
    'contracts': (icon: Icons.assignment, label: 'Hợp Đồng'),
    'material_categories': (icon: Icons.category, label: 'Nhóm VT'),
    'materials': (icon: Icons.widgets, label: 'Vật tư'),
    'inventory': (icon: Icons.inventory, label: 'Kho Hàng'),
    'finance': (icon: Icons.account_balance_wallet, label: 'Thu Chi'),
    'report': (icon: Icons.bar_chart, label: 'Báo Cáo'),
    'reports': (icon: Icons.folder_shared, label: 'Báo Cáo Chung'),
    'employees': (icon: Icons.badge, label: 'Quản Lý NV'),
    'settings': (icon: Icons.settings, label: 'Cài Đặt'),
  };

  static final Map<String, Widget Function()> _tabScreens = {
    'dashboard': () => const PropertyListScreen(),
    'pos': () => const PropertyListScreen(),
    'contracts': () => const PropertyListScreen(),
    'material_categories': () => const PropertyListScreen(),
    'materials': () => const PropertyListScreen(),
    'inventory': () => const PropertyListScreen(),
    'finance': () => const PropertyListScreen(),
    'report': () => const BatDongSanSalesReportScreen(),
    'reports': () => const BatDongSanSalesReportScreen(),
    'employees': () => const EmployeeManagementScreen(),
    'settings': () => const BatDongSanSettingsScreen(),
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
        title: const Text('Quản lý Bất động sản'),
        actions: const [
          AccountSwitcherButton(),
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: safeIndex,
            onDestinationSelected: (index) => setState(() => _selectedIndex = index),
            labelType: NavigationRailLabelType.all,
            scrollable: true,
            selectedIconTheme: const IconThemeData(color: Color(0xFF0284C7)),
            selectedLabelTextStyle: const TextStyle(color: Color(0xFF0284C7), fontWeight: FontWeight.bold),
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