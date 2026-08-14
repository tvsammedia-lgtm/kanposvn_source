import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ParkingMonthlyScreen extends ConsumerWidget {
  const ParkingMonthlyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Vé Tháng'),
        backgroundColor: const Color(0xFF0F766E),
      ),
      body: const Center(
        child: Text('Đang phát triển chức năng Đăng ký & Gia hạn Vé tháng...'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF0F766E),
        child: const Icon(Icons.add),
      ),
    );
  }
}
