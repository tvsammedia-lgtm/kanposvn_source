import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/booking.dart';
import 'xeom_isar_provider.dart';
import 'package:uuid/uuid.dart';

final xeOmBookingProvider = StateNotifierProvider<XeOmBookingNotifier, AsyncValue<List<XeOmBooking>>>((ref) {
  final isar = ref.watch(xeOmIsarProvider);
  return XeOmBookingNotifier(isar);
});

class XeOmBookingNotifier extends StateNotifier<AsyncValue<List<XeOmBooking>>> {
  final Isar isar;
  final uuid = const Uuid();

  XeOmBookingNotifier(this.isar) : super(const AsyncValue.loading()) {
    loadBookings();
  }

  Future<void> loadBookings() async {
    try {
      state = const AsyncValue.loading();
      final bookings = await isar.xeOmBookings.where().findAll();
      state = AsyncValue.data(bookings);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addBooking(XeOmBooking booking) async {
    try {
      if (booking.uuid == null || booking.uuid!.isEmpty) {
        booking.uuid = uuid.v4();
      }
      if (booking.bookingCode == null || booking.bookingCode!.isEmpty) {
        booking.bookingCode = 'BOOK-${DateTime.now().millisecondsSinceEpoch}';
      }
      
      booking.createdAt = DateTime.now();
      booking.updatedAt = DateTime.now();
      
      await isar.writeTxn(() async {
        await isar.xeOmBookings.put(booking);
      });
      await loadBookings();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateBookingStatus(String bookingUuid, BookingStatus newStatus) async {
    try {
      final booking = await isar.xeOmBookings.where().uuidEqualTo(bookingUuid).findFirst();
      if (booking != null) {
        booking.status = newStatus;
        booking.updatedAt = DateTime.now();
        
        if (newStatus == BookingStatus.pickedUp) {
          booking.pickedUpAt = DateTime.now();
        } else if (newStatus == BookingStatus.completed) {
          booking.completedAt = DateTime.now();
        }

        await isar.writeTxn(() async {
          await isar.xeOmBookings.put(booking);
        });
        await loadBookings();
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
