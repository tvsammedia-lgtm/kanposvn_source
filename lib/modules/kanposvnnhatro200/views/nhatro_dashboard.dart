import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/nhatro_providers.dart';
import 'room_list_screen.dart';

class NhaTroDashboard extends ConsumerWidget {
  const NhaTroDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Nhà Trọ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () {
              ref.read(nhatroSyncServiceProvider).syncAll();
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
            _buildDashboardCard(context, 'Phòng', Icons.door_front_door, Colors.blue, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RoomListScreen()));
            }),
            _buildDashboardCard(context, 'Khách thuê', Icons.people, Colors.green, () {}),
            _buildDashboardCard(context, 'Hợp đồng', Icons.description, Colors.orange, () {}),
            _buildDashboardCard(context, 'Thu tiền', Icons.attach_money, Colors.purple, () {}),
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
