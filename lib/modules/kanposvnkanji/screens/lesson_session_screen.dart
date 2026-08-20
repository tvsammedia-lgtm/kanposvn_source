import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverprof.dart';

class LessonSessionScreen extends ConsumerStatefulWidget {
  const LessonSessionScreen({super.key});
  @override ConsumerState<LessonSessionScreen> createState() => _LessonSessionScreenState();
}

class _LessonSessionScreenState extends ConsumerState<LessonSessionScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authServiceprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('PHẦN HỌC BÀI'),
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
                'PHẦN HỌC BÀI KANJI',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Bài học: Kanji cơ bản - Bộ 50 từ đầu tiên',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 24),
              const Text(
                'Từ kanji thứ 1 đến kanji thứ 50: Một, 二, 三, 四, 五',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              const Center(
                child: Text(
                  'Sắp sẵn tính năng Lesson Session',
                  style: TextStyle(fontSize: 18, color: Colors.white60),
              ),
            ],
          ),
        ),
      ),
    );
  }
}