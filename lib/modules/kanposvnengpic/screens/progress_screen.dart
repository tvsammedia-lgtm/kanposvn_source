import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers.dart';
import '../providers/engpic_providers.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordsAsync = ref.watch(engpicWordsProvider);
    final progress = ref.watch(engpicProgressProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TIẾN ĐỘ'),
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
        child: wordsAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Lỗi: $e')),
          data: (words) {
            final p = progress;
            final learned = p?.learnedIds.length ?? 0;
            final favorites = p?.favoriteIds.length ?? 0;
            final totalQ = p?.quizTotalQuestions ?? 0;
            final totalC = p?.quizTotalCorrect ?? 0;
            final accuracy = totalQ > 0 ? totalC / totalQ : 0.0;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(child: _StatCard(icon: Icons.menu_book,
                          color: const Color(0xFF10B981),
                          label: 'Đã học', value: '$learned/${words.length}')),
                      const SizedBox(width: 12),
                      Expanded(child: _StatCard(icon: Icons.star,
                          color: Colors.amber,
                          label: 'Yêu thích', value: '$favorites')),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _StatCard(icon: Icons.quiz,
                          color: const Color(0xFFF97316),
                          label: 'Bài Quiz', value: '${p?.quizCount ?? 0}')),
                      const SizedBox(width: 12),
                      Expanded(child: _StatCard(icon: Icons.percent,
                          color: const Color(0xFF3B82F6),
                          label: 'Chính xác', value: '${(accuracy * 100).round()}%')),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Tổng điểm Quiz',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text('${p?.quizTotalScore ?? 0}',
                              style: const TextStyle(fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff24134a))),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text('Tiến độ theo chủ đề',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  ..._categoryProgress(words, p),
                  const SizedBox(height: 24),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.delete_outline),
                    label: const Text('Xoá toàn bộ tiến độ'),
                    style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                    onPressed: () => _confirmReset(context, ref),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _categoryProgress(List<dynamic> words, dynamic p) {
    final byCat = <String, List<int>>{};
    for (final w in words) {
      byCat.putIfAbsent(w.category as String, () => []).add(w.id as int);
    }
    final cats = byCat.keys.toList()..sort();
    return cats.map((c) {
      final ids = byCat[c]!;
      final learnedCount = ids.where((id) => p?.learnedIds.contains(id) ?? false).length;
      final ratio = ids.isEmpty ? 0.0 : learnedCount / ids.length;
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(c)),
                Text('$learnedCount/${ids.length}',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
              ],
            ),
            const SizedBox(height: 4),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: ratio,
                minHeight: 8,
                backgroundColor: Colors.grey.shade200,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  void _confirmReset(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xoá tiến độ?'),
        content: const Text('Toàn bộ dữ liệu học tập sẽ bị xoá. Thao tác không thể hoàn tác.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Huỷ')),
          TextButton(
            onPressed: () {
              ref.read(engpicProgressProvider.notifier).reset();
              Navigator.pop(ctx);
            },
            child: const Text('Xoá', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final String value;

  const _StatCard({
    required this.icon,
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }
}
