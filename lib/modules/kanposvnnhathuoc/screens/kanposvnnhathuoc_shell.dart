import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_management_screen.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../../../core/sync/api_config.dart';
import '../providers/nhathuoc_providers.dart';
import '../services/nhathuoc_seed_data.dart';
import 'nhathuoc_dashboard_screen.dart';
import 'nhathuoc_pos_screen.dart';
import 'nhathuoc_inventory_screen.dart';
import 'nhathuoc_patient_screen.dart';
import 'nhathuoc_prescription_screen.dart';

class KanPosVNNhathuocShell extends ConsumerStatefulWidget {
  const KanPosVNNhathuocShell({super.key});

  @override
  ConsumerState<KanPosVNNhathuocShell> createState() => _KanPosVNNhathuocShellState();
}

class _KanPosVNNhathuocShellState extends ConsumerState<KanPosVNNhathuocShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final isarService = ref.read(nhathuocIsarServiceProvider);
    await NhathuocSeedData.seedIfEmpty(isarService);
    ref.read(nhathuocMedicinesProvider.notifier).loadMedicines();
    ref.read(nhathuocPatientsProvider.notifier).loadPatients();
    ref.read(nhathuocPrescriptionTemplatesProvider.notifier).loadTemplates();
    ref.read(nhathuocFinanceProvider.notifier).calculateMetrics();
    setState(() {
      _isInit = true;
    });
  }

  static final Map<String, Set<String>> _roleTabs = {
    EmployeeRoles.cashier: const {'pos', 'patient', 'prescription'},
    EmployeeRoles.sale: const {'pos', 'patient'},
    EmployeeRoles.warehouse: const {'inventory', 'pos'},
    EmployeeRoles.accountant: const {'dashboard', 'pos'},
  };

  static final List<({String id, Widget screen, IconData icon, String label})>
      _allTabs = [
    (id: 'dashboard', screen: const NhathuocDashboardScreen(), icon: Icons.dashboard, label: 'Báo Cáo'),
    (id: 'pos', screen: const NhathuocPosScreen(), icon: Icons.point_of_sale, label: 'Bán Hàng'),
    (id: 'inventory', screen: const NhathuocInventoryScreen(), icon: Icons.inventory, label: 'Kho Thuốc'),
    (id: 'patient', screen: const NhathuocPatientScreen(), icon: Icons.people, label: 'Bệnh Nhân'),
    (id: 'prescription', screen: const NhathuocPrescriptionScreen(), icon: Icons.receipt_long, label: 'Toa Mẫu'),
    (id: 'sync', screen: const NhathuocSyncScreen(), icon: Icons.sync, label: 'Đồng bộ'),
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

class NhathuocSyncScreen extends ConsumerWidget {
  const NhathuocSyncScreen({super.key});
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
            final syncService = ref.read(nhathuocNeonSyncServiceProvider);
            await syncService.triggerSync(ApiConfig.baseUrl, ApiConfig.syncApiKey);
            if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đồng bộ hoàn tất!')));
          },
        ),
      ),
    );
  }
}
