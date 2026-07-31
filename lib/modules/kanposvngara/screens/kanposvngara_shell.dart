import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/sync/api_config.dart';
import '../providers/gara_providers.dart';
import '../services/gara_seed_data.dart';
import 'gara_reception_screen.dart';
import 'gara_work_order_screen.dart';
import 'gara_inventory_screen.dart';
import 'gara_finance_screen.dart';
import 'gara_dashboard_screen.dart';
import 'gara_ticket_search_screen.dart';

class KanPosVNGaraShell extends ConsumerStatefulWidget {
  const KanPosVNGaraShell({super.key});

  @override
  ConsumerState<KanPosVNGaraShell> createState() => _KanPosVNGaraShellState();
}

class _KanPosVNGaraShellState extends ConsumerState<KanPosVNGaraShell> {
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final isarService = ref.read(garaIsarServiceProvider);
    await GaraSeedData.seedIfEmpty(isarService);
    ref.read(garaProductsProvider.notifier).loadProducts();
    setState(() {
      _isInit = true;
    });
  }

  final List<Widget> _screens = [
    const GaraDashboardScreen(),
    const GaraReceptionScreen(),
    const GaraWorkOrderScreen(),
    const GaraInventoryScreen(),
    const GaraFinanceScreen(),
    const GaraSyncScreen(),
    const GaraTicketSearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    if (!_isInit) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final selectedIndex = ref.watch(garaTabIndexProvider);

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) {
              ref.read(garaTabIndexProvider.notifier).state = index;
            },
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(icon: Icon(Icons.dashboard), label: Text('Dashboard')),
              NavigationRailDestination(icon: Icon(Icons.car_rental), label: Text('Tiếp Nhận')),
              NavigationRailDestination(icon: Icon(Icons.build), label: Text('Lệnh Sửa Chữa')),
              NavigationRailDestination(icon: Icon(Icons.inventory), label: Text('Kho / Phụ Tùng')),
              NavigationRailDestination(icon: Icon(Icons.account_balance_wallet), label: Text('Thu Chi')),
              NavigationRailDestination(icon: Icon(Icons.sync), label: Text('Đồng bộ')),
              NavigationRailDestination(icon: Icon(Icons.receipt_long), label: Text('Tra Cứu Phiếu')),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _screens[selectedIndex],
          ),
        ],
      ),
    );
  }
}

class GaraSyncScreen extends ConsumerWidget {
  const GaraSyncScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đồng bộ Vercel Neon DB')),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.cloud_sync),
          label: const Text('Đồng bộ Dữ liệu'),
          onPressed: () async {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đang đồng bộ...')));
            final syncService = ref.read(garaNeonSyncServiceProvider);
            await syncService.triggerSync(ApiConfig.baseUrl, ApiConfig.syncApiKey);
            if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đồng bộ hoàn tất!')));
          },
        ),
      ),
    );
  }
}
