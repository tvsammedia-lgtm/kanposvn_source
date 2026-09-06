import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../providers/congtrinh_providers.dart';
import 'congtrinh_catalog_screen.dart';
import 'congtrinh_dashboard_screen.dart';
import 'congtrinh_project_screen.dart';
import 'congtrinh_report_screen.dart';

class KanPosVNCongTrinhShell extends ConsumerStatefulWidget {
  const KanPosVNCongTrinhShell({super.key});

  @override
  ConsumerState<KanPosVNCongTrinhShell> createState() =>
      _KanPosVNCongTrinhShellState();
}

class _KanPosVNCongTrinhShellState
    extends ConsumerState<KanPosVNCongTrinhShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  static final List<({String id, IconData icon, String label})> _tabDefs = [
    (id: 'dashboard', icon: Icons.dashboard, label: 'Dashboard'),
    (id: 'project', icon: Icons.home_work, label: 'Công Trình'),
    (id: 'catalog', icon: Icons.inventory, label: 'Vật Tư & Đơn Giá'),
    (id: 'report', icon: Icons.bar_chart, label: 'Báo Cáo'),
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
          screen: switch (d.id) {
            'dashboard' =>
              CongTrinhDashboardScreen(onNavigate: _switchTab),
            'project' => CongTrinhProjectScreen(onNavigate: _switchTab),
            'catalog' => const CongTrinhCatalogScreen(),
            'report' => const CongTrinhReportScreen(),
            _ => const CongTrinhDashboardScreen(),
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
          .read(congTrinhBootstrapProvider.notifier)
          .seedAndRefresh();
    } catch (_) {
      // Lỗi seed/db → vẫn vào shell; các tab tự báo cần nạp lại nếu cần.
    }
    if (mounted) {
      setState(() => _isInit = true);
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
        backgroundColor: auth.currentModule?.color ?? const Color(0xFF4F46E5),
        foregroundColor: Colors.white,
        title: const Text('KanPosVN - Công Trình & Dự Toán',
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
              selectedItemColor: const Color(0xFF4F46E5),
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