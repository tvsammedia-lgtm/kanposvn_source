import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/services/sync_service.dart';

enum SyncStatus { idle, syncing, success, error }

class SyncState {
  final SyncStatus status;
  final int syncedRecords;
  final List<String> errors;
  final DateTime? lastSyncTime;

  SyncState({
    this.status = SyncStatus.idle,
    this.syncedRecords = 0,
    this.errors = const [],
    this.lastSyncTime,
  });

  SyncState copyWith({
    SyncStatus? status,
    int? syncedRecords,
    List<String>? errors,
    DateTime? lastSyncTime,
  }) {
    return SyncState(
      status: status ?? this.status,
      syncedRecords: syncedRecords ?? this.syncedRecords,
      errors: errors ?? this.errors,
      lastSyncTime: lastSyncTime ?? this.lastSyncTime,
    );
  }
}

class SyncNotifier extends StateNotifier<SyncState> {
  final SyncService _syncService;

  SyncNotifier(this._syncService) : super(SyncState());

  Future<void> sync() async {
    state = state.copyWith(status: SyncStatus.syncing, errors: []);

    final result = await _syncService.syncAll();

    if (result.success) {
      state = state.copyWith(
        status: SyncStatus.success,
        syncedRecords: result.syncedRecords,
        lastSyncTime: DateTime.now(),
      );
    } else {
      state = state.copyWith(
        status: SyncStatus.error,
        syncedRecords: result.syncedRecords,
        errors: result.errors,
      );
    }
  }

  void reset() {
    state = SyncState();
  }
}

final syncProvider = StateNotifierProvider<SyncNotifier, SyncState>((ref) {
  return SyncNotifier(ref.watch(syncServiceProvider));
});
