import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_management_screen.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../../../core/sync/api_config.dart';
import '../providers/vlxd_providers.dart';
import '../services/vlxd_seed_data.dart';
import 'vlxd_pos_screen.dart';
import 'vlxd_inventory_screen.dart';
import 'vlxd_contracts_screen.dart';
import 'vlxd_finance_screen.dart';
import 'vlxd_dashboard_screen.dart';
import 'vlxd_sales_report_screen.dart';

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
    EmployeeRoles.cashier: const {'pos', 'finance', 'report'},
    EmployeeRoles.sale: const {'pos', 'contracts', 'finance', 'report'},
    EmployeeRoles.warehouse: const {'inventory', 'pos'},
    EmployeeRoles.accountant: const {'dashboard', 'finance', 'contracts', 'report'},
  };

  static final List<({String id, Widget screen, IconData icon, String label})>
      _allTabs = [
    (id: 'dashboard', screen: const VlxdDashboardScreen(), icon: Icons.dashboard, label: 'Dashboard'),
    (id: 'pos', screen: const VlxdPosScreen(), icon: Icons.point_of_sale, label: 'Bán Lẻ'),
    (id: 'contracts', screen: const VlxdContractsScreen(), icon: Icons.assignment, label: 'Hợp Đồng Sỉ'),
    (id: 'inventory', screen: const VlxdInventoryScreen(), icon: Icons.inventory, label: 'Kho Hàng'),
    (id: 'finance', screen: const VlxdFinanceScreen(), icon: Icons.account_balance_wallet, label: 'Thu Chi & Nợ'),
    (id: 'sync', screen: const VlxdSyncScreen(), icon: Icons.sync, label: 'Đồng Bộ'),
    (id: 'report', screen: const VlxdSalesReportScreen(), icon: Icons.bar_chart, label: 'Báo Cáo'),
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

class VlxdSyncScreen extends ConsumerWidget {
  const VlxdSyncScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đồng bộ Vercel Neon DB')),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.cloud_sync),
          label: const Text('Đồng bộ Dữ liệu'),
          onPressed: () async {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đang đồng bộ...')));
            final syncService = ref.read(vlxdNeonSyncServiceProvider);
            await syncService.triggerSync(ApiConfig.baseUrl, ApiConfig.syncApiKey);
            if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đồng bộ hoàn tất!')));
          },
        ),
      ),
    );
  }
}
