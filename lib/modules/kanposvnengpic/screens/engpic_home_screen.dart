import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers.dart';
import '../../../../core/router/module_selector_screen.dart';
import '../../../../core/widgets/account_switcher_button.dart';
import '../providers/engpic_providers.dart';
import 'vocabulary_list_screen.dart';
import 'image_learning_screen.dart';
import 'quiz_screen.dart';
import 'progress_screen.dart';

class EngpicHomeScreen extends ConsumerWidget {
  const EngpicHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordsAsync = ref.watch(engpicWordsProvider);
    final progress = ref.watch(engpicProgressProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ENGPIC'),
        backgroundColor: const Color(0xff24134a),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Quay lại',
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          const AccountSwitcherButton(foregroundColor: Colors.white),
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
              const Text(
                'Học tiếng Anh qua hình ảnh',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              _MenuCard(
                icon: Icons.menu_book,
                color: const Color(0xFF10B981),
                title: 'HỌC TỪ VỰNG',
                subtitle: '70 từ kèm hình ảnh minh họa',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const VocabularyListScreen())),
              ),
              const SizedBox(height: 12),
              _MenuCard(
                icon: Icons.image,
                color: const Color(0xFF3B82F6),
                title: 'HỌC QUA HÌNH ẢNH',
                subtitle: 'Nhìn hình chọn từ • Nhìn từ chọn hình',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ImageLearningScreen())),
              ),
              const SizedBox(height: 12),
              _MenuCard(
                icon: Icons.quiz,
                color: const Color(0xFFF97316),
                title: 'QUIZ 10 CÂU',
                subtitle: '10 câu • 15 giây/câu',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const QuizScreen())),
              ),
              const SizedBox(height: 12),
              _MenuCard(
                icon: Icons.refresh,
                color: const Color(0xFF8B5CF6),
                title: 'ÔN TẬP',
                subtitle: 'Ôn các từ đã học và từ trả lời sai',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const VocabularyListScreen(reviewOnly: true))),
              ),
              const SizedBox(height: 12),
              _MenuCard(
                icon: Icons.bar_chart,
                color: const Color(0xFFE11D48),
                title: 'TIẾN ĐỘ',
                subtitle: 'Thống kê học tập',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ProgressScreen())),
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                ),
                child: wordsAsync.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Text('Lỗi tải dữ liệu: $e'),
                  data: (words) {
                    final p = progress;
                    final learned = p?.learnedIds.length ?? 0;
                    final totalQ = p?.quizTotalQuestions ?? 0;
                    final totalC = p?.quizTotalCorrect ?? 0;
                    final accuracy = totalQ > 0 ? (totalC / totalQ * 100).round() : 0;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Hôm nay', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text('Đã học: $learned/${words.length} từ'),
                        Text('Chính xác: $accuracy%'),
                        Text('Số bài Quiz: ${p?.quizCount ?? 0}'),
                      ],
                    );
                  },
                ),
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
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(subtitle,
                        style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
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
