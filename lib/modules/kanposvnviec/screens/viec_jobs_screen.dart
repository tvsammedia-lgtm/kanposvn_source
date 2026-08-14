import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViecJobsScreen extends ConsumerWidget {
  const ViecJobsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Tin Tuyển Dụng'),
        backgroundColor: const Color(0xFF6366F1),
      ),
      body: const Center(
        child: Text('Danh sách công việc đang tuyển...'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFF6366F1),
        icon: const Icon(Icons.post_add),
        label: const Text('Đăng Việc Mới'),
      ),
    );
  }
}
