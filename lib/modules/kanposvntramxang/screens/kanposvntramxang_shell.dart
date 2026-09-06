import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../../../core/widgets/account_switcher_button.dart';
import 'tramxang_dashboard_screen.dart';
import 'tramxang_pos_screen.dart';
import 'tramxang_tank_screen.dart';
import 'tramxang_shift_screen.dart';

class KanPosVNTramXangShell extends ConsumerStatefulWidget {
  const KanPosVNTramXangShell({super.key});

  @override
  ConsumerState<KanPosVNTramXangShell> createState() =>
      _KanPosVNTramXangShellState();
}

class _KanPosVNTramXangShellState extends ConsumerState<KanPosVNTramXangShell> {
  int _selectedIndex = 0;

  static final List<({String id, IconData icon, String label, Widget screen})>
      _tabs = [
    (
      id: 'dashboard',
      icon: Icons.dashboard,
      label: 'Dashboard',
      screen: const TramXangDashboardScreen(),
    ),
    (
      id: 'pos',
      icon: Icons.point_of_sale,
      label: 'POS Bán Hàng',
      screen: const TramXangPosScreen(),
    ),
    (
      id: 'tank',
      icon: Icons.propane_tank,
      label: 'Quản Lý Bồn',
      screen: const TramXangTankScreen(),
    ),
    (
      id: 'shift',
      icon: Icons.schedule,
      label: 'Ca Bán Hàng',
      screen: const TramXangShiftScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authServiceProvider);
    final safeIndex = _selectedIndex < _tabs.length ? _selectedIndex : 0;
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
                  NavigationRailDestination(icon: Icon(t.icon), label: Text(t.label)),
              ],
            ),
          if (isDesktop) const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: ClipRect(child: _tabs[safeIndex].screen),
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