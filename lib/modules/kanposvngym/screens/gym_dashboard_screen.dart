import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/gym_providers.dart';
import '../services/gym_isar_service.dart';
import '../services/gym_seed_data.dart';
import 'gym_checkin_screen.dart';
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