import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/spa_providers.dart';
import '../providers/spa_crm_inventory_providers.dart';
import '../services/spa_seed_data.dart';
import 'spa_dashboard_screen.dart';
import 'spa_beds_screen.dart';
import 'spa_customers_screen.dart';
import 'spa_inventory_screen.dart';

class KanPosVNSpaShell extends ConsumerStatefulWidget {
  const KanPosVNSpaShell({super.key});

  @override
  ConsumerState<KanPosVNSpaShell> createState() => _KanPosVNSpaShellState();
}

class _KanPosVNSpaShellState extends ConsumerState<KanPosVNSpaShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final isarService = ref.read(spaIsarServiceProvider);
    await SpaSeedData.seedIfEmpty(isarService);
    ref.read(spaBedsProvider.notifier).loadBeds();
    ref.read(spaServicesProvider.notifier).loadServices();
    ref.read(spaTechsProvider.notifier).loadTechs();
    ref.read(spaSessionsProvider.notifier).loadSessions();
    ref.read(spaDashboardProvider.notifier).loadDashboard();
    // Load Phase 2 providers
    ref.read(spaCustomersProvider.notifier).loadCustomers();
    ref.read(spaProductsProvider.notifier).loadProducts();
    ref.read(spaInventoryProvider.notifier).loadTransactions();
    
    setState(() {
      _isInit = true;
    });
  }

  final List<Widget> _screens = [
    const SpaBedsScreen(),
    const SpaDashboardScreen(),
    const SpaCustomersScreen(),
    const SpaInventoryScreen(),
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
              NavigationRailDestination(icon: Icon(Icons.grid_view), label: Text('Sơ đồ Giường')),
              NavigationRailDestination(icon: Icon(Icons.dashboard), label: Text('Dashboard')),
              NavigationRailDestination(icon: Icon(Icons.people), label: Text('Khách Hàng')),
              NavigationRailDestination(icon: Icon(Icons.local_pharmacy), label: Text('Kho Dược Liệu')),
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
