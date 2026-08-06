import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_info.dart';

/// AuthService của module HR Payroll – đấu vào backend kanposvn
/// (kanposvn-admin.vercel.app), appCode = kanposvnhrpayroll.
class AuthService {
  static AuthService? _instance;
  AuthService._();
  static AuthService get instance => _instance ??= AuthService._();

  static const _apiBaseUrl = 'https://kanposvn-admin.vercel.app';
  static const _appCode = 'kanposvnhrpayroll';
  static const _prefToken = 'auth_token';
  static const _prefUser = 'auth_user';
  static const _prefStoreId = 'auth_store_id';
  static const _prefStoreName = 'auth_store_name';
  static const _prefStorePhone = 'auth_store_phone';

  String _token = '';
  UserInfo? _user;
  String? _storeId;
  String? _storeName;
  String? _storePhone;

  String get token => _token;
  UserInfo? get user => _user;
  bool get isLoggedIn => _token.isNotEmpty;

  /// Store ID của cửa hàng (dùng để gắn nhãn dữ liệu khi sync).
  String? get storeId => _storeId;
  String? get storeName => _storeName;
  String? get storePhone => _storePhone;

  Future<String?> login(String email, String password) async {
    try {
      final uri = Uri.parse('$_apiBaseUrl/api/auth/login');
      final resp = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          'app_code': _appCode,
        }),
      ).timeout(const Duration(seconds: 10));

      final bodyStr = utf8.decode(resp.bodyBytes);
      final data = jsonDecode(bodyStr);

      if (resp.statusCode == 200) {
        _token = data['token']?.toString() ?? '';
        if (_token.isEmpty) return 'Khong nhan duoc token tu server';

        final userData = data['user'];
        if (userData is Map<String, dynamic>) {
          _user = UserInfo(
            id: userData['id']?.toString() ?? '',
            email: userData['email']?.toString() ?? email,
            name: userData['name']?.toString() ?? '',
            role: null,
          );
        } else {
          _user = UserInfo(id: '', email: email, name: email);
        }

        final perms = data['permissions'];
        if (perms is List) {
          final appPerm = perms.cast<Map<String, dynamic>>().firstWhere(
                (p) => p['app_code'] == _appCode,
                orElse: () => {},
              );
          if (appPerm.isNotEmpty) {
            _user = UserInfo(
              id: _user!.id,
              email: _user!.email,
              name: _user!.name,
              role: appPerm['role_name']?.toString(),
            );
          }
        }

        _storeId = data['storeId']?.toString() ?? data['store_id']?.toString();
        _storeName = data['storeName']?.toString() ?? data['store_name']?.toString();
        _storePhone =
            data['storePhone']?.toString() ?? data['store_phone']?.toString();

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(_prefToken, _token);
        await prefs.setString(_prefUser, jsonEncode(_user!.toJson()));
        if (_storeId != null) await prefs.setString(_prefStoreId, _storeId!);
        if (_storeName != null) await prefs.setString(_prefStoreName, _storeName!);
        if (_storePhone != null) {
          await prefs.setString(_prefStorePhone, _storePhone!);
        }
        return null;
      } else {
        return data['error']?.toString() ??
            data['message']?.toString() ??
            'Dang nhap that bai (${resp.statusCode})';
      }
    } catch (e) {
      return 'Loi ket noi: vui long kiem tra internet va thu lai';
    }
  }

  Future<void> logout() async {
    _token = '';
    _user = null;
    _storeId = null;
    _storeName = null;
    _storePhone = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefToken);
    await prefs.remove(_prefUser);
    await prefs.remove(_prefStoreId);
    await prefs.remove(_prefStoreName);
    await prefs.remove(_prefStorePhone);
  }

  Map<String, String> get authHeaders => {
        'Content-Type': 'application/json',
        if (_token.isNotEmpty) 'Authorization': 'Bearer $_token',
      };
}
