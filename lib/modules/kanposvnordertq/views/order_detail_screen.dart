import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {
  final String orderId;

  const OrderDetailScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết Order $orderId'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCustomerInfo(context),
            const SizedBox(height: 24),
            _buildTimeline(context),
            const SizedBox(height: 24),
            _buildItemsList(context),
            const SizedBox(height: 24),
            _buildCostSummary(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerInfo(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text('Khách hàng: Nguyễn Văn A'),
        subtitle: Text('SĐT: 0987654321\nĐC: 123 Đường B, TP.HCM'),
      ),
    );
  }

  Widget _buildTimeline(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Lộ trình Vận chuyển', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        // Mock Timeline UI
        const ListTile(
          leading: Icon(Icons.check_circle, color: Colors.green),
          title: Text('Nhập kho Trung Quốc'),
          subtitle: Text('07/09 03:30'),
        ),
        const ListTile(
          leading: Icon(Icons.local_shipping, color: Colors.blue),
          title: Text('Đang vận chuyển (Lên xe)'),
          subtitle: Text('07/09 05:00'),
        ),
        const ListTile(
          leading: Icon(Icons.radio_button_unchecked, color: Colors.grey),
          title: Text('Dự kiến tới Kho Việt Nam'),
          subtitle: Text('ETA: 15:30'),
        ),
      ],
    );
  }

  Widget _buildItemsList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sản phẩm', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        const Card(
          child: ListTile(
            title: Text('Túi xách thời trang (Đen)'),
            subtitle: Text('SKU: BAG-123 | SL: 2'),
            trailing: Text('¥150.00'),
          ),
        ),
      ],
    );
  }

  Widget _buildCostSummary(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Tiền hàng:'), Text('1,050,000 đ')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Phí vận chuyển:'), Text('150,000 đ')],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Tổng cộng:', style: TextStyle(fontWeight: FontWeight.bold)), Text('1,200,000 đ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))],
            ),
          ],
        ),
      ),
    );
  }
}
