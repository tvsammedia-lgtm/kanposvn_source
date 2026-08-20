import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageLearningScreen extends ConsumerStatefulWidget {
  const ImageLearningScreen({super.key});
  @override  ConsumerState<ImageLearningScreen> createState() => _ImageLearningScreenState();
}

class _ImageLearningScreenState extends ConsumerState<ImageLearningScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HỌC VỚA HÌNH'),
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
                'Học từ vựng qua hình ảnh',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Tính năng này hiển thị hình ảnh kèm từ vựng tiếng Nhật',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              const Center(
                child: Icon(Icons.photo_size_select_actual, size: 100, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              const Text(
                'Chọn một hình ảnh để bắt đầu học',
                style: TextStyle(fontSize: 18, color: Colors.white60),
              ),
            ],
          ),
        ),
      ),
    );
  }
}