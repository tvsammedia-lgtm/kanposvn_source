import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  final List<Widget> _screens = const [
    RoomsScreen(),
    BookingScreen(),
    CheckinCheckoutScreen(),
    HotelServicesScreen(),
    HotelFinanceScreen(),
    HotelSyncScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    if (!_isInit) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final isDesktop = MediaQuery.of(context).size.width > 800;

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
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) => setState(() => _selectedIndex = index),
              labelType: NavigationRailLabelType.all,
              selectedIconTheme: const IconThemeData(color: Color(0xFF0284C7)),
              selectedLabelTextStyle: const TextStyle(color: Color(0xFF0284C7), fontWeight: FontWeight.bold),
              destinations: const [
                NavigationRailDestination(icon: Icon(Icons.grid_view), label: Text('Sơ đồ phòng')),
                NavigationRailDestination(icon: Icon(Icons.book_online), label: Text('Lễ tân / Đặt phòng')),
                NavigationRailDestination(icon: Icon(Icons.login), label: Text('Check-in/Out')),
                NavigationRailDestination(icon: Icon(Icons.room_service), label: Text('Dịch vụ')),
                NavigationRailDestination(icon: Icon(Icons.account_balance), label: Text('Kế toán')),
                NavigationRailDestination(icon: Icon(Icons.cloud_sync), label: Text('Vercel Neon')),
              ],
            ),
          if (isDesktop) const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: _screens[_selectedIndex]),
        ],
      ),
      bottomNavigationBar: isDesktop
          ? null
          : BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
              selectedItemColor: const Color(0xFF0284C7),
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Phòng'),
                BottomNavigationBarItem(icon: Icon(Icons.book_online), label: 'Lễ tân'),
                BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Checkin'),
                BottomNavigationBarItem(icon: Icon(Icons.room_service), label: 'Dịch vụ'),
                BottomNavigationBarItem(icon: Icon(Icons.cloud_sync), label: 'Sync'),
              ],
            ),
    );
  }
}
