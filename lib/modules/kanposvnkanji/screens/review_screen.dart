import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers.dart';
import '../providers/kanji_providers.dart';
import 'lesson_session_screen.dart';

class ReviewScreen extends ConsumerWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kanjiAsync = ref.watch(kanjiListProvider);
    final progress = ref.watch(kanjiProgressProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ÔN TẬP'),
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
        child: kanjiAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Lỗi: $e')),
          data: (kanji) {
            final known = kanji
                .map((k) => k.character)
                .where((c) => progress.srs.containsKey(c))
                .toSet();
            final due = known.where((c) => progress.srs[c]!.isDue).toList();
            final weak = progress
                .weakCharacters()
                .where((c) => known.contains(c))
                .toList();

            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _ReviewCard(
                    icon: Icons.schedule,
                    color: Colors.orange,
                    title: 'ĐẾN HẠN ÔN TẬP',
                    count: due.length,
                    subtitle: 'Các chữ theo lịch Spaced Repetition',
                    buttonText: 'Ôn ngay',
                    enabled: due.isNotEmpty,
                    onStart: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LessonSessionScreen(
                            characters: due, isReview: true),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _ReviewCard(
                    icon: Icons.trending_down,
                    color: Colors.red,
                    title: 'CHỮ YẾU',
                    count: weak.length,
                    subtitle: 'Chính xác dưới 70% — cần luyện thêm',
                    buttonText: 'Luyện chữ yếu',
                    enabled: weak.isNotEmpty,
                    onStart: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LessonSessionScreen(
                            characters: weak, isReview: true),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (due.isEmpty && weak.isEmpty)
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.verified,
                              size: 48, color: Colors.green.shade400),
                          const SizedBox(height: 8),
                          const Text('Tuyệt vời! Không có gì cần ôn.',
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final IconData icon;
  final MaterialColor color;
  final String title;
  final int count;
  final String subtitle;
  final String buttonText;
  final bool enabled;
  final VoidCallback onStart;

  const _ReviewCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.count,
    required this.subtitle,
    required this.buttonText,
    required this.enabled,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: color.withOpacity(.15),
                  child: Icon(icon, color: color),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(subtitle,
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade600)),
                    ],
                  ),
                ),
                Text('$count chữ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: color.shade700)),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: enabled ? color : Colors.grey.shade300,
                  foregroundColor: enabled ? Colors.white : Colors.grey.shade600,
                ),
                icon: const Icon(Icons.play_arrow),
                label: Text(buttonText),
                onPressed: enabled ? onStart : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
