import 'dart:async';
import 'package:flutter/foundation.dart';
import '../sync/vercel_api_client.dart';
import 'tracking_config.dart';
import 'tracking_store.dart';
import 'tracking_models.dart';

/// Đồng bộ tracking offline-first lên cloud — §12/§20.
///
/// - Gom các điểm chưa đồng bộ thành từng batch (`syncBatchSize`).
/// - Push data dạng `items` qua `VercelApiClient` (đảo ngược api fallback vào
///   handle lỗi mạng).
/// - Sau khi push thành công, đánh dấu điểm đã sync trên Isar.
class TrackingSyncService extends ChangeNotifier {
  final String appCode;
  final TrackingStore store;
  final VercelApiClient client;

  bool _syncing = false;
  bool get isSyncing => _syncing;

  int _lastSyncedCount = 0;
  int get lastSyncedCount => _lastSyncedCount;

  String _lastMessage = '';
  String get lastMessage => _lastMessage;

  TrackingSyncService({required this.appCode, TrackingStore? store, VercelApiClient? client})
      : store = store ?? TrackingStore.instance,
        client = client ?? VercelApiClient();

  /// Đồng bộ tất cả điểm chưa sync theo từng batch — §12.
  Future<bool> syncNow() async {
    if (_syncing) return false;
    _syncing = true;
    _lastSyncedCount = 0;
    notifyListeners();
    try {
      var total = 0;
      while (true) {
        final pending = await store.unsyncedPoints(appCode,
            limit: TrackingConfig.syncBatchSize);
        if (pending.isEmpty) break;

        // Gom theo track để gửi kèm metadata.
        final items = <Map<String, dynamic>>[];
        final byTrack = <String, List<TrackPoint>>{};
        for (final p in pending) {
          byTrack.putIfAbsent(p.trackId, () => []).add(p);
        }
        for (final entry in byTrack.entries) {
          for (final p in entry.value) {
            items.add({
              'collection': 'track_point',
              'trackId': entry.key,
              'latitude': p.latitude,
              'longitude': p.longitude,
              'altitude': p.altitude,
              'accuracy': p.accuracy,
              'speed': p.speed,
              'heading': p.heading,
              'timestamp': p.timestamp.toIso8601String(),
              'operationId': p.id,
            });
          }
        }

        if (items.isEmpty) break;
        final res = await client.pushData(
          appCode: appCode,
          items: items,
        );
        if (!res.success) {
          _lastMessage = res.message;
          break; // offline/network — giữ lại queue, thử lại lần sau.
        }

        // Đánh dấu đã sync.
        final pointIds = pending.map((p) => p.id).toList();
        for (final entry in byTrack.entries) {
          await store.markPointsSynced(appCode, entry.key, pointIds);
        }
        final syncedThisBatch = pending.where((p) => pointIds.contains(p.id)).length;
        total += syncedThisBatch;
        if (pending.length < TrackingConfig.syncBatchSize) break;
      }
      _lastSyncedCount = total;
      _lastMessage = total > 0 ? 'Đã đồng bộ $total điểm' : 'Không có điểm mới';
      return true;
    } catch (e) {
      _lastMessage = 'Lỗi đồng bộ: $e';
      return false;
    } finally {
      _syncing = false;
      notifyListeners();
    }
  }

  Timer? teller;

  /// Push định kỳ nền (mỗi 30s) — tầng controller gọi khi có điểm mới.
  void schedulePeriodicSync(Duration interval) {
    teller?.cancel();
    teller = Timer.periodic(interval, (_) {
      if (!_syncing) syncNow();
    });
  }

  @override
  void dispose() {
    teller?.cancel();
    super.dispose();
  }
}