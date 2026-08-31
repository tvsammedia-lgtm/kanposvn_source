import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../kanposvnhrpayroll/core/app_theme.dart';
import '../providers/doichieu_providers.dart';
import '../services/history_service.dart';

class DcHistoryScreen extends ConsumerWidget {
  const DcHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(doichieuHistoryProvider);
    final currentCreatedAtMs = ref.watch(doichieuFlowProvider).report?.createdAtMs;

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Lưu trữ kết quả',
                        style: Theme.of(context).textTheme.headlineMedium),
                    Text('Các phiên đã phân tích, xem lại được bất cứ lúc nào',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const Spacer(),
                IconButton(
                  tooltip: 'Làm mới',
                  onPressed: () => ref.invalidate(doichieuHistoryProvider),
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppTheme.borderColor),
          Expanded(
            child: history.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(
                child: Text('Lỗi: $e',
                    style: const TextStyle(color: AppTheme.danger)),
              ),
              data: (entries) {
                if (entries.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.history, size: 64, color: AppTheme.textMuted),
                        const SizedBox(height: 16),
                        const Text('Chưa có lịch sử',
                            style: TextStyle(
                                color: AppTheme.textPrimary, fontSize: 16)),
                        const SizedBox(height: 8),
                        const Text(
                          'Kết quả sẽ được lưu tự động sau mỗi lần chạy đối chiếu.\n'
                          'Hãy chọn file → chạy đối chiếu để bắt đầu.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppTheme.textMuted, fontSize: 13),
                        ),
                        const SizedBox(height: 20),
                        FilledButton.icon(
                          onPressed: () {
                            ref.read(doichieuTabIndexProvider.notifier).state = 0;
                          },
                          icon: const Icon(Icons.compare_arrows, size: 18),
                          label: const Text('Chuyển sang tab Đối chiếu'),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(24),
                  itemCount: entries.length,
                  itemBuilder: (context, i) {
                    final e = entries[i];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppTheme.primaryBlue.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.receipt_long,
                              color: AppTheme.primaryLight, size: 20),
                        ),
                        title: Text(
                          e.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          '${_stamp(e)} · ${e.totalRows} dòng · '
                          '${e.errorCount} khác biệt · ${e.fileNames.length} file',
                          style: const TextStyle(fontSize: 12),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (e.createdAtMs == currentCreatedAtMs)
                              Container(
                                margin: const EdgeInsets.only(right: 4),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: AppTheme.success.withValues(alpha: 0.18),
                                  borderRadius: BorderRadius.circular(999),
                                  border:
                                      Border.all(color: AppTheme.success, width: 1),
                                ),
                                child: const Text(
                                  'Phiên hiện tại',
                                  style: TextStyle(
                                    color: AppTheme.success,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            IconButton(
                              tooltip: 'Xem',
                              icon: const Icon(Icons.visibility_outlined, size: 20),
                              onPressed: () async {
                                final report = await HistoryService.loadReport(e.path);
                                if (report == null) return;
                                ref.read(doichieuFlowProvider.notifier).restoreReport(report);
                                ref.read(doichieuTabIndexProvider.notifier).state = 1;
                              },
                            ),
                            IconButton(
                              tooltip: 'Xóa',
                              icon: const Icon(Icons.delete_outline, size: 20),
                              onPressed: () => _delete(ref, e),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _delete(WidgetRef ref, HistoryEntry e) async {
    await HistoryService.deleteReport(e.path);
    ref.invalidate(doichieuHistoryProvider);
  }

  String _stamp(HistoryEntry e) {
    return '${e.createdAt.day.toString().padLeft(2, '0')}/'
        '${e.createdAt.month.toString().padLeft(2, '0')}/'
        '${e.createdAt.year} '
        '${e.createdAt.hour.toString().padLeft(2, '0')}:'
        '${e.createdAt.minute.toString().padLeft(2, '0')}';
  }
}