import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViecMatchingScreen extends ConsumerWidget {
  const ViecMatchingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ghép Việc Tự Động (Matching)'),
        backgroundColor: const Color(0xFF6366F1),
      ),
      body: const Center(
        child: Text('Đang tìm kiếm ứng viên phù hợp cho công việc...'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF6366F1),
        child: const Icon(Icons.compare_arrows),
      ),
    );
  }
}
