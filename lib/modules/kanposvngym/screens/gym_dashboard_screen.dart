import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/gym_providers.dart';
import 'gym_members_screen.dart';
import 'gym_pos_screen.dart';
import 'gym_trainer_screen.dart';

class GymDashboardScreen extends ConsumerWidget {
  const GymDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final members = ref.watch(gymMembersProvider);
    final checkInsAsync = ref.watch(gymCheckInsTodayProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('KanGYM - Quản lý Phòng Tập'),
        backgroundColor: const Color(0xFF1E3A8A), // Blue đậm thể thao
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF1E3A8A)),
              child: Text('KanGYM Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Hội Viên (Members)'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const GymMembersScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.sports_gymnastics),
              title: const Text('Huấn Luyện Viên & Lớp'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const GymTrainerScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.point_of_sale),
              title: const Text('Bán Hàng POS'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const GymPosScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text('Gói Tập (Plans)'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.qr_code_scanner),
              title: const Text('Check-in'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatsRow(members.length, checkInsAsync.valueOrNull?.length ?? 0),
              const SizedBox(height: 24),
              const Text('Hội viên đăng ký gần đây', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildRecentMembers(members, context),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Open Check-in scanner
        },
        backgroundColor: const Color(0xFF1E3A8A),
        icon: const Icon(Icons.qr_code_scanner),
        label: const Text('Check-in'),
      ),
    );
  }

  Widget _buildStatsRow(int memberCount, int checkInCount) {
    return Row(
      children: [
        Expanded(
          child: Card(
            color: Colors.blue[50],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Icon(Icons.people, color: Colors.blue, size: 32),
                  const SizedBox(height: 8),
                  Text('$memberCount', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text('Tổng Hội Viên'),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Card(
            color: Colors.green[50],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Icon(Icons.how_to_reg, color: Colors.green, size: 32),
                  const SizedBox(height: 8),
                  Text('$checkInCount', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text('Check-in Hôm Nay'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentMembers(List<dynamic> members, BuildContext context) {
    if (members.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Center(child: Text('Chưa có hội viên nào.')),
        ),
      );
    }
    
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: members.take(5).length,
      itemBuilder: (context, index) {
        final m = members[index];
        return Card(
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFF1E3A8A),
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(m.fullName, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(m.phone),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        );
      },
    );
  }
}
