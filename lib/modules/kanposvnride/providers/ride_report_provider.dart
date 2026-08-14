import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/ride_booking.dart';
import 'ride_isar_provider.dart';

class RideReportStats {
  final int totalTrips;
  final int completedTrips;
  final int cancelledTrips;
  final double totalRevenue;
  
  double get completionRate => totalTrips == 0 ? 0 : (completedTrips / totalTrips) * 100;
  double get cancellationRate => totalTrips == 0 ? 0 : (cancelledTrips / totalTrips) * 100;

  RideReportStats({
    this.totalTrips = 0,
    this.completedTrips = 0,
    this.cancelledTrips = 0,
    this.totalRevenue = 0.0,
  });
}

final rideReportProvider = FutureProvider.family<RideReportStats, String>((ref, driverUuid) async {
  final isar = ref.watch(rideIsarProvider);
  
  final bookings = await isar.rideBookings
      .where()
      .filter()
      .driverUuidEqualTo(driverUuid)
      .findAll();
      
  int completed = 0;
  int cancelled = 0;
  double revenue = 0.0;
  
  for (var b in bookings) {
    if (b.status == BookingStatus.completed) {
      completed++;
      revenue += b.finalPrice > 0 ? b.finalPrice : b.estimatedPrice; // Lấy giá cuối cùng hoặc giá dự kiến
    } else if (b.status == BookingStatus.cancelled) {
      cancelled++;
    }
  }

  return RideReportStats(
    totalTrips: bookings.length,
    completedTrips: completed,
    cancelledTrips: cancelled,
    totalRevenue: revenue,
  );
});

final generateMockDataReportProvider = FutureProvider<void>((ref) async {
  final isar = ref.read(rideIsarProvider);
  // Tạo dữ liệu giả để biểu đồ có số nhảy
  await isar.writeTxn(() async {
    await isar.rideBookings.putAll([
      RideBooking()
        ..driverUuid = 'DRIVER-001'
        ..status = BookingStatus.completed
        ..finalPrice = 150000
        ..createdAt = DateTime.now().subtract(const Duration(days: 1)),
      RideBooking()
        ..driverUuid = 'DRIVER-001'
        ..status = BookingStatus.completed
        ..finalPrice = 250000
        ..createdAt = DateTime.now().subtract(const Duration(days: 2)),
      RideBooking()
        ..driverUuid = 'DRIVER-001'
        ..status = BookingStatus.cancelled
        ..createdAt = DateTime.now().subtract(const Duration(days: 1)),
    ]);
  });
});
