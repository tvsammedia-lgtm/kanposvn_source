import 'package:flutter/material.dart';

class TaxDeclarationsScreen extends StatelessWidget {
  const TaxDeclarationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tờ Khai Thuế'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.description, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text('Quản lý và nộp Tờ khai Thuế HKD'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Generate Draft Declaration
              },
              child: const Text('Tạo Tờ khai mới'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                // TODO: Export to PDF/Excel
              },
              child: const Text('Xuất Báo cáo (Excel/PDF)'),
            )
          ],
        ),
      ),
    );
  }
}
