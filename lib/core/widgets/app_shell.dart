import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_colors.dart';
import '../providers.dart';
import '../router/module_selector_screen.dart';

final currentScreenIndexProvider = StateProvider<int>((ref) => 0);

class AppShell extends ConsumerWidget {
  final Widget child;
  final List<NavItem> navItems;

  const AppShell({super.key, required this.child, required this.navItems});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentScreenIndexProvider);
    final auth = ref.watch(authServiceProvider);
    final module = auth.currentModule;

    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 240,
            decoration: BoxDecoration(
              color: AppColors.sidebarBg,
              border: Border(right: BorderSide(color: AppColors.border.withValues(alpha: 0.1))),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 40, height: 40,
                        decoration: BoxDecoration(
                          color: (module?.color ?? AppColors.primary).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(module?.icon ?? Icons.store,
                          color: module?.color ?? AppColors.primary, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          module?.label ?? 'KanPosVN',
                          style: const TextStyle(color: AppColors.textLight,
                            fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.white10, height: 1),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    itemCount: navItems.length,
                    itemBuilder: (context, index) {
                      final item = navItems[index];
                      final isActive = index == currentIndex;
                      return ListTile(
                        leading: Icon(item.icon,
                          color: isActive ? AppColors.primaryLight : AppColors.textMuted, size: 20),
                        title: Text(item.label,
                          style: TextStyle(
                            color: isActive ? AppColors.textLight : AppColors.textMuted,
                            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                            fontSize: 13,
                          ),
                        ),
                        selected: isActive,
                        selectedTileColor: AppColors.primary.withValues(alpha: 0.1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                        onTap: () {
                          ref.read(currentScreenIndexProvider.notifier).state = index;
                        },
                      );
                    },
                  ),
                ),
                const Divider(color: Colors.white10, height: 1),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.primary.withValues(alpha: 0.2),
                        child: Text(
                          (auth.user?['full_name'] ?? 'U')[0].toUpperCase(),
                          style: const TextStyle(color: AppColors.primaryLight, fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(auth.user?['full_name'] ?? 'User',
                              style: const TextStyle(color: AppColors.textLight, fontSize: 12),
                              overflow: TextOverflow.ellipsis),
                            Text(auth.userRole ?? 'User',
                              style: const TextStyle(color: AppColors.textMuted, fontSize: 10)),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.logout, color: AppColors.textMuted, size: 18),
                        onPressed: () async {
                          final confirmed = await showDialog<bool>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Đăng xuất'),
                              content: const Text('Bạn có chắc muốn đăng xuất?'),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Hủy')),
                                TextButton(onPressed: () => Navigator.pop(ctx, true),
                                  child: const Text('Đăng xuất', style: TextStyle(color: AppColors.danger))),
                              ],
                            ),
                          );
                          if (confirmed == true && context.mounted) {
                            ref.read(selectedModuleProvider.notifier).state = null;
                            await auth.signOut();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class NavItem {
  final IconData icon;
  final String label;
  const NavItem({required this.icon, required this.label});
}
