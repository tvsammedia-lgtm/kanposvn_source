import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_theme.dart';
import '../../core/router.dart';
import '../../services/hrpayroll_logout.dart';
import '../../../../core/providers.dart';
import '../../../../core/widgets/account_switcher_button.dart';

/// [AppModule.kanposvnhrpayroll] color (bắt buộc khi currentModule chưa có).
const _moduleColor = Color(0xFF0EA5E9);

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;
    if (isWide) {
      return _DesktopShell(child: child);
    }
    return _MobileShell(child: child);
  }
}

/// Shell desktop: tab menu cuộn được giống KanPosVN VLXD
/// (`NavigationRail` + `scrollable: true` + toàn bộ mục trong [navItems]).
class _DesktopShell extends ConsumerWidget {
  final Widget child;
  const _DesktopShell({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).uri.path;
    final selectedIndex = navItems.indexWhere(
      (item) => location.startsWith(item.path),
    );
    final safeIndex = selectedIndex < 0 ? 0 : selectedIndex;
    final moduleColor =
        ref.watch(authServiceProvider).currentModule?.color ?? _moduleColor;

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      appBar: AppBar(
        backgroundColor: moduleColor,
        foregroundColor: Colors.white,
        title: const Text('HR Payroll – Vận tải',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        actions: [
          const AccountSwitcherButton(foregroundColor: Colors.white),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Đăng xuất',
            onPressed: () => performHrPayrollLogout(context, ref),
          ),
        ],
      ),
      body: Row(
        children: [
          // Tab menu cuộn được (copy từ kanposvnvlxd_shell.dart)
          NavigationRail(
            backgroundColor: AppTheme.bg800,
            scrollable: true,
            selectedIndex: safeIndex,
            onDestinationSelected: (index) => context.go(navItems[index].path),
            labelType: NavigationRailLabelType.all,
            destinations: [
              for (final item in navItems)
                NavigationRailDestination(
                  icon: Icon(item.icon),
                  selectedIcon:
                      Icon(item.activeIcon, color: AppTheme.primaryLight),
                  label: Text(item.label),
                ),
            ],
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: ClipRect(child: child),
          ),
        ],
      ),
    );
  }
}

// ─── Mobile Layout (Bottom Nav) ───────────────────────────────────────────
class _MobileShell extends ConsumerWidget {
  final Widget child;
  const _MobileShell({required this.child});

  static const _mobileItems = [
    NavItem(
        path: '/dashboard',
        icon: Icons.dashboard_outlined,
        activeIcon: Icons.dashboard,
        label: 'Home'),
    NavItem(
        path: '/employees',
        icon: Icons.people_outline,
        activeIcon: Icons.people,
        label: 'Nhân sự'),
    NavItem(
        path: '/drivers',
        icon: Icons.local_shipping_outlined,
        activeIcon: Icons.local_shipping,
        label: 'Tài xế'),
    NavItem(
        path: '/payroll',
        icon: Icons.account_balance_wallet_outlined,
        activeIcon: Icons.account_balance_wallet,
        label: 'Lương'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).uri.path;
    final selectedIndex = _mobileItems.indexWhere(
      (item) => location.startsWith(item.path),
    );
    final moduleColor =
        ref.watch(authServiceProvider).currentModule?.color ?? _moduleColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: moduleColor,
        foregroundColor: Colors.white,
        title: const Text('HR Payroll',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        actions: [
          const AccountSwitcherButton(foregroundColor: Colors.white),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Đăng xuất',
            onPressed: () => performHrPayrollLogout(context, ref),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: child,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppTheme.bg800,
          border: Border(top: BorderSide(color: AppTheme.borderColor)),
        ),
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          selectedIndex: selectedIndex < 0 ? 0 : selectedIndex,
          onDestinationSelected: (i) => context.go(_mobileItems[i].path),
          destinations: _mobileItems
              .map((item) => NavigationDestination(
                    icon: Icon(item.icon),
                    selectedIcon: Icon(item.activeIcon,
                        color: AppTheme.primaryLight),
                    label: item.label,
                  ))
              .toList(),
          indicatorColor: AppTheme.primaryBlue.withOpacity(0.2),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          height: 62,
        ),
      ),
    );
  }
}