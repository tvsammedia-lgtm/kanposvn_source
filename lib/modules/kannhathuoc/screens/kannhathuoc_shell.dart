import 'package:flutter/material.dart';
import '../../../core/l10n/translations.dart';
import '../../../core/widgets/app_shell.dart';
import '../../../core/theme/app_colors.dart';
import 'kannhathuoc_dashboard.dart';
import 'kannhathuoc_pos_screen.dart';
import 'kannhathuoc_stock_screen.dart';
import 'kannhathuoc_patients_screen.dart';
import 'kannhathuoc_financial_screen.dart';

class NhaThuocShell extends StatefulWidget {
  const NhaThuocShell({super.key});

  @override
  State<NhaThuocShell> createState() => _NhaThuocShellState();
}

class _NhaThuocShellState extends State<NhaThuocShell> {
  int _currentIndex = 0;

  static const _screens = [
    NhaThuocDashboard(),
    NhaThuocPosScreen(),
    NhaThuocStockScreen(),
    NhaThuocPatientsScreen(),
    NhaThuocFinancialScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    final navItems = [
      NavItem(icon: Icons.dashboard_rounded, label: 'dashboard'.tr),
      NavItem(icon: Icons.point_of_sale_rounded, label: 'pos'.tr),
      NavItem(icon: Icons.inventory_2_rounded, label: 'stock'.tr),
      NavItem(icon: Icons.people_rounded, label: 'patients'.tr),
      NavItem(icon: Icons.account_balance_rounded, label: 'financial'.tr),
    ];

    if (isMobile) {
      return Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) => setState(() => _currentIndex = index),
          backgroundColor: AppColors.surface,
          indicatorColor: AppColors.primary.withOpacity(0.15),
          height: 64,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: navItems
              .map((item) => NavigationDestination(
                    icon: Icon(item.icon, color: AppColors.textMuted, size: 22),
                    selectedIcon: Icon(item.icon, color: AppColors.primary, size: 22),
                    label: item.label,
                  ))
              .toList(),
        ),
      );
    }

    return AppShell(
      navItems: navItems,
      child: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
    );
  }
}
