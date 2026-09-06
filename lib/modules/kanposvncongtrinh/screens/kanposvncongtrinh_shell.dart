import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../../../core/widgets/account_switcher_button.dart';
import 'congtrinh_dashboard_screen.dart';
import 'congtrinh_project_screen.dart';

class KanPosVNCongTrinhShell extends ConsumerStatefulWidget {
  const KanPosVNCongTrinhShell({super.key});

  @override
  ConsumerState<KanPosVNCongTrinhShell> createState() =>
      _KanPosVNCongTrinhShellState();
}

class _KanPosVNCongTrinhShellState
    extends ConsumerState<KanPosVNCongTrinhShell> {
  int _selectedIndex = 0;

  static final List<({String id, IconData icon, String label, Widget screen})>
      _tabs = [
    (
      id: 'dashboard',
      icon: Icons.dashboard,
      label: 'Dashboard',
      screen: const CongTrinhDashboardScreen(),
    ),
    (
      id: 'project',
      icon: Icons.home_work,
      label: 'Công Trình',
      screen: const CongTrinhProjectScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authServiceProvider);
    final safeIndex = _selectedIndex < _tabs.length ? _selectedIndex : 0;
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