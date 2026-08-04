import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../module_enum.dart';
import '../sync/api_config.dart';

class AuthService extends ChangeNotifier {
  static const _kTokenKey = 'auth_token';
  static const _kUserKey = 'auth_user';
  static const _kPermissionsKey = 'auth_permissions';
  static const _kCurrentAppCodeKey = 'auth_current_app_code';

  final http.Client _client = http.Client();

  Map<String, dynamic>? _user;
  Map<String, dynamic>? get user => _user;

  String? _token;
  String? get token => _token;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  set errorMessage(String? value) {
    _errorMessage = value;
    notifyListeners();
  }

  bool get isAuthenticated => _token != null && _user != null;

  List<Map<String, dynamic>> _permissions = [];
  List<Map<String, dynamic>> get permissions => List.unmodifiable(_permissions);

  AppModule? _currentModule;
  AppModule? get currentModule => _currentModule;

  String? _currentAppCode;
  String? get currentAppCode => _currentAppCode;

  AuthService();

  Future<bool> signIn({
    required String email,
    required String password,
    AppModule? module,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      final url = '${ApiConfig.baseUrl}/api/auth/login';
      final body = <String, dynamic>{'email': email, 'password': password};
      if (module != null) body['app_code'] = module.appCode;
      final response = await _client
          .post(
            Uri.parse(url),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(body),
          )
          .timeout(ApiConfig.timeout);
      // login status: ${response.statusCode}
      final bodyStr = utf8.decode(response.bodyBytes);
      final data = jsonDecode(bodyStr);
      if (response.statusCode == 200) {
        _token = data['token'];
        _user = data['user'];
        _permissions = List<Map<String, dynamic>>.from(
          data['permissions'] ?? [],
        );
        if (module != null) {
          _currentModule = module;
          _currentAppCode = module.appCode;
        } else {
          _currentAppCode = null;
          _currentModule = null;
        }
        await _persistSession();
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage =
            data['error'] ??
            data['message'] ??
            'Đăng nhập thất bại (${response.statusCode})';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      // ignore login error
      _errorMessage =
          'Không thể kết nối Admin Web. Vui lòng kiểm tra kết nối mạng hoặc liên hệ Admin.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> warmUp() async {
    try {
      await _client
          .get(Uri.parse('${ApiConfig.baseUrl}/api/health'))
          .timeout(const Duration(seconds: 3));
    } catch (e) {
      // ignore warm-up errors
    }
  }

  AppModule? findMatchingModule() {
    if (_currentModule != null && canLoginTo(_currentModule!)) {
      return _currentModule;
    }
    final accessible = accessibleModules;
    if (accessible.length == 1) return accessible.first;
    return null;
  }

  String? get userRole {
    if (_user == null || _currentAppCode == null) return null;
    final perm = _permissions.firstWhere(
      (p) => p['app_code'] == _currentAppCode,
      orElse: () => {},
    );
    return perm['role_name']?.toString();
  }

  bool get isManager {
    if (isCurrentUserAdmin) return true;
    final role = userRole;
    return role == 'Admin' || role == 'Manager';
  }

  bool get isAdmin {
    if (isCurrentUserAdmin) return true;
    return userRole == 'Admin';
  }

  bool get isCurrentUserAdmin {
    if (_user == null) return false;
    final userRole = _user?['role']?.toString();
    final userEmail = _user?['email']?.toString();
    return userRole == 'admin' || userEmail == 'admin@kanposvn.com';
  }

  bool hasPermission(String permissionKey) {
    return _permissions.any(
      (p) => p['permission_key'] == permissionKey && p['granted'] == true,
    );
  }

  bool canLoginTo(AppModule module) {
    return _permissions.any(
      (p) => p['app_code'] == module.appCode && p['can_login'] == true,
    );
  }

  String getRoleFor(AppModule module) {
    final perm = _permissions.firstWhere(
      (p) => p['app_code'] == module.appCode,
      orElse: () => {},
    );
    return perm['role_name']?.toString() ?? '';
  }

  List<AppModule> get accessibleModules {
    return AppModule.values.where((m) => canLoginTo(m)).toList();
  }

  Future<bool> switchModule(AppModule module) async {
    if (!canLoginTo(module)) {
      _errorMessage =
          'Tài khoản không có quyền truy cập module "${module.label}". Vui lòng chọn module khác.';
      notifyListeners();
      return false;
    }
    _currentModule = module;
    _currentAppCode = module.appCode;
    await _persistSession();
    notifyListeners();
    return true;
  }

  Future<void> signOut() async {
    _token = null;
    _user = null;
    _permissions = [];
    _currentModule = null;
    _currentAppCode = null;
    await _clearSession();
    notifyListeners();
  }

  Future<bool> loadSavedSession() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(_kTokenKey);
      final userJson = prefs.getString(_kUserKey);
      final permissionsJson = prefs.getString(_kPermissionsKey);
      final currentAppCode = prefs.getString(_kCurrentAppCodeKey);

      if (token == null || userJson == null || permissionsJson == null) {
        return false;
      }

      final Map<String, dynamic> savedUser = Map<String, dynamic>.from(
        jsonDecode(userJson),
      );
      final List<dynamic> savedPermissions =
          jsonDecode(permissionsJson) as List<dynamic>;

      _token = token;
      _user = Map<String, dynamic>.from(savedUser);
      _permissions = savedPermissions
          .map((e) => Map<String, dynamic>.from(e as Map<String, dynamic>))
          .toList();
      _currentAppCode = currentAppCode;
      final restoredModule = _currentAppCode != null
          ? _moduleFromAppCode(_currentAppCode!)
          : null;
      _currentModule = restoredModule != null && canLoginTo(restoredModule)
          ? restoredModule
          : null;
      notifyListeners();
      return isAuthenticated;
    } catch (e) {
      // ignore session load error
      await _clearSession();
      return false;
    }
  }

  Future<void> _persistSession() async {
    if (_token == null || _user == null) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kTokenKey, _token!);
    await prefs.setString(_kUserKey, jsonEncode(_user));
    await prefs.setString(_kPermissionsKey, jsonEncode(_permissions));
    if (_currentAppCode != null) {
      await prefs.setString(_kCurrentAppCodeKey, _currentAppCode!);
    } else {
      await prefs.remove(_kCurrentAppCodeKey);
    }
  }

  Future<void> _clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kTokenKey);
    await prefs.remove(_kUserKey);
    await prefs.remove(_kPermissionsKey);
    await prefs.remove(_kCurrentAppCodeKey);
  }

  AppModule? _moduleFromAppCode(String appCode) {
    for (final module in AppModule.values) {
      if (module.appCode == appCode) return module;
    }
    return null;
  }

  Future<String?> loadSavedAppCode() async => null;
}
