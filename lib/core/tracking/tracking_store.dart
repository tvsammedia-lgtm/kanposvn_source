import 'dart:convert';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../db/isar_models/data_entity.dart';
import 'tracking_models.dart';
import 'tracking_config.dart';

/// Lưu trữ offline-first cho tracking — §5/§9/§12.
///
/// Dùng cùng mô hình `DataEntity` JSON-blob như phần còn lại của KanPosVN (không
/// cần codegen schema mới), nhưng nằm ở DB riêng `kanposvn_tracking` để dữ liệu
/// tracking không phụ thuộc vào DB của từng module.
///
/// Collections:
/// - `track`: một lượt tracking (Track), itemId = track.id
/// - `point`: các điểm GPS (TrackPoint), itemId = `trackId:<index>` — §9/§12
class TrackingStore {
  static final TrackingStore instance = TrackingStore._();
  TrackingStore._();

  Isar? _isar;
  Future<void>? _initFuture;

  static const String trackCollection = 'track';
  static const String pointCollection = 'point';

  Future<Isar> _db() async {
    final existing = Isar.getInstance('kanposvn_tracking');
    if (existing != null && existing.isOpen) return existing;
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [DataEntitySchema],
      directory: dir.path,
      name: 'kanposvn_tracking',
    );
    return isar;
  }

  Future<void> init() async {
    if (_initFuture != null) return _initFuture!;
    final f = _db().then((isar) {
      _isar = isar;
    });
    _initFuture = f;
    return f;
  }

  // ---------------- Track ---------------

  /// Lịch sử tracking của module (gần nhất trước).
  Future<List<Track>> tracks(String appCode, {int limit = 100}) async {
    await init();
    final isar = _isar;
    if (isar == null) return [];
    try {
      final entities = await isar.dataEntitys
          .where()
          .filter()
          .appCodeEqualTo(appCode)
          .collectionEqualTo(trackCollection)
          .sortByUpdatedAtDesc()
          .limit(limit)
          .findAll();
      final result = <Track>[];
      for (final e in entities) {
        try {
          result.add(Track.fromJson(jsonDecode(e.jsonData) as Map<String, dynamic>));
        } catch (_) {
          // bỏ bản ghi lỗi format
        }
      }
      return result;
    } catch (e) {
      return [];
    }
  }

  Future<Track?> trackById(String appCode, String trackId) async {
    await init();
    final isar = _isar;
    if (isar == null) return null;
    try {
      final e = await isar.dataEntitys
          .where()
          .filter()
          .appCodeEqualTo(appCode)
          .collectionEqualTo(trackCollection)
          .itemIdEqualTo(trackId)
          .findFirst();
      if (e == null) return null;
      return Track.fromJson(jsonDecode(e.jsonData) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future<void> saveTrack(String appCode, Track track) async {
    await init();
    final isar = _isar;
    if (isar == null) return;
    try {
      final exists = await isar.dataEntitys
          .where()
          .filter()
          .appCodeEqualTo(appCode)
          .collectionEqualTo(trackCollection)
          .itemIdEqualTo(track.id)
          .findFirst();
      final e = exists ??
          (DataEntity()
            ..collection = trackCollection
            ..appCode = appCode
            ..itemId = track.id);
      e.updatedAt = DateTime.now();
      e.jsonData = jsonEncode(track.toJson());
      e.isSynced = track.isSynced;
      await isar.writeTxn(() async {
        await isar.dataEntitys.put(e);
      });
    } catch (_) {
      // bỏ qua lỗi isar
    }
  }

  Future<void> deleteTrack(String appCode, String trackId) async {
    await init();
    final isar = _isar;
    if (isar == null) return;
    try {
      final track = await isar.dataEntitys
          .where()
          .filter()
          .appCodeEqualTo(appCode)
          .collectionEqualTo(trackCollection)
          .itemIdEqualTo(trackId)
          .findFirst();
      await isar.writeTxn(() async {
        if (track != null) await isar.dataEntitys.delete(track.id);
        final points = await isar.dataEntitys
            .where()
            .filter()
            .appCodeEqualTo(appCode)
            .collectionEqualTo(pointCollection)
            .findAll();
        final trackPoints =
            points.where((p) => p.itemId.startsWith('$trackId:')).toList();
        for (final p in trackPoints) {
          await isar.dataEntitys.delete(p.id);
        }
      });
    } catch (_) {
      // bỏ qua lỗi isar
    }
  }

  // ---------------- Points ---------------

  Future<List<TrackPoint>> points(String appCode, String trackId) async {
    await init();
    final isar = _isar;
    if (isar == null) return [];
    try {
      final entities = await isar.dataEntitys
          .where()
          .filter()
          .appCodeEqualTo(appCode)
          .collectionEqualTo(pointCollection)
          .findAll();
      final prefix = '$trackId:';
      final result = <TrackPoint>[];
      for (final e in entities) {
        if (!e.itemId.startsWith(prefix)) continue;
        try {
          result.add(TrackPoint.fromJson(jsonDecode(e.jsonData) as Map<String, dynamic>));
        } catch (_) {
          // bỏ bản ghi lỗi format
        }
      }
      result.sort((a, b) => a.timestamp.compareTo(b.timestamp));
      return result;
    } catch (_) {
      return [];
    }
  }

  Future<void> savePoints(String appCode, String trackId, List<TrackPoint> pts) async {
    if (pts.isEmpty) return;
    await init();
    final isar = _isar;
    if (isar == null) return;
    try {
      await isar.writeTxn(() async {
        for (var i = 0; i < pts.length; i++) {
          final p = pts[i];
          final entity = DataEntity()
            ..collection = pointCollection
            ..appCode = appCode
            ..itemId = '$trackId:${p.id}'
            ..jsonData = jsonEncode(p.toJson())
            ..updatedAt = p.timestamp
            ..isSynced = p.synced;
          await isar.dataEntitys.put(entity);
        }
      });
    } catch (_) {
      // bỏ qua lỗi isar
    }
  }

  Future<void> markPointsSynced(String appCode, String trackId, List<String> pointIds) async {
    if (pointIds.isEmpty) return;
    await init();
    final isar = _isar;
    if (isar == null) return;
    try {
      final entities = await isar.dataEntitys
          .where()
          .filter()
          .appCodeEqualTo(appCode)
          .collectionEqualTo(pointCollection)
          .findAll();
      await isar.writeTxn(() async {
        for (final e in entities) {
          if (!e.itemId.startsWith('$trackId:')) continue;
          final pid = e.itemId.substring('$trackId:'.length);
          if (pointIds.contains(pid)) {
            e.isSynced = true;
            await isar.dataEntitys.put(e);
          }
        }
      });
    } catch (_) {
      // bỏ qua lỗi isar
    }
  }

  /// Các điểm chưa đồng bộ (giới hạn theo batch) — §12.
  Future<List<TrackPoint>> unsyncedPoints(String appCode, {int limit = TrackingConfig.syncBatchSize}) async {
    await init();
    final isar = _isar;
    if (isar == null) return [];
    try {
      final entities = await isar.dataEntitys
          .where()
          .filter()
          .appCodeEqualTo(appCode)
          .collectionEqualTo(pointCollection)
          .findAll();
      final result = <TrackPoint>[];
      for (final e in entities) {
        if (result.length >= limit) break;
        if (e.isSynced) continue;
        try {
          final p = TrackPoint.fromJson(jsonDecode(e.jsonData) as Map<String, dynamic>);
          result.add(p);
        } catch (_) {
          // bỏ bản ghi lỗi format
        }
      }
      result.sort((a, b) => a.timestamp.compareTo(b.timestamp));
      return result;
    } catch (_) {
      return [];
    }
  }

  /// Tổng số điểm tracking trong hệ thống (cho màn giám sát).
  Future<int> totalPointCount() async {
    await init();
    final isar = _isar;
    if (isar == null) return 0;
    try {
      return isar.dataEntitys
          .where()
          .filter()
          .collectionEqualTo(pointCollection)
          .count();
    } catch (_) {
      return 0;
    }
  }
}