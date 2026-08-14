import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/user.dart';
import '../models/message.dart';
import 'videocall_isar_provider.dart';
import '../../../core/api/sync_service.dart';

final syncWorkerProvider = Provider<SyncWorker>((ref) {
  final isar = ref.watch(videoCallIsarProvider);
  return SyncWorker(isar);
});

class SyncWorker {
  final Isar isar;
  Timer? _timer;
  bool _isSyncing = false;

  SyncWorker(this.isar);

  void startBackgroundSync() {
    // Cháº¡y ngáº§m Ä‘á»‹nh ká»³ má»—i 5 giÃ¢y
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      _syncPendingMessages();
    });
  }

  void stopBackgroundSync() {
    _timer?.cancel();
  }

  Future<void> _syncPendingMessages() async {
    if (_isSyncing) return;
    _isSyncing = true;

    try {
      // 1. TÃ¬m táº¥t cáº£ tin nháº¯n Ä‘ang Pending
      final pendingMessages = await isar.videoCallMessages
          .where()
          .filter()
          .syncStatusEqualTo(SyncStatus.pending)
          .findAll();

      if (pendingMessages.isEmpty) {
        _isSyncing = false;
        return;
      }

      // 2. Gá»i API Ä‘á»ƒ Ä‘áº©y dá»¯ liá»‡u
      final results = await SyncService.pushMessages(pendingMessages);

      // 3. Cáº­p nháº­t láº¡i vÃ o Local Database Isar
      await isar.writeTxn(() async {
        for (var result in results) {
          final clientId = result['clientMessageId'];
          final serverId = result['serverId'];
          
          final msgToUpdate = await isar.videoCallMessages.where().clientMessageIdEqualTo(clientId).findFirst();
          
          if (msgToUpdate != null) {
            msgToUpdate.serverId = serverId;
            msgToUpdate.status = MessageStatus.sent;
            msgToUpdate.syncStatus = SyncStatus.synced;
            msgToUpdate.updatedAt = DateTime.now();
            
            await isar.videoCallMessages.put(msgToUpdate);
          }
        }
      });
      
    } catch (e) {
      debugPrint('Sync Error: $e');
    } finally {
      _isSyncing = false;
    }
  }
}

