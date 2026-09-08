import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dailynongsan_navigation.dart';
import 'dashboard_screen.dart';
import 'purchasing_screen.dart';
import 'inventory_screen.dart';
import '../../../core/router/login_screen.dart';

final dailyNongSanTabProvider = StateProvider<DailyNongSanTab>((ref) => DailyNongSanTab.dashboard);

class KanPosVnDailyNongSanShell extends ConsumerWidget {
  const KanPosVnDailyNongSanShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(dailyNongSanTabProvider);

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: currentTab.index,
            onDestinationSelected: (index) {
              ref.read(dailyNongSanTabProvider.notifier).state = DailyNongSanTab.values[index];
            },
            labelType: NavigationRailLabelType.all,
            destinations: DailyNongSanTab.values.map((tab) {
              return NavigationRailDestination(
                icon: Icon(tab.icon),
                label: Text(tab.label),
              );
            }).toList(),
            trailing: Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                        (route) => false,
                      );
                    },
                    tooltip: 'Đăng xuất',
                  ),
                ),
              ),
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _buildBody(currentTab),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(DailyNongSanTab tab) {
    switch (tab) {
      case DailyNongSanTab.dashboard:
        return const DailyNongSanDashboardScreen();
      case DailyNongSanTab.purchasing:
        return const PurchasingScreen();
      case DailyNongSanTab.inventory:
        return const InventoryScreen();
      case DailyNongSanTab.sales:
        return const Center(child: Text('Module Bán hàng (Đang phát triển)'));
      case DailyNongSanTab.finance:
        return const Center(child: Text('Module Tài chính (Đang phát triển)'));
      case DailyNongSanTab.accounting:
        return const Center(child: Text('Module Kế toán (Đang phát triển)'));
      case DailyNongSanTab.settings:
        return const Center(child: Text('Cài đặt (Đang phát triển)'));
    }
  }
}
