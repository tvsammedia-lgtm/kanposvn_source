import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers.dart';
import '../providers/kanji_providers.dart';

class KanjiSettingsScreen extends ConsumerWidget {
  const KanjiSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kanjiAsync = ref.watch(kanjiListProvider);
    final progress = ref.watch(kanjiProgressProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CÀI ĐẶT KANJI'),
        backgroundColor: const Color(0xff24134a),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Quay lại',
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.switch_account),
            tooltip: 'Chuyển tài khoản',
            onPressed: () => ref.read(authServiceProvider).signOut(),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Dữ liệu',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      kanjiAsync.when(
                        loading: () => const Text('Đang tải...'),
                        error: (e, _) => Text('Lỗi: $e'),
                        data: (kanji) {
                          final needReview =
                              kanji.where((k) => k.needsReview).length;
                          return Text(
                              '${kanji.length} chữ từ Kanji.docx'
                              '${needReview > 0 ? ' • $needReview chữ cần kiểm tra dữ liệu' : ''}',
                              style: TextStyle(color: Colors.grey.shade700));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Tiến độ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text('Đã học: ${progress.learnedCount} • XP: ${progress.xp}',
                          style: TextStyle(color: Colors.grey.shade700)),
                      const SizedBox(height: 12),
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                        icon: const Icon(Icons.delete_outline),
                        label: const Text('Xoá toàn bộ tiến độ'),
                        onPressed: () => _confirmReset(context, ref),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmReset(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xoá tiến độ?'),
        content: const Text(
            'Toàn bộ SRS, XP và thống kê Kanji sẽ bị xoá. Thao tác không thể hoàn tác.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Huỷ')),
          TextButton(
            onPressed: () {
              ref.read(kanjiProgressProvider.notifier).resetAll();
              Navigator.pop(ctx);
            },
            child: const Text('Xoá', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
