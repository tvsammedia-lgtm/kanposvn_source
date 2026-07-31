import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/sync/api_config.dart';
import '../providers/nhathuoc_providers.dart';
import '../services/nhathuoc_seed_data.dart';
import 'nhathuoc_dashboard_screen.dart';
import 'nhathuoc_pos_screen.dart';
import 'nhathuoc_inventory_screen.dart';
import 'nhathuoc_patient_screen.dart';
import 'nhathuoc_prescription_screen.dart';

class KanPosVNNhathuocShell extends ConsumerStatefulWidget {
  const KanPosVNNhathuocShell({super.key});

  @override
  ConsumerState<KanPosVNNhathuocShell> createState() => _KanPosVNNhathuocShellState();
}

class _KanPosVNNhathuocShellState extends ConsumerState<KanPosVNNhathuocShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final isarService = ref.read(nhathuocIsarServiceProvider);
    await NhathuocSeedData.seedIfEmpty(isarService);
    ref.read(nhathuocMedicinesProvider.notifier).loadMedicines();
    ref.read(nhathuocPatientsProvider.notifier).loadPatients();
    ref.read(nhathuocPrescriptionTemplatesProvider.notifier).loadTemplates();
    ref.read(nhathuocFinanceProvider.notifier).calculateMetrics();
    setState(() {
      _isInit = true;
    });
  }

  final List<Widget> _screens = [
    const NhathuocDashboardScreen(),
    const NhathuocPosScreen(),
    const NhathuocInventoryScreen(),
    const NhathuocPatientScreen(),
    const NhathuocPrescriptionScreen(),
    const NhathuocSyncScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    if (!_isInit) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(icon: Icon(Icons.dashboard), label: Text('Báo Cáo')),
              NavigationRailDestination(icon: Icon(Icons.point_of_sale), label: Text('Bán Hàng')),
              NavigationRailDestination(icon: Icon(Icons.inventory), label: Text('Kho Thuốc')),
              NavigationRailDestination(icon: Icon(Icons.people), label: Text('Bệnh Nhân')),
              NavigationRailDestination(icon: Icon(Icons.receipt_long), label: Text('Toa Mẫu')),
              NavigationRailDestination(icon: Icon(Icons.sync), label: Text('Đồng bộ')),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _screens[_selectedIndex],
          ),
        ],
      ),
    );
  }
}

class NhathuocSyncScreen extends ConsumerWidget {
  const NhathuocSyncScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đồng bộ Vercel Neon DB')),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.cloud_sync),
          label: const Text('Đồng bộ Dữ liệu'),
          onPressed: () async {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đang đồng bộ...')));
            final syncService = ref.read(nhathuocNeonSyncServiceProvider);
            await syncService.triggerSync(ApiConfig.baseUrl, ApiConfig.syncApiKey);
            if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đồng bộ hoàn tất!')));
          },
        ),
      ),
    );
  }
}
