import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/router/module_selector_screen.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../providers/order_provider.dart';
import 'dashboard_screen.dart';
import 'admin_dashboard_screen.dart';
import 'order_list_screen.dart';
import 'order_tq_settings_screen.dart';
import 'order_tq_tracking_list_screen.dart';

class KanPosVNOrderTqShell extends ConsumerStatefulWidget {
  const KanPosVNOrderTqShell({super.key});

  @override
  ConsumerState<KanPosVNOrderTqShell> createState() => _KanPosVNOrderTqShellState();
}

class _KanPosVNOrderTqShellState extends ConsumerState<KanPosVNOrderTqShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    try {
      final service = ref.read(orderBucketServiceProvider);
      await service.seedIfEmpty();
    } catch (_) {
      // DB schema mismatch hoặc lỗi khác — vẫn vào shell (tab tự báo lỗi).
    }
    if (mounted) {
      setState(() => _isInit = true);
    }
  }

  /// Định nghĩa các tab của module (id, icon, label).
  static final Map<String, ({IconData icon, String label})> _tabDefs = {
    'dashboard': (icon: Icons.dashboard, label: 'Dashboard'),
    'orders': (icon: Icons.receipt_long, label: 'Đơn Hàng'),
    'admin': (icon: Icons.admin_panel_settings, label: 'Admin'),
    'map': (icon: Icons.map, label: 'Tracker'),
    'settings': (icon: Icons.settings, label: 'Cài Đặt'),
  };

  static final Map<String, Widget Function()> _tabScreens = {
    'dashboard': () => const DashboardScreen(),
    'orders': () => const OrderListScreen(),
    'admin': () => const AdminDashboardScreen(),
    'map': () => const OrderTqTrackingListScreen(),
    'settings': () => const OrderTqSettingsScreen(),
  };

  static final List<({String id, Widget screen, IconData icon, String label})>
      _allTabs = [
    for (final e in _tabDefs.entries)
      (
        id: e.key,
        screen: _tabScreens[e.key]!(),
        icon: e.value.icon,
        label: e.value.label,
      ),
  ];

  @override
  Widget build(BuildContext context) {
    if (!_isInit) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final tabs = _allTabs;
    final safeIndex = _selectedIndex < tabs.length ? _selectedIndex : 0;
    final isDesktop = MediaQuery.of(context).size.width > 600;
    final moduleColor = const Color(0xFFEF4444);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: moduleColor,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Quay lại',
          onPressed: () {
            // Quay lại màn hình chọn module: main.dart render theo selectedModule.
            ref.read(selectedModuleProvider.notifier).state = null;
          },
        ),
        title: const Text('KanPosVN - Order Trung Quốc',
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
                for (final t in tabs)
                  NavigationRailDestination(icon: Icon(t.icon), label: Text(t.label)),
              ],
            ),
          if (isDesktop) const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: ClipRect(child: tabs[safeIndex].screen),
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
              selectedItemColor: moduleColor,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: [
                for (final t in tabs)
                  BottomNavigationBarItem(icon: Icon(t.icon), label: t.label),
              ],
            ),
    );
  }
}
