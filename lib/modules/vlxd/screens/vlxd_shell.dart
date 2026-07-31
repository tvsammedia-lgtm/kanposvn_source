import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/l10n/translations.dart';
import '../../../core/widgets/app_shell.dart';
import 'vlxd_dashboard.dart';
import 'vlxd_products_screen.dart';
import 'vlxd_pos_screen.dart';
import 'vlxd_inventory_screen.dart';
import 'vlxd_reports_screen.dart';

class VlxdShell extends ConsumerWidget {
  const VlxdShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navItems = [
      NavItem(icon: Icons.dashboard_rounded, label: 'dashboard'.tr),
      NavItem(icon: Icons.inventory_2_rounded, label: 'products'.tr),
      NavItem(icon: Icons.point_of_sale_rounded, label: 'sales'.tr),
      NavItem(icon: Icons.warehouse_rounded, label: 'stock'.tr),
      NavItem(icon: Icons.assessment_rounded, label: 'reports'.tr),
    ];

    final screens = [
      const VlxdDashboard(),
      const VlxdProductsScreen(),
      const VlxdPosScreen(),
      const VlxdInventoryScreen(),
      const VlxdReportsScreen(),
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
