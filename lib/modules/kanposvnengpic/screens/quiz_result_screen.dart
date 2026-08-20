import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizResultScreen extends ConsumerStatefulWidget {
  const QuizResultScreen({super.key, required this.score, required this.total});
  final int score;
  final int total;
  @override ConsumerState<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends ConsumerState<QuizResultScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authServiceprovider);
    final percentage = (widget.score / widget.total * 100).round();
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                size: 100,
                color: Colors.green,
              ),
              const SizedBox(height: 24),
              Text(
                'Bạn đúng ${widget.score} / ${widget.total} câu',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'Điểm: ${percentage}%',
                style: TextStyle(fontSize: 18, color: percentage >= 80 ? Colors.green : Colors.orange),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Tiếp tục'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}