import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../module_enum.dart';
import '../sync/api_config.dart';

class AuthService extends ChangeNotifier {
  Map<String, dynamic>? _user;
  Map<String, dynamic>? get user => _user;

  String? _token;
  String? get token => _token;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  set errorMessage(String? value) { _errorMessage = value; notifyListeners(); }

  bool get isAuthenticated => _token != null && _user != null;

  List<Map<String, dynamic>> _permissions = [];
  List<Map<String, dynamic>> get permissions => List.unmodifiable(_permissions);

  AppModule? _currentModule;
  AppModule? get currentModule => _currentModule;

  String? _currentAppCode;
  String? get currentAppCode => _currentAppCode;

  AuthService();

  Future<bool> signIn({required String email, required String password, AppModule? module}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      final url = '${ApiConfig.baseUrl}/api/auth/login';
      final body = <String, dynamic>{'email': email, 'password': password};
      if (module != null) body['app_code'] = module.appCode;
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      ).timeout(ApiConfig.timeout);
      debugPrint('LOGIN: status=${response.statusCode}');
      final bodyStr = utf8.decode(response.bodyBytes);
      final data = jsonDecode(bodyStr);
      if (response.statusCode == 200) {
        _token = data['token'];
        _user = data['user'];
        _permissions = List<Map<String, dynamic>>.from(data['permissions'] ?? []);
        if (module != null) {
          _currentModule = module;
          _currentAppCode = module.appCode;
        } else {
          _currentAppCode = null;
          _currentModule = null;
        }
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = data['error'] ?? data['message'] ?? 'Đăng nhập thất bại (${response.statusCode})';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      debugPrint('LOGIN ERROR: $e');
      _errorMessage = 'Không thể kết nối Admin Web. Vui lòng kiểm tra kết nối mạng hoặc liên hệ Admin.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  AppModule? findMatchingModule() {
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
    final role = userRole;
    return role == 'Admin' || role == 'Manager';
  }

  bool get isAdmin => userRole == 'Admin';

  bool hasPermission(String permissionKey) {
    return _permissions.any((p) => p['permission_key'] == permissionKey && p['granted'] == true);
  }

  bool canLoginTo(AppModule module) {
    return _permissions.any((p) =>
      p['app_code'] == module.appCode && p['can_login'] == true
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
      _errorMessage = 'Tài khoản không có quyền truy cập module "${module.label}". Vui lòng chọn module khác.';
      notifyListeners();
      return false;
    }
    _currentModule = module;
    _currentAppCode = module.appCode;
    notifyListeners();
    return true;
  }

  Future<void> signOut() async {
    _token = null;
    _user = null;
    _permissions = [];
    _currentModule = null;
    _currentAppCode = null;
    notifyListeners();
  }

  Future<String?> loadSavedAppCode() async => null;
}
