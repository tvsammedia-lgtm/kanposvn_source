import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_management_screen.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../../../core/sync/api_config.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../providers/hotel_providers.dart';
import '../services/hotel_seed_data.dart';
import 'rooms_screen.dart';
import 'booking_screen.dart';
import 'checkin_checkout_screen.dart';
import 'hotel_services_screen.dart';
import 'hotel_finance_screen.dart';
import 'hotel_reports_screen.dart';
import 'hotel_settings_screen.dart';
import 'hotel_room_pricing_screen.dart';

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
    ref.read(hotelServiceItemsProvider.notifier).loadItems();
    ref.read(hotelCheckInsProvider.notifier).loadCheckIns();
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
    EmployeeRoles.accountant: const {'rooms', 'finance', 'reports', 'settings', 'room_pricing'},
  };

  /// Định nghĩa các tab của module (id, icon, label) — thứ tự hiển thị.
  static final Map<String, ({IconData icon, String label})> _tabDefs = {
    'rooms': (icon: Icons.grid_view, label: 'Sơ đồ phòng'),
    'booking': (icon: Icons.book_online, label: 'Lễ tân / Đặt phòng'),
    'checkin': (icon: Icons.login, label: 'Check-in/Out'),
    'services': (icon: Icons.room_service, label: 'Dịch vụ'),
    'finance': (icon: Icons.account_balance, label: 'Kế toán'),
    'reports': (icon: Icons.description, label: 'Báo cáo chung'),
    'employees': (icon: Icons.badge, label: 'Quản Lý NV'),
    'settings': (icon: Icons.settings, label: 'Cài Đặt'),
    'room_pricing': (icon: Icons.price_change, label: 'Thiết lập Phòng/Món ăn'),
  };

  static final Map<String, Widget Function()> _tabScreens = {
    'rooms': () => const RoomsScreen(),
    'booking': () => const BookingScreen(),
    'checkin': () => const CheckinCheckoutScreen(),
    'services': () => const HotelServicesScreen(),
    'finance': () => const HotelFinanceScreen(),
    'reports': () => const HotelReportsScreen(),
    'employees': () => EmployeeManagementScreen(
      availableTabs: [
        for (final e in _tabDefs.entries)
          EmployeeTabOption(id: e.key, label: e.value.label),
      ],
      roleTabs: _roleTabs,
    ),
    'settings': () => const HotelSettingsScreen(),
    'room_pricing': () => const HotelRoomPricingScreen(),
  };

  static final List<({String id, Widget screen, IconData icon, String label})>
      _allTabs = [
    for (final e in _tabDefs.entries)
      (
        id: e.key,
        screen: _tabScreens[e.key]!(),
        icon: e.value.icon,
        label: e.value.label,
      ),
  ];

  @override
  Widget build(BuildContext context) {
    if (!_isInit) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final isDesktop = MediaQuery.of(context).size.width > 800;
    final auth = ref.watch(authServiceProvider);
    final customTabs = auth.employeeAllowedTabs;
    final tabs = _allTabs.where((t) {
      if (auth.isManager) return true;
      // Tùy chỉnh tab riêng cho nhân viên (Owner check/uncheck trong "Quản Lý NV").
      if (customTabs != null) return customTabs.contains(t.id);
      return EmployeeRolePolicy.isAllowed(
        isManager: false,
        role: auth.employeeRole,
        tabId: t.id,
        roleTabs: _roleTabs,
      );
    }).toList();
    final safeIndex = tabs.isNotEmpty ? (_selectedIndex < tabs.length ? _selectedIndex : 0) : 0;

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
          const AccountSwitcherButton(foregroundColor: Colors.white),
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
        ],
      ),
      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              selectedIndex: safeIndex,
              onDestinationSelected: (index) => setState(() => _selectedIndex = index),
              labelType: NavigationRailLabelType.all,
              scrollable: true,
              selectedIconTheme: const IconThemeData(color: Color(0xFF0284C7)),
              selectedLabelTextStyle: const TextStyle(color: Color(0xFF0284C7), fontWeight: FontWeight.bold),
              destinations: [
                for (final t in tabs)
                  NavigationRailDestination(icon: Icon(t.icon), label: Text(t.label)),
              ],
            ),
          if (isDesktop) const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: tabs.isNotEmpty ? tabs[safeIndex].screen : const Text('Không có quyền truy cập tab')),
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
