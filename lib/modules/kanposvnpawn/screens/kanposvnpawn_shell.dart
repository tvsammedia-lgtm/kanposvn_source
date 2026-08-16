import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_management_screen.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../../../core/sync/api_config.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../providers/isar_provider.dart';
import '../providers/pawn_provider.dart';
import '../providers/customer_provider.dart';
import '../providers/product_provider.dart';
import '../services/pawn_seed_data.dart';
import 'pawn/pawn_list_screen.dart';
import 'customer/customer_list_screen.dart';
import 'pawn_settings_screen.dart';

class KanPosVnPawnShell extends ConsumerStatefulWidget {
  const KanPosVnPawnShell({super.key});

  @override
  ConsumerState<KanPosVnPawnShell> createState() => _KanPosVnPawnShellState();
}

class _KanPosVnPawnShellState extends ConsumerState<KanPosVnPawnShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final isarService = ref.read(pawnIsarServiceProvider);
    await PawnSeedData.seedIfEmpty(isarService);
    ref.read(pawnProvider.notifier).loadContracts();
    ref.read(customerProvider.notifier).loadCustomers();
    ref.read(productProvider.notifier).loadProducts();
    setState(() {
      _isInit = true;
    });
  }

  static final Map<String, Set<String>> _roleTabs = {
    EmployeeRoles.cashier: const {'pawn', 'customer'},
    EmployeeRoles.sale: const {'pawn', 'customer'},
    EmployeeRoles.warehouse: const {'customer'},
    EmployeeRoles.accountant: const {'pawn', 'customer', 'settings'},
  };

  /// Định nghĩa các tab của module (id, icon, label) — thứ tự hiển thị.
  static final Map<String, ({IconData icon, String label})> _tabDefs = {
    'pawn': (icon: Icons.monetization_on, label: 'Hợp Đồng'),
    'customer': (icon: Icons.people, label: 'Khách Hàng'),
    'sync': (icon: Icons.sync, label: 'Đồng bộ'),
    'employees': (icon: Icons.badge, label: 'Quản Lý NV'),
    'settings': (icon: Icons.settings, label: 'Cài Đặt'),
  };

  static final Map<String, Widget Function()> _tabScreens = {
    'pawn': () => const PawnListScreen(),
    'customer': () => const CustomerListScreen(),
    'sync': () => const PawnSyncScreen(),
    'employees': () => EmployeeManagementScreen(
      availableTabs: [
        for (final e in _tabDefs.entries)
          EmployeeTabOption(id: e.key, label: e.value.label),
      ],
      roleTabs: _roleTabs,
    ),
    'settings': () => const PawnSettingsScreen(),
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
        backgroundColor: auth.currentModule?.color ?? const Color(0xFFB45309),
        foregroundColor: Colors.white,
        title: const Text('KanPosVN - Cầm Đồ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        actions: const [
          AccountSwitcherButton(foregroundColor: Colors.white),
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
            scrollable: true,
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

class PawnSyncScreen extends ConsumerWidget {
  const PawnSyncScreen({super.key});
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
            final syncService = ref.read(pawnNeonSyncServiceProvider);
            await syncService.triggerSync(ApiConfig.baseUrl, ApiConfig.syncApiKey);
            if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đồng bộ hoàn tất!')));
          },
        ),
      ),
    );
  }
}
