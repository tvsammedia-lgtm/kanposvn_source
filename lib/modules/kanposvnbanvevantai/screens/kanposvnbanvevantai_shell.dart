import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../providers/vantai_providers.dart';
import '../services/vantai_seed_data.dart';
import 'vantai_dashboard_screen.dart';
import 'vantai_fleet_screen.dart';
import 'vantai_drivers_screen.dart';
import 'vantai_ticketing_screen.dart';
import 'vantai_dispatch_screen.dart';
import 'vantai_shipment_screen.dart';
import 'vantai_partners_screen.dart';
import 'vantai_accounting_screen.dart';
import 'vantai_settings_screen.dart';

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
    if (!mounted) return;
    ref.read(vantaiRoutesProvider.notifier).loadRoutes();
    ref.read(vantaiVehiclesProvider.notifier).loadVehicles();
    ref.read(vantaiDriversProvider.notifier).loadDrivers();
    ref.read(vantaiCustomersProvider.notifier).loadCustomers();
    ref.read(vantaiSuppliersProvider.notifier).loadSuppliers();
    ref.read(vantaiTicketsProvider.notifier).loadTickets();
    ref.read(vantaiTripsProvider.notifier).loadTrips();
    ref.read(vantaiShipmentsProvider.notifier).loadShipments();
    ref.read(vantaiExpensesProvider.notifier).loadExpenses();
    ref.read(vantaiCashTxProvider.notifier).loadTx();
    ref.read(vantaiDashboardProvider.notifier).loadDashboard();
    setState(() {
      _isInit = true;
    });
  }

  static final Map<String, Set<String>> _roleTabs = {
    EmployeeRoles.cashier: const {'ticketing', 'dispatch', 'partners'},
    EmployeeRoles.sale: const {'ticketing', 'dispatch'},
    EmployeeRoles.warehouse: const {'shipment', 'fleet', 'partners'},
    EmployeeRoles.accountant: const {
      'dashboard',
      'accounting',
      'partners',
      'settings'
    },
  };

  static final List<({String id, Widget screen, IconData icon, String label})>
      _allTabs = [
    (id: 'dashboard', screen: const VantaiDashboardScreen(), icon: Icons.dashboard, label: 'Dashboard'),
    (id: 'ticketing', screen: const VantaiTicketingScreen(), icon: Icons.airplane_ticket, label: 'Bán Vé'),
    (id: 'dispatch', screen: const VantaiDispatchScreen(), icon: Icons.departure_board, label: 'Điều Xe'),
    (id: 'shipment', screen: const VantaiShipmentScreen(), icon: Icons.inventory_2, label: 'Nhận Hàng'),
    (id: 'fleet', screen: const VantaiFleetScreen(), icon: Icons.alt_route, label: 'Tuyến & Xe'),
    (id: 'drivers', screen: const VantaiDriversScreen(), icon: Icons.badge, label: 'Tài Xế'),
    (id: 'partners', screen: const VantaiPartnersScreen(), icon: Icons.people, label: 'KH & NCC'),
    (id: 'accounting', screen: const VantaiAccountingScreen(), icon: Icons.account_balance_wallet, label: 'Kế Toán'),
    (id: 'settings', screen: const VantaiSettingsScreen(), icon: Icons.settings, label: 'Cài Đặt'),
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
    final safeIndex = _selectedIndex < tabs.length ? _selectedIndex : 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: auth.currentModule?.color ?? const Color(0xFF0891B2),
        foregroundColor: Colors.white,
        title: const Text('KanPosVN - Vận Tải & Vé',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        actions: const [
          AccountSwitcherButton(foregroundColor: Colors.white),
        ],
      ),
      body: Row(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: NavigationRail(
              selectedIndex: safeIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
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
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: tabs[safeIndex].screen,
          ),
        ],
      ),
    );
  }
}
