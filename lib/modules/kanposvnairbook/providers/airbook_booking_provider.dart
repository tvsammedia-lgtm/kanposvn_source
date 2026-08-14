import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../models/booking.dart';
import '../models/flight_offer.dart';
import 'airbook_isar_provider.dart';
import '../../kanposvnride/providers/wallet_provider.dart'; // Sử dụng chung ví

final airbookBookingProvider = StateNotifierProvider<AirbookBookingNotifier, AsyncValue<void>>((ref) {
  final isar = ref.watch(airbookIsarProvider);
  return AirbookBookingNotifier(isar, ref);
});

final myBookingsProvider = FutureProvider<List<BookingLocal>>((ref) async {
  final isar = ref.watch(airbookIsarProvider);
  return await isar.bookingLocals.where().sortByCreatedAtDesc().findAll();
});

class AirbookBookingNotifier extends StateNotifier<AsyncValue<void>> {
  final Isar isar;
  final Ref ref;
  final uuid = const Uuid();
  final _random = Random();

  AirbookBookingNotifier(this.isar, this.ref) : super(const AsyncValue.data(null));

  Future<BookingLocal?> createBookingAndPay(FlightOffer flight, String name, String phone) async {
    state = const AsyncValue.loading();
    try {
      final amount = flight.totalFare ?? 0.0;
      
      // 1. Trừ tiền Ví ảo (Liên thông module)
      final paySuccess = await ref.read(walletProvider.notifier).payForRide(amount, 'AIRBOOK-${flight.flightNumber}');
      if (!paySuccess) {
        state = AsyncValue.error('Số dư trong Ví không đủ để thanh toán vé!', StackTrace.current);
        return null;
      }

      // 2. Tạo mã PNR ngẫu nhiên (VD: KAN8A2)
      final pnr = 'KAN${_random.nextInt(9)}${String.fromCharCode(65 + _random.nextInt(26))}${_random.nextInt(9)}';

      // 3. Tạo Booking
      final booking = BookingLocal()
        ..uuid = uuid.v4()
        ..pnrCode = pnr
        ..flightOfferUuid = flight.uuid
        ..passengerName = name
        ..passengerPhone = phone
        ..totalAmount = amount
        ..commission = amount * 0.05 // Hoa hồng 5%
        ..status = BookingAirStatus.confirmed
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..needsSync = true;

      await isar.writeTxn(() async {
        await isar.bookingLocals.put(booking);
      });

      // Refresh danh sách vé của tôi
      ref.invalidate(myBookingsProvider);

      state = const AsyncValue.data(null);
      return booking;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  Future<bool> checkIn(String pnr, String seatNumber) async {
    state = const AsyncValue.loading();
    try {
      await isar.writeTxn(() async {
        final booking = await isar.bookingLocals.filter().pnrCodeEqualTo(pnr).findFirst();
        if (booking != null) {
          booking.isCheckedIn = true;
          booking.seatNumber = seatNumber;
          booking.updatedAt = DateTime.now();
          booking.needsSync = true;
          await isar.bookingLocals.put(booking);
        }
      });
      ref.invalidate(myBookingsProvider);
      state = const AsyncValue.data(null);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> rescheduleFlight(String pnr, FlightOffer newFlight) async {
    state = const AsyncValue.loading();
    try {
      final fee = 500000.0;
      final paySuccess = await ref.read(walletProvider.notifier).payForRide(fee, 'RESCHEDULE-$pnr');
      if (!paySuccess) {
        state = AsyncValue.error('Không đủ 500.000đ phí đổi vé', StackTrace.current);
        return false;
      }

      await isar.writeTxn(() async {
        final booking = await isar.bookingLocals.filter().pnrCodeEqualTo(pnr).findFirst();
        if (booking != null) {
          booking.flightOfferUuid = newFlight.uuid;
          booking.isCheckedIn = false; // Reset checkin status
          booking.seatNumber = null;
          booking.updatedAt = DateTime.now();
          booking.needsSync = true;
          await isar.bookingLocals.put(booking);
        }
      });
      ref.invalidate(myBookingsProvider);
      state = const AsyncValue.data(null);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}
