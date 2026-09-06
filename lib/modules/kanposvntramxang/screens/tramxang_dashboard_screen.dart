import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/tramxang_providers.dart';

class TramXangDashboardScreen extends ConsumerStatefulWidget {
  const TramXangDashboardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TramXangDashboardScreen> createState() => _TramXangDashboardScreenState();
}

class _TramXangDashboardScreenState extends ConsumerState<TramXangDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trạm Xăng Dashboard'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildMenuCard(
            context, 
            'POS Bán Hàng', 
            Icons.point_of_sale, 
            () {
              // Navigate to POS
            }
          ),
          _buildMenuCard(
            context, 
            'Quản Lý Bồn', 
            Icons.propane_tank, 
            () {
              // Navigate to Tanks
            }
          ),
          _buildMenuCard(
            context, 
            'Ca Bán Hàng', 
            Icons.schedule, 
            () {
              // Navigate to Shifts
            }
          ),
          _buildMenuCard(
            context, 
            'Báo Cáo', 
            Icons.bar_chart, 
            () {
              // Navigate to Reports
            }
          ),
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
            Text(title, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
