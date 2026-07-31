import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/batdongsan_providers.dart';
import 'property_list_screen.dart';
import 'customer_list_screen.dart';
import 'broker_list_screen.dart';
import 'transaction_list_screen.dart';
import '../models/customer.dart';

class BatDongSanDashboard extends ConsumerWidget {
  const BatDongSanDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Bất động sản'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () {
              ref.read(syncServiceProvider).syncProperties();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Đang đồng bộ...')),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildDashboardCard(context, 'Tổng BĐS', Icons.home, Colors.blue, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PropertyListScreen()));
            }),
            _buildDashboardCard(context, 'Khách Mua', Icons.person_add, Colors.green, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerListScreen(type: CustomerType.buyer)));
            }),
            _buildDashboardCard(context, 'Khách Bán', Icons.person_remove, Colors.orange, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerListScreen(type: CustomerType.seller)));
            }),
            _buildDashboardCard(context, 'Môi Giới', Icons.support_agent, Colors.teal, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BrokerListScreen()));
            }),
            _buildDashboardCard(context, 'Giao Dịch', Icons.handshake, Colors.purple, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TransactionListScreen()));
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
