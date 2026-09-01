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
    final isWide = MediaQuery.of(context).size.width > 600;
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

// ─── Mobile Layout (Scrollable Bottom Tab Bar) ──────────────────────────
class _MobileShell extends ConsumerWidget {
  final Widget child;
  const _MobileShell({required this.child});

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
      bottomNavigationBar: _ScrollableTabBar(
        items: navItems,
        selectedIndex: safeIndex,
        color: moduleColor,
        onSelected: (i) => context.go(navItems[i].path),
      ),
    );
  }
}

/// Thanh tab cuộn ngang — bọc để cuộn được hết các tab module trên màn hình
/// hẹp, giống cách KanPosVN Nhà Thuốc hiển thị đủ tab.
class _ScrollableTabBar extends StatelessWidget {
  final List<NavItem> items;
  final int selectedIndex;
  final Color color;
  final ValueChanged<int> onSelected;

  const _ScrollableTabBar({
    required this.items,
    required this.selectedIndex,
    required this.color,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.bg800,
        border: Border(top: BorderSide(color: AppTheme.borderColor)),
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Row(
            children: [
              for (var i = 0; i < items.length; i++)
                _TabItem(
                  item: items[i],
                  selected: i == selectedIndex,
                  color: color,
                  onTap: () => onSelected(i),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final NavItem item;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  const _TabItem({
    required this.item,
    required this.selected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              selected ? item.activeIcon : item.icon,
              color: selected ? color : AppTheme.textSecondary,
              size: 22,
            ),
            const SizedBox(height: 2),
            Text(
              item.label,
              style: TextStyle(
                fontSize: 10,
                color: selected ? color : AppTheme.textSecondary,
                fontWeight:
                    selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}