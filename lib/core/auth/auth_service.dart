import 'dart:async';
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
  static const _kStoreIdKey = 'auth_store_id';
  static const _kStoreNameKey = 'auth_store_name';
  static const _kStorePhoneKey = 'auth_store_phone';
  static const _kOwnerNameKey = 'auth_owner_name';
  static const _kOwnerPhoneKey = 'auth_owner_phone';
  static const _kStoreAppCodeKey = 'auth_store_app_code';
  static const _kTrialKey = 'auth_trial';
  static const _kExpiresAtKey = 'auth_expires_at';
  static const _kEmployeeKey = 'auth_employee';
  static const _kOwnerHasLoggedInKey = 'auth_owner_logged_in';
  /// Thông tin CHI NHÁNH (mô hình Khách hàng → Chi nhánh → License).
  /// Tên chi nhánh là tên cửa hàng HIỂN THỊ trên POS khi in hóa đơn.
  static const _kBranchNameKey = 'auth_branch_name';
  static const _kBranchPhoneKey = 'auth_branch_phone';
  static const _kBranchIdKey = 'auth_branch_id';
  /// Danh sách module của CỬA HÀNG (Owner được cấp quyền) — bền vững, không bị
  /// xóa khi đăng xuất. Login nhân viên quét danh sách này để tìm tài khoản
  /// trong từng module ("Quản lý nhân viên" của module đó).
  static const _kStoreModulesKey = 'auth_store_modules';
  /// Danh sách module nhân viên NỘI BỘ đang đăng nhập được phép vào (các module
  /// mà Owner đã tạo user local cho họ). Riêng cho phiên employee, không ghi đè
  /// lên `_kStoreModulesKey` (danh sách cửa hàng).
  static const _kEmployeeModulesKey = 'auth_employee_modules';

  /// App code dùng cho license của cửa hàng (đăng ký qua Web/Zalo).
  static const String storeLicenseAppCode = 'pos';

  final http.Client _client = http.Client();

  Map<String, dynamic>? _user;
  Map<String, dynamic>? get user => _user;

  /// Tài khoản nội bộ (Cấp 2) đang đăng nhập cục bộ — do Owner tạo.
  Map<String, dynamic>? _employee;
  Map<String, dynamic>? get employee => _employee;

  /// Đang đăng nhập bằng tài khoản nhân viên nội bộ (không phải Cloud).
  bool get isEmployeeLogin => _employee != null;

  String? get employeeUsername => _employee?['username']?.toString();
  String? get employeeFullName => _employee?['fullName']?.toString();

  /// Role nội bộ: Manager / Thu ngân / Bán hàng / Kho / Kế toán.
  String? get employeeRole => _employee?['role']?.toString();

  /// Danh sách tab (tab bar) nhân viên nội bộ được phép sử dụng trong module
  /// đang mở — do Owner check/uncheck trong "Quản lý NV".
  ///
  /// `null` = dùng mặc định theo role; khác `null` = ghi đè chính xác.
  List<String>? get employeeAllowedTabs {
    final raw = _employee?['allowedTabs'];
    if (raw is List) return raw.map((e) => e.toString()).toList();
    return null;
  }

  /// Tên hiển thị của tài khoản đang đăng nhập (employee nội bộ hoặc user Cloud).
  String get displayName {
    if (isEmployeeLogin) {
      final fullName = employeeFullName;
      if (fullName != null && fullName.isNotEmpty) return fullName;
      final username = employeeUsername;
      if (username != null && username.isNotEmpty) return username;
    }
    if (_user != null) {
      final name = _user?['fullName']?.toString() ??
          _user?['name']?.toString();
      if (name != null && name.isNotEmpty) return name;
      final email = _user?['email']?.toString();
      if (email != null && email.isNotEmpty) return email;
      final phone = _user?['phone']?.toString();
      if (phone != null && phone.isNotEmpty) return phone;
    }
    return 'Tài khoản';
  }

  String? _token;
  String? get token => _token;

  String? _storeId;
  String? get storeId => _storeId;

  String? _storeName;
  String? get storeName => _storeName;

  String? _storePhone;
  String? get storePhone => _storePhone;

  bool _isStoreTrial = false;
  bool get isTrial => _isStoreTrial;

  DateTime? _licenseExpiresAt;
  DateTime? get licenseExpiresAt => _licenseExpiresAt;

  /// User đăng ký cửa hàng qua Web/Zalo hoặc tài khoản nội bộ: không cần chọn module/app.
  bool get isStoreUser => _storeId != null;

  String? _storeAppCode;

  /// App code module cửa hàng đã chọn lúc đăng ký (vd: kanposvnvlxd).
  String? get storeAppCode => _storeAppCode;

  /// Các module mà cửa hàng (Owner đăng nhập Cloud) được cấp quyền.
  ///
  /// Dùng cho tài khoản nhân viên (Cấp 2): nhân viên có thể vào NHIỀU module
  /// của cửa hàng, không chỉ module mặc định (`defaultStoreModule`).
  List<AppModule> _storeModules = [];
  List<AppModule> get storeModules => List.unmodifiable(_storeModules);

  /// Module mặc định hiển thị cho cửa hàng (theo ngành đã chọn lúc đăng ký).
  AppModule get defaultStoreModule {
    if (_storeAppCode != null) {
      final m = _moduleFromAppCode(_storeAppCode!);
      if (m != null) return m;
    }
    return AppModule.kanposvncafe;
  }

  /// App code dùng khi kiểm tra license trên server.
  String get licenseAppCode =>
      isStoreUser ? (_storeAppCode ?? storeLicenseAppCode) : (_currentAppCode ?? 'kanposvn');

  String? _branchId;
  String? get branchId => _branchId;

  String? _branchName;
  String? get branchName => _branchName;

  String? _branchPhone;
  String? get branchPhone => _branchPhone;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  set errorMessage(String? value) {
    _errorMessage = value;
    notifyListeners();
  }

  bool get isAuthenticated => (_token != null && _user != null) || _employee != null;

  List<Map<String, dynamic>> _permissions = [];
  List<Map<String, dynamic>> get permissions => List.unmodifiable(_permissions);

  AppModule? _currentModule;
  AppModule? get currentModule => _currentModule;

  String? _currentAppCode;
  String? get currentAppCode => _currentAppCode;

  AuthService();

  Future<bool> signIn({
    required String identifier,
    required String password,
    AppModule? module,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      final url = '${ApiConfig.baseUrl}/api/auth/login';
      final body = <String, dynamic>{'password': password};
      if (identifier.contains('@')) {
        body['email'] = identifier.trim();
      } else {
        body['phone'] = identifier.trim();
      }
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
        _storeId = data['storeId']?.toString();
        _storeName = data['storeName']?.toString();
        _storePhone = data['storePhone']?.toString();
        _storeAppCode = data['appCode']?.toString() ?? data['app_code']?.toString();
        _isStoreTrial = data['trial'] == true;
        _licenseExpiresAt = data['expiresAt'] != null
            ? DateTime.tryParse(data['expiresAt'].toString())
            : null;
        // Cửa hàng: lưu danh sách module Owner được quyền để nhân viên (Cấp 2)
        // vào được nhiều module, không chỉ module mặc định của cửa hàng.
        if (_storeId != null) {
          _storeModules =
              AppModule.values.where((m) => canLoginTo(m)).toList();
        } else {
          _storeModules = [];
        }
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
        unawaited(refreshBranchInfo());
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

  /// Đăng nhập bằng tài khoản nhân viên nội bộ (Cấp 2).
  ///
  /// Chỉ xác thực trong Isar của cửa hàng, KHÔNG gọi Cloud.
  Future<bool> employeeSignIn({
    required String storeId,
    required String storeAppCode,
    required Map<String, dynamic> employee,
    List<String>? moduleAppCodes,
  }) async {
    _token = null;
    _user = null;
    _permissions = [];
    _currentModule = null;
    _currentAppCode = storeAppCode;
    _employee = Map<String, dynamic>.from(employee);
    _storeId = storeId;
    _storeAppCode = storeAppCode;
    _isStoreTrial = false;
    _licenseExpiresAt = null;
    // Nhân viên chỉ được vào các module mà Owner đã tạo user local cho họ trong
    // "Quản lý nhân viên" của module đó. Ưu tiên danh sách module tìm được lúc
    // đăng nhập; fallback về danh sách module employee đã lưu (dữ liệu cũ).
    if (moduleAppCodes != null && moduleAppCodes.isNotEmpty) {
      _storeModules = moduleAppCodes
          .map((c) => _moduleFromAppCode(c))
          .whereType<AppModule>()
          .toList();
    } else {
      final prefs = await SharedPreferences.getInstance();
      var savedCodes = prefs.getStringList(_kEmployeeModulesKey) ?? const [];
      if (savedCodes.isEmpty) {
        savedCodes = prefs.getStringList(_kStoreModulesKey) ?? const [];
      }
      _storeModules = savedCodes
          .map((c) => _moduleFromAppCode(c))
          .whereType<AppModule>()
          .toList();
    }
    await _persistSession();
    notifyListeners();
    return true;
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
    // Tài khoản nội bộ luôn phải đi qua màn hình chọn module trước khi vào
    // bán hàng — không tự chọn/thẳng vào module như tài khoản Cloud.
    if (isEmployeeLogin) return null;
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
    // Owner (chủ cửa hàng) và tài khoản nội bộ Manager có toàn quyền.
    if (isCurrentUserAdmin) return true;
    // Employee nội bộ phải check role TRƯỚC isStoreUser — vì employeeSignIn
    // cũng gán _storeId (nếu check sau thì mọi employee bị coi là Owner).
    if (isEmployeeLogin) return employeeRole == 'Manager';
    if (isStoreUser) return true;
    final role = userRole;
    return role == 'Admin' || role == 'Manager';
  }

  bool get isAdmin {
    if (isCurrentUserAdmin) return true;
    if (isEmployeeLogin) return employeeRole == 'Manager';
    if (isStoreUser) return true;
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

  /// App code cũ (từ hệ thống KanPos cũ / seed) ánh xạ sang module hiện tại.
  static const Map<String, AppModule> _legacyAppCodes = {
    'KANCAFE_ONE': AppModule.kanposvncafe,
    'kanhot_one': AppModule.kanposvnkhachsan,
    'kanvlxd_one': AppModule.kanposvnvlxd,
    'touch_emp': AppModule.nhanSu,
    'touch_admin': AppModule.kanposvncafe,
  };

  bool _matchesAppCode(AppModule module, String? appCode) {
    if (appCode == null) return false;
    if (appCode == module.appCode) return true;
    return _legacyAppCodes[appCode] == module;
  }

  bool canLoginTo(AppModule module) {
    // Tài khoản nội bộ (Cấp 2): vào được các module cửa hàng đã được cấp quyền
    // (nếu có), nếu không thì chỉ module mặc định của cửa hàng.
    if (isEmployeeLogin) {
      if (_storeModules.isNotEmpty) return _storeModules.contains(module);
      return module == defaultStoreModule;
    }
    return _permissions.any(
      (p) =>
          p['can_login'] == true &&
          _matchesAppCode(module, p['app_code']?.toString()),
    );
  }

  String getRoleFor(AppModule module) {
    if (isEmployeeLogin) {
      if (!canLoginTo(module)) return '';
      return employeeRole ?? '';
    }
    final perm = _permissions.firstWhere(
      (p) => _matchesAppCode(module, p['app_code']?.toString()),
      orElse: () => {},
    );
    return perm['role_name']?.toString() ?? '';
  }

  List<AppModule> get accessibleModules {
    // Tài khoản nội bộ: các module cửa hàng được cấp quyền (nhiều module),
    // fallback về đúng 1 module cửa hàng theo app code đã đăng ký.
    if (isEmployeeLogin) {
      if (_storeModules.isNotEmpty) return List.unmodifiable(_storeModules);
      return [defaultStoreModule];
    }
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
    unawaited(refreshBranchInfo());
    return true;
  }

  Future<void> signOut() async {
    _token = null;
    _user = null;
    _permissions = [];
    _employee = null;
    _currentModule = null;
    _currentAppCode = null;
    _storeId = null;
    _storeName = null;
    _storePhone = null;
    _storeAppCode = null;
    _storeModules = [];
    _isStoreTrial = false;
    _licenseExpiresAt = null;
    _branchId = null;
    _branchName = null;
    _branchPhone = null;
    await _clearSession();
    notifyListeners();
    return;
  }

  Future<bool> loadSavedSession() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(_kTokenKey);
      final userJson = prefs.getString(_kUserKey);
      final permissionsJson = prefs.getString(_kPermissionsKey);
      final currentAppCode = prefs.getString(_kCurrentAppCodeKey);

      _storeId = prefs.getString(_kStoreIdKey);
      _storeName = prefs.getString(_kStoreNameKey);
      _storePhone = prefs.getString(_kStorePhoneKey);
      _storeAppCode = prefs.getString(_kStoreAppCodeKey);
      _isStoreTrial = prefs.getBool(_kTrialKey) ?? false;
      final expiresStr = prefs.getString(_kExpiresAtKey);
      _licenseExpiresAt = expiresStr != null ? DateTime.tryParse(expiresStr) : null;
      // Thông tin chi nhánh đã chọn lần trước (mô hình 1 module = nhiều chi nhánh).
      _branchId = prefs.getString(_kBranchIdKey);
      _branchName = prefs.getString(_kBranchNameKey);
      _branchPhone = prefs.getString(_kBranchPhoneKey);

      // Phiên tài khoản nội bộ: không có token Cloud nhưng vẫn hợp lệ.
      if (token == null || userJson == null || permissionsJson == null) {
        final employeeJson = prefs.getString(_kEmployeeKey);
        if (employeeJson != null && _storeId != null) {
          _employee = Map<String, dynamic>.from(jsonDecode(employeeJson));
          var savedCodes = prefs.getStringList(_kEmployeeModulesKey) ?? const [];
          if (savedCodes.isEmpty) {
            savedCodes = prefs.getStringList(_kStoreModulesKey) ?? const [];
          }
          _storeModules = savedCodes
              .map((c) => _moduleFromAppCode(c))
              .whereType<AppModule>()
              .toList();
          if (_storeAppCode != null) {
            final restoredModule = _moduleFromAppCode(_storeAppCode!);
            _currentModule = restoredModule;
            _currentAppCode = restoredModule?.appCode;
          }
          notifyListeners();
          return isAuthenticated;
        }
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
      // Cửa hàng: suy lại danh sách module từ quyền Cloud đã lưu (luôn đồng bộ).
      if (_storeId != null) {
        _storeModules = AppModule.values.where((m) => canLoginTo(m)).toList();
        // Lưu lại để tài khoản nhân viên (Cấp 2) đọc được khi đăng nhập ngoại tuyến.
        await prefs.setStringList(
          _kStoreModulesKey,
          _storeModules.map((m) => m.appCode).toList(),
        );
      } else {
        _storeModules = [];
        await prefs.remove(_kStoreModulesKey);
      }
      _currentAppCode = currentAppCode;
      final restoredModule = _currentAppCode != null
          ? _moduleFromAppCode(_currentAppCode!)
          : null;
      _currentModule = restoredModule != null && canLoginTo(restoredModule)
          ? restoredModule
          : null;

      // Phiên Cloud đang tồn tại → Owner đã từng đăng nhập trên máy này.
      await prefs.setBool(_kOwnerHasLoggedInKey, true);
      // Đồng bộ tên & SĐT Owner vào key riêng (cho các bản cài cũ chưa có).
      final ownerName = _user?['fullName']?.toString() ?? _user?['name']?.toString();
      if (ownerName != null && ownerName.isNotEmpty) {
        await prefs.setString(_kOwnerNameKey, ownerName);
      }
      final ownerPhone = _user?['phone']?.toString();
      if (ownerPhone != null && ownerPhone.isNotEmpty) {
        await prefs.setString(_kOwnerPhoneKey, ownerPhone);
      }

      unawaited(refreshBranchInfo());

      notifyListeners();
      return isAuthenticated;
    } catch (e) {
      // ignore session load error
      await _clearSession();
      return false;
    }
  }

  Future<void> _persistSession() async {
    if (!isAuthenticated) return;
    final prefs = await SharedPreferences.getInstance();
    if (_employee != null) {
      await prefs.setString(_kEmployeeKey, jsonEncode(_employee));
      await prefs.remove(_kTokenKey);
      await prefs.remove(_kUserKey);
      await prefs.remove(_kPermissionsKey);
    } else if (_token != null && _user != null) {
      await prefs.setString(_kTokenKey, _token!);
      await prefs.setString(_kUserKey, jsonEncode(_user));
      await prefs.setString(_kPermissionsKey, jsonEncode(_permissions));
      await prefs.remove(_kEmployeeKey);
      // Tên & SĐT của Owner (dùng làm tiêu đề in hóa đơn/phiếu chi).
      final ownerName =
          _user?['fullName']?.toString() ?? _user?['name']?.toString();
      if (ownerName != null && ownerName.isNotEmpty) {
        await prefs.setString(_kOwnerNameKey, ownerName);
      }
      final ownerPhone = _user?['phone']?.toString();
      if (ownerPhone != null && ownerPhone.isNotEmpty) {
        await prefs.setString(_kOwnerPhoneKey, ownerPhone);
      }
      // Owner/Store đã đăng nhập Cloud trên máy này: cờ bền vững cho phép
      // xác thực tài khoản nội bộ (Cấp 2) trong Isar của cửa hàng sau này.
      await prefs.setBool(_kOwnerHasLoggedInKey, true);
      // Phiên employee cũ không còn hiệu lực khi Owner đăng nhập lại.
      await prefs.remove(_kEmployeeModulesKey);
    }
    if (_currentAppCode != null) {
      await prefs.setString(_kCurrentAppCodeKey, _currentAppCode!);
    } else {
      await prefs.remove(_kCurrentAppCodeKey);
    }
    if (_storeId != null) {
      await prefs.setString(_kStoreIdKey, _storeId!);
    } else {
      await prefs.remove(_kStoreIdKey);
    }
    if (_storeName != null) {
      await prefs.setString(_kStoreNameKey, _storeName!);
    } else {
      await prefs.remove(_kStoreNameKey);
    }
    if (_storePhone != null) {
      await prefs.setString(_kStorePhoneKey, _storePhone!);
    } else {
      await prefs.remove(_kStorePhoneKey);
    }
    if (_storeAppCode != null) {
      await prefs.setString(_kStoreAppCodeKey, _storeAppCode!);
    } else {
      await prefs.remove(_kStoreAppCodeKey);
    }
    if (_employee != null) {
      // Phiên nhân viên: lưu module của RIÊNG employee, KHÔNG đụng đến
      // `_kStoreModulesKey` (danh sách module cửa hàng cho login nhân viên khác).
      if (_storeModules.isNotEmpty) {
        await prefs.setStringList(
          _kEmployeeModulesKey,
          _storeModules.map((m) => m.appCode).toList(),
        );
      } else {
        await prefs.remove(_kEmployeeModulesKey);
      }
    } else {
      // Phiên Cloud (Owner): cập nhật danh sách module của cửa hàng.
      if (_storeModules.isNotEmpty) {
        await prefs.setStringList(
          _kStoreModulesKey,
          _storeModules.map((m) => m.appCode).toList(),
        );
      } else {
        await prefs.remove(_kStoreModulesKey);
      }
    }
    await prefs.setBool(_kTrialKey, _isStoreTrial);
    if (_licenseExpiresAt != null) {
      await prefs.setString(_kExpiresAtKey, _licenseExpiresAt!.toIso8601String());
    } else {
      await prefs.remove(_kExpiresAtKey);
    }
  }

  Future<void> _clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kTokenKey);
    await prefs.remove(_kUserKey);
    await prefs.remove(_kPermissionsKey);
    await prefs.remove(_kEmployeeKey);
    await prefs.remove(_kEmployeeModulesKey);
    await prefs.remove(_kCurrentAppCodeKey);
    await prefs.remove(_kTrialKey);
    await prefs.remove(_kExpiresAtKey);
    // KHÔNG xóa _kStoreModulesKey: đây là dữ liệu CỬA HÀNG (danh sách module
    // Owner được cấp quyền), phải giữ để tài khoản nhân viên (Cấp 2) vẫn quét
    // được các module sau khi Owner đăng xuất — tương tự _kStoreIdKey.
  }

  AppModule? _moduleFromAppCode(String appCode) {
    for (final module in AppModule.values) {
      if (module.appCode == appCode) return module;
    }
    return _legacyAppCodes[appCode];
  }

  /// Tên chủ cửa hàng (Owner) đã đăng ký — tiêu đề in hóa đơn, phiếu chi...
  /// Ưu tiên tên CHI NHÁNH (branch.name) → tên Owner → tên cửa hàng đã lưu.
  static Future<String?> loadSavedStoreName() async {
    final prefs = await SharedPreferences.getInstance();
    final branchName = prefs.getString(_kBranchNameKey);
    if (branchName != null && branchName.isNotEmpty) return branchName;
    final ownerName = prefs.getString(_kOwnerNameKey);
    if (ownerName != null && ownerName.isNotEmpty) return ownerName;
    return prefs.getString(_kStoreNameKey);
  }

  /// SĐT chủ cửa hàng (Owner) đã đăng ký — dùng cho in hóa đơn, phiếu chi...
  /// Ưu tiên SĐT CHI NHÁNH (branch.phone) → SĐT Owner → SĐT cửa hàng đã lưu.
  static Future<String?> loadSavedStorePhone() async {
    final prefs = await SharedPreferences.getInstance();
    final branchPhone = prefs.getString(_kBranchPhoneKey);
    if (branchPhone != null && branchPhone.isNotEmpty) return branchPhone;
    final ownerPhone = prefs.getString(_kOwnerPhoneKey);
    if (ownerPhone != null && ownerPhone.isNotEmpty) return ownerPhone;
    return prefs.getString(_kStorePhoneKey);
  }

  /// Tên chủ cửa hàng (Owner) đã đăng ký — dòng thứ 2 trên tiêu đề bill khi có
  /// chi nhánh (vd: "CỬA HÀNG CHÍNH" + "Nguyễn Văn A"). Migration 016.
  static Future<String?> loadSavedOwnerName() async {
    final prefs = await SharedPreferences.getInstance();
    final ownerName = prefs.getString(_kOwnerNameKey);
    if (ownerName != null && ownerName.isNotEmpty) return ownerName;
    return prefs.getString(_kStoreNameKey);
  }

  /// Lấy thông tin chi nhánh từ server (`/api/owner/info?app_code=...`) và lưu
  /// branch name/phone/id để POS in tên cửa hàng theo CHI NHÁNH.
  ///
  /// Chỉ ghi đè khi response có `branch_id` (mô hình chi nhánh). Với cửa hàng
  /// cũ (không phải branch) thì giữ nguyên hành vi hiện tại.
  Future<void> refreshBranchInfo({String? appCode, String? branchId}) async {
    if (_token == null) return;
    final code = appCode ?? _currentAppCode ?? _storeAppCode ?? 'kanposvn';
    try {
      final params = <String, String>{'app_code': code};
      if (branchId != null && branchId.isNotEmpty) params['branch_id'] = branchId;
      final res = await _client
          .get(
            Uri.parse('${ApiConfig.baseUrl}/api/owner/info').replace(
              queryParameters: params,
            ),
            headers: {'Authorization': 'Bearer $_token'},
          )
          .timeout(const Duration(seconds: 8));
      if (res.statusCode != 200) return;
      final json =
          jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;
      if (json['branch_id'] == null) return;
      final prefs = await SharedPreferences.getInstance();
      final name = json['shop_name']?.toString() ?? '';
      final phone = json['phone']?.toString() ?? '';
      final branchId2 = json['branch_id']?.toString() ?? '';
      final ownerName = json['full_name']?.toString() ?? '';
      _branchName = name;
      _branchPhone = phone;
      _branchId = branchId2;
      if (name.isNotEmpty) await prefs.setString(_kBranchNameKey, name);
      if (phone.isNotEmpty) await prefs.setString(_kBranchPhoneKey, phone);
      if (branchId2.isNotEmpty) await prefs.setString(_kBranchIdKey, branchId2);
      if (ownerName.isNotEmpty) await prefs.setString(_kOwnerNameKey, ownerName);
      notifyListeners();
    } catch (e) {
      // Best-effort: không làm hỏng phiên đăng nhập khi lỗi mạng.
    }
  }

  /// Danh sách CHI NHÁNH của module (app_code) mà user đang đăng nhập được phép dùng.
  ///
  /// Gọi `/api/owner/branches?app_code=...`. Trả về danh sách rỗng nếu module đó
  /// không có chi nhánh (cửa hàng đăng ký Web/Zalo cũ) hoặc bị lỗi mạng — luồng
  /// chọn module/đăng nhập KHÔNG bị chặn bởi lỗi này.
  Future<List<Map<String, dynamic>>> fetchBranches(String appCode) async {
    if (_token == null) return [];
    try {
      final res = await _client
          .get(
            Uri.parse('${ApiConfig.baseUrl}/api/owner/branches').replace(
              queryParameters: {'app_code': appCode},
            ),
            headers: {'Authorization': 'Bearer $_token'},
          )
          .timeout(const Duration(seconds: 8));
      if (res.statusCode != 200) return [];
      final json =
          jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;
      final list = json['branches'];
      if (list is List) {
        return list
            .map((e) => Map<String, dynamic>.from(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  /// Chọn chi nhánh sau khi vào module (mô hình 1 module = nhiều chi nhánh).
  ///
  /// Lưu branch id/name/phone (in báo cáo, bill title) và gọi refreshBranchInfo
  /// với branch_id để lấy đúng thông tin chi nhánh đã chọn.
  Future<void> selectBranch(Map<String, dynamic> branch) async {
    final id = branch['id']?.toString() ?? '';
    final name = branch['name']?.toString() ?? '';
    final phone = branch['phone']?.toString() ?? '';
    if (id.isEmpty) return;
    _branchId = id;
    _branchName = name;
    _branchPhone = phone;
    final prefs = await SharedPreferences.getInstance();
    if (name.isNotEmpty) await prefs.setString(_kBranchNameKey, name);
    if (phone.isNotEmpty) await prefs.setString(_kBranchPhoneKey, phone);
    await prefs.setString(_kBranchIdKey, id);
    notifyListeners();
    final code = _currentAppCode ?? _storeAppCode;
    if (code != null) {
      unawaited(refreshBranchInfo(appCode: code, branchId: id));
    }
  }

  /// Store ID đã lưu trên máy (dùng để đăng nhập tài khoản nội bộ ngoại tuyến).
  static Future<String?> loadSavedStoreId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kStoreIdKey);
  }

  /// App code của cửa hàng đã lưu trên máy.
  static Future<String?> loadSavedStoreAppCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kStoreAppCodeKey);
  }

  /// Danh sách app code các module cửa hàng được cấp quyền, đã lưu trên máy.
  ///
  /// Dùng khi đăng nhập tài khoản nhân viên nội bộ để quét tìm tài khoản
  /// trong từng module ("Quản lý nhân viên" của module đó).
  static Future<List<String>> loadSavedStoreModules() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_kStoreModulesKey) ?? const [];
  }

  /// Owner đã từng đăng nhập Cloud trên máy này hay chưa.
  ///
  /// Cờ bền vững: không bị xóa khi đăng xuất hay khi tài khoản nội bộ (Cấp 2)
  /// đăng nhập. Chỉ khi cờ này `true` thì DB cửa hàng (Isar) mới được mở để
  /// xác thực tài khoản nội bộ — đảm bảo employee chỉ được login sau khi
  /// Owner đã khởi tạo/sync dữ liệu cửa hàng trên máy này.
  static Future<bool> hasOwnerLoggedInOnDevice() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kOwnerHasLoggedInKey) ?? false;
  }

  Future<String?> loadSavedAppCode() async => null;
}
