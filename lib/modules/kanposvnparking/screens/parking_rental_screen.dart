import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ParkingRentalScreen extends ConsumerWidget {
  const ParkingRentalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Cho Thuê Xe'),
        backgroundColor: const Color(0xFF0F766E),
      ),
      body: const Center(
        child: Text('Đang phát triển chức năng Giao Xe & Nhận Cọc...'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFF0F766E),
        icon: const Icon(Icons.car_rental),
        label: const Text('Tạo Phiếu Thuê'),
      ),
    );
  }
}
