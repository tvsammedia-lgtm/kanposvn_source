import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../providers/tramxang_providers.dart';
import 'accounting/tramxang_accounting_screen.dart';
import 'tramxang_dashboard_screen.dart';
import 'tramxang_fuel_sale_screen.dart';
import 'tramxang_pos_screen.dart';
import 'tramxang_report_screen.dart';
import 'tramxang_reports_screen.dart';
import 'tramxang_settings_screen.dart';
import 'tramxang_shift_screen.dart';
import 'tramxang_tank_screen.dart';

class KanPosVNTramXangShell extends ConsumerStatefulWidget {
  const KanPosVNTramXangShell({super.key});

  @override
  ConsumerState<KanPosVNTramXangShell> createState() =>
      _KanPosVNTramXangShellState();
}

class _KanPosVNTramXangShellState extends ConsumerState<KanPosVNTramXangShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  static final List<({String id, IconData icon, String label})> _tabDefs = [
    (id: 'dashboard', icon: Icons.dashboard, label: 'Dashboard'),
    (id: 'fuel', icon: Icons.local_gas_station, label: 'Bán Xăng'),
    (id: 'pos', icon: Icons.point_of_sale, label: 'POS Bán Hàng'),
    (id: 'tank', icon: Icons.propane_tank, label: 'Quản Lý Bồn'),
    (id: 'shift', icon: Icons.schedule, label: 'Ca Bán Hàng'),
    (id: 'report', icon: Icons.bar_chart, label: 'Báo Cáo'),
    (id: 'reports', icon: Icons.picture_as_pdf, label: 'Báo Cáo Chung'),
    (id: 'accounting', icon: Icons.book, label: 'Kế Toán'),
    (id: 'settings', icon: Icons.settings, label: 'Cài Đặt'),
  ];

  late final List<({String id, IconData icon, String label, Widget screen})>
      _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [
      for (final d in _tabDefs)
        (
          id: d.id,
          icon: d.icon,
          label: d.label,
          screen: d.id == 'dashboard'
              ? TramXangDashboardScreen(
                  onNavigate: _switchTab,
                  seeding: !_isInit,
                )
              : switch (d.id) {
                  'fuel' => const TramXangFuelSaleScreen(),
                  'pos' => const TramXangPosScreen(),
                  'tank' => const TramXangTankScreen(),
                  'shift' => const TramXangShiftScreen(),
                  'report' => const TramXangReportScreen(),
                  'reports' => const TramXangReportsScreen(),
                  'accounting' => const TramXangAccountingScreen(),
                  'settings' => const TramXangSettingsScreen(),
                  _ => const TramXangDashboardScreen(),
                },
        ),
    ];
    _initData();
  }

  void _switchTab(String id) {
    final idx = _tabs.indexWhere((t) => t.id == id);
    if (idx >= 0) setState(() => _selectedIndex = idx);
  }

  Future<void> _initData() async {
    try {
      await ref
          .read(tramXangBootstrapProvider.notifier)
          .seedAndRefresh();
    } catch (_) {
      // Lỗi seed/db → vẫn cho vào shell; các tab sẽ tự báo cần
      // nạp lại dữ liệu mẫu nếu cần thiết.
    }
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
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final auth = ref.watch(authServiceProvider);
    final safeIndex =
        _selectedIndex < _tabs.length ? _selectedIndex : 0;
    final isDesktop = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: auth.currentModule?.color ?? const Color(0xFFF59E0B),
        foregroundColor: Colors.white,
        title: const Text('KanPosVN - Trạm Xăng',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        actions: const [
          AccountSwitcherButton(foregroundColor: Colors.white),
        ],
      ),
      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              selectedIndex: safeIndex,
              onDestinationSelected: (index) {
                setState(() => _selectedIndex = index);
              },
              labelType: NavigationRailLabelType.all,
              destinations: [
                for (final t in _tabs)
                  NavigationRailDestination(
                      icon: Icon(t.icon), label: Text(t.label)),
              ],
            ),
          if (isDesktop) const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: ClipRect(
              child: IndexedStack(
                index: safeIndex,
                children: [for (final t in _tabs) t.screen],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: isDesktop
          ? null
          : BottomNavigationBar(
              currentIndex: safeIndex,
              onTap: (index) {
                setState(() => _selectedIndex = index);
              },
              selectedItemColor: const Color(0xFFF59E0B),
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: [
                for (final t in _tabs)
                  BottomNavigationBarItem(icon: Icon(t.icon), label: t.label),
              ],
            ),
    );
  }
}