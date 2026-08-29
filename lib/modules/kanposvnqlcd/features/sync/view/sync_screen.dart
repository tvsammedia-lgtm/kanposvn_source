import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../core/widgets/account_switcher_button.dart';
import '../controller/sync_controller.dart';

class SyncScreen extends ConsumerWidget {
  const SyncScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncState = ref.watch(syncProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Đồng bộ dữ liệu'),
        actions: const [AccountSwitcherButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Trạng thái hiện tại
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Trạng thái đồng bộ',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    _buildStatusRow(
                      icon: Icons.sync,
                      label: 'Trạng thái',
                      value: _statusText(syncState.status),
                      color: _statusColor(syncState.status),
                    ),
                    const SizedBox(height: 8),
                    _buildStatusRow(
                      icon: Icons.storage,
                      label: 'Số bản ghi đã đồng bộ',
                      value: '${syncState.syncedRecords}',
                    ),
                    const SizedBox(height: 8),
                    _buildStatusRow(
                      icon: Icons.access_time,
                      label: 'Lần đồng bộ cuối',
                      value: syncState.lastSyncTime != null
                          ? DateFormat('dd/MM/yyyy HH:mm:ss').format(syncState.lastSyncTime!)
                          : 'Chưa đồng bộ',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Nút đồng bộ
            SizedBox(
              height: 56,
              child: ElevatedButton.icon(
                onPressed: syncState.status == SyncStatus.syncing
                    ? null
                    : () => ref.read(syncProvider.notifier).sync(),
                icon: syncState.status == SyncStatus.syncing
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Icon(Icons.cloud_upload),
                label: Text(
                  syncState.status == SyncStatus.syncing ? 'Đang đồng bộ...' : 'Đồng bộ lên Supabase',
                  style: const TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Nút reset
            if (syncState.status == SyncStatus.success || syncState.status == SyncStatus.error)
              OutlinedButton(
                onPressed: () => ref.read(syncProvider.notifier).reset(),
                child: const Text('Đặt lại'),
              ),
            const SizedBox(height: 20),

            // Hiển thị lỗi nếu có
            if (syncState.errors.isNotEmpty)
              Expanded(
                child: Card(
                  color: Colors.red.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Lỗi chi tiết:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: ListView.builder(
                            itemCount: syncState.errors.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4.0),
                                child: Text(
                                  '• ${syncState.errors[index]}',
                                  style: const TextStyle(color: Colors.red),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            // Hướng dẫn cấu hình
            if (syncState.status == SyncStatus.idle)
              const Expanded(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hướng dẫn:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text('1. Deploy API Vercel từ thư mục api/'),
                        Text('2. Cập nhật URL trong sync_service.dart'),
                        Text('3. Tạo bảng trong Supabase (xem schema.sql)'),
                        Text('4. Nhấn nút "Đồng bộ" để upload dữ liệu'),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow({
    required IconData icon,
    required String label,
    required String value,
    Color? color,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey),
        const SizedBox(width: 12),
        Text('$label: ', style: const TextStyle(fontSize: 14)),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  String _statusText(SyncStatus status) {
    switch (status) {
      case SyncStatus.idle:
        return 'Sẵn sàng';
      case SyncStatus.syncing:
        return 'Đang đồng bộ...';
      case SyncStatus.success:
        return 'Thành công';
      case SyncStatus.error:
        return 'Lỗi';
    }
  }

  Color _statusColor(SyncStatus status) {
    switch (status) {
      case SyncStatus.idle:
        return Colors.grey;
      case SyncStatus.syncing:
        return Colors.blue;
      case SyncStatus.success:
        return Colors.green;
      case SyncStatus.error:
        return Colors.red;
    }
  }
}
