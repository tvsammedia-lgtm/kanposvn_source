import 'package:flutter/material.dart';

class TaxDashboardScreen extends StatelessWidget {
  const TaxDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tổng quan Thuế Hộ Kinh Doanh'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Doanh thu dự kiến tháng này',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                title: const Text('0 VND'),
                subtitle: const Text('Chưa có dữ liệu POS'),
                leading: const Icon(Icons.attach_money),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Tổng Chi phí trong kỳ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                title: const Text('0 VND'),
                subtitle: const Text('Chi phí hợp lệ được khấu trừ'),
                leading: const Icon(Icons.money_off),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Thuế GTGT & TNCN dự kiến',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                title: const Text('0 VND'),
                subtitle: const Text('Đã tính toán dựa trên quy tắc thuế (Khoán / Kê khai)'),
                leading: const Icon(Icons.account_balance),
                trailing: IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                     // TODO: Trigger TaxCalculationEngine calculate()
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
