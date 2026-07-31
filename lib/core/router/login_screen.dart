import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_colors.dart';
import '../providers.dart';
import '../module_enum.dart';
import '../l10n/translations.dart';
import 'module_selector_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  AppModule? _findMatchingModule(Map<String, dynamic>? user, List<AppModule> modules) {
    final userName = (user?['full_name'] ?? '').toString().toLowerCase().trim();
    final userEmail = (user?['email'] ?? _emailController.text.trim()).toString().toLowerCase().trim();

    for (final module in modules) {
      final moduleLabel = module.label.toLowerCase().trim();
      final moduleName = module.name.toLowerCase().trim();
      final moduleCode = module.appCode.toLowerCase().trim();

      if (userName.contains(moduleLabel) ||
          userName.contains(moduleName) ||
          userEmail.contains(moduleCode) ||
          userName == moduleLabel ||
          userName == moduleName) {
        return module;
      }
    }
    return null;
  }

  Future<void> _login() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() => _error = 'login_empty_fields'.tr);
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final auth = ref.read(authServiceProvider);
      final email = _emailController.text.trim();
      final password = _passwordController.text;

      final success = await auth.signIn(email: email, password: password);
      if (!mounted) return;

      if (!success) {
        setState(() {
          _isLoading = false;
          _error = auth.errorMessage ?? 'login_failed'.tr;
        });
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

      final matched = _findMatchingModule(auth.user, modules);
      if (matched == null) {
        setState(() {
          _isLoading = false;
          _error = 'Liên hệ Admin để biết thêm thông tin.';
        });
        return;
      }

      await _selectModule(matched);
    } catch (e) {
      debugPrint('LOGIN FLOW ERROR: $e');
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _error = 'Đăng nhập gặp lỗi. Vui lòng thử lại: $e';
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
    } catch (e) {
      debugPrint('SELECT MODULE ERROR: $e');
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _error = 'Khởi tạo dữ liệu gặp lỗi: $e';
      });
    }
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
              border: Border.all(color: AppColors.border.withValues(alpha: 0.1)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 72, height: 72,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Icon(Icons.store_mall_directory, size: 36, color: AppColors.primaryLight),
                ),
                const SizedBox(height: 20),
                Text('KanPosVN',
                  style: TextStyle(color: AppColors.textLight, fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('login_subtitle'.tr,
                  style: TextStyle(color: AppColors.textMuted, fontSize: 14)),
                const SizedBox(height: 32),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: AppColors.textLight, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'email'.tr,
                    hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 13),
                    prefixIcon: Icon(Icons.email_outlined, color: AppColors.textMuted, size: 18),
                    filled: true,
                    fillColor: AppColors.sidebarBg,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.border.withValues(alpha: 0.2)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.border.withValues(alpha: 0.2)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.primary, width: 1.5),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                    hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 13),
                    prefixIcon: Icon(Icons.lock_outline, color: AppColors.textMuted, size: 18),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: AppColors.textMuted, size: 18,
                      ),
                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                    ),
                    filled: true,
                    fillColor: AppColors.sidebarBg,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.border.withValues(alpha: 0.2)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.border.withValues(alpha: 0.2)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.primary, width: 1.5),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                        Icon(Icons.error_outline, color: AppColors.danger, size: 16),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(_error!,
                            style: TextStyle(color: AppColors.danger, fontSize: 12)),
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 20, height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                          )
                        : Text('login'.tr,
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
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
