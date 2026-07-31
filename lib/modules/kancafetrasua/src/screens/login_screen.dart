import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';
import '../providers/app_providers.dart';
import 'sync_settings_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;
  bool _needConfig = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _needConfig = false;
    });

    final authService = AuthService();
    final result = await authService.login(
      _emailController.text.trim(),
      _passwordController.text,
    );

    if (!mounted) return;

    if (result.success && result.user != null) {
      ref.read(currentUserProvider.notifier).state = result.user!;
      ref.read(currentRoleProvider.notifier).state = result.user!.role;
    } else {
      setState(() {
        _isLoading = false;
        _errorMessage = result.message;
        _needConfig = result.needConfig;
      });
    }
  }

  void _openSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SyncSettingsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: 420,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 48),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4A2C2A).withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.coffee, size: 48, color: Color(0xFF4A2C2A)),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'KÀN CAFE & TRÀ SỮA',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4A2C2A), letterSpacing: 1.5),
                    ),
                    const SizedBox(height: 4),
                    Text('Đăng nhập POS System', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                    const SizedBox(height: 28),

                    // Email
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email_outlined),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        filled: true,
                        fillColor: Colors.grey[50],
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (v) => (v == null || v.trim().isEmpty) ? 'Nhập email' : null,
                    ),
                    const SizedBox(height: 16),

                    // Password
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Mật khẩu',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        filled: true,
                        fillColor: Colors.grey[50],
                      ),
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _handleLogin(),
                      validator: (v) => (v == null || v.isEmpty) ? 'Nhập mật khẩu' : null,
                    ),
                    const SizedBox(height: 8),

                    // Error message
                    if (_errorMessage != null)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(top: 4),
                        decoration: BoxDecoration(
                          color: _needConfig ? Colors.orange[50] : Colors.red[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: _needConfig ? Colors.orange[200]! : Colors.red[200]!),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  _needConfig ? Icons.settings : Icons.error_outline,
                                  color: _needConfig ? Colors.orange[700] : Colors.red[700],
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    _errorMessage!,
                                    style: TextStyle(
                                      color: _needConfig ? Colors.orange[700] : Colors.red[700],
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (_needConfig) ...[
                              const SizedBox(height: 10),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: _openSettings,
                                  icon: const Icon(Icons.settings, size: 16),
                                  label: const Text('Mở Cấu Hình Cloud'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange[700],
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    const SizedBox(height: 24),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A2C2A),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 2,
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                width: 22, height: 22,
                                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                              )
                            : const Text(
                                'ĐĂNG NHẬP',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
