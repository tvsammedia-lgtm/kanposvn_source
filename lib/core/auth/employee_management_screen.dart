import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';
import '../theme/app_colors.dart';
import 'employee_auth.dart';

/// Một tab (tab bar) trong module — dùng để Owner check/uncheck quyền sử dụng
/// tab của từng nhân viên (đặc biệt là nhân viên Bán hàng).
class EmployeeTabOption {
  final String id;
  final String label;

  const EmployeeTabOption({required this.id, required this.label});
}

/// Quản lý tài khoản nội bộ (Cấp 2): Manager, Thu ngân, Bán hàng, Kho, Kế toán.
///
/// Chỉ Owner (đăng nhập Cloud) và Manager được phép truy cập.
///
/// Truyền [availableTabs] (danh sách tab của module) để hiển thị phần
/// check/uncheck tab cho từng nhân viên; [roleTabs] (map role -> tab mặc định)
/// để mặc định sẵn đúng các tab theo role khi chưa tùy chỉnh.
class EmployeeManagementScreen extends ConsumerStatefulWidget {
  final List<EmployeeTabOption>? availableTabs;
  final Map<String, Set<String>>? roleTabs;

  const EmployeeManagementScreen({
    super.key,
    this.availableTabs,
    this.roleTabs,
  });

  @override
  ConsumerState<EmployeeManagementScreen> createState() =>
      _EmployeeManagementScreenState();
}

class _EmployeeManagementScreenState
    extends ConsumerState<EmployeeManagementScreen> {
  List<EmployeeAccount> _employees = [];
  bool _loading = true;
  String? _error;

  String? get _storeId => ref.read(authServiceProvider).storeId;

  String get _storeAppCode {
    final auth = ref.read(authServiceProvider);
    // Tài khoản nội bộ được tạo theo MODULE đang mở: mỗi module có danh sách
    // "Quản lý nhân viên" riêng. Nhân viên chỉ login được vào module nào mà
    // Owner đã tạo user local cho họ ở đây.
    return auth.currentModule?.appCode ??
        auth.storeAppCode ??
        auth.defaultStoreModule.appCode;
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    final storeId = _storeId;
    if (storeId == null) {
      setState(() {
        _loading = false;
        _error = 'Không xác định được cửa hàng';
      });
      return;
    }
    try {
      final employees = await EmployeeAuthService.getEmployees(
        storeId: storeId,
        storeAppCode: _storeAppCode,
      );
      if (!mounted) return;
      setState(() {
        _employees = employees;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = 'Lỗi tải danh sách nhân viên: $e';
      });
    }
  }

  Future<void> _save(EmployeeAccount account) async {
    final storeId = _storeId;
    if (storeId == null) return;
    final error = await EmployeeAuthService.saveEmployee(
      storeId: storeId,
      storeAppCode: _storeAppCode,
      employee: account,
    );
    if (error != null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        );
      }
      return;
    }
    await _load();
  }

  Future<void> _delete(EmployeeAccount account) async {
    final storeId = _storeId;
    if (storeId == null) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.warning_amber, color: AppColors.danger),
        title: const Text('Xóa tài khoản'),
        content: Text(
          'Xóa tài khoản "${account.fullName} (${account.username})"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Hủy'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppColors.danger),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await EmployeeAuthService.deleteEmployee(
      storeId: storeId,
      storeAppCode: _storeAppCode,
      employeeId: account.id,
    );
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authServiceProvider);

    if (!auth.isManager) {
      return const Center(
        child: Text('Bạn không có quyền quản lý nhân viên'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Quản lý nhân viên'),
            Text(
              'Module: ${auth.currentModule?.label ?? _storeAppCode}',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: () => _showEmployeeDialog(context, null),
        icon: const Icon(Icons.person_add),
        label: const Text('Thêm nhân viên'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, color: AppColors.danger, size: 40),
              const SizedBox(height: 12),
              Text(_error!, textAlign: TextAlign.center),
            ],
          ),
        ),
      );
    }
    if (_employees.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.badge_outlined,
              color: AppColors.textMuted,
              size: 56,
            ),
            const SizedBox(height: 12),
            const Text(
              'Chưa có tài khoản nhân viên',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Nhấn "Thêm nhân viên" để tạo tài khoản cho Manager, Thu ngân, Bán hàng...',
              style: TextStyle(color: AppColors.textMuted, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _employees.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final emp = _employees[index];
        return _EmployeeCard(
          employee: emp,
          onEdit: () => _showEmployeeDialog(context, emp),
          onDelete: () => _delete(emp),
          onToggleStatus: () => _save(
            EmployeeAccount(
              id: emp.id,
              storeId: emp.storeId,
              username: emp.username,
              password: emp.password,
              fullName: emp.fullName,
              role: emp.role,
              status: !emp.status,
              allowedTabs: emp.allowedTabs,
              createdAt: emp.createdAt,
              updatedAt: DateTime.now(),
            ),
          ),
        );
      },
    );
  }

  void _showEmployeeDialog(BuildContext context, EmployeeAccount? existing) {
    final usernameCtrl = TextEditingController(text: existing?.username ?? '');
    final fullNameCtrl = TextEditingController(text: existing?.fullName ?? '');
    final passwordCtrl = TextEditingController();
    String role = existing?.role ?? EmployeeRoles.sale;
    bool status = existing?.status ?? true;
    final tabs = widget.availableTabs;
    final roleTabs = widget.roleTabs;
    // Các tab được check sẵn: ưu tiên tùy chỉnh riêng của nhân viên, nếu chưa
    // có thì dùng mặc định theo role (hoặc tất cả tab nếu không có roleTabs).
    Set<String> selectedTabs = existing?.allowedTabs != null
        ? Set.of(existing!.allowedTabs!)
        : _defaultTabsForRole(role, tabs: tabs, roleTabs: roleTabs);

    showDialog<void>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) {
          return AlertDialog(
            title: Text(existing == null ? 'Thêm nhân viên' : 'Sửa nhân viên'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: usernameCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Tên đăng nhập',
                      prefixIcon: Icon(Icons.badge_outlined),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: fullNameCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Họ và tên',
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: passwordCtrl,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText:
                          existing == null ? 'Mật khẩu' : 'Mật khẩu mới (để trống giữ nguyên)',
                      prefixIcon: const Icon(Icons.lock_outline),
                    ),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: role,
                    decoration: const InputDecoration(
                      labelText: 'Role',
                      prefixIcon: Icon(Icons.admin_panel_settings_outlined),
                    ),
                    items: EmployeeRoles.all
                        .map((r) => DropdownMenuItem(
                              value: r,
                              child: Text(r),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setDialogState(() {
                          role = value;
                          // Đổi role => reset lại các tab mặc định theo role mới.
                          selectedTabs = existing?.allowedTabs != null
                              ? Set.of(existing!.allowedTabs!)
                              : _defaultTabsForRole(role,
                                  tabs: tabs, roleTabs: roleTabs);
                        });
                      }
                    },
                  ),
                  if (tabs != null && role != EmployeeRoles.manager) ...[
                    const SizedBox(height: 12),
                    const Divider(),
                    Row(
                      children: [
                        const Icon(Icons.tab, size: 18, color: AppColors.primary),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Các tab được phép sử dụng',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        TextButton(
                          onPressed: () => setDialogState(() {
                            selectedTabs = tabs.map((t) => t.id).toSet();
                          }),
                          child: const Text('Chọn tất cả'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    for (final t in tabs)
                      CheckboxListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(t.label, style: const TextStyle(fontSize: 14)),
                        value: selectedTabs.contains(t.id),
                        onChanged: (v) => setDialogState(() {
                          if (v == true) {
                            selectedTabs.add(t.id);
                          } else {
                            selectedTabs.remove(t.id);
                          }
                        }),
                      ),
                  ],
                  const SizedBox(height: 12),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Kích hoạt'),
                    subtitle: const Text('Tắt để khóa tài khoản'),
                    value: status,
                    onChanged: (v) => setDialogState(() => status = v),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Hủy'),
              ),
              FilledButton(
                onPressed: () async {
                  final username = usernameCtrl.text.trim();
                  final fullName = fullNameCtrl.text.trim();
                  final password = passwordCtrl.text;
                  if (username.isEmpty || fullName.isEmpty) {
                    ScaffoldMessenger.of(ctx).showSnackBar(
                      const SnackBar(
                        content: Text('Vui lòng nhập đầy đủ tên đăng nhập và họ tên'),
                      ),
                    );
                    return;
                  }
                  if (existing == null && password.isEmpty) {
                    ScaffoldMessenger.of(ctx).showSnackBar(
                      const SnackBar(content: Text('Vui lòng nhập mật khẩu')),
                    );
                    return;
                  }
                  if (tabs != null && role != EmployeeRoles.manager && selectedTabs.isEmpty) {
                    ScaffoldMessenger.of(ctx).showSnackBar(
                      const SnackBar(
                        content: Text('Vui lòng chọn ít nhất 1 tab cho nhân viên'),
                      ),
                    );
                    return;
                  }
                  Navigator.pop(ctx);
                  await _save(
                    EmployeeAccount(
                      id: existing?.id ?? EmployeeAuthService.generateEmployeeId(),
                      storeId: _storeId ?? '',
                      username: username,
                      password:
                          existing != null && password.isEmpty
                              ? existing.password
                              : password,
                      fullName: fullName,
                      role: role,
                      status: status,
                      allowedTabs: tabs != null && role != EmployeeRoles.manager
                          ? selectedTabs.toList()
                          : existing?.allowedTabs,
                      createdAt: existing?.createdAt,
                      updatedAt: DateTime.now(),
                    ),
                  );
                },
                child: const Text('Lưu'),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Các tab mặc định của một role: dùng theo map [roleTabs] nếu có; ngược lại
  /// cho phép tất cả tab của module.
  Set<String> _defaultTabsForRole(
    String role, {
    List<EmployeeTabOption>? tabs,
    Map<String, Set<String>>? roleTabs,
  }) {
    final defaults = roleTabs?[role];
    if (defaults != null) return Set.of(defaults);
    return tabs?.map((t) => t.id).toSet() ?? <String>{};
  }
}

class _EmployeeCard extends StatelessWidget {
  final EmployeeAccount employee;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onToggleStatus;

  const _EmployeeCard({
    required this.employee,
    required this.onEdit,
    required this.onDelete,
    required this.onToggleStatus,
  });

  Color get _roleColor {
    switch (employee.role) {
      case EmployeeRoles.manager:
        return AppColors.primary;
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

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.border),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _roleColor.withValues(alpha: 0.15),
          child: Icon(Icons.person, color: _roleColor),
        ),
        title: Row(
          children: [
            Flexible(
              child: Text(
                employee.fullName,
                style: const TextStyle(fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: _roleColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                employee.role,
                style: TextStyle(
                  color: _roleColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        subtitle: Text(
          '@${employee.username}${employee.isActive ? '' : '  •  Đã khóa'}',
          style: TextStyle(
            color: employee.isActive ? AppColors.textMuted : AppColors.danger,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                employee.isActive ? Icons.verified_user : Icons.block,
                color: employee.isActive ? AppColors.success : AppColors.danger,
              ),
              tooltip: employee.isActive ? 'Khóa tài khoản' : 'Kích hoạt',
              onPressed: onToggleStatus,
            ),
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: AppColors.danger),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
