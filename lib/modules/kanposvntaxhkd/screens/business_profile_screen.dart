import 'package:flutter/material.dart';

class BusinessProfileScreen extends StatelessWidget {
  const BusinessProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hồ sơ Hộ Kinh Doanh'),
      ),
      body: Center(
        child: const Text('Chức năng quản lý hồ sơ đang được phát triển.'),
      ),
    );
  }
}
