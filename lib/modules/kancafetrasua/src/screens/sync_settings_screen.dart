import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/app_providers.dart';

class SyncSettingsScreen extends ConsumerStatefulWidget {
  const SyncSettingsScreen({super.key});

  @override
  ConsumerState<SyncSettingsScreen> createState() => _SyncSettingsScreenState();
}

class _SyncSettingsScreenState extends ConsumerState<SyncSettingsScreen> {
  late TextEditingController _urlController;
  late TextEditingController _keyController;

  @override
  void initState() {
    super.initState();
    final settings = ref.read(dbProvider).settings;
    _urlController = TextEditingController(text: settings.vercelApiUrl);
    _keyController = TextEditingController(text: settings.vercelApiKey);
  }

  @override
  void dispose() {
    _urlController.dispose();
    _keyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(dbProvider);
    final syncState = ref.watch(syncNotifierProvider);
    final syncNotifier = ref.read(syncNotifierProvider.notifier);
    final dateTimeFormatter = DateFormat('dd/MM/yyyy HH:mm:ss');

    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text('Cấu Hình & Kiểm Tra Đồng Bộ Cloud', style: TextStyle(color: Color(0xFF4A2C2A), fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sync Control Card matching PRD Section 31
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.cloud_sync, color: Color(0xFF4A2C2A), size: 28),
                        const SizedBox(width: 10),
                        const Text('Trạng Thái Đồng Bộ Cloud', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        ElevatedButton.icon(
                          onPressed: syncState.isSyncing
                              ? null
                              : () async {
                                  final res = await syncNotifier.triggerSync();
                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(res.message), backgroundColor: res.success ? Colors.green : Colors.red),
                                    );
                                  }
                                },
                          icon: syncState.isSyncing
                              ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                              : const Icon(Icons.sync),
                          label: Text(syncState.isSyncing ? 'Đang gửi Vercel...' : 'ĐỒNG BỘ NGAY'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4A2C2A),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Số bản ghi chờ đẩy (Pending Queue):', style: TextStyle(fontSize: 13, color: Colors.grey)),
                              Text(
                                '${syncState.pendingCount} thay đổi chưa lên Cloud',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: syncState.pendingCount > 0 ? Colors.orange.shade900 : Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Lần đồng bộ thành công gần nhất:', style: TextStyle(fontSize: 13, color: Colors.grey)),
                              Text(
                                syncState.lastSyncedAt != null ? dateTimeFormatter.format(syncState.lastSyncedAt!) : 'Chưa đồng bộ',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.brown),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Endpoint & API Config matching PRD Section 33
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Cấu Hình REST API Vercel Endpoint', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4A2C2A))),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _urlController,
                      decoration: const InputDecoration(
                        labelText: 'Vercel Serverless REST API URL',
                        prefixIcon: Icon(Icons.link),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _keyController,
                      decoration: const InputDecoration(
                        labelText: 'API Authorization Bearer Token / API Key',
                        prefixIcon: Icon(Icons.key),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          db.updateSettings(db.settings.copyWith(
                            vercelApiUrl: _urlController.text,
                            vercelApiKey: _keyController.text,
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Đã lưu cấu hình Vercel API thành công!')),
                          );
                        },
                        child: const Text('Lưu Cấu Hình'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Sync Queue Log Inspector matching PRD Section 31 & 32
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Nhật Ký Hàng Chờ Đồng Bộ (Sync Queue Log)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4A2C2A))),
                        Text('Tổng: ${db.syncQueue.length} bản ghi', style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (db.syncQueue.isEmpty)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(child: Text('Hàng chờ đồng bộ trống.')),
                      )
                    else
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: db.syncQueue.length,
                        separatorBuilder: (ctx, i) => const Divider(height: 12),
                        itemBuilder: (ctx, i) {
                          final q = db.syncQueue[i];
                          final isSynced = q.status == 'SYNCED';
                          return ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(
                              radius: 14,
                              backgroundColor: isSynced ? Colors.green.shade100 : Colors.orange.shade100,
                              child: Icon(isSynced ? Icons.check : Icons.access_time, size: 14, color: isSynced ? Colors.green : Colors.orange),
                            ),
                            title: Text('[${q.action}] Bảng ${q.tableName} (ID: ${q.recordId.substring(0, 8)}...)'),
                            subtitle: Text('Thời gian tạo: ${dateTimeFormatter.format(q.createdAt)}'),
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: isSynced ? Colors.green.shade50 : Colors.orange.shade50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                q.status,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: isSynced ? Colors.green.shade900 : Colors.orange.shade900,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
