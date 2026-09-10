import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../config/account_config.dart';

/// Abstraction cho lưu token/session. [InMemoryTokenStore] dùng cho test;
/// app thật dùng [SecureTokenStore] (flutter_secure_storage).
abstract class TokenStore {
  Future<String?> read(String key);
  Future<void> write(String key, String value);
  Future<void> delete(String key);
}

class InMemoryTokenStore implements TokenStore {
  final Map<String, String> _store = {};
  @override
  Future<String?> read(String key) async => _store[key];
  @override
  Future<void> write(String key, String value) async => _store[key] = value;
  @override
  Future<void> delete(String key) async => _store.remove(key);
}

class SecureTokenStore implements TokenStore {
  const SecureTokenStore([this._storage = const FlutterSecureStorage()]);
  final FlutterSecureStorage _storage;
  @override
  Future<String?> read(String key) => _storage.read(key: key);
  @override
  Future<void> write(String key, String value) => _storage.write(key: key, value: value);
  @override
  Future<void> delete(String key) => _storage.delete(key: key);
}

/// Kết quả đăng nhập từ AuthService (không phụ thuộc UI).
class AccountSession {
  final bool success;
  final String? accessToken;
  final String? refreshToken;
  final String? userIdentifier;
  final String? role;
  final String? error;
  const AccountSession({
    required this.success,
    this.accessToken,
    this.refreshToken,
    this.userIdentifier,
    this.role,
    this.error,
  });
}

/// AuthService hybrid: đăng nhập qua cloud online (Vercel) hoặc local (localhost).
class AccountAuthService {
  final TokenStore _store;
  final http.Client _http;
  final String localAppCode;

  /// Store hiện tại (SecureTokenStore trên app thật, InMemory khi test).
  TokenStore get tokenStore => _store;

  AccountAuthService({
    TokenStore? store,
    http.Client? httpClient,
    this.localAppCode = AccountConfig.localAppCode,
  })  : _store = store ?? InMemoryTokenStore(),
        _http = httpClient ?? http.Client();

  /// Giải mã payload JWT (base64) chỉ để đọc role — KHÔNG verify chữ ký.
  static Map<String, dynamic>? decodeJwtPayload(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;
      final normalized = base64Url.normalize(parts[1]);
      final decoded = utf8.decode(base64Url.decode(normalized));
      return jsonDecode(decoded) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }

  /// Đăng nhập hybrid:
  ///  - online:  POST {AccountConfig.onlineLoginUrl} (phone/email + password).
  ///  - offline: POST {AccountConfig.offlineLoginUrl} (username + password + app_code).
  ///  - auto:    thử online trước; nếu fail/mất mạng thì thử offline local.
  Future<AccountSession> login(String username, String password) async {
    switch (AccountConfig.defaultMode) {
      case AccountServerMode.online:
        return _tryLogin(_loginOnline, username, password);
      case AccountServerMode.offline:
        return _tryLogin(_loginOffline, username, password);
      case AccountServerMode.auto:
        final online = await _tryLogin(_loginOnline, username, password);
        if (online.success) return online;
        final offline = await _tryLogin(_loginOffline, username, password);
        if (offline.success) {
          return AccountSession(
            success: true,
            accessToken: offline.accessToken,
            refreshToken: offline.refreshToken,
            userIdentifier: offline.userIdentifier,
            role: offline.role,
            error: 'offline',
          );
        }
        return online;
    }
  }

  Future<AccountSession> _tryLogin(
    Future<AccountSession> Function(String, String) fn,
    String username,
    String password,
  ) async {
    try {
      return await fn(username, password);
    } catch (_) {
      return const AccountSession(
        success: false,
        error: 'Không thể kết nối server.',
      );
    }
  }

  Future<AccountSession> _loginOnline(String username, String password) async {
    final body = <String, dynamic>{'password': password};
    if (username.contains('@')) {
      body['email'] = username.trim();
    } else {
      body['phone'] = username.trim();
    }
    final response = await _http
        .post(
          Uri.parse(AccountConfig.onlineLoginUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(body),
        )
        .timeout(AccountConfig.timeout);
    if (response.statusCode != 200) {
      return _sessionFromJsonError(username, response.bodyBytes);
    }
    final json = _decodeBody(response.bodyBytes);
    final token = json?['token'];
    final role = json?['user']?['role']?.toString() ?? 'user';
    if (token is! String || token.isEmpty) {
      return const AccountSession(success: false, error: 'Server trả token rỗng.');
    }
    await _persist(username, token, null, role, 'online');
    return AccountSession(
      success: true,
      accessToken: token,
      userIdentifier: username,
      role: role,
    );
  }

  Future<AccountSession> _loginOffline(String username, String password) async {
    // Đăng nhập local qua Admin Web chạy trên máy này (localhost:3000) — giao
    // thức y hệt online (email/phone + password → {token, user}), chỉ khác base
    // URL. Không còn dùng protocol riêng của Express + SQLite.
    final body = <String, dynamic>{'password': password};
    if (username.contains('@')) {
      body['email'] = username.trim();
    } else {
      body['phone'] = username.trim();
    }
    final response = await _http
        .post(
          Uri.parse(AccountConfig.offlineLoginUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(body),
        )
        .timeout(AccountConfig.timeout);
    if (response.statusCode != 200) {
      return _sessionFromJsonError(username, response.bodyBytes);
    }
    final json = _decodeBody(response.bodyBytes);
    final token = json?['token'];
    final role = json?['user']?['role']?.toString() ?? 'user';
    if (token is! String || token.isEmpty) {
      return const AccountSession(success: false, error: 'Server trả token rỗng.');
    }
    await _persist(username, token, null, role, 'offline');
    return AccountSession(
      success: true,
      accessToken: token,
      userIdentifier: username,
      role: role,
    );
  }

  AccountSession _sessionFromJsonError(String username, List<int> bodyBytes) {
    final json = _decodeBody(bodyBytes);
    final msg = json?['error']?.toString() ??
        json?['message']?.toString() ??
        'Đăng nhập thất bại.';
    return AccountSession(success: false, userIdentifier: username, error: msg);
  }

  Map<String, dynamic>? _decodeBody(List<int> bodyBytes) {
    try {
      final decoded = jsonDecode(utf8.decode(bodyBytes));
      return decoded is Map<String, dynamic> ? decoded : null;
    } catch (_) {
      return null;
    }
  }

  Future<void> _persist(
    String username,
    String accessToken,
    String? refreshToken,
    String role,
    String source,
  ) async {
    await _store.write('access_token', accessToken);
    if (refreshToken != null && refreshToken.isNotEmpty) {
      await _store.write('refresh_token', refreshToken);
    }
    await _store.write('current_user', username);
    await _store.write('current_role', role);
    await _store.write('login_source', source);
  }

  Future<String?> getAccessToken() => _store.read('access_token');

  Future<String?> getCurrentUser() => _store.read('current_user');

  Future<String?> getCurrentRole() async {
    final storedRole = await _store.read('current_role');
    if (storedRole != null && storedRole.isNotEmpty) return storedRole;
    final token = await _store.read('access_token');
    return decodeJwtPayload(token ?? '')?['role']?.toString();
  }

  /// Nguồn đăng nhập hiện tại: 'online' (cloud) hoặc 'offline' (local).
  Future<String?> getLoginSource() => _store.read('login_source');

  Future<void> logout() async {
    await _store.delete('access_token');
    await _store.delete('refresh_token');
    await _store.delete('current_user');
    await _store.delete('current_role');
    await _store.delete('login_source');
  }
}