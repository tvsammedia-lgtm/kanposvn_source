import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/bida_providers.dart';
import '../services/bida_seed_data.dart';
import 'bida_dashboard_screen.dart';
import 'bida_tables_screen.dart';

import 'bida_inventory_screen.dart';

class KanPosVNBidaShell extends ConsumerStatefulWidget {
  const KanPosVNBidaShell({super.key});

  @override
  ConsumerState<KanPosVNBidaShell> createState() => _KanPosVNBidaShellState();
}

class _KanPosVNBidaShellState extends ConsumerState<KanPosVNBidaShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final isarService = ref.read(bidaIsarServiceProvider);
    await BidaSeedData.seedIfEmpty(isarService);
    ref.read(bidaTablesProvider.notifier).loadTables();
    ref.read(bidaItemsProvider.notifier).loadItems();
    ref.read(bidaSessionsProvider.notifier).loadSessions();
    ref.read(bidaDashboardProvider.notifier).loadDashboard();
    setState(() {
      _isInit = true;
    });
  }

  final List<Widget> _screens = [
    const BidaTablesScreen(),
    const BidaDashboardScreen(),
    const BidaInventoryScreen(),
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
              NavigationRailDestination(icon: Icon(Icons.grid_view), label: Text('Sơ đồ Bàn')),
              NavigationRailDestination(icon: Icon(Icons.dashboard), label: Text('Dashboard')),
              NavigationRailDestination(icon: Icon(Icons.inventory), label: Text('Kho Hàng')),
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
