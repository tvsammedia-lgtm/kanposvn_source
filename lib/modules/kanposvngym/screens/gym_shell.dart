import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/router/module_selector_screen.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../providers/gym_providers.dart';
import '../services/gym_isar_service.dart';
import '../services/gym_seed_data.dart';
import 'gym_dashboard_screen.dart';
import 'gym_members_screen.dart';
import 'gym_plans_screen.dart';
import 'gym_checkin_screen.dart';
import 'gym_pos_screen.dart';
import 'gym_trainer_screen.dart';
import 'gym_reports_screen.dart';
import 'gym_settings_screen.dart';

/// Shell KanGYM: tab menu cuộn bên trái (NavigationRail + scrollable)
/// giống kanposvnspa. Màn hình nhỏ giữ nguyên Dashboard (Drawer + FAB).
class GymShell extends ConsumerStatefulWidget {
  const GymShell({super.key});

  @override
  ConsumerState<GymShell> createState() => _GymShellState();
}

class _GymShellState extends ConsumerState<GymShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  static final Map<String, ({IconData icon, String label})> _tabDefs = {
    'dashboard': (icon: Icons.dashboard, label: 'Dashboard'),
    'members': (icon: Icons.people, label: 'Hội Viên'),
    'trainer': (icon: Icons.sports_gymnastics, label: 'PT & Lớp'),
    'pos': (icon: Icons.point_of_sale, label: 'Bán Hàng'),
    'plans': (icon: Icons.fitness_center, label: 'Gói Tập'),
    'checkin': (icon: Icons.qr_code_scanner, label: 'Check-in'),
    'reports': (icon: Icons.bar_chart, label: 'Báo Cáo'),
    'settings': (icon: Icons.settings, label: 'Cài Đặt'),
  };

  static final Map<String, Widget Function()> _tabScreens = {
    'dashboard': () => const GymDashboardScreen(),
    'members': () => const GymMembersScreen(),
    'trainer': () => const GymTrainerScreen(),
    'pos': () => const GymPosScreen(),
    'plans': () => const GymPlansScreen(),
    'checkin': () => const GymCheckInScreen(),
    'reports': () => const GymReportsScreen(),
    'settings': () => const GymSettingsScreen(),
  };

  static final List<
          ({String id, Widget Function() screen, IconData icon, String label})>
      _allTabs = [
    for (final e in _tabDefs.entries)
      (
        id: e.key,
        screen: _tabScreens[e.key]!,
        icon: e.value.icon,
        label: e.value.label,
      ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_isInit) return;
      await GymSeedData.seedIfEmpty(GymIsarService());
      if (!mounted) return;
      _isInit = true;
      ref.read(gymMembersProvider.notifier).loadMembers();
      ref.read(gymPlansProvider.notifier).refresh();
      ref.read(gymProductsProvider.notifier).refresh();
      ref.read(gymTrainersProvider.notifier).refresh();
      ref.read(gymClassesProvider.notifier).refresh();
      ref.read(gymCheckInsTodayProvider.notifier).refresh();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final safeIndex = _selectedIndex < _allTabs.length ? _selectedIndex : 0;
    final isDesktop = MediaQuery.of(context).size.width > 600;

    if (!_isInit) {
      return const Scaffold(
        backgroundColor: Color(0xFF1E3A8A),
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF16224B),
      appBar: AppBar(
        title: const Text('KanGYM - Quản lý Phòng Tập'),
        backgroundColor: const Color(0xFF1E3A8A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Quay lại màn hình chọn module',
          onPressed: () {
            ref.read(selectedModuleProvider.notifier).state = null;
          },
        ),
        actions: const [
          AccountSwitcherButton(foregroundColor: Colors.white),
        ],
      ),
      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              backgroundColor: const Color(0xFF16224B),
              selectedIconTheme: const IconThemeData(color: Colors.white),
              selectedLabelTextStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
              unselectedLabelTextStyle:
                  const TextStyle(color: Colors.white70),
              unselectedIconTheme:
                  const IconThemeData(color: Colors.white70),
              indicatorColor: const Color(0xFF1E3A8A),
              scrollable: true,
              selectedIndex: safeIndex,
              onDestinationSelected: (index) {
                setState(() => _selectedIndex = index);
              },
              labelType: NavigationRailLabelType.all,
              destinations: [
                for (final t in _allTabs)
                  NavigationRailDestination(
                    icon: Icon(t.icon),
                    label: Text(t.label),
                  ),
              ],
            ),
          if (isDesktop) const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: ClipRect(child: _allTabs[safeIndex].screen()),
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
              selectedItemColor: const Color(0xFF1E3A8A),
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: [
                for (final t in _allTabs)
                  BottomNavigationBarItem(
                    icon: Icon(t.icon),
                    label: t.label,
                  ),
              ],
            ),
    );
  }
}