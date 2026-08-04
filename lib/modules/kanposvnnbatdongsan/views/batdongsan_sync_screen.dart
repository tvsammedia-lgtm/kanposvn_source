import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../../../core/router/module_selector_screen.dart';
import '../providers/batdongsan_providers.dart';

class BatDongSanSyncScreen extends ConsumerWidget {
  const BatDongSanSyncScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đồng bộ Vercel Neon DB'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(authServiceProvider).signOut();
              ref.read(selectedModuleProvider.notifier).state = null;
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.cloud_sync),
          label: const Text('Đồng bộ Dữ liệu'),
          onPressed: () async {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Đang đồng bộ...')),
            );
            final syncService = ref.read(syncServiceProvider);
            await syncService.syncAll();
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Đồng bộ hoàn tất!')),
              );
            }
          },
        ),
      ),
    );
  }
}
