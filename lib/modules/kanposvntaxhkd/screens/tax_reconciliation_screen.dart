import 'package:flutter/material.dart';

class TaxReconciliationScreen extends StatelessWidget {
  const TaxReconciliationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đối chiếu Dữ liệu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.compare_arrows, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text('Đối chiếu doanh thu POS với Ngân hàng / HĐĐT'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Run reconciliation
              },
              child: const Text('Chạy Đối chiếu tự động'),
            )
          ],
        ),
      ),
    );
  }
}
