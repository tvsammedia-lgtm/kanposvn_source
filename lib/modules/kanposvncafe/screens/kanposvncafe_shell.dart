import 'dart:io' show exit;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/db/database_service.dart';
import '../../../core/providers.dart';
import '../../../core/router/module_selector_screen.dart';
import '../providers/cafe_providers.dart';
import '../services/cafe_seed_data.dart';
import 'tables_screen.dart';
import 'pos_order_screen.dart';
import 'menu_recipe_screen.dart';
import 'inventory_screen.dart';
import 'finance_accounting_screen.dart';
import 'dashboard_reports_screen.dart';
import 'sync_neon_screen.dart';
import 'customer_supplier_screen.dart';
import 'purchase_import_screen.dart';
import 'voucher_screen.dart';
import 'order_history_screen.dart';
import 'backup_restore_screen.dart';

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
    } catch (e) {
      debugPrint('CAFE INIT ERROR: $e');
    } finally {
      if (mounted) {
        setState(() => _isInit = true);
      }
    }
  }

  static final List<_CafeTab> _allTabs = [
    const _CafeTab(
      screen: TablesScreen(),
      label: 'Sơ đồ Bàn',
      shortLabel: 'Bàn',
      icon: Icons.table_restaurant,
    ),
    const _CafeTab(
      screen: PosOrderScreen(),
      label: 'Bán hàng',
      shortLabel: 'POS',
      icon: Icons.point_of_sale,
    ),
    const _CafeTab(
      screen: DashboardReportsScreen(),
      label: 'Dashboard',
      shortLabel: 'Báo cáo',
      icon: Icons.dashboard,
    ),
    const _CafeTab(
      screen: MenuRecipeScreen(),
      label: 'Menu & Recipe',
      shortLabel: 'Menu',
      icon: Icons.restaurant_menu,
    ),
    const _CafeTab(
      screen: InventoryScreen(),
      label: 'Kho Hàng',
      shortLabel: 'Kho',
      icon: Icons.inventory_2,
    ),
    const _CafeTab(
      screen: FinanceAccountingScreen(),
      label: 'Thu Chi & KT',
      shortLabel: 'KT',
      icon: Icons.account_balance,
    ),
    const _CafeTab(
      screen: CustomerSupplierScreen(),
      label: 'KH & NCC',
      icon: Icons.people,
    ),
    const _CafeTab(
      screen: PurchaseImportScreen(),
      label: 'Nhập hàng',
      icon: Icons.add_shopping_cart,
    ),
    const _CafeTab(
      screen: VoucherScreen(),
      label: 'Phiếu Thu/Chi',
      icon: Icons.receipt,
    ),
    const _CafeTab(
      screen: SyncNeonScreen(),
      label: 'Vercel Neon',
      icon: Icons.cloud_sync,
    ),
    const _CafeTab(
      screen: OrderHistoryScreen(),
      label: 'Tra cứu hóa đơn',
      icon: Icons.search,
    ),
    const _CafeTab(
      screen: BackupRestoreScreen(),
      label: 'Backup/Restore',
      icon: Icons.backup,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (!_isInit) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final isDesktop = MediaQuery.of(context).size.width > 800;
    final selectedIndex = ref.watch(cafeTabIndexProvider);
    final auth = ref.watch(authServiceProvider);
    final tabs = auth.isManager ? _allTabs : _allTabs.sublist(0, 2);
    final safeIndex = selectedIndex < tabs.length ? selectedIndex : 0;
    final mobileTabs = tabs.length > 6 ? tabs.sublist(0, 6) : tabs;
    final mobileSafeIndex = safeIndex < mobileTabs.length ? safeIndex : 0;

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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Isar Offline + Vercel Neon Sync',
                style: TextStyle(fontSize: 11, color: Colors.white),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            tooltip: 'Đồng bộ Neon DB',
            onPressed: () async {
              final syncService = ref.read(cafeNeonSyncServiceProvider);
              final success = await syncService.triggerSync();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      success
                          ? 'Đồng bộ Neon DB qua Vercel API thành công!'
                          : 'Đồng bộ thất bại, đã lưu vào Isar SyncQueue',
                    ),
                    backgroundColor: success ? Colors.green : Colors.orange,
                  ),
                );
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.swap_horiz),
            tooltip: 'Đổi Module',
            onPressed: () {
              ref.read(selectedModuleProvider.notifier).state = null;
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const ModuleSelectorScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Đổi tài khoản',
            onPressed: () async {
              final auth = ref.read(authServiceProvider);
              ref.read(selectedModuleProvider.notifier).state = null;
              await auth.signOut();
            },
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Thoát',
            onPressed: () {
              exit(0);
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
                onDestinationSelected: (index) =>
                    ref.read(cafeTabIndexProvider.notifier).state = index,
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
          Expanded(child: tabs[safeIndex].screen),
        ],
      ),
      bottomNavigationBar: isDesktop
          ? null
          : BottomNavigationBar(
              currentIndex: mobileSafeIndex,
              onTap: (index) =>
                  ref.read(cafeTabIndexProvider.notifier).state = index,
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
  final Widget screen;
  final String label;
  final IconData icon;
  final String? shortLabel;

  const _CafeTab({
    required this.screen,
    required this.label,
    required this.icon,
    this.shortLabel,
  });
}
