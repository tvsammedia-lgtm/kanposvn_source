import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../providers/nhatro_providers.dart';
import '../services/nhatro_seed_data.dart';
import 'nhatro_dashboard.dart';
import 'room_list_screen.dart';
import 'tenant_list_screen.dart';
import 'contract_list_screen.dart';
import 'payment_list_screen.dart';
import 'utility_screen.dart';
import 'maintenance_list_screen.dart';
import 'nhatro_reports_screen.dart';
import 'nhatro_sync_screen.dart';

class KanPosVnNhaTro200Shell extends ConsumerStatefulWidget {
  const KanPosVnNhaTro200Shell({super.key});

  @override
  ConsumerState<KanPosVnNhaTro200Shell> createState() => _KanPosVnNhaTro200ShellState();
}

class _KanPosVnNhaTro200ShellState extends ConsumerState<KanPosVnNhaTro200Shell> {
  int _selectedIndex = 0;
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
    ref.invalidate(contractsProvider);
    ref.invalidate(paymentsProvider);
    ref.invalidate(expensesProvider);
    if (mounted) setState(() => _isInit = true);
  }

  static const _tabs = <({int id, IconData icon, String label})>[
    (id: 0, icon: Icons.dashboard, label: 'Dashboard'),
    (id: 1, icon: Icons.door_front_door, label: 'Phòng'),
    (id: 2, icon: Icons.people, label: 'Khách'),
    (id: 3, icon: Icons.description, label: 'Hợp đồng'),
    (id: 4, icon: Icons.attach_money, label: 'Thu chi'),
    (id: 5, icon: Icons.electric_bolt, label: 'Điện Nước'),
    (id: 6, icon: Icons.build, label: 'Bảo trì'),
    (id: 7, icon: Icons.bar_chart, label: 'Báo cáo chung'),
    (id: 8, icon: Icons.sync, label: 'Đồng bộ'),
  ];

  Widget _buildTab(int index) {
    switch (index) {
      case 0: return const NhaTroDashboard();
      case 1: return const RoomListScreen();
      case 2: return const TenantListScreen();
      case 3: return const ContractListScreen();
      case 4: return const PaymentListScreen();
      case 5: return const UtilityScreen();
      case 6: return const MaintenanceListScreen();
      case 7: return const NhatroReportsScreen();
      case 8: return const NhaTroSyncScreen();
      default: return const NhaTroDashboard();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInit) {
      return const Scaffold(body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CircularProgressIndicator(), SizedBox(height: 16), Text('Đang khởi tạo dữ liệu...')],
      )));
    }

    final isDesktop = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF475569),
        foregroundColor: Colors.white,
        title: const Text('KanPosVN - Nhà Trọ', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: const [
          AccountSwitcherButton(foregroundColor: Colors.white),
        ],
      ),
      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              scrollable: true,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (i) => setState(() => _selectedIndex = i),
              labelType: NavigationRailLabelType.all,
              destinations: [
                for (final t in _tabs)
                  NavigationRailDestination(icon: Icon(t.icon), label: Text(t.label)),
              ],
            ),
          if (isDesktop) const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: ClipRect(child: _buildTab(_selectedIndex))),
        ],
      ),
      bottomNavigationBar: isDesktop
          ? null
          : BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (i) => setState(() => _selectedIndex = i),
              selectedItemColor: const Color(0xFF475569),
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: [
                for (final t in _tabs)
                  BottomNavigationBarItem(
                    icon: Icon(t.icon),
                    label: t.label,
                  ),
              ],
            ),
    );
  }
}
