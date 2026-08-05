import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../core/providers.dart';
import '../../core/sync/sync_providers.dart';
import '../../core/router/module_selector_screen.dart';
import '../../core/l10n/translations.dart';
import '../../core/update/update_checker.dart';
import '../../core/update/update_providers.dart';
import '../../core/update/update_service.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authServiceProvider);
    final syncEngine = ref.watch(syncEngineProvider);
    final update = ref.watch(updateServiceProvider);
    final license = ref.watch(licenseServiceProvider);

    final licenseStatus = license.status;
    final appCode = auth.licenseAppCode;
    final syncAppCode = auth.currentModule?.appCode ?? syncEngine.appCode;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('settings'.tr, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  _SettingsSection(
                    title: 'account'.tr,
                    children: [
                      _SettingsTile(
                        icon: Icons.person,
                        title: auth.user?['full_name'] ?? 'User',
                        subtitle: auth.user?['email'] ?? '',
                      ),
                      _SettingsTile(
                        icon: Icons.security,
                        title: 'role'.tr,
                        subtitle: auth.userRole ?? 'User',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _SettingsSection(
                    title: 'current_module'.tr,
                    children: [
                      _SettingsTile(
                        icon: auth.currentModule?.icon ?? Icons.store,
                        title: auth.currentModule?.label ?? 'Chưa chọn',
                        subtitle: 'tap_to_change_module'.tr,
                        onTap: () {
                          ref.read(selectedModuleProvider.notifier).state = null;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _SettingsSection(
                    title: 'sync'.tr,
                    children: [
                      _SettingsTile(
                        icon: syncEngine.isSyncing ? Icons.cloud_sync : Icons.cloud_done,
                        title: syncEngine.isSyncing ? 'Đang đồng bộ...' : 'sync_data'.tr,
                        subtitle: syncEngine.lastSyncStatus,
                        onTap: syncEngine.isSyncing ? null : () => _showSyncDialog(context, ref),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _SettingsSection(
                    title: 'Cập nhật & License',
                    children: [
                      _SettingsTile(
                        icon: licenseStatus?.valid == true
                            ? Icons.verified
                            : Icons.gpp_maybe,
                        title: licenseStatus?.valid == true
                            ? 'License hợp lệ'
                            : 'License',
                        subtitle: licenseStatus == null
                            ? (license.error ?? 'Chạm để kiểm tra license')
                            : licenseStatus.valid
                                ? '${licenseStatus.plan} · còn ${licenseStatus.daysLeft} ngày'
                                : (licenseStatus.message.isNotEmpty
                                    ? licenseStatus.message
                                    : 'Chưa có license'),
                        onTap: license.isChecking
                            ? null
                            : () => _checkLicense(context, ref, appCode),
                      ),
                      _SettingsTile(
                        icon: update.isChecking
                            ? Icons.cloud_sync
                            : Icons.system_update,
                        title: update.isChecking
                            ? 'Đang kiểm tra...'
                            : 'Kiểm tra cập nhật',
                        subtitle: update.error ??
                            (update.latest != null
                                ? (isVersionNewer(update.latest!.version,
                                        UpdateService.currentVersion)
                                    ? 'Có bản mới v${update.latest!.version}'
                                    : 'Đang dùng phiên bản mới nhất')
                                : 'Kiểm tra phiên bản mới từ server'),
                        onTap: update.isChecking
                            ? null
                            : () => _checkUpdate(context, ref, syncAppCode),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _SettingsSection(
                    title: 'other'.tr,
                    children: [
                      _SettingsTile(
                        icon: Icons.info_outline,
                        title: 'version'.tr,
                        subtitle: 'KanPosVN v${UpdateService.currentVersion}',
                      ),
                      _SettingsTile(
                        icon: Icons.logout,
                        title: 'logout'.tr,
                        subtitle: 'logout_confirm'.tr,
                        onTap: () async {
                          final confirmed = await showDialog<bool>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('logout'.tr),
                              content: Text('logout_confirm'.tr),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text('cancel'.tr)),
                                TextButton(onPressed: () => Navigator.pop(ctx, true),
                                  child: Text('logout'.tr, style: TextStyle(color: AppColors.danger))),
                              ],
                            ),
                          );
                          if (confirmed == true && context.mounted) {
                            ref.read(selectedModuleProvider.notifier).state = null;
                            await auth.signOut();
                          }
                        },
                        titleColor: AppColors.danger,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _checkUpdate(
      BuildContext context, WidgetRef ref, String appCode) async {
    final update = ref.read(updateServiceProvider);
    final latest = await update.checkForUpdate(appCode: appCode);
    if (!context.mounted) return;
    if (latest == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(update.error ?? 'Không có phản hồi từ server')),
      );
      return;
    }
    if (isVersionNewer(latest.version, UpdateService.currentVersion)) {
      await showUpdateDialog(context, latest);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bạn đang dùng phiên bản mới nhất')),
      );
    }
  }

  Future<void> _checkLicense(
      BuildContext context, WidgetRef ref, String appCode) async {
    final license = ref.read(licenseServiceProvider);
    final token = ref.read(authServiceProvider).token;
    if (token == null || token.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng đăng nhập trước')),
      );
      return;
    }
    final status = await license.check(token: token, appCode: appCode);
    if (!context.mounted) return;
    if (status == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(license.error ?? 'Không có phản hồi từ server')),
      );
      return;
    }
    if (!status.valid) {
      await showLicenseDialog(context, status);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('License hợp lệ · còn ${status.daysLeft} ngày')),
      );
    }
  }

  void _showSyncDialog(BuildContext context, WidgetRef ref) {
    final engine = ref.read(syncEngineProvider);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Đồng bộ dữ liệu'),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(engine.lastSyncStatus),
              const SizedBox(height: 8),
              if (engine.syncLogs.isNotEmpty) ...[
                const Text('Lịch sử:', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: engine.syncLogs.length,
                    itemBuilder: (_, i) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      child: Text(engine.syncLogs[i], style: const TextStyle(fontSize: 11)),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('cancel'.tr)),
          ElevatedButton(
            onPressed: engine.isSyncing ? null : () {
              engine.triggerSync();
            },
            child: Text(engine.isSyncing ? 'Đang đồng bộ...' : 'sync_button'.tr),
          ),
        ],
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SettingsSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
        const SizedBox(height: 8),
        Card(child: Column(children: children)),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Color? titleColor;
  const _SettingsTile({required this.icon, required this.title,
    required this.subtitle, this.onTap, this.titleColor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textMuted, size: 20),
      title: Text(title, style: TextStyle(
        color: titleColor, fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      trailing: onTap != null ? const Icon(Icons.chevron_right, size: 18) : null,
      onTap: onTap,
    );
  }
}
