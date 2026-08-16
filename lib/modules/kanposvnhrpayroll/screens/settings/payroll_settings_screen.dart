import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_theme.dart';
import '../../services/auth_service.dart';

class PayrollSettingsScreen extends StatelessWidget {
  const PayrollSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService.instance.user;

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Cài Đặt',
              style: Theme.of(context).textTheme.headlineLarge),
          Text('Thông tin tài khoản & ứng dụng',
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 24),
          Card(
            color: AppTheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: AppTheme.borderColor),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppTheme.primaryBlue.withOpacity(0.2),
                child: Text(
                  (user?.name != null && user!.name.isNotEmpty
                          ? user.name[0]
                          : 'U')
                      .toUpperCase(),
                  style: const TextStyle(color: AppTheme.primaryLight),
                ),
              ),
              title: Text(
                user?.name ?? 'User',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(user?.email ?? ''),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: AppTheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: AppTheme.borderColor),
            ),
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.info_outline, color: AppTheme.textSecondary),
                  title: Text('Phiên bản'),
                  subtitle: Text('KanPosVN HR Payroll 1.1.4'),
                ),
                const Divider(height: 1, color: AppTheme.borderColor),
                ListTile(
                  leading: const Icon(Icons.logout, color: AppTheme.danger),
                  title: const Text('Đăng xuất'),
                  onTap: () async {
                    await AuthService.instance.logout();
                    if (context.mounted) context.go('/login');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
