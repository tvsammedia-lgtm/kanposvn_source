import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanposvn/core/tracking/screens/tracking_list_screen.dart';
import 'customer_list_screen.dart';
import 'order_list_screen.dart';
import 'order_tq_settings_screen.dart';
import '../providers/sync_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bảng điều khiển KanPosVN'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Đang đồng bộ dữ liệu với Backend...')),
              );
              try {
                await ref.read(syncServiceProvider).syncAll();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Đồng bộ thành công!')),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Đồng bộ lỗi: $e')),
                  );
                }
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Xử lý logout state tại Provider sau, tạm thời đẩy về giao diện
              Navigator.pushReplacementNamed(context, '/login');
            },
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: [
          _buildMenuCard(
            context,
            Icons.list_alt,
            'Đơn Hàng',
            Colors.blue,
            () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const OrderListScreen())),
          ),
          _buildMenuCard(
            context,
            Icons.map,
            'Bản Đồ Tracking',
            Colors.green,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const TrackingListScreen(
                  appCode: 'kanposvnordertq',
                  accentColor: Color(0xFFEF4444),
                  unitLabel: 'Xe',
                  moduleTitle: 'Tracking — Order TQ',
                ),
              ),
            ),
          ),
          _buildMenuCard(
            context,
            Icons.people,
            'Khách Hàng',
            Colors.orange,
            () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const CustomerListScreen())),
          ),
          _buildMenuCard(
            context,
            Icons.settings,
            'Cài Đặt Mode',
            Colors.grey,
            () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const OrderTqSettingsScreen())),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(
      BuildContext context, IconData icon, String title, Color color, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: color),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}