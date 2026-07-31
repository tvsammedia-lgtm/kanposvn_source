import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/isar_models.dart';
import 'database_service.dart';

class AuthResult {
  final bool success;
  final UserModel? user;
  final String message;
  final bool needConfig;

  AuthResult({required this.success, this.user, required this.message, this.needConfig = false});
}

class AuthService {
  final DatabaseService _db = DatabaseService();
  static const String _appCode = 'kancafetrasua';

  /// Kiểm tra đăng nhập trên Admin Web
  /// Admin Web response:
  /// { "user": { id, name, email }, "permissions": [{ app: "kancafetrasua", role: "User" }] }
  /// Error: { "error": "..." }
  Future<AuthResult> login(String email, String password) async {
    final settings = _db.settings;

    if (settings.vercelApiUrl.isEmpty) {
      return AuthResult(
        success: false,
        message: 'Chưa cấu hình URL Admin Web. Vào Cấu hình Cloud để nhập URL API.',
        needConfig: true,
      );
    }

    try {
      final response = await http.post(
        Uri.parse('${settings.vercelApiUrl}/auth/login'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${settings.vercelApiKey}',
        },
        body: jsonEncode({'email': email, 'password': password}),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Admin Web error: { "error": "..." }
        if (data['error'] != null) {
          return AuthResult(success: false, message: data['error']);
        }

        // Admin Web success: { "user": {...}, "permissions": [...] }
        final userData = data['user'];
        final permissions = data['permissions'] as List?;

        if (userData == null) {
          return AuthResult(success: false, message: 'Phản hồi không hợp lệ từ Admin Web.');
        }

        // Check app permission
        if (permissions != null) {
          final hasAccess = permissions.any(
            (p) => p['app'] == _appCode && (p['role'] as String?)?.isNotEmpty == true,
          );
          if (!hasAccess) {
            final appName = permissions.map((p) => p['app']).join(', ');
            return AuthResult(
              success: false,
              message: 'Tài khoản không có quyền sử dụng ứng dụng này.\n'
                  'Quyền hiện tại: ${appName.isEmpty ? "Không có" : appName}',
            );
          }
        }

        final user = UserModel(
          id: userData['id'].toString(),
          username: userData['email'] ?? email,
          fullName: userData['name'] ?? userData['fullName'] ?? email,
          role: _parseRole(permissions),
          isActive: true,
        );

        return AuthResult(success: true, user: user, message: 'Đăng nhập thành công!');
      }

      if (response.statusCode == 401) {
        return AuthResult(success: false, message: 'Sai tài khoản hoặc mật khẩu. Liên hệ Admin để sử dụng phần mềm.');
      }
      return AuthResult(success: false, message: 'Admin Web trả lỗi HTTP ${response.statusCode}.');
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Không thể kết nối Admin Web.\nURL: ${settings.vercelApiUrl}\nVào Cấu hình Cloud để cập nhật.',
      );
    }
  }

  UserRole _parseRole(List? permissions) {
    if (permissions == null || permissions.isEmpty) return UserRole.cashier;

    for (var p in permissions) {
      if (p['app'] == _appCode) {
        final roleStr = (p['role'] ?? '').toString().toLowerCase();
        for (var r in UserRole.values) {
          if (r.name.toLowerCase() == roleStr) return r;
        }
        // Default mapping for common role names
        if (roleStr == 'user') return UserRole.cashier;
        if (roleStr == 'admin') return UserRole.admin;
        if (roleStr == 'manager' || roleStr == 'quản lý') return UserRole.manager;
      }
    }
    return UserRole.cashier;
  }
}
