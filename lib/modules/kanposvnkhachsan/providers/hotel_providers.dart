import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../services/hotel_isar_service.dart';
import '../services/hotel_neon_sync_service.dart';
import '../services/hotel_einvoice_settings.dart';
import '../models/hotel_room.dart';
import '../models/hotel_booking.dart';
import '../models/hotel_checkin_checkout.dart';
import '../models/hotel_service.dart';

// Services
final hotelIsarServiceProvider = Provider<HotelIsarService>((ref) {
  return HotelIsarService();
});

final hotelNeonSyncServiceProvider = Provider<HotelNeonSyncService>((ref) {
  final isarService = ref.watch(hotelIsarServiceProvider);
  return HotelNeonSyncService(isarService);
});

// Settings
final hotelEinvoiceSettingsProvider =
    ChangeNotifierProvider<HotelEinvoiceSettingsStore>((ref) {
  final store = HotelEinvoiceSettingsStore();
  store.load();
  return store;
});

// Đồng hồ toàn cục tick mỗi giây để cập nhật timer tính tiền phòng
class HotelClockNotifier extends StateNotifier<DateTime> {
  Timer? _timer;

  HotelClockNotifier() : super(DateTime.now()) {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      state = DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final hotelClockProvider = StateNotifierProvider<HotelClockNotifier, DateTime>((ref) {
  return HotelClockNotifier();
});

// Rooms Notifier
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
      for (final r in rooms) {
        await r.floor.load();
        await r.roomType.load();
      }
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
      for (final b in bookings) {
        await b.room.load();
      }
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

// Dịch vụ / Menu Notifier
class HotelServiceItemsNotifier extends StateNotifier<AsyncValue<List<HotelServiceItem>>> {
  final HotelIsarService _isarService;

  HotelServiceItemsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadItems();
  }

  Future<void> loadItems() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final items = await db.hotelServiceItems.where().sortByCategory().findAll();
      state = AsyncValue.data(items);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> saveItem(HotelServiceItem item) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        item.updatedAt = DateTime.now();
        await db.hotelServiceItems.put(item);
      });
      await loadItems();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteItem(Id id) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        await db.hotelServiceItems.delete(id);
      });
      await loadItems();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final hotelServiceItemsProvider = StateNotifierProvider<HotelServiceItemsNotifier, AsyncValue<List<HotelServiceItem>>>((ref) {
  final isarService = ref.watch(hotelIsarServiceProvider);
  return HotelServiceItemsNotifier(isarService);
});

// Check-in/Out Notifier
class HotelCheckInsNotifier extends StateNotifier<AsyncValue<List<RoomCheckIn>>> {
  final HotelIsarService _isarService;

  HotelCheckInsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadCheckIns();
  }

  Future<void> loadCheckIns() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final checkIns = await db.roomCheckIns.where().sortByActualCheckInDesc().findAll();
      for (final c in checkIns) {
        await c.room.load();
      }
      state = AsyncValue.data(checkIns);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Tạo check-in mới + chuyển phòng sang trạng thái CÓ KHÁCH
  Future<RoomCheckIn> createCheckIn({
    required HotelRoom room,
    required RentalType rentalType,
    String customerName = '',
    String customerIdentity = '',
    String customerPhone = '',
    double prePaid = 0,
    DateTime? expectedCheckOut,
    String note = '',
  }) async {
    final db = await _isarService.db;
    final checkIn = RoomCheckIn()
      ..checkInId = const Uuid().v4()
      ..customerName = customerName
      ..customerIdentity = customerIdentity
      ..customerPhone = customerPhone
      ..actualCheckIn = DateTime.now()
      ..expectedCheckOut = expectedCheckOut
      ..rentalType = rentalType
      ..prePaid = prePaid
      ..note = note
      ..isCheckedOut = false;

    await db.writeTxn(() async {
      await db.roomCheckIns.put(checkIn);
      checkIn.room.value = room;
      checkIn.room.save();
      room.status = RoomStatus.OCCUPIED;
      room.activeCheckInId = checkIn.checkInId;
      await db.hotelRooms.put(room);
    });

    await loadCheckIns();
    return checkIn;
  }

  /// Check-out: tính tổng tiền dịch vụ, chốt tiền phòng, trả phòng về trạng thái ĐANG DỌN
  Future<void> checkout(RoomCheckIn checkIn, {required double roomTotalCharge, double discount = 0}) async {
    try {
      final db = await _isarService.db;
      final orderItems = await db.roomServiceOrderItems.filter()
          .checkIn((q) => q.idEqualTo(checkIn.id))
          .findAll();
      final serviceTotal = orderItems.fold(0.0, (sum, oi) => sum + oi.totalPrice);

      await db.writeTxn(() async {
        final c = await db.roomCheckIns.get(checkIn.id);
        if (c == null) return;
        c.roomTotalCharge = roomTotalCharge;
        c.serviceTotalCharge = serviceTotal;
        c.actualCheckOut = DateTime.now();
        c.discount = discount;
        c.finalTotal = (c.roomTotalCharge + c.serviceTotalCharge - discount).clamp(0.0, double.infinity);
        c.isCheckedOut = true;
        await db.roomCheckIns.put(c);

        for (final oi in orderItems) {
          oi.isPaid = true;
          await db.roomServiceOrderItems.put(oi);
        }

        final room = checkIn.room.value;
        if (room != null) {
          room.status = RoomStatus.CLEANING;
          room.activeCheckInId = '';
          await db.hotelRooms.put(room);
        }
      });

      await loadCheckIns();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final hotelCheckInsProvider = StateNotifierProvider<HotelCheckInsNotifier, AsyncValue<List<RoomCheckIn>>>((ref) {
  final isarService = ref.watch(hotelIsarServiceProvider);
  return HotelCheckInsNotifier(isarService);
});

// Đơn hàng dịch vụ theo từng check-in
class HotelOrderItemsNotifier extends StateNotifier<AsyncValue<List<RoomServiceOrderItem>>> {
  final HotelIsarService _isarService;
  final int _checkInIsarId;

  HotelOrderItemsNotifier(this._isarService, this._checkInIsarId) : super(const AsyncValue.loading()) {
    load();
  }

  Future<void> load() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final items = await db.roomServiceOrderItems.filter()
          .checkIn((q) => q.idEqualTo(_checkInIsarId))
          .sortByOrderTime()
          .findAll();
      for (final it in items) {
        await it.serviceItem.load();
      }
      state = AsyncValue.data(items);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Thêm món dịch vụ (nếu đã có trong hoá đơn thì tăng số lượng)
  Future<void> addItem(HotelServiceItem item) async {
    final db = await _isarService.db;
    final checkIn = await db.roomCheckIns.get(_checkInIsarId);
    if (checkIn == null) return;

    final existing = await db.roomServiceOrderItems.filter()
        .checkIn((q) => q.idEqualTo(_checkInIsarId))
        .findAll();
    RoomServiceOrderItem? found;
    for (final e in existing) {
      await e.serviceItem.load();
      if (e.serviceItem.value?.itemId == item.itemId) {
        found = e;
        break;
      }
    }

    await db.writeTxn(() async {
      if (found != null) {
        found.quantity++;
        found.totalPrice = found.quantity * found.unitPrice;
        await db.roomServiceOrderItems.put(found);
      } else {
        final oi = RoomServiceOrderItem()
          ..orderItemId = const Uuid().v4()
          ..quantity = 1
          ..unitPrice = item.price
          ..totalPrice = item.price
          ..orderTime = DateTime.now()
          ..isPaid = false;
        await db.roomServiceOrderItems.put(oi);
        oi.checkIn.value = checkIn;
        oi.serviceItem.value = item;
        oi.checkIn.save();
        oi.serviceItem.save();
      }
    });

    await load();
  }

  Future<void> updateQuantity(int orderItemIsarId, int delta) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      final oi = await db.roomServiceOrderItems.get(orderItemIsarId);
      if (oi == null) return;
      oi.quantity += delta;
      if (oi.quantity <= 0) {
        await db.roomServiceOrderItems.delete(oi.id);
      } else {
        oi.totalPrice = oi.quantity * oi.unitPrice;
        await db.roomServiceOrderItems.put(oi);
      }
    });
    await load();
  }

  Future<void> removeItem(int orderItemIsarId) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.roomServiceOrderItems.delete(orderItemIsarId);
    });
    await load();
  }
}

final hotelOrderItemsProvider =
    StateNotifierProvider.family<HotelOrderItemsNotifier, AsyncValue<List<RoomServiceOrderItem>>, int>((ref, checkInIsarId) {
  final isarService = ref.watch(hotelIsarServiceProvider);
  return HotelOrderItemsNotifier(isarService, checkInIsarId);
});
