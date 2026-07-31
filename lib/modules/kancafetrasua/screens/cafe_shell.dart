import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/l10n/translations.dart';
import '../../../core/widgets/app_shell.dart';
import 'cafe_dashboard.dart';
import 'cafe_product_manage_screen.dart';
import '../src/screens/pos_order_screen.dart';
import '../src/screens/table_floor_screen.dart';
import '../src/screens/inventory_recipe_screen.dart';
import '../src/screens/revenue_management_screen.dart';
import '../src/screens/expense_debt_screen.dart';
import '../src/screens/accounting_reports_screen.dart';

class CafeShell extends ConsumerStatefulWidget {
  final String initialRoute;
  const CafeShell({super.key, this.initialRoute = '/'});

  @override
  ConsumerState<CafeShell> createState() => _CafeShellState();
}

class _CafeShellState extends ConsumerState<CafeShell> {
  void _navigateToTab(int index) {
    ref.read(currentScreenIndexProvider.notifier).state = index;
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      const CafeDashboard(),
      const CafeProductManageScreen(),
      const PosOrderScreen(),
      TableFloorScreen(onNavigateToPos: _navigateToTab),
      const InventoryRecipeScreen(),
      const RevenueManagementScreen(),
      const ExpenseDebtScreen(),
      const AccountingReportsScreen(),
    ];

    final navItems = [
      NavItem(icon: Icons.dashboard_rounded, label: 'dashboard'.tr),
      NavItem(icon: Icons.coffee_rounded, label: 'Sản phẩm'),
      NavItem(icon: Icons.point_of_sale_rounded, label: 'POS'),
      NavItem(icon: Icons.table_restaurant_rounded, label: 'Bàn'),
      NavItem(icon: Icons.inventory_2_rounded, label: 'Kho & CT'),
      NavItem(icon: Icons.trending_up_rounded, label: 'Thu chi'),
      NavItem(icon: Icons.receipt_long_rounded, label: 'Nợ'),
      NavItem(icon: Icons.assessment_rounded, label: 'Báo cáo'),
    ];

    return AppShell(
      navItems: navItems,
      child: IndexedStack(
        index: ref.watch(currentScreenIndexProvider),
        children: screens,
      ),
    );
  }
}
