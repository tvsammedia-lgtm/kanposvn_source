import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../license/license_service.dart';
import '../providers.dart';
import 'update_providers.dart';
import 'update_service.dart';

/// Bọc quanh màn hình chính: sau khi vào app sẽ tự kiểm tra
/// phiên bản mới + trạng thái license, hiện dialog nếu cần.
class UpdateAndLicenseChecker extends ConsumerStatefulWidget {
  final Widget child;
  final String appCode;

  const UpdateAndLicenseChecker({
    super.key,
    required this.child,
    required this.appCode,
  });

  @override
  ConsumerState<UpdateAndLicenseChecker> createState() =>
      _UpdateAndLicenseCheckerState();
}

class _UpdateAndLicenseCheckerState
    extends ConsumerState<UpdateAndLicenseChecker> {
  bool _checked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _runChecks());
  }

  Future<void> _runChecks() async {
    if (_checked || !mounted) return;
    _checked = true;

    final update = ref.read(updateServiceProvider);
    await update.checkForUpdate(appCode: widget.appCode);
    if (!mounted) return;

    final latest = update.latest;
    if (latest != null &&
        isVersionNewer(latest.version, UpdateService.currentVersion)) {
      await showUpdateDialog(context, latest);
      if (!mounted) return;
    }

    final token = ref.read(authServiceProvider).token;
    if (token == null || token.isEmpty) return;

    final auth = ref.read(authServiceProvider);
    final license = ref.read(licenseServiceProvider);
    await license.check(token: token, appCode: auth.licenseAppCode);
    if (!mounted) return;

    final status = license.status;
    if (status != null && !status.valid) {
      await showLicenseDialog(context, status);
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

/// Dialog thông báo có phiên bản mới kèm nút tải APK.
Future<void> showUpdateDialog(BuildContext context, AppRelease release) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (ctx) => AlertDialog(
      icon: const Icon(Icons.system_update_alt, size: 40, color: Colors.teal),
      title: Text('Có phiên bản mới v${release.version}'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (release.name.isNotEmpty) ...[
              Text(release.name,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
            ],
            if (release.body.isNotEmpty)
              Text(release.body, style: const TextStyle(fontSize: 13)),
            if (release.body.isEmpty)
              const Text(
                'Bản cập nhật mới đã có. Vui lòng tải xuống để nâng cấp.',
                style: TextStyle(fontSize: 13),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: const Text('Để sau'),
        ),
        FilledButton(
          onPressed: () async {
            final url = release.downloadUrl;
            if (url.isEmpty) {
              Navigator.pop(ctx);
              return;
            }
            await launchUrl(
              Uri.parse(url),
              mode: LaunchMode.externalApplication,
            );
            if (ctx.mounted) Navigator.pop(ctx);
          },
          child: const Text('Tải bản mới'),
        ),
      ],
    ),
  );
}

/// Dialog cảnh báo khi license không hợp lệ / hết hạn.
Future<void> showLicenseDialog(BuildContext context, LicenseStatus status) {
  return showDialog<void>(
    context: context,
    builder: (ctx) => AlertDialog(
      icon: const Icon(Icons.error_outline, color: Colors.orange, size: 40),
      title: const Text('License cần chú ý'),
      content: Text(
        status.message.isEmpty
            ? 'License không hợp lệ. Vui lòng đăng ký hoặc gia hạn trên Zalo Mini App.'
            : status.message,
      ),
      actions: [
        FilledButton(
          onPressed: () => Navigator.pop(ctx),
          child: const Text('Đóng'),
        ),
      ],
    ),
  );
}
