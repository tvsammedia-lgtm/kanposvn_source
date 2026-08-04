import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../../../core/router/module_selector_screen.dart';
import '../providers/batdongsan_providers.dart';
import '../services/batdongsan_seed_data.dart';
import 'property_list_screen.dart';
import 'customer_list_screen.dart';
import 'broker_list_screen.dart';
import 'transaction_list_screen.dart';
import 'batdongsan_sales_report_screen.dart';
import 'batdongsan_sync_screen.dart';
import '../models/customer.dart';

class BatDongSanDashboard extends ConsumerStatefulWidget {
  const BatDongSanDashboard({super.key});

  @override
  ConsumerState<BatDongSanDashboard> createState() => _BatDongSanDashboardState();
}

class _BatDongSanDashboardState extends ConsumerState<BatDongSanDashboard> {
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    await BatDongSanSeedData.seedIfEmpty();
    ref.invalidate(propertiesProvider);
    ref.invalidate(transactionsProvider);
    ref.invalidate(customersProvider);
    ref.invalidate(buyersProvider);
    ref.invalidate(sellersProvider);
    ref.invalidate(brokersProvider);
    if (mounted) {
      setState(() {
        _isInit = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInit) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Đang khởi tạo dữ liệu mẫu...'),
            ],
          ),
        ),
      );
    }

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
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Thoát',
            onPressed: () async {
              await ref.read(authServiceProvider).signOut();
              ref.read(selectedModuleProvider.notifier).state = null;
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildDashboardCard(context, 'Bất động sản', Icons.home, Colors.blue, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PropertyListScreen()));
            }),
            _buildDashboardCard(context, 'Khách mua', Icons.people, Colors.green, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerListScreen(type: CustomerType.buyer)));
            }),
            _buildDashboardCard(context, 'Khách bán', Icons.people_outline, Colors.lightGreen, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerListScreen(type: CustomerType.seller)));
            }),
            _buildDashboardCard(context, 'Môi giới', Icons.person, Colors.orange, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BrokerListScreen()));
            }),
            _buildDashboardCard(context, 'Giao dịch', Icons.description, Colors.purple, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TransactionListScreen()));
            }),
            _buildDashboardCard(context, 'Báo cáo', Icons.bar_chart, Colors.deepOrange, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BatDongSanSalesReportScreen()));
            }),
            _buildDashboardCard(context, 'Đồng bộ', Icons.sync, Colors.indigo, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BatDongSanSyncScreen()));
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
