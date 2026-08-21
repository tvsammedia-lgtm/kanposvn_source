import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers.dart';
import '../providers/kanji_providers.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kanjiAsync = ref.watch(kanjiListProvider);
    final progress = ref.watch(kanjiProgressProvider);

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
        child: kanjiAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Lỗi: $e')),
          data: (kanji) {
            var totalCorrect = 0;
            var totalWrong = 0;
            for (final s in progress.srs.values) {
              totalCorrect += s.correctCount;
              totalWrong += s.wrongCount;
            }
            final accuracy =
                totalCorrect + totalWrong == 0 ? 0.0 : totalCorrect / (totalCorrect + totalWrong);
            final level = (progress.xp / 100).floor() + 1;

            // Biểu đồ 7 ngày
            final week = <Widget>[];
            for (var i = 6; i >= 0; i--) {
              final day = DateTime.now().subtract(Duration(days: i));
              final key = day.toIso8601String().substring(0, 10);
              final s = progress.daily[key];
              final actions = s == null
                  ? 0
                  : s.newLearned + s.reviewed + s.quizCorrect + s.quizWrong + s.gamePlays;
              week.add(_Bar(
                label: 'T2 T3 T4 T5 T6 T7 CN'
                    .split(' ')[(day.weekday - 1) % 7],
                value: actions,
                max: 30,
              ));
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(child: _StatCard(icon: Icons.menu_book, color: Colors.indigo, label: 'Tổng Kanji', value: '${kanji.length}')),
                      const SizedBox(width: 12),
                      Expanded(child: _StatCard(icon: Icons.verified, color: Colors.green, label: 'Mastered', value: '${progress.masteredCount}')),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _StatCard(icon: Icons.local_fire_department, color: Colors.orange, label: 'Streak', value: '${progress.streakDays} ngày')),
                      const SizedBox(width: 12),
                      Expanded(child: _StatCard(icon: Icons.stars, color: Colors.amber, label: 'XP (Lv.$level)', value: '${progress.xp}')),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _StatCard(icon: Icons.percent, color: Colors.blue, label: 'Chính xác', value: '${(accuracy * 100).round()}%')),
                      const SizedBox(width: 12),
                      Expanded(child: _StatCard(icon: Icons.schedule, color: Colors.red, label: 'Cần ôn', value: '${progress.dueCount}')),
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
                          const Text('7 ngày qua',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: week,
                          ),
                        ],
                      ),
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

class _Bar extends StatelessWidget {
  final String label;
  final int value;
  final int max;
  const _Bar({required this.label, required this.value, required this.max});

  @override
  Widget build(BuildContext context) {
    final h = (value / max).clamp(0.05, 1.0) * 80;
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 22,
            height: h,
            decoration: BoxDecoration(
              color: value > 0 ? const Color(0xff24134a) : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 6),
          Text(label, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final MaterialColor color;
  final String label;
  final String value;
  const _StatCard({required this.icon, required this.color, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(label, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }
}
