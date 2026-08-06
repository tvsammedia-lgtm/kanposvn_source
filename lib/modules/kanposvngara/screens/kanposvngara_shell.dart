import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_management_screen.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../../../core/sync/api_config.dart';
import '../providers/gara_providers.dart';
import '../services/gara_seed_data.dart';
import 'gara_reception_screen.dart';
import 'gara_work_order_screen.dart';
import 'gara_inventory_screen.dart';
import 'gara_finance_screen.dart';
import 'gara_dashboard_screen.dart';
import 'gara_ticket_search_screen.dart';
import 'gara_sales_report_screen.dart';

class KanPosVNGaraShell extends ConsumerStatefulWidget {
  const KanPosVNGaraShell({super.key});

  @override
  ConsumerState<KanPosVNGaraShell> createState() => _KanPosVNGaraShellState();
}

class _KanPosVNGaraShellState extends ConsumerState<KanPosVNGaraShell> {
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final isarService = ref.read(garaIsarServiceProvider);
    await GaraSeedData.seedIfEmpty(isarService);
    ref.read(garaProductsProvider.notifier).loadProducts();
    setState(() {
      _isInit = true;
    });
  }

  static final Map<String, Set<String>> _roleTabs = {
    EmployeeRoles.cashier: const {'reception', 'finance', 'search'},
    EmployeeRoles.sale: const {'reception', 'workorder', 'search'},
    EmployeeRoles.warehouse: const {'inventory', 'workorder'},
    EmployeeRoles.accountant: const {'dashboard', 'finance', 'report'},
  };

  static final List<({String id, Widget screen, IconData icon, String label})>
      _allTabs = [
    (id: 'dashboard', screen: const GaraDashboardScreen(), icon: Icons.dashboard, label: 'Dashboard'),
    (id: 'reception', screen: const GaraReceptionScreen(), icon: Icons.car_rental, label: 'Tiếp Nhận'),
    (id: 'workorder', screen: const GaraWorkOrderScreen(), icon: Icons.build, label: 'Lệnh Sửa Chữa'),
    (id: 'inventory', screen: const GaraInventoryScreen(), icon: Icons.inventory, label: 'Kho / Phụ Tùng'),
    (id: 'finance', screen: const GaraFinanceScreen(), icon: Icons.account_balance_wallet, label: 'Thu Chi'),
    (id: 'sync', screen: const GaraSyncScreen(), icon: Icons.sync, label: 'Đồng bộ'),
    (id: 'search', screen: const GaraTicketSearchScreen(), icon: Icons.receipt_long, label: 'Tra Cứu Phiếu'),
    (id: 'report', screen: const GaraSalesReportScreen(), icon: Icons.bar_chart, label: 'Báo Cáo'),
    (id: 'employees', screen: const EmployeeManagementScreen(), icon: Icons.badge, label: 'Quản Lý NV'),
  ];

  @override
  Widget build(BuildContext context) {
    if (!_isInit) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final selectedIndex = ref.watch(garaTabIndexProvider);
    final auth = ref.watch(authServiceProvider);
    final tabs = _allTabs
        .where((t) => EmployeeRolePolicy.isAllowed(
              isManager: auth.isManager,
              role: auth.employeeRole,
              tabId: t.id,
              roleTabs: _roleTabs,
            ))
        .toList();
    final safeIndex = selectedIndex < tabs.length ? selectedIndex : 0;

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: safeIndex,
            onDestinationSelected: (index) {
              ref.read(garaTabIndexProvider.notifier).state = index;
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

class GaraSyncScreen extends ConsumerWidget {
  const GaraSyncScreen({super.key});
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
            final syncService = ref.read(garaNeonSyncServiceProvider);
            await syncService.triggerSync(ApiConfig.baseUrl, ApiConfig.syncApiKey);
            if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đồng bộ hoàn tất!')));
          },
        ),
      ),
    );
  }
}
