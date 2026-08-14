import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/ride_user.dart';
import '../models/ride_booking.dart';
import 'ride_isar_provider.dart';
import '../../../core/api/ride_sync_service.dart';

final rideSyncWorkerProvider = Provider<RideSyncWorker>((ref) {
  final isar = ref.watch(rideIsarProvider);
  return RideSyncWorker(isar);
});

class RideSyncWorker {
  final Isar isar;
  Timer? _timer;
  bool _isSyncing = false;

  RideSyncWorker(this.isar);

  void startSync() {
    debugPrint('SYNC ENGINE: Khá»Ÿi Ä‘á»™ng vÃ²ng láº·p Ä‘á»“ng bá»™ ngáº§m (má»—i 10s)');
    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      _syncBookings();
    });
  }

  void stopSync() {
    _timer?.cancel();
  }

  Future<void> _syncBookings() async {
    if (_isSyncing) return;
    _isSyncing = true;

    try {
      // 1. TÃ¬m cÃ¡c cuá»‘c xe cÃ³ tráº¡ng thÃ¡i pending
      final pendingBookings = await isar.rideBookings
          .where()
          .filter()
          .syncStatusEqualTo(SyncStatus.pending)
          .findAll();

      if (pendingBookings.isEmpty) {
        _isSyncing = false;
        return;
      }

      // 2. Gá»­i lÃªn Vercel
      final success = await RideSyncService.pushPendingBookings(pendingBookings);

      // 3. Náº¿u thÃ nh cÃ´ng, cáº­p nháº­t Isar thÃ nh synced
      if (success) {
        await isar.writeTxn(() async {
          for (var b in pendingBookings) {
            b.syncStatus = SyncStatus.synced;
            await isar.rideBookings.put(b);
          }
        });
      }
    } catch (e) {
      debugPrint('SYNC ENGINE ERROR: $e');
    } finally {
      _isSyncing = false;
    }
  }
}

