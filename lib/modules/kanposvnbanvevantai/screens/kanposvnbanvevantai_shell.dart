import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/vantai_providers.dart';
import '../services/vantai_seed_data.dart';
import 'vantai_dashboard_screen.dart';
import 'vantai_ticketing_screen.dart';
import 'vantai_dispatch_screen.dart';
import 'vantai_shipment_screen.dart';
import 'vantai_accounting_screen.dart';

class KanPosVNBanvevantaiShell extends ConsumerStatefulWidget {
  const KanPosVNBanvevantaiShell({super.key});

  @override
  ConsumerState<KanPosVNBanvevantaiShell> createState() => _KanPosVNBanvevantaiShellState();
}

class _KanPosVNBanvevantaiShellState extends ConsumerState<KanPosVNBanvevantaiShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final isarService = ref.read(vantaiIsarServiceProvider);
    await VantaiSeedData.seedIfEmpty(isarService);
    ref.read(vantaiRoutesProvider.notifier).loadRoutes();
    ref.read(vantaiVehiclesProvider.notifier).loadVehicles();
    ref.read(vantaiTicketsProvider.notifier).loadTickets();
    ref.read(vantaiTripsProvider.notifier).loadTrips();
    ref.read(vantaiShipmentsProvider.notifier).loadShipments();
    ref.read(vantaiExpensesProvider.notifier).loadExpenses();
    ref.read(vantaiDashboardProvider.notifier).loadDashboard();
    setState(() {
      _isInit = true;
    });
  }

  final List<Widget> _screens = [
    const VantaiDashboardScreen(),
    const VantaiTicketingScreen(),
    const VantaiDispatchScreen(),
    const VantaiShipmentScreen(),
    const VantaiAccountingScreen(),
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
              NavigationRailDestination(icon: Icon(Icons.dashboard), label: Text('Dashboard')),
              NavigationRailDestination(icon: Icon(Icons.airplane_ticket), label: Text('Bán Vé')),
              NavigationRailDestination(icon: Icon(Icons.departure_board), label: Text('Điều Xe')),
              NavigationRailDestination(icon: Icon(Icons.inventory_2), label: Text('Nhận Hàng')),
              NavigationRailDestination(icon: Icon(Icons.account_balance_wallet), label: Text('Kế Toán')),
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
