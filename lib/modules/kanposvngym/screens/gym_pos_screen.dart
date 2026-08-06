import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GymPosScreen extends ConsumerWidget {
  const GymPosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bán Hàng POS (Nước, Whey...)'),
        backgroundColor: const Color(0xFF1E3A8A),
      ),
      body: const Center(
        child: Text('Đang phát triển chức năng POS Bán hàng phòng GYM...'),
      ),
    );
  }
}
