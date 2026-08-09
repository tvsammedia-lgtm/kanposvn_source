import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../module_enum.dart';
import '../theme/app_colors.dart';
import '../providers.dart';
import '../l10n/translations.dart';
import '../sync/sync_providers.dart';

final selectedModuleProvider = StateProvider<AppModule?>((ref) => null);

class ModuleSelectorScreen extends ConsumerStatefulWidget {
  const ModuleSelectorScreen({super.key});

  @override
  ConsumerState<ModuleSelectorScreen> createState() => _ModuleSelectorScreenState();
}

class _ModuleSelectorScreenState extends ConsumerState<ModuleSelectorScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authServiceProvider);
    final accessible = auth.accessibleModules;

    return Scaffold(
      backgroundColor: AppColors.sidebarBg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.store_mall_directory, size: 64, color: AppColors.primaryLight),
            const SizedBox(height: 16),
            Text('KanPosVN',
              style: TextStyle(color: AppColors.textLight, fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('${'hello'.tr}, ${auth.user?['full_name'] ?? 'User'}',
              style: TextStyle(color: AppColors.textMuted, fontSize: 16)),
            const SizedBox(height: 32),
            if (accessible.isEmpty) ...[
              Icon(Icons.lock_outline, size: 48, color: AppColors.textMuted),
              const SizedBox(height: 12),
              Text('no_access'.tr,
                style: TextStyle(color: AppColors.textMuted, fontSize: 14)),
              Text('contact_admin'.tr,
                style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
            ] else ...[
              Text('select_module'.tr,
                style: TextStyle(color: AppColors.textMuted, fontSize: 14)),
              const SizedBox(height: 24),
              Wrap(
                spacing: 16, runSpacing: 16,
                alignment: WrapAlignment.center,
                children: accessible.map((module) => _InstanceCard(
                  module: module,
                  role: auth.getRoleFor(module),
                  onTap: () => _selectModule(context, module),
                )).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _selectModule(BuildContext context, AppModule module) async {
    try {
      final auth = ref.read(authServiceProvider);
      final db = ref.read(databaseServiceProvider);

      final canAccess = await auth.switchModule(module);
      if (!canAccess) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(auth.errorMessage ?? 'Bạn không có quyền truy cập module này'),
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
      ref.read(selectedModuleProvider.notifier).state = module;

      if (module.appCode == 'kanposvncafe' || module.appCode == 'nhansu') {
        ref.read(syncEngineProvider).triggerSync();
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }
}

class _InstanceCard extends StatelessWidget {
  final AppModule module;
  final String role;
  final VoidCallback onTap;

  const _InstanceCard({required this.module, required this.role, required this.onTap});

  Color get _roleColor {
    switch (role) {
      case 'Admin': return AppColors.danger;
      case 'Manager': return AppColors.warning;
      case 'Staff': return AppColors.info;
      default: return AppColors.textMuted;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200, height: 180,
        decoration: BoxDecoration(
          color: AppColors.sidebarActive,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: module.color.withValues(alpha: 0.3), width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 56, height: 56,
              decoration: BoxDecoration(
                color: module.color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(module.icon, color: module.color, size: 28),
            ),
            const SizedBox(height: 12),
            Text(module.label,
              style: TextStyle(color: AppColors.textLight, fontSize: 15, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: _roleColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(role,
                style: TextStyle(color: _roleColor, fontSize: 11, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}
