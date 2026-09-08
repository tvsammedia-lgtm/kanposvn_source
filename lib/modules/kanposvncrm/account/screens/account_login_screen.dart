import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/account_config.dart';
import '../providers/account_providers.dart';

/// Màn hình đăng nhập phần Account của kanposvncrm — mô hình login HYBRID:
///  - online cloud (Vercel)  -> đăng nhập bằng SĐT hoặc email.
///  - offline local (localhost:3000) -> đăng nhập bằng username.
class AccountLoginScreen extends ConsumerStatefulWidget {
  const AccountLoginScreen({super.key});

  @override
  ConsumerState<AccountLoginScreen> createState() => _AccountLoginScreenState();
}

class _AccountLoginScreenState extends ConsumerState<AccountLoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    setState(() => _isLoading = true);
    final notifier = ref.read(accountAuthStateProvider.notifier);
    final success =
        await notifier.login(_usernameController.text, _passwordController.text);
    if (!mounted) return;
    setState(() => _isLoading = false);
    if (success) {
      final source = ref.read(accountLoginSourceProvider);
      final modeLabel = source == 'offline'
          ? 'Local (localhost)'
          : 'Cloud (Admin Web)';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đăng nhập thành công! ($modeLabel)')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đăng nhập thất bại. Vui lòng thử lại!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mode = AccountConfig.defaultMode;
    final modeLabel = switch (mode) {
      AccountServerMode.online => 'Cloud (Admin Web)',
      AccountServerMode.offline => 'Local (localhost:3000)',
      AccountServerMode.auto => 'Auto (Cloud → Local)',
    };
    return Scaffold(
      appBar: AppBar(title: const Text('Đăng nhập Account (KanPosVN CRM)')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Chế độ: $modeLabel',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'SĐT / Email / Tên đăng nhập',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Mật khẩu'),
            ),
            const SizedBox(height: 32),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _handleLogin,
                    child: const Text('Đăng nhập'),
                  ),
          ],
        ),
      ),
    );
  }
}