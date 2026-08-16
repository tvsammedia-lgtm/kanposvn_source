import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../module_enum.dart';
import '../theme/app_colors.dart';
import '../providers.dart';
import 'module_selector_screen.dart' show selectedModuleProvider;

/// Module đang chờ chọn CHI NHÁNH (mô hình 1 module = nhiều chi nhánh).
/// main.dart xem provider này để hiển thị BranchSelectorScreen thay cho shell.
final branchSelectorModuleProvider = StateProvider<AppModule?>((ref) => null);

/// Màn hình chọn CHI NHÁNH sau khi vào module (mô hình 1 module = nhiều chi nhánh).
///
/// Luồng: login → chọn module → chọn chi nhánh → vào POS.
/// Danh sách chi nhánh lấy từ `/api/owner/branches?app_code=...` (chỉ những chi
/// nhánh user được phép). Nếu module không có chi nhánh (cửa hàng cũ) thì bỏ qua
/// màn hình này và vào thẳng như trước.
class BranchSelectorScreen extends ConsumerStatefulWidget {
  final AppModule module;

  const BranchSelectorScreen({super.key, required this.module});

  @override
  ConsumerState<BranchSelectorScreen> createState() =>
      _BranchSelectorScreenState();
}

class _BranchSelectorScreenState extends ConsumerState<BranchSelectorScreen> {
  List<Map<String, dynamic>> _branches = [];
  bool _loading = true;
  String? _error;
  String? _selectingBranchId;

  @override
  void initState() {
    super.initState();
    _loadBranches();
  }

  Future<void> _loadBranches() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final auth = ref.read(authServiceProvider);
      final branches = await auth.fetchBranches(widget.module.appCode);
      if (!mounted) return;
      setState(() {
        _branches = branches;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = 'Không tải được danh sách chi nhánh: $e';
      });
    }
  }

  Future<void> _selectBranch(Map<String, dynamic> branch) async {
    if (_selectingBranchId != null) return;
    setState(() => _selectingBranchId = branch['id']?.toString());
    try {
      final auth = ref.read(authServiceProvider);
      await auth.selectBranch(branch);
      // Chọn xong chi nhánh → đặt selectedModule để main.dart vào shell.
      ref.read(branchSelectorModuleProvider.notifier).state = null;
      ref.read(selectedModuleProvider.notifier).state = widget.module;
    } catch (e) {
      if (!mounted) return;
      setState(() => _selectingBranchId = null);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi: $e'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sidebarBg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: AppColors.textLight),
                    onPressed: () {
                      ref.read(branchSelectorModuleProvider.notifier).state = null;
                      Navigator.of(context).maybePop();
                    },
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Chọn chi nhánh',
                          style: TextStyle(
                            color: AppColors.textLight,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )),
                        const SizedBox(height: 2),
                        Text(widget.module.label,
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 13,
                          )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.cloud_off, size: 40, color: AppColors.textMuted),
            const SizedBox(height: 12),
            Text(_error!,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadBranches,
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }
    if (_branches.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.store_mall_directory_outlined,
              size: 40, color: AppColors.textMuted),
            const SizedBox(height: 12),
            Text('Module này chưa có chi nhánh.',
              style: TextStyle(color: AppColors.textMuted, fontSize: 14)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(branchSelectorModuleProvider.notifier).state = null;
                ref.read(selectedModuleProvider.notifier).state = widget.module;
              },
              child: const Text('Vào module'),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      itemCount: _branches.length,
      itemBuilder: (context, index) {
        final branch = _branches[index];
        return _BranchCard(
          branch: branch,
          loading: _selectingBranchId == branch['id']?.toString(),
          onTap: () => _selectBranch(branch),
        );
      },
    );
  }
}

class _BranchCard extends StatelessWidget {
  final Map<String, dynamic> branch;
  final bool loading;
  final VoidCallback onTap;

  const _BranchCard({
    required this.branch,
    this.loading = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final name = branch['name']?.toString() ?? '';
    final code = branch['branch_code']?.toString() ?? '';
    final phone = branch['phone']?.toString() ?? '';
    final address = branch['address']?.toString() ?? '';
    final license = branch['license'] is Map<String, dynamic>
        ? branch['license'] as Map<String, dynamic>
        : null;
    final licenseStatus = license?['status']?.toString() ?? '';
    final expiresAt = license?['expires_at']?.toString() ?? '';

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.sidebarActive,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.border.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: loading
                    ? const Padding(
                        padding: EdgeInsets.all(12),
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.storefront_outlined,
                        color: AppColors.primary, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(name,
                            style: TextStyle(
                              color: AppColors.textLight,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            )),
                        ),
                        if (code.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.info.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(code,
                              style: TextStyle(
                                color: AppColors.info,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              )),
                          ),
                      ],
                    ),
                    if (phone.isNotEmpty || address.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        [phone, address].where((e) => e.isNotEmpty).join(' · '),
                        style: TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 12,
                        ),
                      ),
                    ],
                    if (license != null) ...[
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            licenseStatus == 'active'
                                ? Icons.check_circle
                                : Icons.error_outline,
                            size: 14,
                            color: licenseStatus == 'active'
                                ? AppColors.success
                                : AppColors.warning,
                          ),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              licenseStatus == 'active'
                                  ? 'License đang hoạt động${expiresAt.isNotEmpty ? ' · hết hạn ${_fmtDate(expiresAt)}' : ''}'
                                  : 'License: ${licenseStatus.isEmpty ? 'chưa có' : licenseStatus}',
                              style: TextStyle(
                                color: licenseStatus == 'active'
                                    ? AppColors.success
                                    : AppColors.warning,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right, color: AppColors.textMuted),
            ],
          ),
        ),
      ),
    );
  }

  String _fmtDate(String iso) {
    final dt = DateTime.tryParse(iso);
    if (dt == null) return iso;
    return '${dt.day}/${dt.month}/${dt.year}';
  }
}
