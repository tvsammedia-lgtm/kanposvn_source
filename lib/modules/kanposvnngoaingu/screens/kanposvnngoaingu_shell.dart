import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../providers/ngoaingu_isar_provider.dart';
import '../services/ngoai_ngo_seed_data.dart';
import 'student/student_list_screen.dart';
import 'teacher/teacher_list_screen.dart';
import 'class/class_list_screen.dart';
import 'assignment/assignment_list_screen.dart';
import 'ai/ai_evaluation_screen.dart';
import 'ngoai_ngo_reports_screen.dart';

class KanPosVNNgaoinguShell extends ConsumerStatefulWidget {
  const KanPosVNNgaoinguShell({super.key});

  @override
  ConsumerState<KanPosVNNgaoinguShell> createState() => _KanPosVNNgaoinguShellState();
}

class _KanPosVNNgaoinguShellState extends ConsumerState<KanPosVNNgaoinguShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    try {
      final db = await NgoaiNguDatabaseSetup.init();
      await NgoaiNguSeedData.seedIfEmpty(db);
    } catch (_) {}
    if (mounted) {
      setState(() {
        _isInit = true;
      });
    }
  }

  static final Map<String, Set<String>> _roleTabs = {
    EmployeeRoles.cashier: const {'students', 'report'},
    EmployeeRoles.sale: const {'students', 'classes', 'report'},
    EmployeeRoles.warehouse: const {'report'},
    EmployeeRoles.accountant: const {'dashboard', 'report'},
  };

  static final List<({String id, Widget screen, IconData icon, String label})> _allTabs = [
    (id: 'dashboard', screen: const _PlaceholderScreen('Dashboard'), icon: Icons.dashboard, label: 'Dashboard'),
    (id: 'students', screen: const StudentListScreen(), icon: Icons.school, label: 'Hoc Vien'),
    (id: 'teachers', screen: const TeacherListScreen(), icon: Icons.badge, label: 'Giang Vien'),
    (id: 'classes', screen: const ClassListScreen(), icon: Icons.class_, label: 'Lop Hoc'),
    (id: 'assignments', screen: const AssignmentListScreen(), icon: Icons.assignment, label: 'Bai Tap'),
    (id: 'ai', screen: const AIEvaluationScreen(), icon: Icons.smart_toy, label: 'AI Dinh Gia'),
    (id: 'report', screen: const NgoaiNguReportsScreen(), icon: Icons.bar_chart, label: 'Bao Cao'),
  ];

  @override
  Widget build(BuildContext context) {
    if (!_isInit) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final auth = ref.watch(authServiceProvider);
    final tabs = _allTabs
        .where((t) => EmployeeRolePolicy.isAllowed(
              isManager: auth.isManager,
              role: auth.employeeRole,
              tabId: t.id,
              roleTabs: _roleTabs,
            ))
        .toList();
    final safeIndex = tabs.isNotEmpty ? (_selectedIndex < tabs.length ? _selectedIndex : 0) : 0;
    final isDesktop = MediaQuery.of(context).size.width > 600;

    if (tabs.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF4F46E5),
          foregroundColor: Colors.white,
          title: const Text('KanPosVN - Ngoai Ngu',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        body: const Center(child: Text('Không có quyền truy cập tab nào.\nLiên hệ quản trị viên để được cấp quyền.', textAlign: TextAlign.center)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4F46E5),
        foregroundColor: Colors.white,
        title: const Text('KanPosVN - Ngoai Ngu',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        actions: const [
          AccountSwitcherButton(foregroundColor: Colors.white),
        ],
      ),
      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              scrollable: true,
              selectedIndex: safeIndex,
              onDestinationSelected: (index) {
                setState(() { _selectedIndex = index; });
              },
              labelType: NavigationRailLabelType.all,
              destinations: [
                for (final t in tabs)
                  NavigationRailDestination(
                    icon: Icon(t.icon),
                    label: Text(t.label),
                  ),
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
                setState(() { _selectedIndex = index; });
              },
              selectedItemColor: const Color(0xFF4F46E5),
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: [
                for (final t in tabs)
                  BottomNavigationBarItem(
                    icon: Icon(t.icon),
                    label: t.label,
                  ),
              ],
            ),
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  final String title;
  const _PlaceholderScreen(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(title, style: const TextStyle(fontSize: 24))));
  }
}
