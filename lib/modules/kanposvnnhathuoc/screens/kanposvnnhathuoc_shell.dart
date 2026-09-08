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
import 'nhathuoc_reports_screen.dart';
import 'nhathuoc_settings_screen.dart';

class KanPosVNNhathuocShell extends ConsumerStatefulWidget {
  const KanPosVNNhathuocShell({super.key});

  @override
  ConsumerState<KanPosVNNhathuocShell> createState() => _KanPosVNNhathuocShellState();
}

class _KanPosVNNhathuocShellState extends ConsumerState<KanPosVNNhathuocShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  // Thanh tab dọc dùng SingleChildScrollView (KHÔNG dùng NavigationRail
  // scrollable): cửa sổ thấp sẽ cắt mất tab cuối và vùng bấm nằm ngoài giới
  // hạn — lỗi "bấm tab bên cạnh không tác dụng". Tự cuộn tab đang chọn vào
  // giữa khung.
  final ScrollController _railController = ScrollController();
  static const double _itemExtent = 58;

  @override
  void dispose() {
    _railController.dispose();
    super.dispose();
  }

  /// Giữ tab đang chọn luôn nằm trong tầm nhìn (giữa khung) của thanh tab.
  void _scrollSelectedIntoView(int selectedIndex) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_railController.hasClients) return;
      final position = _railController.position;
      final target = (selectedIndex * _itemExtent) -
          position.viewportDimension / 2 +
          _itemExtent / 2;
      _railController.jumpTo(
        target.clamp(0.0, position.maxScrollExtent),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    try {
      final isarService = ref.read(nhathuocIsarServiceProvider);
      await NhathuocSeedData.seedIfEmpty(isarService);
      ref.read(nhathuocMedicinesProvider.notifier).loadMedicines();
      ref.read(nhathuocPatientsProvider.notifier).loadPatients();
      ref.read(nhathuocSuppliersProvider.notifier).loadSuppliers();
      ref.read(nhathuocCustomersProvider.notifier).loadCustomers();
      ref.read(nhathuocExpensesProvider.notifier).loadExpenses();
      ref.read(nhathuocPrescriptionTemplatesProvider.notifier).loadTemplates();
      ref.read(nhathuocFinanceProvider.notifier).calculateMetrics();
    } catch (_) {}
    if (mounted) {
      setState(() {
        _isInit = true;
      });
    }
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
    'reports': (icon: Icons.bar_chart, label: 'Báo Cáo'),
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
    'reports': () => const NhathuocReportsScreen(),
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
    final safeIndex = tabs.isNotEmpty ? (_selectedIndex < tabs.length ? _selectedIndex : 0) : 0;
    final moduleColor = auth.currentModule?.color ?? const Color(0xFF10B981);
    final isDesktop = MediaQuery.of(context).size.width > 600;
    _scrollSelectedIntoView(safeIndex);

    if (tabs.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: auth.currentModule?.color ?? const Color(0xFF10B981),
          foregroundColor: Colors.white,
          title: const Text('KanPosVN - Nhà Thuốc',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        body: const Center(child: Text('Không có quyền truy cập tab nào.\nLiên hệ quản trị viên để được cấp quyền.', textAlign: TextAlign.center)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: moduleColor,
        foregroundColor: Colors.white,
        title: const Text('KanPosVN - Nhà Thuốc',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        actions: const [
          AccountSwitcherButton(foregroundColor: Colors.white),
        ],
      ),
      body: Row(
        children: [
          if (isDesktop)
            Container(
              key: const ValueKey('nhathuoc_tab_rail'),
              width: 100,
              color: const Color(0xFF111827),
              child: Scrollbar(
                controller: _railController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _railController,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (var i = 0; i < tabs.length; i++)
                        _RailItem(
                          label: tabs[i].label,
                          icon: tabs[i].icon,
                          selected: i == safeIndex,
                          color: moduleColor,
                          onTap: () {
                            setState(() => _selectedIndex = i);
                          },
                        ),
                    ],
                  ),
                ),
              ),
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
              selectedItemColor: const Color(0xFF10B981),
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

/// Mục tab dọc gọn (icon + label) dùng cho thanh tab desktop có thể cuộn.
class _RailItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  const _RailItem({
    required this.label,
    required this.icon,
    required this.selected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 88,
        height: _KanPosVNNhathuocShellState._itemExtent,
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
        decoration: BoxDecoration(
          color: selected ? color.withValues(alpha: 0.18) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: selected ? Border.all(color: color.withValues(alpha: 0.45)) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: selected ? color : Colors.grey),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: selected ? color : Colors.grey,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
