import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key});
  @override ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('TRẮC NGHIỆM'),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'TRẮC NGHIỆM KANJI',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Câu hỏi: Chọn ý nghĩa đúng cho Kanji: 一',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 24),
              _buildOption('Một', Icons.check_circle),
              const SizedBox(height: 12),
              _buildOption('Hai', Icons.remove),
              const SizedBox(height: 12),
              _buildOption('Ba', Icons.remove),
              const SizedBox(height: 12),
              _buildOption('Ô', Icons.remove),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Nộp bài'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.green),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}