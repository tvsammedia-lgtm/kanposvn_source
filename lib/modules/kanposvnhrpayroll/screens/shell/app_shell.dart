import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/router.dart';
import '../../core/app_theme.dart';
import '../../services/auth_service.dart';

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

// ─── Desktop Layout (NavigationRail) ─────────────────────────────────────
class _DesktopShell extends StatelessWidget {
  final Widget child;
  const _DesktopShell({required this.child});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    final selectedIndex = navItems.indexWhere(
      (item) => location.startsWith(item.path),
    );

    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 220,
            color: AppTheme.bg800,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo area
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppTheme.primaryBlue, AppTheme.accent],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.local_shipping,
                            color: Colors.white, size: 20),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('HR Payroll',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w800)),
                            Text('Vận tải',
                                style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                const SizedBox(height: 8),
                // Nav items
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: navItems.length,
                    itemBuilder: (context, i) {
                      final item = navItems[i];
                      final isActive = selectedIndex == i;
                      return _NavTile(
                        item: item,
                        isActive: isActive,
                        onTap: () => context.go(item.path),
                      );
                    },
                  ),
                ),
                // User info & Logout
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: AppTheme.borderColor)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: AppTheme.primaryBlue.withOpacity(0.2),
                            child: Text(
                              (() {
                                final n = AuthService.instance.user?.name;
                                return (n != null && n.isNotEmpty ? n[0] : 'U').toUpperCase();
                              })(),
                              style: const TextStyle(
                                color: AppTheme.primaryLight,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AuthService.instance.user?.name ?? 'User',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  AuthService.instance.user?.email ?? '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () async {
                            await AuthService.instance.logout();
                            if (context.mounted) context.go('/login');
                          },
                          icon: const Icon(Icons.logout, size: 14),
                          label: const Text('Đăng xuất', style: TextStyle(fontSize: 12)),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppTheme.textMuted,
                            side: const BorderSide(color: AppTheme.borderColor),
                            padding: const EdgeInsets.symmetric(vertical: 6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Content
          const VerticalDivider(width: 1),
          Expanded(
            child: ClipRect(child: child),
          ),
        ],
      ),
    );
  }
}

class _NavTile extends StatefulWidget {
  final NavItem item;
  final bool isActive;
  final VoidCallback onTap;

  const _NavTile({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavTile> createState() => _NavTileState();
}

class _NavTileState extends State<_NavTile> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          color: widget.isActive
              ? AppTheme.primaryBlue.withOpacity(0.2)
              : _hovered
                  ? AppTheme.bg900.withOpacity(0.5)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: widget.isActive
              ? Border.all(color: AppTheme.primaryBlue.withOpacity(0.4))
              : null,
        ),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Icon(
                  widget.isActive ? widget.item.activeIcon : widget.item.icon,
                  size: 18,
                  color: widget.isActive
                      ? AppTheme.primaryLight
                      : AppTheme.textMuted,
                ),
                const SizedBox(width: 10),
                Text(
                  widget.item.label,
                  style: TextStyle(
                    color: widget.isActive
                        ? AppTheme.primaryLight
                        : AppTheme.textSecondary,
                    fontSize: 13,
                    fontWeight: widget.isActive
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
                if (widget.isActive) ...[
                  const Spacer(),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: AppTheme.primaryLight,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Mobile Layout (Bottom Nav) ───────────────────────────────────────────
class _MobileShell extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final selectedIndex = _mobileItems.indexWhere(
      (item) => location.startsWith(item.path),
    );

    return Scaffold(
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
