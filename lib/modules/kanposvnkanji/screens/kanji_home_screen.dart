import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers.dart';
import '../../../../core/router/module_selector_screen.dart';
import '../providers/kanji_providers.dart';
import 'kanji_library_screen.dart';
import 'lesson_session_screen.dart';
import 'quiz_screen.dart';
import 'review_screen.dart';
import 'match_game_screen.dart';
import 'speed_game_screen.dart';
import 'memory_game_screen.dart';
import 'progress_screen.dart';
import 'kanji_settings_screen.dart';

class KanjiHomeScreen extends ConsumerWidget {
  const KanjiHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kanjiAsync = ref.watch(kanjiListProvider);
    final progress = ref.watch(kanjiProgressProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('KANJI MASTER'),
        backgroundColor: const Color(0xff24134a),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Quay lại',
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Cài đặt',
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const KanjiSettingsScreen())),
          ),
          IconButton(
            icon: const Icon(Icons.switch_account),
            tooltip: 'Chuyển tài khoản',
            onPressed: () => ref.read(authServiceProvider).signOut(),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Thoát về màn hình đăng nhập',
            onPressed: () => _confirmExit(context, ref),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Text('Hôm nay',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Icon(Icons.local_fire_department, color: Colors.orange.shade700),
                  Text('${progress.streakDays} ngày liên tiếp',
                      style: TextStyle(color: Colors.grey.shade700)),
                ],
              ),
              const SizedBox(height: 12),
              kanjiAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Text('Lỗi tải dữ liệu: $e'),
                data: (kanji) {
                  final today = progress.today();
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Column(
                      children: [
                        _TodayRow(label: 'Chữ mới', value: '${today.newLearned}'),
                        _TodayRow(label: 'Ôn tập', value: '${today.reviewed}'),
                        _TodayRow(
                            label: 'Quiz',
                            value: '${today.quizCorrect + today.quizWrong}'),
                        _TodayRow(label: 'Mini Game', value: '${today.gamePlays}'),
                        const Divider(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: LinearProgressIndicator(
                                  value: kanji.isEmpty
                                      ? 0
                                      : progress.learnedCount / kanji.length,
                                  minHeight: 14,
                                  backgroundColor: Colors.grey.shade300,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text('${progress.learnedCount}/${kanji.length}',
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _LevelChip(
                                label: 'Nhớ tốt',
                                count: progress.masteredCount,
                                color: Colors.green),
                            _LevelChip(
                                label: 'Đang học',
                                count: progress.learnedCount - progress.masteredCount,
                                color: Colors.blue),
                            _LevelChip(
                                label: 'Cần ôn',
                                count: progress.dueCount,
                                color: Colors.orange),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              _MenuCard(
                icon: Icons.school,
                color: const Color(0xFF10B981),
                title: 'HỌC BÀI HÔM NAY',
                subtitle: '10 chữ mới • Flashcard Hán Việt → Kanji',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LessonSessionScreen())),
              ),
              const SizedBox(height: 12),
              _MenuCard(
                icon: Icons.replay_circle_filled,
                color: const Color(0xFFF97316),
                title: 'ÔN TẬP',
                subtitle:
                    '${progress.dueCount} chữ đến hạn • ${progress.weakCharacters().length} chữ yếu',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ReviewScreen())),
              ),
              const SizedBox(height: 12),
              _MenuCard(
                icon: Icons.quiz,
                color: const Color(0xFF3B82F6),
                title: 'QUIZ',
                subtitle: 'Trắc nghiệm 4 đáp án',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const QuizScreen())),
              ),
              const SizedBox(height: 12),
              _MenuCard(
                icon: Icons.sports_esports,
                color: const Color(0xFF8B5CF6),
                title: 'MINI GAME',
                subtitle: 'Match • Speed 30s • Memory Card',
                onTap: () => _showGameMenu(context),
              ),
              const SizedBox(height: 12),
              _MenuCard(
                icon: Icons.menu_book,
                color: const Color(0xFFE11D48),
                title: 'THƯ VIỆN KANJI',
                subtitle: 'Tìm kiếm theo chữ, Hán Việt, nghĩa',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const KanjiLibraryScreen())),
              ),
              const SizedBox(height: 12),
              _MenuCard(
                icon: Icons.bar_chart,
                color: const Color(0xFF0EA5E9),
                title: 'TIẾN ĐỘ',
                subtitle: 'Thống kê học tập',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ProgressScreen())),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _confirmExit(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Thoát'),
        content: const Text('Bạn có chắc muốn thoát về màn hình đăng nhập?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Thoát', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      ref.read(selectedModuleProvider.notifier).state = null;
      await ref.read(authServiceProvider).signOut();
    }
  }

  void _showGameMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.extension, color: Color(0xFF8B5CF6)),
                title: const Text('Match — Ghép cặp'),
                subtitle: const Text('Ghép Hán Việt với Kanji'),
                onTap: () {
                  Navigator.pop(ctx);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const MatchGameScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.bolt, color: Color(0xFFF97316)),
                title: const Text('Speed Kanji — 30 giây'),
                subtitle: const Text('Trả lời nhanh nhất có thể'),
                onTap: () {
                  Navigator.pop(ctx);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SpeedGameScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.style, color: Color(0xFF10B981)),
                title: const Text('Memory Card — Lật thẻ'),
                subtitle: const Text('Tìm cặp thẻ giống nhau'),
                onTap: () {
                  Navigator.pop(ctx);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const MemoryGameScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TodayRow extends StatelessWidget {
  final String label;
  final String value;
  const _TodayRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _LevelChip extends StatelessWidget {
  final String label;
  final int count;
  final MaterialColor color;
  const _LevelChip(
      {required this.label, required this.count, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text('$label $count',
          style: TextStyle(fontSize: 12, color: color.shade800)),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _MenuCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: color.withOpacity(.15),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(subtitle,
                        style:
                            TextStyle(fontSize: 13, color: Colors.grey.shade600)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
