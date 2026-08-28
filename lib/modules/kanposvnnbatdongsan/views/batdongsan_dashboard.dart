import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../../../core/widgets/owner_info_bar.dart';

import '../../../core/providers.dart';
import '../providers/batdongsan_providers.dart';
import '../services/batdongsan_seed_data.dart';
import 'batdongsan_home_screen.dart';
import 'property_list_screen.dart';
import 'customer_list_screen.dart';
import 'broker_list_screen.dart';
import 'transaction_list_screen.dart';
import 'batdongsan_match_screen.dart';
import 'batdongsan_finance_screen.dart';
import 'bds_reports_screen.dart';
import 'batdongsan_settings_screen.dart';

/// Shell module Bất động sản — tab theo PRD kanbatdongsan.md mục 4.
class BatDongSanDashboard extends ConsumerStatefulWidget {
  const BatDongSanDashboard({super.key});

  @override
  ConsumerState<BatDongSanDashboard> createState() =>
      _BatDongSanDashboardState();
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
    debugPrint('BDS-DEBUG: _initData START');
    try {
      await BatDongSanSeedData.seedIfEmpty();
      debugPrint('BDS-DEBUG: _initData seed done');
      ref.invalidate(bdsBundleProvider);
      ref.invalidate(dashboardMetricsProvider);
      debugPrint('BDS-DEBUG: _initData invalidated');
    } catch (e, st) {
      // Lỗi mở DB/seed: không treo màn hình trắng, vẫn vào shell với dữ liệu rỗng.
      debugPrint('BDS-DEBUG: _initData CATCH e=$e\n$st');
    }
    if (mounted) {
      setState(() {
        _isInit = true;
      });
    }
    debugPrint('BDS-DEBUG: _initData END');
  }

  static final Map<String, Set<String>> _roleTabs = {
    EmployeeRoles.cashier: const {'home', 'transactions', 'finance', 'report'},
    EmployeeRoles.sale: const {
      'home',
      'properties',
      'customers',
      'brokers',
      'transactions',
      'match',
      'report',
    },
    EmployeeRoles.warehouse: const {'home', 'properties'},
    EmployeeRoles.accountant: const {
      'home',
      'finance',
      'transactions',
      'brokers',
      'report',
      'settings',
    },
  };

  static final Map<String, ({IconData icon, String label})> _tabDefs = {
    'home': (icon: Icons.dashboard, label: 'Tổng Quan'),
    'properties': (icon: Icons.home_work, label: 'BĐS'),
    'customers': (icon: Icons.people, label: 'Khách Hàng'),
    'brokers': (icon: Icons.badge, label: 'Môi Giới'),
    'transactions': (icon: Icons.handshake, label: 'Giao Dịch'),
    'match': (icon: Icons.join_inner, label: 'So Khớp'),
    'finance': (icon: Icons.account_balance_wallet, label: 'Phí Sàn'),
    'report': (icon: Icons.bar_chart, label: 'Báo Cáo'),
    'settings': (icon: Icons.settings, label: 'Cài Đặt'),
  };

  static final Map<String, Widget Function()> _tabScreens = {
    'home': () => const BatDongSanHomeScreen(),
    'properties': () => const PropertyListScreen(),
    'customers': () => const CustomerListScreen(),
    'brokers': () => const BrokerListScreen(),
    'transactions': () => const TransactionListScreen(),
    'match': () => const BatDongSanMatchScreen(),
    'finance': () => const BatDongSanFinanceScreen(),
    'report': () => const BdsReportsScreen(),
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
    final safeIndex = tabs.isNotEmpty
        ? (_selectedIndex < tabs.length ? _selectedIndex : 0)
        : 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Môi giới Bất động sản'),
        actions: const [AccountSwitcherButton()],
      ),
      body: Column(
        children: [
          const OwnerInfoBar(),
          const SizedBox(height: 12),
          Expanded(
            child: tabs.isEmpty
                ? const Center(
                    child: Text('Bạn chưa được cấp quyền truy cập module này'),
                  )
                : Row(
                    children: [
                      NavigationRail(
                        scrollable: true,
                        selectedIndex: safeIndex,
                        onDestinationSelected: (index) =>
                            setState(() => _selectedIndex = index),
                        labelType: NavigationRailLabelType.all,
                        selectedIconTheme: const IconThemeData(
                          color: Color(0xFF0284C7),
                        ),
                        selectedLabelTextStyle: const TextStyle(
                          color: Color(0xFF0284C7),
                          fontWeight: FontWeight.bold,
                        ),
                        destinations: [
                          for (final t in tabs)
                            NavigationRailDestination(
                              icon: Icon(t.icon),
                              label: Text(t.label),
                            ),
                        ],
                      ),
                      const VerticalDivider(thickness: 1, width: 1),
                      Expanded(child: ClipRect(child: tabs[safeIndex].screen)),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
