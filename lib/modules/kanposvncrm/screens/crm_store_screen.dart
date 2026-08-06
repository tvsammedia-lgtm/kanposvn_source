import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CrmStoreScreen extends ConsumerWidget {
  const CrmStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Cửa Hàng (Stores)'),
        backgroundColor: const Color(0xFFE11D48),
      ),
      body: const Center(
        child: Text('Đang phát triển tính năng quản lý cửa hàng...'),
      ),
    );
  }
}
