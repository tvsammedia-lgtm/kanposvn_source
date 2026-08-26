import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/gym_providers.dart';
import '../services/gym_isar_service.dart';
import '../services/gym_seed_data.dart';
import 'gym_members_screen.dart';
import 'gym_pos_screen.dart';
import 'gym_trainer_screen.dart';
import 'gym_plans_screen.dart';
import 'gym_checkin_screen.dart';
import 'gym_settings_screen.dart';
import 'gym_reports_screen.dart';
import '../../../core/widgets/owner_info_bar.dart';

class GymDashboardScreen extends ConsumerStatefulWidget {
  const GymDashboardScreen({super.key});

  @override
  ConsumerState<GymDashboardScreen> createState() => _GymDashboardScreenState();
}

class _GymDashboardScreenState extends ConsumerState<GymDashboardScreen> {
  bool _seeded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_seeded) return;
      _seeded = true;
      await GymSeedData.seedIfEmpty(GymIsarService());
      if (mounted) {
        ref.read(gymMembersProvider.notifier).loadMembers();
        ref.read(gymPlansProvider.notifier).refresh();
        ref.read(gymProductsProvider.notifier).refresh();
        ref.read(gymTrainersProvider.notifier).refresh();
        ref.read(gymClassesProvider.notifier).refresh();
        ref.read(gymCheckInsTodayProvider.notifier).refresh();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final members = ref.watch(gymMembersProvider);
    final checkIns = ref.watch(gymCheckInsTodayProvider);
    final revenueAsync = ref.watch(gymRevenueTodayProvider);
    final expiringAsync = ref.watch(gymExpiringCardsProvider(7));

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
              title: const Text('Gói Tập & Bán Vé'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const GymPlansScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.qr_code_scanner),
              title: const Text('Check-in'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const GymCheckInScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Báo cáo'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const GymReportsScreen()));
              },
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.amber),
              title: const Text('Cài Đặt'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const GymSettingsScreen()));
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
              const OwnerInfoBar(),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _statCard('Hội viên', '${members.length}', Icons.groups, Colors.blue)),
                  const SizedBox(width: 10),
                  Expanded(child: _statCard('Check-in hôm nay',
                      '${checkIns.length}', Icons.verified, Colors.green)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: _statCard('Doanh thu hôm nay',
                      '${NumberFormat.compact(locale: 'vi_VN').format(revenueAsync.valueOrNull ?? 0)}đ',
                      Icons.payments, Colors.orange)),
                  const SizedBox(width: 10),
                  Expanded(child: _statCard('Gói sắp hết hạn (7d)',
                      '${expiringAsync.valueOrNull?.length ?? 0}', Icons.event_busy, Colors.red)),
                ],
              ),
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
          Navigator.push(context, MaterialPageRoute(builder: (_) => const GymCheckInScreen()));
        },
        backgroundColor: const Color(0xFF1E3A8A),
        icon: const Icon(Icons.qr_code_scanner),
        label: const Text('Check-in'),
      ),
    );
  }

  Widget _statCard(String label, String value, IconData icon, Color color) {
    return Card(
      color: color.withOpacity(.08),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 6),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
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