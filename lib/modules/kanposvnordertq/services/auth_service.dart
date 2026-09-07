import 'dart:convert';

/// Abstraction for token persistence. Tests use [InMemoryTokenStore];
/// the real app can swap in a SharedPreferences/file-backed implementation.
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

/// Lightweight AuthService that persists tokens via [TokenStore].
class AuthService {
  final TokenStore _store;

  AuthService({TokenStore? store}) : _store = store ?? InMemoryTokenStore();

  /// Mock login — returns JWT-like tokens (access + refresh) on success.
  Future<bool> login(String username, String password) async {
    // TODO: Replace with real API call to Vercel backend
    await Future.delayed(const Duration(milliseconds: 200));

    // Simple role mapping from username
    final role = switch (username) {
      'admin' => 'ADMIN',
      'staff' => 'STAFF',
      'driver' => 'DRIVER',
      'customer' => 'CUSTOMER',
      _ => null,
    };
    if (role == null) return false;

    final payload = utf8.encode(jsonEncode({
      'sub': username,
      'role': role,
      'customer_id': username == 'customer' ? 'cust_nam_01' : null,
    }));
    final accessToken = 'mock_${base64Url.encode(payload)}';
    final refreshToken = 'mock_refresh_${username}_${DateTime.now().millisecondsSinceEpoch}';

    await _store.write('access_token', accessToken);
    await _store.write('refresh_token', refreshToken);
    await _store.write('current_user', username);
    await _store.write('current_role', role);
    return true;
  }

  Future<String?> getAccessToken() => _store.read('access_token');

  Future<String?> getCurrentUser() => _store.read('current_user');

  Future<String?> getCurrentRole() => _store.read('current_role');

  Future<void> logout() async {
    await _store.delete('access_token');
    await _store.delete('refresh_token');
    await _store.delete('current_user');
    await _store.delete('current_role');
  }
}
