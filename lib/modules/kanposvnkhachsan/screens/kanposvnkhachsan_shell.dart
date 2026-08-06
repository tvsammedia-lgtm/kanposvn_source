import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_management_screen.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../../../core/router/module_selector_screen.dart';
import '../../../core/sync/api_config.dart';
import '../providers/hotel_providers.dart';
import '../services/hotel_seed_data.dart';
import 'rooms_screen.dart';
import 'booking_screen.dart';
import 'checkin_checkout_screen.dart';
import 'hotel_services_screen.dart';
import 'hotel_finance_screen.dart';
import 'hotel_sync_screen.dart';

class KanPosVNKhachSanShell extends ConsumerStatefulWidget {
  const KanPosVNKhachSanShell({super.key});

  @override
  ConsumerState<KanPosVNKhachSanShell> createState() => _KanPosVNKhachSanShellState();
}

class _KanPosVNKhachSanShellState extends ConsumerState<KanPosVNKhachSanShell> {
  int _selectedIndex = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final isarService = ref.read(hotelIsarServiceProvider);
    await HotelSeedData.seed(isarService);
    ref.read(hotelRoomsProvider.notifier).loadRooms();
    ref.read(hotelBookingsProvider.notifier).loadBookings();
    if (mounted) {
      setState(() {
        _isInit = true;
      });
    }
  }

  static final Map<String, Set<String>> _roleTabs = {
    EmployeeRoles.cashier: const {'booking', 'checkin', 'services'},
    EmployeeRoles.sale: const {'booking', 'checkin'},
    EmployeeRoles.warehouse: const {'services'},
    EmployeeRoles.accountant: const {'rooms', 'finance'},
  };

  static final List<({String id, Widget screen, IconData icon, String label})>
      _allTabs = const [
    (id: 'rooms', screen: RoomsScreen(), icon: Icons.grid_view, label: 'Sơ đồ phòng'),
    (id: 'booking', screen: BookingScreen(), icon: Icons.book_online, label: 'Lễ tân / Đặt phòng'),
    (id: 'checkin', screen: CheckinCheckoutScreen(), icon: Icons.login, label: 'Check-in/Out'),
    (id: 'services', screen: HotelServicesScreen(), icon: Icons.room_service, label: 'Dịch vụ'),
    (id: 'finance', screen: HotelFinanceScreen(), icon: Icons.account_balance, label: 'Kế toán'),
    (id: 'sync', screen: HotelSyncScreen(), icon: Icons.cloud_sync, label: 'Vercel Neon'),
    (id: 'employees', screen: EmployeeManagementScreen(), icon: Icons.badge, label: 'Quản Lý NV'),
  ];

  @override
  Widget build(BuildContext context) {
    if (!_isInit) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final isDesktop = MediaQuery.of(context).size.width > 800;
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
        backgroundColor: const Color(0xFF0284C7), // Blue theme for hotel
        foregroundColor: Colors.white,
        title: Row(
          children: [
            const Icon(Icons.hotel, color: Colors.white),
            const SizedBox(width: 8),
            const Text(
              'KanPosVN - Quản lý Khách sạn',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Isar Offline + Vercel Neon Sync',
                style: TextStyle(fontSize: 11, color: Colors.white),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            tooltip: 'Đồng bộ Neon DB',
            onPressed: () async {
              final syncService = ref.read(hotelNeonSyncServiceProvider);
              // Assuming API URL and key are fetched from a config or environment
              final success = await syncService.triggerSync(ApiConfig.baseUrl, ApiConfig.syncApiKey);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(success ? 'Đồng bộ Neon DB qua Vercel API thành công!' : 'Đồng bộ thất bại, đã lưu vào Isar SyncQueue'),
                    backgroundColor: success ? Colors.green : Colors.orange,
                  ),
                );
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Thoát',
            onPressed: () async {
              await ref.read(authServiceProvider).signOut();
              ref.read(selectedModuleProvider.notifier).state = null;
            },
          ),
        ],
      ),
      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              selectedIndex: safeIndex,
              onDestinationSelected: (index) => setState(() => _selectedIndex = index),
              labelType: NavigationRailLabelType.all,
              selectedIconTheme: const IconThemeData(color: Color(0xFF0284C7)),
              selectedLabelTextStyle: const TextStyle(color: Color(0xFF0284C7), fontWeight: FontWeight.bold),
              destinations: [
                for (final t in tabs)
                  NavigationRailDestination(icon: Icon(t.icon), label: Text(t.label)),
              ],
            ),
          if (isDesktop) const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: tabs[safeIndex].screen),
        ],
      ),
      bottomNavigationBar: isDesktop
          ? null
          : BottomNavigationBar(
              currentIndex: safeIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
              selectedItemColor: const Color(0xFF0284C7),
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: [
                for (final t in tabs)
                  BottomNavigationBarItem(icon: Icon(t.icon), label: t.label),
              ],
            ),
    );
  }
}
