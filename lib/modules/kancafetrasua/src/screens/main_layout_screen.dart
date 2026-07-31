import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/app_providers.dart';
import '../models/isar_models.dart';
import 'dashboard_screen.dart';
import 'table_floor_screen.dart';
import 'table_management_screen.dart';
import 'pos_order_screen.dart';
import 'takeaway_delivery_screen.dart';
import 'inventory_recipe_screen.dart';
import 'expense_debt_screen.dart';
import 'accounting_reports_screen.dart';
import 'revenue_management_screen.dart';
import 'sync_settings_screen.dart';
import 'qr_scan_screen.dart';
import 'backup_restore_screen.dart';

class MainLayoutScreen extends ConsumerStatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  ConsumerState<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends ConsumerState<MainLayoutScreen> {
  int _selectedIndex = 0;

  List<_NavItem> _getNavItems(UserRole role) {
    if (role == UserRole.cashier || role == UserRole.waiter) {
      return [
        _NavItem(icon: Icons.table_bar_outlined, selectedIcon: Icons.table_bar, label: 'Sơ đồ bàn', pageBuilder: () => TableFloorScreen(onNavigateToPos: (i) => setState(() => _selectedIndex = 1))),
        _NavItem(icon: Icons.point_of_sale_outlined, selectedIcon: Icons.point_of_sale, label: 'Bán hàng', pageBuilder: () => const PosOrderScreen()),
      ];
    }

    return [
      _NavItem(icon: Icons.dashboard_outlined, selectedIcon: Icons.dashboard, label: 'Tổng quan', pageBuilder: () => const DashboardScreen()),
      _NavItem(icon: Icons.table_bar_outlined, selectedIcon: Icons.table_bar, label: 'Sơ đồ bàn', pageBuilder: () => TableFloorScreen(onNavigateToPos: (i) => setState(() => _selectedIndex = 1))),
      _NavItem(icon: Icons.point_of_sale_outlined, selectedIcon: Icons.point_of_sale, label: 'Bán hàng', pageBuilder: () => const PosOrderScreen()),
      _NavItem(icon: Icons.table_chart_outlined, selectedIcon: Icons.table_chart, label: 'Quản lý bàn', pageBuilder: () => const TableManagementScreen()),
      _NavItem(icon: Icons.two_wheeler_outlined, selectedIcon: Icons.two_wheeler, label: 'Mang đi', pageBuilder: () => const TakeawayDeliveryScreen()),
      _NavItem(icon: Icons.inventory_2_outlined, selectedIcon: Icons.inventory_2, label: 'Kho/Recipe', pageBuilder: () => const InventoryRecipeScreen()),
      _NavItem(icon: Icons.account_balance_wallet_outlined, selectedIcon: Icons.account_balance_wallet, label: 'Thu chi', pageBuilder: () => const ExpenseDebtScreen()),
      _NavItem(icon: Icons.receipt_long_outlined, selectedIcon: Icons.receipt_long, label: 'Doanh thu', pageBuilder: () => const RevenueManagementScreen()),
      _NavItem(icon: Icons.assessment_outlined, selectedIcon: Icons.assessment, label: 'Kế toán', pageBuilder: () => const AccountingReportsScreen()),
      _NavItem(icon: Icons.cloud_sync_outlined, selectedIcon: Icons.cloud_sync, label: 'Cloud', pageBuilder: () => const SyncSettingsScreen()),
      _NavItem(icon: Icons.backup_outlined, selectedIcon: Icons.backup, label: 'Backup', pageBuilder: () => const BackupRestoreScreen()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserProvider);
    final syncState = ref.watch(syncNotifierProvider);
    final role = currentUser?.role ?? UserRole.cashier;
    final navItems = _getNavItems(role);

    if (_selectedIndex >= navItems.length) _selectedIndex = 0;

    final pages = navItems.map((n) => n.pageBuilder()).toList();
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A2C2A),
        foregroundColor: Colors.white,
        elevation: 2,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Icon(Icons.coffee, color: Colors.amberAccent, size: 28),
              const SizedBox(width: 10),
              const Text('KÀN CAFE & TRÀ SỮA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.amberAccent)),
              if (!isMobile && role != UserRole.cashier && role != UserRole.waiter) ...[
                const SizedBox(width: 16),
                InkWell(
                  onTap: () => setState(() {
                    final cloudIdx = navItems.indexWhere((n) => n.label == 'Cloud');
                    if (cloudIdx != -1) _selectedIndex = cloudIdx;
                  }),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: syncState.pendingCount > 0 ? Colors.orange.withValues(alpha: 0.25) : Colors.green.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: syncState.pendingCount > 0 ? Colors.amber : Colors.greenAccent),
                    ),
                    child: Row(children: [
                      Icon(syncState.isSyncing ? Icons.sync : Icons.cloud_done, size: 14, color: syncState.pendingCount > 0 ? Colors.amber : Colors.greenAccent),
                      const SizedBox(width: 4),
                      Text(syncState.pendingCount > 0 ? '${syncState.pendingCount}' : 'OK', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: syncState.pendingCount > 0 ? Colors.amber : Colors.greenAccent)),
                    ]),
                  ),
                ),
              ],
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: IconButton(
              icon: const Icon(Icons.qr_code_scanner, color: Colors.amberAccent, size: 22),
              tooltip: 'Quét QR',
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QrScanScreen())),
            ),
          ),
          StreamBuilder(
            stream: Stream.periodic(const Duration(seconds: 1)),
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Center(child: Text(DateFormat('HH:mm').format(DateTime.now()), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white70))),
              );
            },
          ),
          if (currentUser != null)
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(16)),
                  child: Text(currentUser.fullName.split(' ').last, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                ),
              ),
            ),
          if (currentUser != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(Icons.logout, color: Colors.redAccent, size: 18),
                tooltip: 'Đăng xuất',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Đăng xuất'),
                      content: Text('Đăng xuất "${currentUser.fullName}"?'),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, foregroundColor: Colors.white),
                          onPressed: () { Navigator.pop(ctx); ref.read(currentUserProvider.notifier).state = null; },
                          child: const Text('Đăng xuất'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
      body: Row(
        children: [
          // Desktop: NavigationRail
          if (!isMobile) ...[
            SizedBox(
              width: 72,
              child: NavigationRail(
                selectedIndex: _selectedIndex,
                onDestinationSelected: (index) => setState(() => _selectedIndex = index),
                backgroundColor: const Color(0xFF321D1C),
                selectedIconTheme: const IconThemeData(color: Colors.amberAccent, size: 24),
                unselectedIconTheme: const IconThemeData(color: Colors.white54, size: 20),
                selectedLabelTextStyle: const TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.bold, fontSize: 10),
                unselectedLabelTextStyle: const TextStyle(color: Colors.white54, fontSize: 9),
                labelType: NavigationRailLabelType.all,
                destinations: navItems.map((n) => NavigationRailDestination(
                  icon: Icon(n.icon),
                  selectedIcon: Icon(n.selectedIcon),
                  label: Text(n.label),
                )).toList(),
              ),
            ),
            const VerticalDivider(thickness: 1, width: 1),
          ],

          // Main View
          Expanded(child: pages[_selectedIndex]),
        ],
      ),

      // Mobile: BottomNavigationBar
      bottomNavigationBar: isMobile
          ? BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color(0xFF321D1C),
              selectedItemColor: Colors.amberAccent,
              unselectedItemColor: Colors.white54,
              selectedFontSize: 10,
              unselectedFontSize: 9,
              iconSize: 22,
              items: navItems.take(5).map((n) => BottomNavigationBarItem(
                icon: Icon(n.icon),
                activeIcon: Icon(n.selectedIcon),
                label: n.label,
              )).toList(),
            )
          : null,
    );
  }
}

class _NavItem {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final Widget Function() pageBuilder;

  _NavItem({required this.icon, required this.selectedIcon, required this.label, required this.pageBuilder});
}
