import 'package:flutter/material.dart';

class CongTrinhDashboardScreen extends StatelessWidget {
  const CongTrinhDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dự toán Xây Dựng'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildMenuCard(context, 'Công Trình', Icons.home_work, () {
            // Navigate to Project Management
          }),
          _buildMenuCard(context, 'Dự Toán', Icons.request_quote, () {
            // Navigate to Estimates
          }),
          _buildMenuCard(context, 'Định Mức & Đơn Giá', Icons.format_list_numbered, () {
            // Navigate to Norms and Prices
          }),
          _buildMenuCard(context, 'Báo Cáo', Icons.bar_chart, () {
            // Navigate to Reports
          }),
        ],
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: Theme.of(context).primaryColor),
            const SizedBox(height: 16),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
