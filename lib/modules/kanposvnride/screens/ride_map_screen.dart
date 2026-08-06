import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RideMapScreen extends ConsumerWidget {
  const RideMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bản Đồ Điều Phối'),
        backgroundColor: const Color(0xFFFACC15),
        foregroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.grey[200],
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.map, size: 100, color: Colors.grey),
              SizedBox(height: 16),
              Text('Bản đồ điều phối đang khởi tạo...', style: TextStyle(color: Colors.grey, fontSize: 18)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFFACC15),
        foregroundColor: Colors.black,
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
