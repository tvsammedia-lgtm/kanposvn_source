import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/viec_providers.dart';
import '../../../core/widgets/owner_info_bar.dart';
import 'viec_candidates_screen.dart';
import 'viec_jobs_screen.dart';
import 'viec_matching_screen.dart';

class ViecDashboardScreen extends ConsumerWidget {
  const ViecDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final candidates = ref.watch(viecCandidatesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('KanViec - Quản lý Việc Làm'),
        backgroundColor: const Color(0xFF6366F1), // Indigo
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF6366F1)),
              child: Text('KanViec Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.person_search),
              title: const Text('Ứng Viên (Người tìm việc)'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ViecCandidatesScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.business_center),
              title: const Text('Tin Tuyển Dụng'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ViecJobsScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.compare_arrows),
              title: const Text('Ghép Việc (Matching)'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ViecMatchingScreen()));
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
              _buildStatsRow(candidates.length),
              const SizedBox(height: 24),
              const Text('Ứng viên mới đăng ký', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildRecentCandidates(candidates),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const ViecCandidatesScreen()));
        },
        backgroundColor: const Color(0xFF6366F1),
        icon: const Icon(Icons.person_add),
        label: const Text('Thêm Ứng Viên'),
      ),
    );
  }

  Widget _buildStatsRow(int candidateCount) {
    return Row(
      children: [
        Expanded(
          child: Card(
            color: Colors.indigo[50],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Icon(Icons.person_search, color: Colors.indigo, size: 32),
                  const SizedBox(height: 8),
                  Text('$candidateCount', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text('Ứng Viên Đang Rảnh'),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Card(
            color: Colors.deepPurple[50],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Icon(Icons.business_center, color: Colors.deepPurple, size: 32),
                  const SizedBox(height: 8),
                  const Text('0', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text('Việc Làm Mới'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentCandidates(List<dynamic> candidates) {
    if (candidates.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Center(child: Text('Chưa có ứng viên nào.')),
        ),
      );
    }
    
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: candidates.take(5).length,
      itemBuilder: (context, index) {
        final c = candidates[index];
        return Card(
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFF6366F1),
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(c.fullName, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(c.phone),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        );
      },
    );
  }
}
