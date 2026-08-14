import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../models/ride_booking.dart';
import '../models/ride_driver.dart';
import '../models/ride_user.dart';
import 'ride_isar_provider.dart';

final rideBookingProvider = StateNotifierProvider<RideBookingNotifier, AsyncValue<List<RideBooking>>>((ref) {
  final isar = ref.watch(rideIsarProvider);
  return RideBookingNotifier(isar);
});

class RideBookingNotifier extends StateNotifier<AsyncValue<List<RideBooking>>> {
  final Isar isar;
  final uuid = const Uuid();

  RideBookingNotifier(this.isar) : super(const AsyncValue.loading()) {
    loadBookings();
  }

  Future<void> loadBookings() async {
    try {
      state = const AsyncValue.loading();
      final bookings = await isar.rideBookings.where().sortByCreatedAtDesc().findAll();
      state = AsyncValue.data(bookings);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createBooking({
    required String pickup,
    required String dropoff,
    required double distance,
    required double price,
    required VehicleType vehicleType,
    bool isShared = false,
  }) async {
    try {
      final booking = RideBooking()
        ..uuid = uuid.v4()
        ..passengerUuid = 'PASSENGER-001' // Mock ID
        ..pickupAddress = pickup
        ..dropoffAddress = dropoff
        ..distanceKm = distance
        ..estimatedPrice = price
        ..requestedVehicleType = vehicleType
        ..isSharedRide = isShared
        ..status = BookingStatus.findingDriver
        ..createdAt = DateTime.now()
        ..syncStatus = SyncStatus.pending; // Chuẩn bị cho Offline Sync

      await isar.writeTxn(() async {
        await isar.rideBookings.put(booking);
      });
      await loadBookings();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> acceptBooking(String bookingUuid, String driverUuid) async {
    try {
      final booking = await isar.rideBookings.where().uuidEqualTo(bookingUuid).findFirst();
      if (booking != null) {
        booking.driverUuid = driverUuid;
        booking.status = BookingStatus.accepted;
        booking.acceptedAt = DateTime.now();
        booking.syncStatus = SyncStatus.pending;

        await isar.writeTxn(() async {
          await isar.rideBookings.put(booking);
        });
        await loadBookings();
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
