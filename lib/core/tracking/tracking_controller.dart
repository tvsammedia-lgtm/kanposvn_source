import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'tracking_models.dart';
import 'gps_math.dart';
import 'tracking_store.dart';
import 'tracking_location_source.dart';
import 'tracking_sync_service.dart';

/// Controller trung tâm của một phiên tracking — §8.
///
/// Làm việc trực tiếp với `TrackingLocationSource` (real GPS hoặc mock), lọc
/// điểm theo `GpsMath.isValidPoint`, cập nhật quãng đường/tốc độ/thời gian và
/// ghi offline-first xuống `TrackingStore`. Nguồn dữ liệu thô mà UI (list + map)
/// lắng nghe.
class TrackingController extends ChangeNotifier {
  final String appCode;
  final TrackingStore store;
  TrackingLocationSource source;

  TrackingController({
    required this.appCode,
    TrackingStore? store,
    TrackingLocationSource? source,
  })  : store = store ?? TrackingStore.instance,
        source = source ?? MockTrackingLocationSource() {
    _lastPoint = null;
  }

  StreamSubscription<TrackPoint>? _sub;
  final TrackStatus _status = TrackStatus.completed;

  final List<TrackPoint> _currentPoints = [];
  Track? _currentTrack;
  double _currentSpeedKmh = 0;
  double _heading = 0;
  bool _deviceHasGps = true;

  Timer? _autosaveTimer;

  /// Trạng thái hiện tại.
  TrackStatus get status => _currentTrack?.status ?? _status;
  Track? get currentTrack => _currentTrack;
  List<TrackPoint> get currentPoints => List.unmodifiable(_currentPoints);
  double get speedKmh => _currentSpeedKmh;
  double get heading => _heading;
  double get totalDistanceM => _currentTrack?.totalDistance ?? 0;
  int get durationSeconds => _durationSecondsCache;
  int _durationSecondsCache = 0;
  bool get isRunning =>
      _currentTrack != null && _currentTrack!.status == TrackStatus.running;

  /// Danh sách lịch sử (đã load).
  List<Track> history = [];

  bool get deviceHasGps => _deviceHasGps;

  int get pendingPointsCount => _pendingPoints;
  int _pendingPoints = 0;

  /// Service đồng bộ cloud — §12.
  late final TrackingSyncService sync = TrackingSyncService(appCode: appCode);

  Future<bool> syncNow({Duration? periodicInterval}) async {
    if (periodicInterval != null) {
      sync.schedulePeriodicSync(periodicInterval);
    }
    return sync.syncNow();
  }

  String? get syncMessage => sync.lastMessage.isNotEmpty ? sync.lastMessage : null;

  Future<void> init() async {
    await store.init();
    await loadHistory();
  }

  Future<void> loadHistory() async {
    history = await store.tracks(appCode);
    notifyListeners();
  }

  /// Bắt đầu một phiên tracking mới — §8/§10. Trả về track id.
  Future<String?> startTracking({
    String userId = '',
    String? vehicleId,
  }) async {
    if (isRunning) return null;
    await store.init();

    // Kiểm tra nguồn GPS sẵn sàng: nếu real GPS không hoạt động (không có quyền /
    // không có thiết bị), giữ mock để demo không bị treo không điểm.
    final sourceOk = await source.isLocationEnabled();
    _deviceHasGps = sourceOk;
    if (!sourceOk && source is MockTrackingLocationSource) {
      _deviceHasGps = false;
    }

    final track = Track(
      id: 'trk-${DateTime.now().millisecondsSinceEpoch}',
      userId: userId,
      vehicleId: vehicleId,
      startTime: DateTime.now(),
      status: TrackStatus.running,
    );
    _currentTrack = track;
    _currentPoints.clear();
    _currentSpeedKmh = 0;
    _heading = 0;
    _lastPoint = null;
    await store.saveTrack(appCode, track);

    _sub = source.positionStream.listen(_onPoint);
    await source.start();

    notifyListeners();
    return track.id;
  }

  /// Tạm dừng nhận GPS — §8.
  Future<void> pauseTracking() async {
    final t = _currentTrack;
    if (t == null || t.status != TrackStatus.running) return;
    await source.stop();
    t.status = TrackStatus.paused;
    await store.saveTrack(appCode, t);
    notifyListeners();
  }

  /// Tiếp tục sau tạm dừng.
  Future<void> resumeTracking() async {
    final t = _currentTrack;
    if (t == null || t.status != TrackStatus.paused) return;
    t.status = TrackStatus.running;
    await source.start();
    notifyListeners();
  }

  /// Kết thúc phiên tracking, lưu lại lịch sử — §8/§10.
  Future<void> stopTracking() async {
    final t = _currentTrack;
    if (t == null) return;
    await source.stop();
    await _sub?.cancel();
    _sub = null;
    t.status = TrackStatus.completed;
    t.endTime = DateTime.now();
    t.durationSeconds = _computeDurationSeconds(DateTime.now());
    await store.saveTrack(appCode, t);
    _autosaveTimer?.cancel();
    _autosaveTimer = null;
    await _flushPoints();
    await loadHistory();
    _currentTrack = null;
    _currentPoints.clear();
    notifyListeners();
  }

  /// Xóa toàn bộ dữ liệu tracking của module này.
  Future<void> clearAllData() async {
    await source.stop();
    final tracks = await store.tracks(appCode);
    for (final t in tracks) {
      await store.deleteTrack(appCode, t.id);
    }
    history.clear();
    notifyListeners();
  }

  // ---------------- Xử lý điểm GPS ----------------

  TrackPoint? _lastPoint;

  void _onPoint(TrackPoint p) {
    final t = _currentTrack;
    if (t == null || t.status != TrackStatus.running) return;

    if (!GpsMath.isValidPoint(p, previous: _lastPoint)) return;

    if (_lastPoint != null) {
      // Tích lũy khoảng cách, không cho âm (vị trí "nhảy lùi" do nhiễu).
      final d = GpsMath.distanceBetween(_lastPoint!, p);
      t.totalDistance += d;
      _currentSpeedKmh = GpsMath.speedKmh(_lastPoint!, p).clamp(0, double.infinity);
    } else {
      _currentSpeedKmh = p.speed ?? 0;
    }

    _heading = p.heading ?? _heading;
    _durationSecondsCache = _computeDurationSeconds(p.timestamp);
    t.durationSeconds = _durationSecondsCache;
    t.endTime = p.timestamp;

    _pendingPoints++;
    _currentPoints.add(p);
    _lastPoint = p;
    notifyListeners();
  }

  int _computeDurationSeconds(DateTime now) {
    final t = _currentTrack;
    if (t == null) return 0;
    final base = now.difference(t.startTime);
    if (base.inSeconds < 0) return 0;
    return base.inSeconds;
  }

  Future<void> _flushPoints() async {
    if (_currentPoints.isEmpty) return;
    await store.savePoints(appCode, _currentTrack?.id ?? '',
        List.of(_currentPoints));
    _pendingPoints = 0;
  }

  int get currentPointCount => _currentPoints.length;

  /// Ghi điểm đang chờ xuống Isar (gọi định kỳ / trước khi thoát).
  Future<void> persistPending() async {
    await _flushPoints();
  }

  @override
  void dispose() {
    _autosaveTimer?.cancel();
    sync.dispose();
    _sub?.cancel();
    super.dispose();
  }
}

/// Chuyển độ heading (độ) sang radian.
double degToRad(double deg) => deg * math.pi / 180.0;