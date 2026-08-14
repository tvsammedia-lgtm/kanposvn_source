import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/call_history.dart';
import '../models/user.dart';
import 'videocall_isar_provider.dart';

final callHistoryProvider = StateNotifierProvider<CallHistoryNotifier, AsyncValue<List<VideoCallHistory>>>((ref) {
  final isar = ref.watch(videoCallIsarProvider);
  return CallHistoryNotifier(isar);
});

class CallHistoryNotifier extends StateNotifier<AsyncValue<List<VideoCallHistory>>> {
  final Isar isar;

  CallHistoryNotifier(this.isar) : super(const AsyncValue.loading()) {
    loadHistory();
  }

  Future<void> loadHistory() async {
    try {
      state = const AsyncValue.loading();
      final histories = await isar.videoCallHistorys.where().sortByStartedAtDesc().findAll();
      state = AsyncValue.data(histories);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  // Dùng mock để có dữ liệu
  Future<void> addMockCall() async {
    try {
      final call = VideoCallHistory()
        ..callerUuid = 'ME'
        ..receiverUuid = 'FRIEND-001'
        ..type = CallType.video
        ..status = CallHistoryStatus.completed
        ..durationSeconds = 125
        ..startedAt = DateTime.now().subtract(const Duration(hours: 1))
        ..endedAt = DateTime.now().subtract(const Duration(minutes: 58))
        ..syncStatus = SyncStatus.synced;
        
      await isar.writeTxn(() async {
        await isar.videoCallHistorys.put(call);
      });
      await loadHistory();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
