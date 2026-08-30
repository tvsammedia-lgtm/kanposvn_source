import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../kanposvnhrpayroll/core/app_theme.dart';
import '../../kanposvnride/providers/ride_isar_provider.dart';
import '../providers/airbook_isar_provider.dart';
import '../services/airbook_seed_data.dart';
import 'flight_search_screen.dart';
import 'my_bookings_screen.dart';
import 'commission_report_screen.dart';

class KanPosVnAirbookShell extends ConsumerStatefulWidget {
  const KanPosVnAirbookShell({super.key});

  @override
  ConsumerState<KanPosVnAirbookShell> createState() =>
      _KanPosVnAirbookShellState();
}

class _KanPosVnAirbookShellState extends ConsumerState<KanPosVnAirbookShell> {
  bool _ready = false;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initDbs());
  }

  Future<void> _initDbs() async {
    try {
      await RideDatabaseSetup.init();
      final db = await AirbookDatabaseSetup.init();
      await AirBookSeedData.seedIfEmpty(db);
      if (mounted) setState(() => _ready = true);
    } catch (_) {
      if (mounted) setState(() => _ready = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return const Scaffold(
        backgroundColor: AppTheme.bg900,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      body: IndexedStack(
        index: _tabIndex,
        children: const [
          FlightSearchScreen(),
          MyBookingsScreen(),
          CommissionReportScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tabIndex,
        backgroundColor: AppTheme.surface,
        indicatorColor: AppTheme.primaryBlue.withValues(alpha: 0.15),
        onDestinationSelected: (i) => setState(() => _tabIndex = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.flight_takeoff_outlined), selectedIcon: Icon(Icons.flight_takeoff), label: 'Đặt vé'),
          NavigationDestination(icon: Icon(Icons.confirmation_num_outlined), selectedIcon: Icon(Icons.confirmation_num), label: 'Vé của tôi'),
          NavigationDestination(icon: Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart), label: 'Hoa hồng'),
        ],
      ),
    );
  }
}