import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../services/hotel_isar_service.dart';
import '../services/hotel_neon_sync_service.dart';
import '../models/hotel_room.dart';
import '../models/hotel_booking.dart';

// Services
final hotelIsarServiceProvider = Provider<HotelIsarService>((ref) {
  return HotelIsarService();
});

final hotelNeonSyncServiceProvider = Provider<HotelNeonSyncService>((ref) {
  final isarService = ref.watch(hotelIsarServiceProvider);
  return HotelNeonSyncService(isarService);
});

// State Notifiers
class HotelRoomsNotifier extends StateNotifier<AsyncValue<List<HotelRoom>>> {
  final HotelIsarService _isarService;

  HotelRoomsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadRooms();
  }

  Future<void> loadRooms() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final rooms = await db.hotelRooms.where().findAll();
      state = AsyncValue.data(rooms);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateRoomStatus(int id, RoomStatus newStatus) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        final room = await db.hotelRooms.get(id);
        if (room != null) {
          room.status = newStatus;
          await db.hotelRooms.put(room);
        }
      });
      await loadRooms();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final hotelRoomsProvider = StateNotifierProvider<HotelRoomsNotifier, AsyncValue<List<HotelRoom>>>((ref) {
  final isarService = ref.watch(hotelIsarServiceProvider);
  return HotelRoomsNotifier(isarService);
});

// Bookings Notifier
class HotelBookingsNotifier extends StateNotifier<AsyncValue<List<RoomReservation>>> {
  final HotelIsarService _isarService;

  HotelBookingsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadBookings();
  }

  Future<void> loadBookings() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final bookings = await db.roomReservations.where().findAll();
      state = AsyncValue.data(bookings);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addBooking(RoomReservation booking) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        await db.roomReservations.put(booking);
        await booking.room.save(); // Save IsarLink
      });
      await loadBookings();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final hotelBookingsProvider = StateNotifierProvider<HotelBookingsNotifier, AsyncValue<List<RoomReservation>>>((ref) {
  final isarService = ref.watch(hotelIsarServiceProvider);
  return HotelBookingsNotifier(isarService);
});

