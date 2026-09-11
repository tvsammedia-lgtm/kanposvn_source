import 'package:flutter/material.dart';

class TaxExpensesScreen extends StatelessWidget {
  const TaxExpensesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chứng từ Chi phí'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.receipt_long, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text('Danh sách chứng từ chi phí và phân bổ'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Open add expense modal
              },
              child: const Text('Thêm Chi phí mới'),
            )
          ],
        ),
      ),
    );
  }
}
