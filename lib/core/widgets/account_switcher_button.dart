import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

import '../auth/auth_service.dart';
import '../module_enum.dart';
import '../providers.dart';
import '../router/module_selector_screen.dart';
import '../router/branch_selector_screen.dart';
import '../sync/api_config.dart';
import '../sync/sync_providers.dart';
import '../../modules/kanposvngara/providers/gara_providers.dart';
import '../../modules/kanposvnbida/providers/bida_providers.dart';
import '../../modules/kanposvnkhachsan/providers/hotel_providers.dart';
import '../../modules/kanposvnnhathuoc/providers/nhathuoc_providers.dart';
import '../../modules/kanposvnpawn/providers/isar_provider.dart';
import '../../modules/kanposvnspa/providers/spa_providers.dart';

/// Nút "Đổi tài khoản" ở góc phải màn hình: hiển thị tài khoản hiện tại và mở
/// menu để chuyển module/chi nhánh (owner có nhiều chi nhánh) hoặc đăng xuất.
///
/// Với module có nhiều chi nhánh (mô hình 1 module = nhiều chi nhánh), menu
/// liệt kê trực tiếp từng chi nhánh (vd: GARA THIÊN KIM 01, 02) để chuyển nhanh;
/// bấm vào tên module sẽ mở màn hình chọn chi nhánh đầy đủ.
class AccountSwitcherButton extends ConsumerStatefulWidget {
  const AccountSwitcherButton({super.key, this.foregroundColor, this.child});

  /// Màu chữ/icon trên nền AppBar. Mặc định: màu chữ mặc định của theme.
  final Color? foregroundColor;

  /// Nút mở menu tùy chỉnh. Nếu không truyền sẽ dùng chip mặc định hiển thị
  /// tên tài khoản.
  final Widget? child;

  @override
  ConsumerState<AccountSwitcherButton> createState() => _AccountSwitcherButtonState();
}

class _AccountSwitcherButtonState extends ConsumerState<AccountSwitcherButton> {
  /// app_code => danh sách chi nhánh (cache để menu hiển thị chi nhánh inline).
  final Map<String, List<Map<String, dynamic>>> _branchesByCode = {};
  final Set<String> _requested = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _maybeLoadBranches();
  }

  @override
  void didUpdateWidget(covariant AccountSwitcherButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _maybeLoadBranches();
  }

  /// Nạp danh sách chi nhánh của các module user được truy cập (best-effort).
  void _maybeLoadBranches() {
    final auth = ref.read(authServiceProvider);
    final accessible = auth.accessibleModules;
    if (accessible.isEmpty) return;
    for (final module in accessible) {
      if (_requested.contains(module.appCode)) continue;
      _requested.add(module.appCode);
      _loadBranches(module);
    }
  }

  Future<void> _loadBranches(AppModule module) async {
    try {
      final branches =
          await ref.read(authServiceProvider).fetchBranches(module.appCode);
      if (!mounted) return;
      setState(() => _branchesByCode[module.appCode] = branches);
    } catch (_) {
      if (!mounted) return;
      setState(() => _branchesByCode[module.appCode] = []);
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authServiceProvider);
    final accessible = auth.accessibleModules;
    final fg = widget.foregroundColor ?? Theme.of(context).colorScheme.onSurface;
    final ownBranchId = auth.branchId;
    final hasBranchesAnywhere =
        accessible.any((m) => (_branchesByCode[m.appCode] ?? []).isNotEmpty);

    return PopupMenuButton<String>(
      tooltip: 'Đổi tài khoản',
      offset: const Offset(0, 46),
      onSelected: (value) {
        if (value == 'logout') {
          _signOut(context, ref);
        } else if (value.startsWith('branch:')) {
          final parts = value.substring('branch:'.length).split(':');
          if (parts.length != 2) return;
          final appCode = parts[0];
          final branchId = parts[1];
          final module = accessible.where((m) => m.appCode == appCode).firstOrNull;
          final branches = _branchesByCode[appCode] ?? const [];
          final branch = branches
              .where((b) => b['id']?.toString() == branchId)
              .firstOrNull;
          if (module != null && branch != null) {
            _switchToBranch(context, ref, module, branch);
          }
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
        if (accessible.length > 1 || hasBranchesAnywhere) ...[
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
          for (final module in accessible) ..._buildModuleEntries(
            context: context,
            module: module,
            branches: _branchesByCode[module.appCode],
            ownBranchId: ownBranchId,
            currentModule: auth.currentModule,
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
      child: widget.child ??
          Container(
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

  /// Danh sách entry của 1 module: nếu module có chi nhánh thì liệt kê chi
  /// nhánh inline (bấm để chuyển ngay), kèm mục module để mở màn hình chọn đầy đủ.
  List<PopupMenuEntry<String>> _buildModuleEntries({
    required BuildContext context,
    required AppModule module,
    required List<Map<String, dynamic>>? branches,
    required String? ownBranchId,
    required AppModule? currentModule,
  }) {
    final hasBranch = branches != null && branches.isNotEmpty;
    final entries = <PopupMenuEntry<String>>[];

    entries.add(
      PopupMenuItem<String>(
        value: 'module:${module.appCode}',
        height: 40,
        child: Row(
          children: [
            Icon(module.icon, size: 20, color: module.color),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                module.label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: hasBranch ? FontWeight.w700 : FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (hasBranch)
              Icon(Icons.chevron_right,
                  size: 20, color: Theme.of(context).colorScheme.onSurfaceVariant)
            else if (module == currentModule)
              Icon(
                Icons.check,
                size: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
          ],
        ),
      ),
    );

    if (hasBranch) {
      for (final branch in branches) {
        final branchId = branch['id']?.toString() ?? '';
        final name = branch['name']?.toString() ?? '';
        final code = branch['branch_code']?.toString() ?? '';
        final isCurrent = branchId.isNotEmpty && branchId == ownBranchId;
        entries.add(
          PopupMenuItem<String>(
            value: 'branch:${module.appCode}:$branchId',
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Icon(
                    isCurrent
                        ? Icons.radio_button_checked
                        : Icons.storefront_outlined,
                    size: 18,
                    color: isCurrent
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        color: isCurrent
                            ? Theme.of(context).colorScheme.primary
                            : null,
                        fontWeight:
                            isCurrent ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                  ),
                  if (code.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 1),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        code,
                        style: TextStyle(
                          fontSize: 10,
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      }
    }

    return entries;
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

      // Mô hình 1 module = nhiều chi nhánh: module có chi nhánh → hiện màn hình
      // chọn chi nhánh để chuyển (giống luồng sau login), KHÔNG vào shell ngay.
      final branches = await auth.fetchBranches(module.appCode);
      if (branches.isNotEmpty) {
        // Đặt branch selector và bỏ shell hiện tại để main.dart render
        // BranchSelectorScreen (thứ tự: ưu tiên selectedModule trước).
        ref.read(selectedModuleProvider.notifier).state = null;
        ref.read(branchSelectorModuleProvider.notifier).state = module;
        return;
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

  /// Chuyển thẳng đến một chi nhánh được chọn từ menu (không qua màn hình chọn).
  Future<void> _switchToBranch(
    BuildContext context,
    WidgetRef ref,
    AppModule module,
    Map<String, dynamic> branch,
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
      await auth.selectBranch(branch);

      await _triggerBranchSync(ref, module);

      // Re-mount shell: selectedModule null rồi set lại để cập nhật ngay.
      ref.read(selectedModuleProvider.notifier).state = null;
      ref.read(selectedModuleProvider.notifier).state = module;
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  /// Đồng bộ dữ liệu chi nhánh Gara hiện tại từ Neon rồi nạp lại các provider.
  Future<void> syncCurrentGaraBranchData(WidgetRef ref) async {
    try {
      final auth = ref.read(authServiceProvider);
      await ref.read(garaNeonSyncServiceProvider).triggerSync(
            ApiConfig.baseUrl,
            ApiConfig.syncApiKey,
            branchId: auth.branchId,
          );
    } catch (_) {
      // Best-effort: không làm hỏng việc chuyển chi nhánh nếu đồng bộ lỗi mạng.
    }
    if (!mounted) return;
    ref.read(garaCustomersProvider.notifier).loadCustomers();
    ref.read(garaVehiclesProvider.notifier).loadVehicles();
    ref.read(garaProductsProvider.notifier).loadProducts();
    ref.read(garaOrdersProvider.notifier).loadOrders();
    ref.read(garaSuppliersProvider.notifier).loadSuppliers();
    ref.read(garaInventoryProvider.notifier).loadTransactions();
    ref.read(garaFinanceProvider.notifier).loadTransactions();
  }

  /// Kích hoạt đồng bộ theo CHI NHÁNH (giống kanposvnvlxd/kanposvngara) cho từng
  /// module khi chuyển chi nhánh qua Account Switcher. Best-effort: lỗi mạng
  /// không làm hỏng việc chuyển chi nhánh.
  Future<void> _triggerBranchSync(WidgetRef ref, AppModule module) async {
    try {
      final branchId = ref.read(authServiceProvider).branchId;
      switch (module.appCode) {
        case 'kanposvncafe':
        case 'nhansu':
          ref.read(syncEngineProvider).triggerSync();
          break;
        case 'kanposvngara':
          unawaited(syncCurrentGaraBranchData(ref));
          break;
        case 'kanposvnvlxd':
          unawaited(ref.read(syncEngineProvider).triggerSync(branchId: branchId));
          break;
        case 'kanposvnbida':
          unawaited(ref.read(bidaNeonSyncServiceProvider).triggerSync(
            ApiConfig.baseUrl, ApiConfig.syncApiKey, branchId: branchId));
          break;
        case 'kanposvnkhachsan':
          unawaited(ref.read(hotelNeonSyncServiceProvider).triggerSync(
            ApiConfig.baseUrl, ApiConfig.syncApiKey, branchId: branchId));
          break;
        case 'kanposvnnhathuoc':
          unawaited(ref.read(nhathuocNeonSyncServiceProvider).triggerSync(
            ApiConfig.baseUrl, ApiConfig.syncApiKey, branchId: branchId));
          break;
        case 'kanposvnpawn':
          unawaited(ref.read(pawnNeonSyncServiceProvider).triggerSync(
            ApiConfig.baseUrl, ApiConfig.syncApiKey, branchId: branchId));
          break;
        case 'kanposvnspa':
          unawaited(ref.read(spaNeonSyncServiceProvider).triggerSync(
            ApiConfig.baseUrl, ApiConfig.syncApiKey, branchId: branchId));
          break;
      }
    } catch (_) {
      // Best-effort
    }
  }

  Future<void> _signOut(BuildContext context, WidgetRef ref) async {
    ref.read(selectedModuleProvider.notifier).state = null;
    await ref.read(authServiceProvider).signOut();
  }
}