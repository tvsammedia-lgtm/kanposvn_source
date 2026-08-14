import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../models/real_estate.dart';
import '../models/real_estate_booking.dart';
import 'bds_isar_provider.dart';
import '../../kanposvnride/providers/wallet_provider.dart';
import 'real_estate_provider.dart';

final realEstateBookingProvider = StateNotifierProvider<RealEstateBookingNotifier, AsyncValue<void>>((ref) {
  final isar = ref.watch(bdsIsarProvider);
  return RealEstateBookingNotifier(isar, ref);
});

class RealEstateBookingNotifier extends StateNotifier<AsyncValue<void>> {
  final Isar isar;
  final Ref ref;
  final uuid = const Uuid();

  RealEstateBookingNotifier(this.isar, this.ref) : super(const AsyncValue.data(null));

  Future<bool> depositForProperty(String bdsUuid, double depositAmount) async {
    state = const AsyncValue.loading();
    try {
      // 1. Trừ tiền trong Ví chung (Wallet từ module kanposvnride)
      final paySuccess = await ref.read(walletProvider.notifier).payForRide(depositAmount, bdsUuid);
      if (!paySuccess) {
        state = AsyncValue.error('Không đủ số dư trong ví', StackTrace.current);
        return false;
      }

      // 2. Tạo Booking
      final booking = RealEstateBooking()
        ..uuid = uuid.v4()
        ..realEstateUuid = bdsUuid
        ..userUuid = 'PASSENGER-001'
        ..depositAmount = depositAmount
        ..status = BookingStatus.pending
        ..createdAt = DateTime.now();

      // 3. Cập nhật Status BĐS thành Deposited
      await isar.writeTxn(() async {
        await isar.realEstateBookings.put(booking);
        
        final bds = await isar.realEstates.where().uuidEqualTo(bdsUuid).findFirst();
        if (bds != null) {
          bds.status = RealEstateStatus.deposited;
          await isar.realEstates.put(bds);
        }
      });
      
      // Refresh lại danh sách BĐS
      await ref.read(realEstateProvider.notifier).loadListings();
      
      state = const AsyncValue.data(null);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}
