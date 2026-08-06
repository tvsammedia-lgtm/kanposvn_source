import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_colors.dart';
import '../providers.dart';
import '../module_enum.dart';
import '../l10n/translations.dart';
import '../sync/sync_providers.dart';
import '../auth/auth_service.dart';
import '../auth/employee_auth.dart';
import 'module_selector_screen.dart';

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

  @override
  void initState() {
    super.initState();
    ref.read(authServiceProvider).warmUp();
  }

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
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

      // Cửa hàng (đăng ký qua Web/Zalo): vào thẳng POS, không cần chọn module.
      if (auth.isStoreUser) {
        await _initStoreLogin();
        return;
      }

      final modules = auth.accessibleModules;

      if (modules.isEmpty) {
        setState(() {
          _isLoading = false;
          _error = 'Liên hệ Admin để biết thêm thông tin.';
        });
        return;
      }

      if (modules.length == 1) {
        await _selectModule(modules.first);
        return;
      }

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      // ignore login errors
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _error = 'Đăng nhập gặp lỗi. Vui lòng thử lại: $e';
      });
    }
  }

  /// Thử đăng nhập tài khoản nhân viên nội bộ (Isar của cửa hàng).
  ///
  /// Trả về `null` nếu thành công hoặc không có tài khoản nội bộ (chuyển sang Cloud).
  /// Trả về chuỗi lỗi nếu tìm thấy tài khoản nội bộ nhưng sai mật khẩu/bị khóa.
  Future<String?> _tryLocalLogin(String identifier, String password) async {
    try {
      final storeId = await AuthService.loadSavedStoreId();
      if (storeId == null) return null;
      var appCode = await AuthService.loadSavedStoreAppCode();
      appCode ??= ref.read(authServiceProvider).defaultStoreModule.appCode;

      final result = await EmployeeAuthService.login(
        storeId: storeId,
        storeAppCode: appCode,
        username: identifier,
        password: password,
      );
      if (result == EmployeeLoginResult.notFound) return null;
      if (result == EmployeeLoginResult.inactive) return 'Tài khoản đã bị khóa';
      if (result == EmployeeLoginResult.wrongPassword) {
        return 'Mật khẩu không đúng';
      }

      // Thành công: khôi phục phiên nội bộ + khởi tạo DB cửa hàng.
      final auth = ref.read(authServiceProvider);
      final db = ref.read(databaseServiceProvider);
      final employee = await EmployeeAuthService.findByUsername(
        storeId: storeId,
        storeAppCode: appCode,
        username: identifier,
      );
      if (employee == null) return null;
      await auth.employeeSignIn(
        storeId: storeId,
        storeAppCode: appCode,
        employee: employee.toJson(),
      );
      await db.initStore(storeId: storeId, module: auth.defaultStoreModule);
      if (mounted) {
        ref.read(selectedModuleProvider.notifier).state =
            auth.defaultStoreModule;
      }
      return null;
    } catch (e) {
      // Lỗi đọc DB cửa hàng: không chặn luồng Cloud, để Owner đăng nhập.
      return null;
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
      if (!mounted) return;
      ref.read(selectedModuleProvider.notifier).state = auth.defaultStoreModule;
      setState(() {
        _isLoading = false;
      });
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

      final canAccess = await auth.switchModule(module);
      if (!mounted) return;
      if (!canAccess) {
        setState(() {
          _isLoading = false;
          _error = auth.errorMessage;
        });
        return;
      }

      await db.init(module: module);
      if (!mounted) return;
      moduleNotifier.state = module;

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
    if (!_usesSharedSync(module)) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(syncEngineProvider).triggerSync();
    });
  }

  bool _usesSharedSync(AppModule module) {
    return module.appCode == 'kanposvncafe' || module.appCode == 'nhansu';
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
                  child: Icon(
                    Icons.store_mall_directory,
                    size: 36,
                    color: AppColors.primaryLight,
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
                const SizedBox(height: 32),
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
