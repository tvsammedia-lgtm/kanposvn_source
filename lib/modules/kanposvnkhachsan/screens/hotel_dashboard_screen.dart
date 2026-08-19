import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/hotel_room.dart';
import '../models/hotel_checkin_checkout.dart';
import '../models/hotel_finance_accounting.dart';
import '../providers/hotel_providers.dart';
import '../services/hotel_billing_service.dart';
import '../../../core/widgets/owner_info_bar.dart';

class HotelDashboardScreen extends ConsumerWidget {
  const HotelDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomsAsync = ref.watch(hotelRoomsProvider);
    final checkInsAsync = ref.watch(hotelCheckInsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: const Color(0xFF0284C7),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(hotelRoomsProvider.notifier).loadRooms();
              ref.read(hotelCheckInsProvider.notifier).loadCheckIns();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OwnerInfoBar(),
            const SizedBox(height: 12),
            roomsAsync.when(
              data: (rooms) => _buildRoomStats(rooms),
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text('Lỗi: $e'),
            ),
            const SizedBox(height: 16),
            // ── Row 2: Doanh thu ──
            _buildRevenueSection(ref),
            const SizedBox(height: 16),
            // ── Row 3: Khách đang ở ──
            checkInsAsync.when(
              data: (checkIns) => _buildActiveGuests(checkIns, ref),
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text('Lỗi: $e'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomStats(List<HotelRoom> rooms) {
    final total = rooms.length;
    final available = rooms.where((r) => r.status == RoomStatus.AVAILABLE).length;
    final occupied = rooms.where((r) => r.status == RoomStatus.OCCUPIED).length;
    final reserved = rooms.where((r) => r.status == RoomStatus.RESERVED).length;
    final cleaning = rooms.where((r) => r.status == RoomStatus.CLEANING).length;
    final maintenance = rooms.where((r) => r.status == RoomStatus.MAINTENANCE).length;
    final occupancyRate = total > 0 ? (occupied / total * 100).toStringAsFixed(0) : '0';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('TỔNG QUAN PHÒNG', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          children: [
            _statCard('Tổng phòng', '$total', Icons.hotel, Colors.blue),
            _statCard('Trống', '$available', Icons.check_circle, Colors.green),
            _statCard('Có khách', '$occupied', Icons.person, Colors.red),
            _statCard('Đặt trước', '$reserved', Icons.bookmark, Colors.orange),
            _statCard('Đang dọn', '$cleaning', Icons.cleaning_services, Colors.teal),
            _statCard('Bảo trì', '$maintenance', Icons.build, Colors.grey),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: total > 0 ? occupied / total : 0,
          backgroundColor: Colors.grey[200],
          color: Colors.red,
          minHeight: 8,
        ),
        const SizedBox(height: 4),
        Text('Tỷ lệ lấp đầy: $occupancyRate% ($occupied/$total)',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _statCard(String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 4),
              Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
              Text(label, style: const TextStyle(fontSize: 11)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRevenueSection(WidgetRef ref) {
    return FutureBuilder<Map<String, double>>(
      future: _loadRevenue(ref),
      builder: (context, snapshot) {
        final data = snapshot.data;
        final todayIncome = data?['todayIncome'] ?? 0;
        final todayExpense = data?['todayExpense'] ?? 0;
        final monthIncome = data?['monthIncome'] ?? 0;
        final monthExpense = data?['monthExpense'] ?? 0;
        final profit = monthIncome - monthExpense;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('DOANH THU', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                _revenueCard('Thu hôm nay', todayIncome, Colors.green),
                _revenueCard('Chi hôm nay', todayExpense, Colors.red),
                _revenueCard('Thu tháng', monthIncome, Colors.blue),
                _revenueCard('Lãi/tháng', profit, profit >= 0 ? Colors.green : Colors.red),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _revenueCard(String label, double amount, Color color) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
              const SizedBox(height: 4),
              Text('${amount.toStringAsFixed(0)}đ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        ),
      ),
    );
  }

  Future<Map<String, double>> _loadRevenue(WidgetRef ref) async {
    final isarService = ref.read(hotelIsarServiceProvider);
    final db = await isarService.db;
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final monthStart = DateTime(now.year, now.month, 1);
    final todayEnd = DateTime(now.year, now.month, now.day, 23, 59, 59);
    final monthEnd = DateTime(now.year, now.month, now.day, 23, 59, 59);

    final allTxns = await db.hotelCashTransactions.where().findAll();
    double todayIncome = 0, todayExpense = 0, monthIncome = 0, monthExpense = 0;
    for (final t in allTxns) {
      final isIncome = t.type == CashTransactionType.INCOME;
      if (t.createdAt.isAfter(todayStart) && t.createdAt.isBefore(todayEnd)) {
        if (isIncome) { todayIncome += t.amount; } else { todayExpense += t.amount; }
      }
      if (t.createdAt.isAfter(monthStart) && t.createdAt.isBefore(monthEnd)) {
        if (isIncome) { monthIncome += t.amount; } else { monthExpense += t.amount; }
      }
    }
    return {
      'todayIncome': todayIncome,
      'todayExpense': todayExpense,
      'monthIncome': monthIncome,
      'monthExpense': monthExpense,
    };
  }

  Widget _buildActiveGuests(List<RoomCheckIn> checkIns, WidgetRef ref) {
    final active = checkIns.where((c) => !c.isCheckedOut).toList();
    final now = DateTime.now();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('KHÁCH ĐANG Ở (${active.length})', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        if (active.isEmpty)
          const Card(child: Padding(padding: EdgeInsets.all(16), child: Text('Không có khách đang ở')))
        else
          ...active.map((c) {
            final room = c.room.value;
            final roomType = room?.roomType.value;
            final checkInTime = c.actualCheckIn ?? c.createdAt;
            final elapsed = HotelBillingCalculator.formatElapsed(checkInTime, now);
            final charge = roomType != null
                ? HotelBillingCalculator.computeRoomCharge(roomType: roomType, rentalType: c.rentalType, checkIn: checkInTime, now: now)
                : 0.0;

            return Card(
              child: ListTile(
                leading: CircleAvatar(backgroundColor: Colors.red[50], child: const Icon(Icons.person, color: Colors.red)),
                title: Text('${room?.roomName ?? '?'} - ${c.customerName.isEmpty ? 'Khách vãng lai' : c.customerName}'),
                subtitle: Text('${c.rentalType.label} • Đã ở: $elapsed'),
                trailing: Text('${charge.toStringAsFixed(0)}đ', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
              ),
            );
          }),
      ],
    );
  }
}
