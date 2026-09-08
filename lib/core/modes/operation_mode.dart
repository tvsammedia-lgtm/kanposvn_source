import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Chế độ vận hành của app: Online (mặc định) / Offline.
///
/// - **Online**: đăng nhập qua Cloud (Admin Web), đồng bộ dữ liệu 2 chiều.
/// - **Offline**: thao tác cục bộ trên Isar, đăng nhập bằng tài khoản nội bộ
///   đã được Owner tạo trước đó; dữ liệu được đồng bộ lại khi có internet.
enum AppOperationMode { online, offline }

extension AppOperationModeX on AppOperationMode {
  String get label => this == AppOperationMode.online ? 'Online' : 'Offline';
}

const _kOperationModeKey = 'app_operation_mode';

/// Hiện tại đang chạy chế độ nào. Mặc định Online.
/// Được `LoginScreen` cập nhật khi người dùng chọn chế độ đăng nhập.
final appOperationModeProvider = StateProvider<AppOperationMode>((ref) {
  return AppOperationMode.online;
});

/// Lưu chế độ đã chọn để khôi phục lần mở app sau.
Future<void> saveOperationMode(AppOperationMode mode) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_kOperationModeKey, mode.name);
}

/// Khôi phục chế độ đã lưu (mặc định Online).
Future<AppOperationMode> loadOperationMode() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kOperationModeKey);
    for (final mode in AppOperationMode.values) {
      if (mode.name == raw) return mode;
    }
  } catch (_) {
    // ignore prefs errors
  }
  return AppOperationMode.online;
}