import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../providers/nhathuoc_providers.dart';
import '../services/nhathuoc_seed_data.dart';
import 'nhathuoc_dashboard_screen.dart';
import 'nhathuoc_pos_screen.dart';
import 'nhathuoc_inventory_screen.dart';
import 'nhathuoc_patient_screen.dart';
import 'nhathuoc_prescription_screen.dart';
import 'nhathuoc_medicine_screen.dart';
import 'nhathuoc_supplier_screen.dart';
import 'nhathuoc_customer_screen.dart';
import 'nhathuoc_expense_screen.dart';
import 'nhathuoc_settings_screen.dart';

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
    ref.read(nhathuocSuppliersProvider.notifier).loadSuppliers();
    ref.read(nhathuocCustomersProvider.notifier).loadCustomers();
    ref.read(nhathuocExpensesProvider.notifier).loadExpenses();
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
    EmployeeRoles.accountant: const {'dashboard', 'pos', 'settings', 'expenses'},
  };

  /// Định nghĩa các tab của module (id, icon, label) — thứ tự hiển thị.
  /// Đồng bộ / Quản Lý NV đã chuyển vào trong tab Cài Đặt.
  static final Map<String, ({IconData icon, String label})> _tabDefs = {
    'dashboard': (icon: Icons.dashboard, label: 'Dashboard'),
    'pos': (icon: Icons.point_of_sale, label: 'Bán Hàng'),
    'medicines': (icon: Icons.medication, label: 'Thuốc'),
    'inventory': (icon: Icons.inventory_2, label: 'Kho Thuốc'),
    'patient': (icon: Icons.people, label: 'Bệnh Nhân'),
    'customers': (icon: Icons.person_search, label: 'Khách Hàng'),
    'suppliers': (icon: Icons.business, label: 'NCC'),
    'prescription': (icon: Icons.receipt_long, label: 'Toa Mẫu'),
    'expenses': (icon: Icons.account_balance_wallet, label: 'Thu Chi'),
    'settings': (icon: Icons.settings, label: 'Cài Đặt'),
  };

  static final Map<String, Widget Function()> _tabScreens = {
    'dashboard': () => const NhathuocDashboardScreen(),
    'pos': () => const NhathuocPosScreen(),
    'medicines': () => const NhathuocMedicineScreen(),
    'inventory': () => const NhathuocInventoryScreen(),
    'patient': () => const NhathuocPatientScreen(),
    'customers': () => const NhathuocCustomerScreen(),
    'suppliers': () => const NhathuocSupplierScreen(),
    'prescription': () => const NhathuocPrescriptionScreen(),
    'expenses': () => const NhathuocExpenseScreen(),
    'settings': () => const NhathuocSettingsScreen(),
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
        backgroundColor: auth.currentModule?.color ?? const Color(0xFF10B981),
        foregroundColor: Colors.white,
        title: const Text('KanPosVN - Nhà Thuốc',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        actions: const [
          AccountSwitcherButton(foregroundColor: Colors.white),
        ],
      ),
      body: Row(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: NavigationRail(
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
