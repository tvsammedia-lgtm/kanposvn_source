import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchGameScreen extends ConsumerStatefulWidget {
  const MatchGameScreen({super.key});
  @override ConsumerState<MatchGameScreen> createState() => _MatchGameScreenState();
}

class _MatchGameScreenState extends ConsumerState<MatchGameScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('TRÒ CHƠI MATCH'),
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
                'TRÒ CHƠI MATCH KANJI',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Khớp nghĩa với hình ảnh Kanji',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              const Text(
                'Tính năng này sẽ hiện ra một số từ và bạn cần khớp với nghĩa đúng',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              const Center(
                child: Text(
                  'Sắp sẵn tính năng Match Game',
                  style: TextStyle(fontSize: 18, color: Colors.white60),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}