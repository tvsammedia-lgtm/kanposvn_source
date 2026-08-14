import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GymTrainerScreen extends ConsumerWidget {
  const GymTrainerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Huấn Luyện Viên & Lịch Học'),
        backgroundColor: const Color(0xFF1E3A8A),
      ),
      body: const Center(
        child: Text('Đang phát triển chức năng Booking PT & Lớp học...'),
      ),
    );
  }
}
