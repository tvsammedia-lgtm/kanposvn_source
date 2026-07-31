import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/restaurant_providers.dart';
import '../providers/restaurant_inventory_providers.dart';
import '../services/restaurant_seed_data.dart';
import 'restaurant_dashboard_screen.dart';
import 'restaurant_tables_screen.dart';
import 'restaurant_kitchen_screen.dart';
import 'restaurant_inventory_screen.dart';

class KanPosVNRestaurantShell extends ConsumerStatefulWidget {
  const KanPosVNRestaurantShell({super.key});

  @override
  ConsumerState<KanPosVNRestaurantShell> createState() => _KanPosVNRestaurantShellState();
}

class _KanPosVNRestaurantShellState extends ConsumerState<KanPosVNRestaurantShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final isarService = ref.read(restaurantIsarServiceProvider);
    await RestaurantSeedData.seedIfEmpty(isarService);
    ref.read(restaurantTablesProvider.notifier).loadTables();
    ref.read(restaurantMenuProvider.notifier).loadMenu();
    ref.read(restaurantOrdersProvider.notifier).loadOrders();
    ref.read(restaurantDashboardProvider.notifier).loadDashboard();
    
    // Phase 2
    ref.read(restaurantIngredientsProvider.notifier).loadIngredients();
    ref.read(restaurantInventoryTxProvider.notifier).loadTransactions();

    setState(() {
      _isInit = true;
    });
  }

  final List<Widget> _screens = [
    const RestaurantTablesScreen(),
    const RestaurantKitchenScreen(),
    const RestaurantInventoryScreen(),
    const RestaurantDashboardScreen(),
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
              NavigationRailDestination(icon: Icon(Icons.kitchen), label: Text('Bếp')),
              NavigationRailDestination(icon: Icon(Icons.inventory), label: Text('Kho Hàng')),
              NavigationRailDestination(icon: Icon(Icons.dashboard), label: Text('Dashboard')),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: _screens[_selectedIndex]),
        ],
      ),
    );
  }
}
