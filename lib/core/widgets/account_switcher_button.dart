import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/auth_service.dart';
import '../module_enum.dart';
import '../providers.dart';
import '../router/module_selector_screen.dart';
import '../sync/sync_providers.dart';

/// Nút "Đổi tài khoản" ở góc phải màn hình: hiển thị tài khoản hiện tại và mở
/// menu để chuyển module (nhân viên nội bộ được vào nhiều module) hoặc đăng xuất.
class AccountSwitcherButton extends ConsumerWidget {
  const AccountSwitcherButton({super.key, this.foregroundColor});

  /// Màu chữ/icon trên nền AppBar. Mặc định: màu chữ mặc định của theme.
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authServiceProvider);
    final accessible = auth.accessibleModules;
    final fg = foregroundColor ?? Theme.of(context).colorScheme.onSurface;

    return PopupMenuButton<String>(
      tooltip: 'Đổi tài khoản',
      offset: const Offset(0, 46),
      onSelected: (value) {
        if (value == 'logout') {
          _signOut(context, ref);
        } else if (value.startsWith('module:')) {
          final appCode = value.substring('module:'.length);
          for (final module in accessible) {
            if (module.appCode == appCode) {
              _switchModule(context, ref, module);
              break;
            }
          }
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem<String>(
          enabled: false,
          height: 56,
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: (auth.currentModule?.color ??
                        Theme.of(context).colorScheme.primary)
                    .withValues(alpha: 0.15),
                child: Text(
                  auth.displayName.isNotEmpty
                      ? auth.displayName[0].toUpperCase()
                      : 'U',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: auth.currentModule?.color ??
                        Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      auth.displayName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _roleLabel(auth),
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (accessible.length > 1) ...[
          const PopupMenuDivider(),
          PopupMenuItem<String>(
            enabled: false,
            height: 28,
            child: Text(
              'Chuyển module',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          for (final module in accessible)
            PopupMenuItem<String>(
              value: 'module:${module.appCode}',
              child: Row(
                children: [
                  Icon(module.icon, size: 20, color: module.color),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      module.label,
                      style: const TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (module == auth.currentModule)
                    Icon(
                      Icons.check,
                      size: 18,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                ],
              ),
            ),
        ],
        const PopupMenuDivider(),
        PopupMenuItem<String>(
          value: 'logout',
          child: Row(
            children: [
              Icon(
                Icons.logout,
                size: 20,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(width: 12),
              const Text('Đổi tài khoản', style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ],
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: fg.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.person, size: 16, color: fg),
            const SizedBox(width: 6),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: Text(
                auth.displayName,
                style: TextStyle(
                  fontSize: 13,
                  color: fg,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 2),
            Icon(Icons.arrow_drop_down, size: 18, color: fg),
          ],
        ),
      ),
    );
  }

  String _roleLabel(AuthService auth) {
    if (auth.isEmployeeLogin) {
      return auth.employeeRole ?? 'Nhân viên';
    }
    if (auth.isStoreUser) return 'Chủ cửa hàng';
    return auth.userRole ?? 'Tài khoản';
  }

  Future<void> _switchModule(
    BuildContext context,
    WidgetRef ref,
    AppModule module,
  ) async {
    try {
      final auth = ref.read(authServiceProvider);
      final db = ref.read(databaseServiceProvider);

      if (!auth.canLoginTo(module)) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                auth.errorMessage ?? 'Bạn không có quyền truy cập module này',
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }

      if (auth.isStoreUser && auth.storeId != null) {
        await db.initStore(storeId: auth.storeId!, module: module);
      } else {
        await db.init(module: module);
      }

      await auth.switchModule(module);

      if (module.appCode == 'kanposvncafe' || module.appCode == 'nhansu') {
        ref.read(syncEngineProvider).triggerSync();
      }

      // Đặt selectedModule để main.dart render shell của module mới.
      ref.read(selectedModuleProvider.notifier).state = module;
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _signOut(BuildContext context, WidgetRef ref) async {
    ref.read(selectedModuleProvider.notifier).state = null;
    await ref.read(authServiceProvider).signOut();
  }
}
