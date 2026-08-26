import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/db/database_service.dart';
import '../../../core/providers.dart';
import '../../../core/warehouse/warehouse_screen.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../providers/cafe_providers.dart';
import '../services/cafe_seed_data.dart';
import '../services/cafe_permission_service.dart';
import 'floor_table_management_screen.dart';
import 'tables_screen.dart';
import 'pos_order_screen.dart';
import 'menu_recipe_screen.dart';
import 'inventory_screen.dart';
import 'finance_accounting_screen.dart';
import 'dashboard_reports_screen.dart';
import 'customer_supplier_screen.dart';
import 'purchase_import_screen.dart';
import 'voucher_screen.dart';
import 'order_history_screen.dart';
import 'cafe_sales_report_screen.dart';
import 'cafe_reports_screen.dart';
import 'cafe_settings_screen.dart';

class KanPosVNCafeShell extends ConsumerStatefulWidget {
  const KanPosVNCafeShell({super.key});

  @override
  ConsumerState<KanPosVNCafeShell> createState() => _KanPosVNCafeShellState();
}

class _KanPosVNCafeShellState extends ConsumerState<KanPosVNCafeShell> {
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initData());
  }

  Future<void> _initData() async {
    try {
      final db = DatabaseService.instance;
      await CafeSeedData.seedIfEmpty(db);
      ref.read(cafeTabPermissionsProvider.notifier).load(db);
    } catch (e) {
      // ignore init errors
    } finally {
      if (mounted) {
        setState(() => _isInit = true);
      }
    }
  }

  static final List<_CafeTab> _allTabs = [
    const _CafeTab(
      id: 'tables',
      screen: TablesScreen(),
      label: 'Sơ đồ Bàn',
      shortLabel: 'Bàn',
      icon: Icons.table_restaurant,
    ),
    const _CafeTab(
      id: 'floor_table_management',
      screen: FloorTableManagementScreen(),
      label: 'Quản lý Tầng/Bàn',
      shortLabel: 'QL Tầng/Bàn',
      icon: Icons.view_kanban,
    ),
    const _CafeTab(
      id: 'pos',
      screen: PosOrderScreen(),
      label: 'Bán hàng',
      shortLabel: 'POS',
      icon: Icons.point_of_sale,
    ),
    const _CafeTab(
      id: 'dashboard',
      screen: DashboardReportsScreen(),
      label: 'Dashboard',
      shortLabel: 'Báo cáo',
      icon: Icons.dashboard,
    ),
    const _CafeTab(
      id: 'menu',
      screen: MenuRecipeScreen(),
      label: 'Menu & Recipe',
      shortLabel: 'Menu',
      icon: Icons.restaurant_menu,
    ),
    const _CafeTab(
      id: 'inventory',
      screen: InventoryScreen(),
      label: 'Kho Hàng',
      shortLabel: 'Kho',
      icon: Icons.inventory_2,
    ),
    const _CafeTab(
      id: 'warehouse',
      screen: WarehouseScreen(),
      label: 'Kho Đa Chi Nhánh',
      shortLabel: 'Kho Cloud',
      icon: Icons.warehouse_outlined,
    ),
    const _CafeTab(
      id: 'finance',
      screen: FinanceAccountingScreen(),
      label: 'Thu Chi & KT',
      shortLabel: 'KT',
      icon: Icons.account_balance,
    ),
    const _CafeTab(
      id: 'customers',
      screen: CustomerSupplierScreen(),
      label: 'KH & NCC',
      icon: Icons.people,
    ),
    const _CafeTab(
      id: 'purchase',
      screen: PurchaseImportScreen(),
      label: 'Nhập hàng',
      icon: Icons.add_shopping_cart,
    ),
    const _CafeTab(
      id: 'voucher',
      screen: VoucherScreen(),
      label: 'Phiếu Thu/Chi',
      icon: Icons.receipt,
    ),
    const _CafeTab(
      id: 'order_history',
      screen: OrderHistoryScreen(),
      label: 'Tra cứu hóa đơn',
      icon: Icons.search,
    ),
    const _CafeTab(
      id: 'sales_report',
      screen: CafeSalesReportScreen(),
      label: 'Báo Cáo Bán Hàng',
      shortLabel: 'BCBH',
      icon: Icons.bar_chart,
    ),
    const _CafeTab(
      id: 'report_common',
      screen: CafeReportsScreen(),
      label: 'Báo Cáo Chung',
      shortLabel: 'Báo cáo',
      icon: Icons.description,
    ),
    const _CafeTab(
      id: 'settings',
      screen: CafeSettingsScreen(),
      label: 'Cài Đặt',
      shortLabel: 'Cài Đặt',
      icon: Icons.settings,
    ),
  ];

  /// Lọc tab theo role tài khoản (Owner/Manager xem hết, nhân viên xem theo
  /// cấu hình phân quyền trong màn hình "Phân quyền").
  ///
  /// [customTabs] là danh sách tab được check riêng cho từng nhân viên trong
  /// "Quản lý nhân viên" — nếu có thì ưu tiên hơn cấu hình theo role.
  static List<_CafeTab> _tabsForRole(
    bool isManager,
    String? role,
    Map<String, Set<String>> permissions,
    List<String>? customTabs,
  ) {
    if (!isManager && customTabs != null) {
      final filtered = _allTabs
          .where((t) => customTabs.contains(t.id))
          .toList();
      if (filtered.isNotEmpty) return filtered;
    }
    final allowed = allowedTabIdsForRole(isManager, role, permissions);
    final filtered = _allTabs.where((t) => allowed.contains(t.id)).toList();
    // An toàn: role không được cấu hình tab nào → ít nhất vẫn thấy Sơ đồ Bàn.
    if (filtered.isEmpty) {
      return _allTabs.where((t) => t.id == 'tables').toList();
    }
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInit) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }


    final isDesktop = MediaQuery.of(context).size.width > 600;
    final selectedIndex = ref.watch(cafeTabIndexProvider);
    final activeTabId = ref.watch(cafeActiveTabIdProvider);
    final auth = ref.watch(authServiceProvider);
    final tabPermissions = ref.watch(cafeTabPermissionsProvider);
    final customTabs = auth.employeeAllowedTabs;
    final tabs = _tabsForRole(
      auth.isManager,
      auth.employeeRole,
      tabPermissions,
      customTabs,
    );
    // Ưu tiên tab theo id (điều hướng bằng tên thay vì index cứng) —
    // chống lệch index khi danh sách tab bị lọc theo role.
    final activeIndex =
        activeTabId != null ? tabs.indexWhere((t) => t.id == activeTabId) : -1;
    final safeIndex =
        activeIndex >= 0
            ? activeIndex
            : (selectedIndex < tabs.length ? selectedIndex : 0);
    final mobileTabs = tabs;
    final mobileSafeIndex = safeIndex;
    // Ensure active tab id is set on initial display — do this after tabs are constructed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        final currentActive = ref.read(cafeActiveTabIdProvider);
        if (currentActive == null) {
          ref.read(cafeActiveTabIdProvider.notifier).state = tabs[safeIndex].id;
        }
      } catch (_) {}
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD97706),
        foregroundColor: Colors.white,
        title: Row(
          children: [
            const Icon(Icons.local_cafe, color: Colors.white),
            const SizedBox(width: 8),
            const Text(
              'KanPosVN - Quán Cafe & Trà Sữa',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(width: 12),
          ],
        ),
        actions: [
          const AccountSwitcherButton(foregroundColor: Colors.white),
          IconButton(
            icon: const Icon(Icons.sync),
            tooltip: 'Đồng bộ dữ liệu',
            onPressed: () async {
              final syncService = ref.read(cafeNeonSyncServiceProvider);
              final success = await syncService.triggerSync();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      success
                          ? 'Đồng bộ dữ liệu thành công!'
                          : 'Đồng bộ thất bại, dữ liệu đã được lưu hàng chờ',
                    ),
                    backgroundColor: success ? Colors.green : Colors.orange,
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              scrollable: true,
              selectedIndex: safeIndex,
                onDestinationSelected: (index) {
                 ref.read(cafeTabIndexProvider.notifier).state = index;
                 try {
                   ref.read(cafeActiveTabIdProvider.notifier).state = tabs[index].id;
                 } catch (_) {}
                },
                labelType: NavigationRailLabelType.all,
                selectedIconTheme: const IconThemeData(color: Color(0xFFD97706)),
                selectedLabelTextStyle: const TextStyle(
                  color: Color(0xFFD97706),
                  fontWeight: FontWeight.bold,
                ),
                destinations: [
                  for (final tab in tabs)
                    NavigationRailDestination(
                      icon: Icon(tab.icon),
                      label: Text(tab.label),
                    ),
                ],
              ),
          if (isDesktop) const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: ClipRect(child: tabs[safeIndex].screen)),
        ],
      ),
      bottomNavigationBar: isDesktop
          ? null
          : BottomNavigationBar(
              currentIndex: mobileSafeIndex,
              onTap: (index) {
                 ref.read(cafeTabIndexProvider.notifier).state = index;
                 try {
                   ref.read(cafeActiveTabIdProvider.notifier).state = tabs[index].id;
                 } catch (_) {}
               },
              selectedItemColor: const Color(0xFFD97706),
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: [
                for (final tab in mobileTabs)
                  BottomNavigationBarItem(
                    icon: Icon(tab.icon),
                    label: tab.shortLabel ?? tab.label,
                  ),
              ],
            ),
    );
  }
}

class _CafeTab {
  final String id;
  final Widget screen;
  final String label;
  final IconData icon;
  final String? shortLabel;

  const _CafeTab({
    required this.id,
    required this.screen,
    required this.label,
    required this.icon,
    this.shortLabel,
  });
}
