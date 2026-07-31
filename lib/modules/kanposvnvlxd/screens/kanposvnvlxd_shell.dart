import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/sync/api_config.dart';
import '../providers/vlxd_providers.dart';
import '../services/vlxd_seed_data.dart';
import 'vlxd_pos_screen.dart';
import 'vlxd_inventory_screen.dart';
import 'vlxd_contracts_screen.dart';
import 'vlxd_finance_screen.dart';
import 'vlxd_dashboard_screen.dart';

class KanPosVNVlxdShell extends ConsumerStatefulWidget {
  const KanPosVNVlxdShell({super.key});

  @override
  ConsumerState<KanPosVNVlxdShell> createState() => _KanPosVNVlxdShellState();
}

class _KanPosVNVlxdShellState extends ConsumerState<KanPosVNVlxdShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final isarService = ref.read(vlxdIsarServiceProvider);
    await VlxdSeedData.seedIfEmpty(isarService);
    ref.read(vlxdProductsProvider.notifier).loadProducts();
    setState(() {
      _isInit = true;
    });
  }

  final List<Widget> _screens = [
    const VlxdDashboardScreen(),
    const VlxdPosScreen(),
    const VlxdContractsScreen(),
    const VlxdInventoryScreen(),
    const VlxdFinanceScreen(),
    const VlxdSyncScreen(),
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
              NavigationRailDestination(icon: Icon(Icons.point_of_sale), label: Text('Bán Lẻ')),
              NavigationRailDestination(icon: Icon(Icons.assignment), label: Text('Hợp Đồng Sỉ')),
              NavigationRailDestination(icon: Icon(Icons.inventory), label: Text('Kho Hàng')),
              NavigationRailDestination(icon: Icon(Icons.account_balance_wallet), label: Text('Thu Chi & Nợ')),
              NavigationRailDestination(icon: Icon(Icons.sync), label: Text('Đồng Bộ')),
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

class VlxdSyncScreen extends ConsumerWidget {
  const VlxdSyncScreen({super.key});
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
            final syncService = ref.read(vlxdNeonSyncServiceProvider);
            await syncService.triggerSync(ApiConfig.baseUrl, ApiConfig.syncApiKey);
            if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đồng bộ hoàn tất!')));
          },
        ),
      ),
    );
  }
}
