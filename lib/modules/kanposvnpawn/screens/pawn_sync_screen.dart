import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers.dart';
import '../../../core/sync/api_config.dart';
import '../providers/isar_provider.dart';

/// Màn hình "Đồng bộ" của module Cầm Đồ — đẩy dữ liệu lên Vercel Neon DB.
class PawnSyncScreen extends ConsumerWidget {
  const PawnSyncScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đồng bộ Vercel Neon DB')),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.cloud_sync),
          label: const Text('Đồng bộ Dữ liệu'),
          onPressed: () async {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Đang đồng bộ...')));
            final syncService = ref.read(pawnNeonSyncServiceProvider);
            await syncService.triggerSync(
              ApiConfig.baseUrl,
              ApiConfig.syncApiKey,
              branchId: ref.read(authServiceProvider).branchId,
            );
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đồng bộ hoàn tất!')));
            }
          },
        ),
      ),
    );
  }
}
