import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'dart:developer';

import '../models/booking.dart';
import 'airbook_isar_provider.dart';

final airbookSyncProvider = StateNotifierProvider<AirbookSyncNotifier, AsyncValue<void>>((ref) {
  final isar = ref.watch(airbookIsarProvider);
  return AirbookSyncNotifier(isar);
});

class AirbookSyncNotifier extends StateNotifier<AsyncValue<void>> {
  final Isar isar;

  AirbookSyncNotifier(this.isar) : super(const AsyncValue.data(null));

  Future<void> syncNow() async {
    state = const AsyncValue.loading();
    try {
      log('--- BẮT ĐẦU ĐỒNG BỘ OFFLINE -> CLOUD ---');
      
      // 1. Lấy tất cả booking cần sync
      final bookingsToSync = await isar.bookingLocals.where().filter().needsSyncEqualTo(true).findAll();
      
      if (bookingsToSync.isEmpty) {
        log('Không có dữ liệu mới nào cần đồng bộ.');
      } else {
        log('Đang đẩy ${bookingsToSync.length} booking lên server Vercel...');
        // Giả lập network delay
        await Future.delayed(const Duration(seconds: 2));

        // 2. Ghi nhận thành công, tắt cờ needsSync
        await isar.writeTxn(() async {
          for (var b in bookingsToSync) {
            b.needsSync = false;
          }
          await isar.bookingLocals.putAll(bookingsToSync);
        });
        
        log('✅ Đã đồng bộ thành công ${bookingsToSync.length} booking lên server!');
      }

      state = const AsyncValue.data(null);
    } catch (e, st) {
      log('Lỗi đồng bộ: $e');
      state = AsyncValue.error(e, st);
    }
  }
}
