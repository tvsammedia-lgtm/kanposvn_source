import 'package:flutter/material.dart';

class TaxEInvoiceScreen extends StatelessWidget {
  const TaxEInvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hóa đơn Điện tử'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.flash_on, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text('Tích hợp phát hành Hóa đơn Điện tử (HĐĐT)'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Issue E-Invoice
              },
              child: const Text('Phát hành HĐĐT mới'),
            ),
          ],
        ),
      ),
    );
  }
}
