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
      final isarService = ref.read(vlxdIsarServiceProvider);
      await VlxdSeedData.seedIfEmpty(isarService);
      ref.read(vlxdProductsProvider.notifier).loadProducts();
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
    final safeIndex = tabs.isNotEmpty ? (_selectedIndex < tabs.length ? _selectedIndex : 0) : 0;
    final moduleColor = auth.currentModule?.color ?? const Color(0xFF6366F1);
    final isDesktop = MediaQuery.of(context).size.width > 600;
    _scrollSelectedIntoView(safeIndex);

    if (tabs.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: auth.currentModule?.color ?? const Color(0xFF6366F1),
          foregroundColor: Colors.white,
          title: const Text('KanPosVN - Vật Liệu Xây Dựng',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        body: const Center(child: Text('Không có quyền truy cập tab nào.\nLiên hệ quản trị viên để được cấp quyền.', textAlign: TextAlign.center)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: moduleColor,
        foregroundColor: Colors.white,
        title: const Text('KanPosVN - Vật Liệu Xây Dựng',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        actions: const [
          AccountSwitcherButton(foregroundColor: Colors.white),
        ],
      ),
      body: Row(
        children: [
          if (isDesktop)
            Container(
              key: const ValueKey('vlxd_tab_rail'),
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
              selectedItemColor: const Color(0xFF6366F1),
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
        height: _KanPosVNVlxdShellState._itemExtent,
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
