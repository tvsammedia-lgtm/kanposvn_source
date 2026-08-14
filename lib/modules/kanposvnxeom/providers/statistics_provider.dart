import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/booking.dart';
import '../models/payment.dart';
import 'xeom_isar_provider.dart';

class DashboardStats {
  final int totalBookingsToday;
  final int activeBookings; // Đang chạy
  final double totalRevenueToday; // Tổng thu
  final double totalCommissionToday; // Hoa hồng thu được

  DashboardStats({
    this.totalBookingsToday = 0,
    this.activeBookings = 0,
    this.totalRevenueToday = 0.0,
    this.totalCommissionToday = 0.0,
  });
}

final xeOmStatisticsProvider = FutureProvider<DashboardStats>((ref) async {
  final isar = ref.watch(xeOmIsarProvider);

  final now = DateTime.now();
  final startOfDay = DateTime(now.year, now.month, now.day);
  final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

  // Lấy các chuyến đi hôm nay
  final todayBookings = await isar.xeOmBookings
      .where()
      .filter()
      .createdAtBetween(startOfDay, endOfDay)
      .findAll();

  // Đếm cuốc đang chạy
  final activeCount = await isar.xeOmBookings
      .where()
      .filter()
      .statusEqualTo(BookingStatus.inProgress)
      .count();

  // Lấy thanh toán hôm nay
  final todayPayments = await isar.xeOmPayments
      .where()
      .filter()
      .paidAtBetween(startOfDay, endOfDay)
      .and()
      .statusEqualTo(PaymentStatus.completed)
      .findAll();

  double revenue = 0;
  double commission = 0;

  for (var p in todayPayments) {
    revenue += (p.amount ?? 0);
    commission += (p.driverCommission ?? 0);
  }

  return DashboardStats(
    totalBookingsToday: todayBookings.length,
    activeBookings: activeCount,
    totalRevenueToday: revenue,
    totalCommissionToday: commission,
  );
});
