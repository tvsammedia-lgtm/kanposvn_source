import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/router/module_selector_screen.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../dailynongsan_navigation.dart';
import '../providers/nongsan_providers.dart';
import '../services/nongsan_seed_data.dart';
import 'accounting/nongsan_accounting_screen.dart';
import 'dashboard_screen.dart';
import 'inventory_screen.dart';
import 'nongsan_settings_screen.dart';
import 'purchasing_screen.dart';

/// Màu module Kinh doanh Nông sản (dùng cho AppBar).
const _moduleColor = Color(0xFF16A34A);

final dailyNongSanTabProvider =
    StateProvider<DailyNongSanTab>((ref) => DailyNongSanTab.dashboard);

class KanPosVnDailyNongSanShell extends ConsumerStatefulWidget {
  const KanPosVnDailyNongSanShell({super.key});

  @override
  ConsumerState<KanPosVnDailyNongSanShell> createState() =>
      _KanPosVnDailyNongSanShellState();
}

class _KanPosVnDailyNongSanShellState
    extends ConsumerState<KanPosVnDailyNongSanShell> {
  DailyNongSanTab _currentTab = DailyNongSanTab.dashboard;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    try {
      await NongSanSeedData.seedIfEmpty(ref.read(nongsanBusinessLogicProvider));
    } catch (_) {}
    if (mounted) setState(() => _isInit = true);
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInit) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final isDesktop = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _moduleColor,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Quay lại',
          onPressed: () {
            // Quay lại màn hình chọn module: main.dart render theo selectedModule.
            ref.read(selectedModuleProvider.notifier).state = null;
          },
        ),
        title: const Text('KanPosVN - Kinh doanh Nông sản',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        actions: const [
          AccountSwitcherButton(foregroundColor: Colors.white),
        ],
      ),
      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              selectedIndex: _currentTab.index,
              onDestinationSelected: (index) {
                setState(() => _currentTab = DailyNongSanTab.values[index]);
              },
              labelType: NavigationRailLabelType.all,
              destinations: [
                for (final tab in DailyNongSanTab.values)
                  NavigationRailDestination(
                    icon: Icon(tab.icon),
                    selectedIcon: Icon(tab.icon, color: _moduleColor),
                    label: Text(tab.label),
                  ),
              ],
            ),
          if (isDesktop) const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _buildBody(_currentTab),
          ),
        ],
      ),
      bottomNavigationBar: isDesktop
          ? null
          : BottomNavigationBar(
              currentIndex: _currentTab.index,
              onTap: (index) {
                setState(() => _currentTab = DailyNongSanTab.values[index]);
              },
              selectedItemColor: _moduleColor,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: [
                for (final tab in DailyNongSanTab.values)
                  BottomNavigationBarItem(icon: Icon(tab.icon), label: tab.label),
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
      case DailyNongSanTab.accounting:
        return const NongSanAccountingScreen();
      case DailyNongSanTab.settings:
        return const NongSanSettingsScreen();
    }
  }
}