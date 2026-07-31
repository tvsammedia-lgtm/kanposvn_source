import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/providers.dart';
import '../providers/cafe_providers.dart';

class SyncNeonScreen extends ConsumerStatefulWidget {
  const SyncNeonScreen({super.key});

  @override
  ConsumerState<SyncNeonScreen> createState() => _SyncNeonScreenState();
}

class _SyncNeonScreenState extends ConsumerState<SyncNeonScreen> {
  final _urlController = TextEditingController();
  final _keyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final config = ref.read(cafeIsarServiceProvider).getSyncConfig();
      _urlController.text = config.vercelApiUrl;
      _keyController.text = config.apiKey;
    });
  }

  @override
  Widget build(BuildContext context) {
    final syncService = ref.watch(cafeNeonSyncServiceProvider);
    final db = ref.watch(databaseServiceProvider);
    final config = ref.watch(cafeIsarServiceProvider).getSyncConfig();
    final pendingCount = db.pendingSyncCount;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cấu Hình Đồng Bộ Offline-First (Isar <-> Vercel API <-> Neon DB)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD97706),
              ),
            ),
            const SizedBox(height: 16),
            // Configuration Card
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _urlController,
                      decoration: const InputDecoration(
                        labelText: 'Vercel Serverless API Endpoint URL',
                        prefixIcon: Icon(Icons.cloud),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _keyController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'API Secret Token / Authorization Key',
                        prefixIcon: Icon(Icons.key),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton.icon(
                          icon: const Icon(Icons.wifi_find),
                          label: const Text('Kiểm tra Kết nối'),
                          onPressed: () async {
                            final testCfg = config.copyWith(
                              vercelApiUrl: _urlController.text,
                              apiKey: _keyController.text,
                            );
                            final ok = await syncService.testConnection(
                              testCfg,
                            );
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    ok
                                        ? 'Kết nối tới Vercel API OK!'
                                        : 'Thất bại - Hệ thống vẫn chạy mượt ở chế độ Offline Isar',
                                  ),
                                  backgroundColor: ok
                                      ? Colors.green
                                      : Colors.orange,
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD97706),
                          ),
                          icon: const Icon(Icons.save, color: Colors.white),
                          label: const Text(
                            'Lưu Cấu Hình',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            final updated = config.copyWith(
                              vercelApiUrl: _urlController.text,
                              apiKey: _keyController.text,
                            );
                            await ref
                                .read(cafeIsarServiceProvider)
                                .saveSyncConfig(updated);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Đã lưu cấu hình Vercel API & Neon DB!',
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Sync Status & Trigger Panel
            Card(
              color: Colors.amber.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: pendingCount > 0
                          ? Colors.orange
                          : Colors.green,
                      child: Icon(
                        pendingCount > 0
                            ? Icons.sync_problem
                            : Icons.cloud_done,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Trạng Thái Hàng Chờ (SyncQueue): $pendingCount bản ghi chờ đẩy',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            config.lastSyncedAt != null
                                ? 'Đồng bộ lần cuối: ${DateFormat('dd/MM/yyyy HH:mm:ss').format(config.lastSyncedAt!)}'
                                : 'Chưa từng đồng bộ',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      icon: const Icon(Icons.sync, color: Colors.white),
                      label: const Text(
                        'Đồng Bộ Ngay',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () async {
                        final ok = await syncService.triggerSync();
                        setState(() {});
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                ok
                                    ? 'Đồng bộ thành công!'
                                    : 'Đồng bộ không thành công',
                              ),
                              backgroundColor: ok ? Colors.green : Colors.red,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Sync Logs List
            const Text(
              'Nhật Ký Đồng Bộ (Sync Logs):',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: syncService.syncLogs.length,
              itemBuilder: (ctx, i) {
                final log = syncService.syncLogs[i];
                return Card(
                  child: ListTile(
                    dense: true,
                    leading: Icon(
                      log.success ? Icons.check_circle : Icons.error,
                      color: log.success ? Colors.green : Colors.red,
                    ),
                    title: Text(
                      '${log.action} (${DateFormat('HH:mm:ss').format(log.timestamp)})',
                    ),
                    subtitle: Text(log.message),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
