import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers.dart';
import 'quiz_screen.dart';

class QuizResultScreen extends ConsumerWidget {
  const QuizResultScreen({
    super.key,
    required this.score,
    required this.correct,
    required this.wrong,
    required this.skipped,
    required this.total,
  });

  final int score;
  final int correct;
  final int wrong;
  final int skipped;
  final int total;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final percent = total > 0 ? (correct / total * 100).round() : 0;
    final passed = percent >= 50;

    return Scaffold(
      appBar: AppBar(
        title: const Text('KẾT QUẢ'),
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
            children: [
              const SizedBox(height: 16),
              CircleAvatar(
                radius: 56,
                backgroundColor: passed ? Colors.green.shade100 : Colors.red.shade100,
                child: Icon(
                  passed ? Icons.emoji_events : Icons.sentiment_dissatisfied,
                  size: 64,
                  color: passed ? Colors.green : Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                passed ? 'Xuất sắc!' : 'Cố gắng hơn nhé!',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('$percent%',
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: passed ? Colors.green : Colors.red)),
              Text('$correct/$total câu đúng',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  children: [
                    _StatRow(icon: Icons.check_circle, color: Colors.green,
                        label: 'Đúng', value: '$correct'),
                    const Divider(),
                    _StatRow(icon: Icons.cancel, color: Colors.red,
                        label: 'Sai', value: '$wrong'),
                    const Divider(),
                    _StatRow(icon: Icons.hourglass_empty, color: Colors.orange,
                        label: 'Bỏ qua (hết giờ)', value: '$skipped'),
                    const Divider(),
                    _StatRow(icon: Icons.stars, color: Colors.amber,
                        label: 'Tổng điểm', value: '$score'),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.refresh),
                      label: const Text('Làm lại'),
                      onPressed: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const QuizScreen())),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff24134a),
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.home),
                      label: const Text('Về trang chủ'),
                      onPressed: () =>
                          Navigator.popUntil(context, (r) => r.isFirst),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final String value;

  const _StatRow({
    required this.icon,
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(width: 10),
        Expanded(child: Text(label)),
        Text(value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
