import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/nhatro_providers.dart';
import '../services/nhatro_seed_data.dart';
import 'room_list_screen.dart';

class NhaTroDashboard extends ConsumerStatefulWidget {
  const NhaTroDashboard({super.key});

  @override
  ConsumerState<NhaTroDashboard> createState() => _NhaTroDashboardState();
}

class _NhaTroDashboardState extends ConsumerState<NhaTroDashboard> {
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    await NhaTroSeedData.seedIfEmpty();
    ref.invalidate(roomsProvider);
    ref.invalidate(tenantsProvider);
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

    final roomsAsync = ref.watch(roomsProvider);
    final tenantsAsync = ref.watch(tenantsProvider);
    final roomCount = roomsAsync.maybeWhen(data: (r) => r.length, orElse: () => null);
    final tenantCount = tenantsAsync.maybeWhen(data: (t) => t.length, orElse: () => null);

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
            _buildDashboardCard(context, 'Phòng', Icons.door_front_door, Colors.blue, roomCount, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RoomListScreen()));
            }),
            _buildDashboardCard(context, 'Khách thuê', Icons.people, Colors.green, tenantCount, () {}),
            _buildDashboardCard(context, 'Hợp đồng', Icons.description, Colors.orange, null, () {}),
            _buildDashboardCard(context, 'Thu tiền', Icons.attach_money, Colors.purple, null, () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, String title, IconData icon, Color color, int? count, VoidCallback onTap) {
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
            if (count != null) ...[
              const SizedBox(height: 4),
              Text('$count', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54)),
            ],
          ],
        ),
      ),
    );
  }
}
