import 'package:flutter/material.dart';

import '../../../core/tracking/screens/tracking_list_screen.dart';
import '../../../core/widgets/dashboard_nav_grid.dart';
import 'accounting/nongsan_accounting_screen.dart';
import 'inventory_screen.dart';
import 'nongsan_settings_screen.dart';
import 'purchasing_screen.dart';

/// Màu module Kinh doanh Nông sản.
const nongsanModuleColor = Color(0xFF16A34A);

class DailyNongSanDashboardScreen extends StatelessWidget {
  const DailyNongSanDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <DashboardNavItem>[
      DashboardNavItem(
        label: 'Mua Hàng',
        icon: Icons.shopping_cart,
        color: Colors.blue,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PurchasingScreen()),
        ),
      ),
      DashboardNavItem(
        label: 'Kho Hàng',
        icon: Icons.inventory_2,
        color: Colors.teal,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const InventoryScreen()),
        ),
      ),
      DashboardNavItem(
        label: 'Kế Toán',
        icon: Icons.account_balance,
        color: Colors.indigo,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const NongSanAccountingScreen()),
        ),
      ),
      DashboardNavItem(
        label: 'Bản Đồ Tracking',
        icon: Icons.map,
        color: Colors.green,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const TrackingListScreen(
              appCode: 'kanposvndailynongsan',
              accentColor: nongsanModuleColor,
              unitLabel: 'Xe',
              moduleTitle: 'Tracking — Nông sản',
            ),
          ),
        ),
      ),
      DashboardNavItem(
        label: 'Bán Hàng',
        icon: Icons.point_of_sale,
        color: Colors.orange,
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Module Bán hàng đang phát triển')),
        ),
      ),
      DashboardNavItem(
        label: 'Cài Đặt',
        icon: Icons.settings,
        color: Colors.blueGrey,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const NongSanSettingsScreen()),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: nongsanModuleColor,
        foregroundColor: Colors.white,
        title: const Text('Tổng quan Đại lý Nông sản'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          DashboardNavGrid(
            items: items,
            crossAxisCount: MediaQuery.sizeOf(context).width > 600 ? 4 : 2,
          ),
        ],
      ),
    );
  }
}