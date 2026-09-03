import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/employee_management_screen.dart';
import '../../../core/providers.dart';
import '../../../core/sync/api_config.dart';
import '../providers/spa_providers.dart';

class SpaSettingsScreen extends ConsumerWidget {
  const SpaSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài Đặt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Thông tin tài khoản', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text('Tên đăng nhập'),
              subtitle: Text(auth.user?.toString() ?? ''),
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: Text('Đăng xuất'),
              onTap: () {
                ref.read(authServiceProvider.notifier).signOut();
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.manage_accounts, color: Colors.blue),
              title: Text('Quản lý nhân viên'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const EmployeeManagementScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.sync, color: Colors.purple),
              title: const Text('Đồng bộ Vercel Neon DB'),
              onTap: () async {
                final syncService = ref.read(spaNeonSyncServiceProvider);
                if (syncService.isSyncing) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Đang đồng bộ...')),
                  );
                  return;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đang đồng bộ...')),
                );
                final ok = await syncService.triggerSync(
                  ApiConfig.baseUrl,
                  ApiConfig.syncApiKey,
                  branchId: ref.read(authServiceProvider).branchId,
                );
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(ok ? 'Đồng bộ hoàn tất!' : 'Đồng bộ thất bại!')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}