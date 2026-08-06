import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/employee_auth.dart';
import '../../../core/db/database_service.dart';
import '../../../core/providers.dart';
import '../../../core/theme/app_colors.dart';
import '../cafe_tab_defs.dart';
import '../providers/cafe_providers.dart';
import '../services/cafe_permission_service.dart';

/// Màn hình phân quyền tab theo role (Cấp 2) cho shell kanposvncafe.
///
/// Chỉ Owner/Manager được phép cấu hình. Owner & Manager luôn thấy toàn bộ tab.
class CafePermissionScreen extends ConsumerStatefulWidget {
  const CafePermissionScreen({super.key});

  @override
  ConsumerState<CafePermissionScreen> createState() =>
      _CafePermissionScreenState();
}

class _CafePermissionScreenState extends ConsumerState<CafePermissionScreen> {
  Map<String, Set<String>> _draft = {};

  /// Các tab được phép cấu hình (không cho cấu hình tab quản trị/điều hành).
  List<CafeTabDef> get _configurableTabs => cafeTabDefs
      .where((t) => t.id != 'permissions' && t.id != 'employees')
      .toList();

  @override
  void initState() {
    super.initState();
    _draft = CafePermissionService.load(DatabaseService.instance);
  }

  Future<void> _save() async {
    await ref
        .read(cafeTabPermissionsProvider.notifier)
        .save(DatabaseService.instance, _draft);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã lưu phân quyền')),
      );
    }
  }

  void _toggle(String role, String tabId, bool selected) {
    setState(() {
      final ids = {...(_draft[role] ?? const {})};
      if (selected) {
        ids.add(tabId);
      } else {
        ids.remove(tabId);
      }
      _draft[role] = ids;
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authServiceProvider);
    if (!auth.isManager) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text('Bạn không có quyền phân quyền'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: const Text('Phân quyền tab'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.info.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: AppColors.info, size: 18),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Owner & Manager luôn thấy toàn bộ tab. Tích chọn các tab được phép cho từng role.',
                    style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _RoleCard(
            title: 'Owner',
            subtitle: 'Toàn bộ tab',
            color: AppColors.primary,
            icon: Icons.storefront,
            locked: true,
            children: _configurableTabs
                .map((t) => _chip(t.label, true, null))
                .toList(),
          ),
          const SizedBox(height: 12),
          _RoleCard(
            title: EmployeeRoles.manager,
            subtitle: 'Toàn bộ tab',
            color: AppColors.primary,
            icon: Icons.admin_panel_settings,
            locked: true,
            children: _configurableTabs
                .map((t) => _chip(t.label, true, null))
                .toList(),
          ),
          for (final role in _employeeRoles) ...[
            const SizedBox(height: 12),
            _buildRoleEditor(role),
          ],
          const SizedBox(height: 80),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: _save,
        icon: const Icon(Icons.save_outlined),
        label: const Text('Lưu'),
      ),
    );
  }

  List<String> get _employeeRoles => [
        EmployeeRoles.sale,
        EmployeeRoles.cashier,
        EmployeeRoles.warehouse,
        EmployeeRoles.accountant,
      ];

  Widget _buildRoleEditor(String role) {
    final allowed = _draft[role] ?? const <String>{};
    final color = _roleColor(role);
    return _RoleCard(
      title: role,
      subtitle: '${allowed.length}/${_configurableTabs.length} tab được phép',
      color: color,
      icon: Icons.person,
      children: _configurableTabs
          .map(
            (t) => _chip(
              t.label,
              allowed.contains(t.id),
              () => _toggle(role, t.id, !allowed.contains(t.id)),
            ),
          )
          .toList(),
    );
  }

  Widget _chip(String label, bool selected, VoidCallback? onTap) {
    return FilterChip(
      label: Text(label, style: const TextStyle(fontSize: 12)),
      selected: selected,
      onSelected: onTap == null ? null : (_) => onTap(),
      selectedColor: AppColors.primary.withValues(alpha: 0.15),
      checkmarkColor: AppColors.primary,
      labelStyle: TextStyle(
        fontSize: 12,
        color: selected ? AppColors.primary : AppColors.textSecondary,
      ),
      side: BorderSide(
        color: selected ? AppColors.primary : AppColors.border,
      ),
      visualDensity: VisualDensity.compact,
    );
  }

  Color _roleColor(String role) {
    switch (role) {
      case EmployeeRoles.cashier:
        return AppColors.success;
      case EmployeeRoles.sale:
        return AppColors.warning;
      case EmployeeRoles.warehouse:
        return AppColors.info;
      case EmployeeRoles.accountant:
        return AppColors.accent;
      default:
        return AppColors.textSecondary;
    }
  }
}

class _RoleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final IconData icon;
  final bool locked;
  final List<Widget> children;

  const _RoleCard({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.icon,
    this.locked = false,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundColor: color.withValues(alpha: 0.15),
                  child: Icon(icon, size: 16, color: color),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                if (locked)
                  const Icon(
                    Icons.lock_outline,
                    size: 16,
                    color: AppColors.textMuted,
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: children,
            ),
          ],
        ),
      ),
    );
  }
}
