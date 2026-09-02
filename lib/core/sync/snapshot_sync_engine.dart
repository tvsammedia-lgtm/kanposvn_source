import 'package:isar/isar.dart';
import 'api_config.dart';
import 'vercel_api_client.dart';

/// Cấu hình một collection tham gia snapshot sync.
///
/// [collection] là `IsarCollection` lấy từ generated getter (vd: `isar.garaOrders`).
/// [keyField] là tên field business-id (chuỗi, ổn định giữa các thiết bị) dùng làm
/// itemId trên server. Nếu null, engine fallback theo Isar int id — chỉ nên dùng
/// cho các collection không có khóa tự nhiên (thường là dòng chi tiết).
class SnapshotSyncCollection {
  final IsarCollection collection;
  final String? keyField;

  const SnapshotSyncCollection({required this.collection, this.keyField});

  String get name => collection.schema.name;
  String get idName => collection.schema.idName;
}

class SnapshotSyncResult {
  final bool success;
  final String message;
  final int pushed;
  final int pulled;

  const SnapshotSyncResult({
    required this.success,
    required this.message,
    required this.pushed,
    required this.pulled,
  });
}

/// Generic snapshot sync engine cho các module dùng typed Isar DB.
///
/// Push: `exportJson` toàn bộ từng collection → gửi `items` lên `/api/sync/push`
/// (server key theo `payload.itemId` — luôn là chuỗi business key).
/// Pull: lấy `records` từ `/api/sync/pull` → merge theo business key:
///   - record có key trùng object local → giữ nguyên int id (IsarLink không vỡ),
///     cập nhật các field còn lại.
///   - record có key mới → insert (bỏ int id để Isar tự tăng).
///   - object local thiếu trên server snapshot → xóa (đã bị xóa ở thiết bị khác).
class SnapshotSyncEngine {
  final VercelApiClient apiClient;
  final String appCode;
  final List<SnapshotSyncCollection> collections;
  final int maxBatchSize;

  /// Chi nhánh hiện tại của thiết bị (mô hình 1 module = nhiều chi nhánh).
  /// Khi có (vd kanposvngara), push/pull sẽ gắn/lọc theo chi nhánh này.
  final String? branchId;

  SnapshotSyncEngine({
    required this.apiClient,
    required this.appCode,
    required this.collections,
    this.branchId,
    this.maxBatchSize = ApiConfig.maxBatchSize,
  });

  Future<SnapshotSyncResult> sync() async {
    final push = await pushAll();
    if (!push.success) return push;
    return pullAll();
  }

  String _keyOf(SnapshotSyncCollection cfg, Map<String, dynamic> m) {
    final keyField = cfg.keyField;
    if (keyField != null) {
      final v = m[keyField];
      if (v != null && v.toString().trim().isNotEmpty) {
        return v.toString().trim();
      }
    }
    return 'id:${m[cfg.idName]}';
  }

  Future<SnapshotSyncResult> pushAll() async {
    var pushed = 0;
    try {
      for (final cfg in collections) {
        final maps = await cfg.collection.where().exportJson();
        for (final chunk in _chunks(maps, maxBatchSize)) {
          final items = chunk.map((m) {
            final key = _keyOf(cfg, m);
            return {
              'operationId': key,
              'collectionName': cfg.name,
              'operationType': 'UPSERT',
              'payload': {...m, 'itemId': key},
            };
          }).toList();
          final result = await apiClient.pushData(appCode: appCode, items: items, branchId: branchId);
          if (!result.success) {
            return SnapshotSyncResult(
              success: false,
              message: 'Push lỗi (${cfg.name}): ${result.message}',
              pushed: pushed, pulled: 0,
            );
          }
          pushed += result.syncedIds.length;
        }
      }
      return SnapshotSyncResult(
        success: true,
        message: 'Push $pushed bản ghi',
        pushed: pushed, pulled: 0,
      );
    } catch (e) {
      return SnapshotSyncResult(
        success: false,
        message: 'Push exception: $e',
        pushed: pushed, pulled: 0,
      );
    }
  }

  Future<SnapshotSyncResult> pullAll() async {
    var pulled = 0;
    try {
      final result = await apiClient.pullData(appCode: appCode, branchId: branchId);
      if (!result.success) {
        return SnapshotSyncResult(
          success: false,
          message: 'Pull lỗi: ${result.message}',
          pushed: 0, pulled: 0,
        );
      }

      final byCollection = <String, List<Map<String, dynamic>>>{};
      for (final record in result.pulledRecords) {
        final collection = record['collection'] as String?;
        final data = record['data'] as Map<String, dynamic>?;
        if (collection == null || data == null) continue;
        byCollection.putIfAbsent(collection, () => []).add(data);
      }

      for (final cfg in collections) {
        pulled += await _reconcile(
          cfg,
          byCollection[cfg.name] ?? const <Map<String, dynamic>>[],
        );
      }
      return SnapshotSyncResult(
        success: true,
        message: 'Pull/merge $pulled bản ghi',
        pushed: 0, pulled: pulled,
      );
    } catch (e) {
      return SnapshotSyncResult(
        success: false,
        message: 'Pull exception: $e',
        pushed: 0, pulled: 0,
      );
    }
  }

  Future<int> _reconcile(
    SnapshotSyncCollection cfg,
    List<Map<String, dynamic>> serverMaps,
  ) async {
    final idName = cfg.idName;

    final cleaned = serverMaps.map((m) {
      final copy = Map<String, dynamic>.from(m);
      copy.remove('itemId');
      return copy;
    }).toList();

    if (cfg.keyField == null) {
      final local = await cfg.collection.where().exportJson();
      final localIds = local.map((m) => m[idName] as int).toSet();
      final serverIds = cleaned.map((m) => m[idName] as int).toSet();
      if (cleaned.isNotEmpty) {
        await cfg.collection.importJson(cleaned);
      }
      final toDelete = localIds.difference(serverIds).toList();
      if (toDelete.isNotEmpty) {
        await cfg.collection.deleteAll(toDelete);
      }
      return cleaned.length + toDelete.length;
    }

    final keyField = cfg.keyField!;
    final localMaps = await cfg.collection.where().exportJson();
    final localIdByKey = <String, int>{};
    for (final m in localMaps) {
      final k = m[keyField];
      if (k == null || k.toString().trim().isEmpty) continue;
      localIdByKey[k.toString().trim()] = m[idName] as int;
    }

    final serverKeys = <String>{};
    final toImport = <Map<String, dynamic>>[];
    for (final serverMap in cleaned) {
      final k = serverMap[keyField];
      if (k == null || k.toString().trim().isEmpty) continue;
      final key = k.toString().trim();
      serverKeys.add(key);
      final localId = localIdByKey[key];
      if (localId != null) {
        serverMap[idName] = localId;
      } else {
        serverMap.remove(idName);
      }
      toImport.add(serverMap);
    }

    if (toImport.isNotEmpty) {
      await cfg.collection.importJson(toImport);
    }

    final toDelete = <int>[];
    for (final m in localMaps) {
      final k = m[keyField];
      if (k == null || k.toString().trim().isEmpty) continue;
      final key = k.toString().trim();
      if (!serverKeys.contains(key)) {
        toDelete.add(m[idName] as int);
      }
    }
    if (toDelete.isNotEmpty) {
      await cfg.collection.deleteAll(toDelete);
    }

    return toImport.length + toDelete.length;
  }

  List<List<T>> _chunks<T>(List<T> list, int size) {
    if (size <= 0) return [list];
    final result = <List<T>>[];
    for (var i = 0; i < list.length; i += size) {
      result.add(list.sublist(i, i + size > list.length ? list.length : i + size));
    }
    return result;
  }
}
