import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../theme/app_colors.dart';
import '../providers.dart';
import '../module_enum.dart';
import '../l10n/translations.dart';
import '../sync/sync_providers.dart';
import '../sync/api_config.dart';
import '../auth/auth_service.dart';
import '../auth/employee_auth.dart';
import '../modes/operation_mode.dart';
import 'module_selector_screen.dart';
import 'branch_selector_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;
  String? _error;
  AppOperationMode _mode = AppOperationMode.online;

  @override
  void initState() {
    super.initState();
    // Khôi phục chế độ người dùng đã chọn lần trước (mặc định Online).
    loadOperationMode().then((mode) {
      if (mounted) setState(() => _mode = mode);
    });
    if (_mode == AppOperationMode.online) {
      ref.read(authServiceProvider).warmUp();
    }
  }

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _setMode(AppOperationMode mode) async {
    if (mode == _mode) return;
    setState(() => _mode = mode);
    await saveOperationMode(mode);
    ref.read(appOperationModeProvider.notifier).state = mode;
    // Ở chế độ Offline tắt warm-up mạng định kỳ; bật lại khi chuyển Online.
    if (mode == AppOperationMode.online) {
      ref.read(authServiceProvider).warmUp();
    }
    // Báo hiệu cho SyncEngine biết đang offline để trì hoãn đồng bộ.
    try {
      ref.read(syncEngineProvider).setOnlineStatus(mode == AppOperationMode.online);
    } catch (_) {}
  }

  Future<void> _login() async {
    if (_identifierController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() => _error = 'login_empty_fields'.tr);
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    // ── Chế độ OFFLINE: xác thực qua WEBSITE LOCALHOST (giống admin-web Vercel)
    // chạy ngay trên máy này (http://127.0.0.1:3000). KHÔNG gọi Cloud, KHÔNG có
    // fallback Isar: máy không có web localhost chạy → chặn đăng nhập.
    if (_mode == AppOperationMode.offline) {
      final offlineError = await _tryOfflineServerLogin();
      if (!mounted) return;
      setState(() => _isLoading = false);
      if (offlineError != null) setState(() => _error = offlineError);
      return;
    }

    try {
      final auth = ref.read(authServiceProvider);
      final identifier = _identifierController.text.trim();
      final password = _passwordController.text;

      // Chủ cửa hàng đăng nhập bằng SĐT đã đăng ký: không kiểm tra tài khoản
      // nội bộ (Cấp 2) — tránh mở Isar + quét employees làm chậm login.
      final savedStoreId = await AuthService.loadSavedStoreId();
      final savedStorePhone = await AuthService.loadSavedStorePhone();
      final isOwnerPhone = savedStorePhone != null && identifier == savedStorePhone;

      if (!isOwnerPhone && await AuthService.hasOwnerLoggedInOnDevice()) {
        // Bước 1: thử tài khoản nội bộ (Cấp 2) — xác thực trong Isar, không gọi Cloud.
        // Chỉ được check trên Isar khi Owner đã từng đăng nhập Cloud trên máy này
        // (DB cửa hàng đã được khởi tạo + sync dữ liệu employee). Nếu chưa có phiên
        // Owner thì bỏ qua Isar và chuyển thẳng sang Cloud login ở Bước 2.
        final localError = await _tryLocalLogin(identifier, password);
        if (localError != null) {
          if (!mounted) return;
          setState(() {
            _isLoading = false;
            _error = localError;
          });
          return;
        }
        if (!mounted) return;
        if (auth.isEmployeeLogin) return;
      }

      // Bước 2: đăng nhập Cloud (Owner).
      // Với owner: mở DB cửa hàng song song với network login để vào app nhanh.
      final cloudLogin = auth.signIn(
        identifier: identifier,
        password: password,
      );
      Future<void>? storeInit;
      if (isOwnerPhone && savedStoreId != null) {
        storeInit = ref
            .read(databaseServiceProvider)
            .initStore(storeId: savedStoreId, module: auth.defaultStoreModule);
      }

      final success = await cloudLogin;
      if (!mounted) return;
      if (storeInit != null) {
        await storeInit;
      }

      if (!success) {
        setState(() {
          _isLoading = false;
          _error = auth.errorMessage ?? 'login_failed'.tr;
        });
        return;
      }

      // User cửa hàng nhiều module: nạp sẵn DB cửa hàng ở nền để chọn module
      // (vd kanposvncafe) vào ngay, không phải chờ "Đang xác thực...".
      if (storeInit == null && auth.isStoreUser && auth.storeId != null) {
        unawaited(
          ref
              .read(databaseServiceProvider)
              .initStore(storeId: auth.storeId!, module: auth.defaultStoreModule),
        );
      }

      await _continueAfterSignIn();
    } catch (e) {
      // ignore login errors
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _error = 'Đăng nhập gặp lỗi. Vui lòng thử lại: $e';
      });
    }
  }

  /// Xử lý chung sau khi `signIn` thành công (dùng cho cả Online và Offline):
  /// quyết định vào màn hình chọn module / POS cửa hàng / module duy nhất.
  Future<void> _continueAfterSignIn() async {
    final auth = ref.read(authServiceProvider);
    if (!mounted) return;
    setState(() {
      _isLoading = false;
    });
    final modules = auth.accessibleModules;

    // User gán nhiều module → hiện màn hình chọn module (kể cả user cửa hàng).
    if (modules.length > 1) {
      return;
    }

    // Cửa hàng (đăng ký qua Web/Zalo): vào thẳng POS, không cần chọn module.
    if (auth.isStoreUser) {
      await _initStoreLogin();
      return;
    }

    if (modules.isEmpty) {
      if (mounted) {
        setState(() {
          _error = 'Liên hệ Admin để biết thêm thông tin.';
        });
      }
      return;
    }

    await _selectModule(modules.first);
  }

  /// Thử đăng nhập tài khoản nhân viên nội bộ (Isar của cửa hàng).
  ///
  /// Trả về `null` nếu thành công hoặc không có tài khoản nội bộ (chuyển sang Cloud).
  /// Trả về chuỗi lỗi nếu tìm thấy tài khoản nội bộ nhưng sai mật khẩu/bị khóa.
  Future<String?> _tryLocalLogin(String identifier, String password) async {
    try {
      final storeId = await AuthService.loadSavedStoreId();
      if (storeId == null) return null;
      final auth = ref.read(authServiceProvider);

      // Nhân viên phải được Owner tạo user local trong "Quản lý nhân viên" của
      // module đó mới login được. Quét qua TẤT CẢ module của cửa hàng để tìm
      // tài khoản; nhân viên chỉ vào được các module mà họ có tài khoản.
      var appCodes = await AuthService.loadSavedStoreModules();
      if (appCodes.isEmpty) {
        // Dữ liệu cũ (trước khi tạo tài khoản theo module): quét app code
        // cửa hàng + module mặc định để không phá luồng đăng nhập cũ.
        final savedAppCode = await AuthService.loadSavedStoreAppCode();
        appCodes = <String?>[savedAppCode, auth.defaultStoreModule.appCode]
            .whereType<String>()
            .toSet()
            .toList();
      }

      final foundAppCodes = <String>[];
      EmployeeLoginResult? blocked;
      for (final appCode in appCodes) {
        final result = await EmployeeAuthService.login(
          storeId: storeId,
          storeAppCode: appCode,
          username: identifier,
          password: password,
        );
        if (result == EmployeeLoginResult.success) {
          foundAppCodes.add(appCode);
        } else if (result != EmployeeLoginResult.notFound) {
          blocked ??= result;
        }
      }

      if (foundAppCodes.isNotEmpty) {
        final employee = await EmployeeAuthService.findByUsername(
          storeId: storeId,
          storeAppCode: foundAppCodes.first,
          username: identifier,
        );
        if (employee == null) return null;
        await auth.employeeSignIn(
          storeId: storeId,
          storeAppCode: foundAppCodes.first,
          employee: employee.toJson(),
          moduleAppCodes: foundAppCodes,
        );
        final db = ref.read(databaseServiceProvider);
        await db.initStore(storeId: storeId, module: auth.defaultStoreModule);
        // KHÔNG đặt selectedModule ở đây: để main.dart / ModuleSelectorScreen
        // quyết định, luôn hiện màn hình chọn module trước khi vào bán hàng.
        return null;
      }
      if (blocked == EmployeeLoginResult.inactive) {
        return 'Tài khoản đã bị khóa';
      }
      if (blocked == EmployeeLoginResult.wrongPassword) {
        return 'Mật khẩu không đúng';
      }
      // Không có tài khoản nội bộ: chuyển sang đăng nhập Cloud (Owner/user khác).
      return null;
    } catch (e) {
      // Lỗi đọc DB cửa hàng: không chặn luồng Cloud, để Owner đăng nhập.
      return null;
    }
  }

/// Đăng nhập ở chế độ Ngoại tuyến (Offline) bằng WEBSITE LOCALHOST.
///
/// Xác thực qua web localhost (bản admin-web chạy ngay trên máy: port 3000)
/// — áp dụng cho MỌI module trong app. Nếu máy không có web localhost đang
/// chạy thì đăng nhập Offline BỊ CHẶN (không có fallback dữ liệu Isar).
///
/// Trả về chuỗi lỗi nếu không thể đăng nhập ngoại tuyến; ngược lại trả về
/// `null` (đã chuyển sang màn hình chọn module hoặc vào thẳng module).
  Future<String?> _tryOfflineServerLogin() async {
    final identifier = _identifierController.text.trim();
    final password = _passwordController.text;

    // Web localhost phải đang chạy trên máy này, nếu không thì chặn đăng nhập.
    if (!await _isLocalWebRunning()) {
      return 'Không tìm thấy Web Localhost (localhost:3000) đang chạy trên máy '
          'này. Hãy bật Web Localhost để đăng nhập chế độ Ngoại tuyến (Offline).';
    }

    try {
      final auth = ref.read(authServiceProvider);
      final success = await auth.signIn(
        identifier: identifier,
        password: password,
        baseUrl: ApiConfig.offlineBaseUrl,
        networkErrorMessage: 'Không kết nối được Web Localhost (localhost:3000). '
            'Kiểm tra Web Localhost đang bật trên máy này.',
      );
      if (!success) {
        return auth.errorMessage ?? 'Đăng nhập ngoại tuyến thất bại.';
      }
      await _continueAfterSignIn();
      return null;
    } catch (e) {
      return 'Không thể đăng nhập offline: $e';
    }
  }

  /// Kiểm tra Web Localhost (localhost:3000) có đang chạy trên máy này không.
  Future<bool> _isLocalWebRunning() async {
    try {
      final res = await http
          .get(Uri.parse('${ApiConfig.offlineBaseUrl}/api/health'))
          .timeout(const Duration(seconds: 3));
      return res.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  Future<void> _initStoreLogin() async {
    try {
      final db = ref.read(databaseServiceProvider);
      final auth = ref.read(authServiceProvider);
      final storeId = auth.storeId;
      if (storeId == null) {
        if (!mounted) return;
        setState(() {
          _isLoading = false;
          _error = 'Không xác định được cửa hàng';
        });
        return;
      }
      await db.initStore(storeId: storeId, module: auth.defaultStoreModule);
      final isOnline = _mode == AppOperationMode.online;
      // Mô hình 1 module = nhiều chi nhánh: cửa hàng có chi nhánh → chọn chi nhánh.
      // Offline: bỏ qua fetch branch để không treo chờ mạng.
      final branches = isOnline
          ? await auth.fetchBranches(auth.defaultStoreModule.appCode)
          : <Map<String, dynamic>>[];
      if (!mounted) return;
      if (branches.isNotEmpty) {
        setState(() => _isLoading = false);
        ref.read(branchSelectorModuleProvider.notifier).state = auth.defaultStoreModule;
        return;
      }
      ref.read(selectedModuleProvider.notifier).state = auth.defaultStoreModule;
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      // ignore store init errors
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _error = 'Khởi tạo dữ liệu gặp lỗi: $e';
      });
    }
  }

  Future<void> _selectModule(AppModule module) async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final db = ref.read(databaseServiceProvider);
      final auth = ref.read(authServiceProvider);
      final moduleNotifier = ref.read(selectedModuleProvider.notifier);

      if (!auth.canLoginTo(module)) {
        if (mounted) {
          setState(() {
            _isLoading = false;
            _error = auth.errorMessage;
          });
        }
        return;
      }

      // Nạp dữ liệu trước khi switchModule để tiến trình hiện trên màn hình
      // đang mở thay vì màn hình "Đang xác thực...".
      await db.init(module: module);
      await auth.switchModule(module);
      final isOnline = _mode == AppOperationMode.online;

      // Mô hình 1 module = nhiều chi nhánh: module có chi nhánh → chọn chi nhánh.
      // Offline: bỏ qua fetch branch để không treo chờ mạng.
      final branches = isOnline
          ? await auth.fetchBranches(module.appCode)
          : <Map<String, dynamic>>[];
      if (!mounted) return;
      if (branches.isNotEmpty) {
        setState(() => _isLoading = false);
        ref.read(branchSelectorModuleProvider.notifier).state = module;
        return;
      }

      // Đặt selectedModule kể cả khi LoginScreen đã bị thay thế (mounted == false).
      moduleNotifier.state = module;
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }

      _autoSyncAfterLogin(module);
    } catch (e) {
      // ignore select module errors
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _error = 'Khởi tạo dữ liệu gặp lỗi: $e';
      });
    }
  }

  void _autoSyncAfterLogin(AppModule module) {
    if (_mode == AppOperationMode.offline) return;
    if (!_usesSharedSync(module)) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(syncEngineProvider).triggerSync();
    });
  }

  bool _usesSharedSync(AppModule module) {
    return module.appCode == 'kanposvncafe' || module.appCode == 'nhansu';
  }

  Widget _buildModeToggle() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.sidebarBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.border.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          _buildModeOption(
            mode: AppOperationMode.online,
            icon: Icons.cloud_done_outlined,
            label: 'Online',
            subtitle: 'Có internet',
          ),
          const SizedBox(width: 4),
          _buildModeOption(
            mode: AppOperationMode.offline,
            icon: Icons.cloud_off_outlined,
            label: 'Offline',
            subtitle: 'Ngoại tuyến',
          ),
        ],
      ),
    );
  }

  Widget _buildModeOption({
    required AppOperationMode mode,
    required IconData icon,
    required String label,
    required String subtitle,
  }) {
    final selected = _mode == mode;
    return Expanded(
      child: InkWell(
        onTap: _isLoading ? null : () => _setMode(mode),
        borderRadius: BorderRadius.circular(8),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: selected ? Colors.white : AppColors.textMuted,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: selected ? Colors.white : AppColors.textLight,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: selected
                          ? Colors.white.withValues(alpha: 0.85)
                          : AppColors.textMuted,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sidebarBg,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Container(
            width: 420,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: AppColors.sidebarActive,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.border.withValues(alpha: 0.1),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'KanPosVN',
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'login_subtitle'.tr,
                  style: TextStyle(color: AppColors.textMuted, fontSize: 14),
                ),
                const SizedBox(height: 24),
                _buildModeToggle(),
                if (_mode == AppOperationMode.offline) ...[
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.warning.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.cloud_off_outlined,
                          color: AppColors.warning,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Đang ở chế độ Ngoại tuyến: đăng nhập qua Web Localhost '
                            '(localhost:3000) chạy ngay trên máy này. Không bật '
                            'Web Localhost thì không sử dụng được.',
                            style: TextStyle(
                              color: AppColors.warning,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                TextField(
                  controller: _identifierController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: AppColors.textLight, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'login_identifier_hint'.tr,
                    hintStyle: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 13,
                    ),
                    prefixIcon: Icon(
                      Icons.badge_outlined,
                      color: AppColors.textMuted,
                      size: 18,
                    ),
                    filled: true,
                    fillColor: AppColors.sidebarBg,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColors.border.withValues(alpha: 0.2),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColors.border.withValues(alpha: 0.2),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 1.5,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  style: TextStyle(color: AppColors.textLight, fontSize: 14),
                  onSubmitted: (_) => _login(),
                  decoration: InputDecoration(
                    hintText: 'password'.tr,
                    hintStyle: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 13,
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: AppColors.textMuted,
                      size: 18,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.textMuted,
                        size: 18,
                      ),
                      onPressed: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                    filled: true,
                    fillColor: AppColors.sidebarBg,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColors.border.withValues(alpha: 0.2),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColors.border.withValues(alpha: 0.2),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 1.5,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
                if (_error != null) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.danger.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: AppColors.danger,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _error!,
                            style: TextStyle(
                              color: AppColors.danger,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'login'.tr,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
