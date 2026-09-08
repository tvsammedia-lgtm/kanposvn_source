import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'tracking_models.dart';
import 'tracking_config.dart';
import 'tracking_location_source.dart';

/// Nguồn GPS thật bằng `geolocator` — §3.3/§7.
///
/// - Tự kiểm tra & xin quyền truy cập vị trí.
/// - `distanceFilter` theo `TrackingConfig.gpsDistanceFilter` (chỉ nhận điểm khi
///   xe đã di chuyển đủ xa) — §7.2.
/// - Accuracy ưu tiên `high`.
class GeolocatorTrackingLocationSource implements TrackingLocationSource {
  StreamController<TrackPoint>? _controller;
  StreamSubscription<Position>? _sub;
  bool _running = false;

  bool get isRunning => _running;

  @override
  Stream<TrackPoint> get positionStream => _controller?.stream ?? Stream.empty();

  /// Kiểm tra & xin thêm quyền vị trí nếu chưa có.
  Future<bool> _ensurePermission() async {
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      return permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> isLocationEnabled() async {
    try {
      if (!await _ensurePermission()) return false;
      return await Geolocator.isLocationServiceEnabled();
    } catch (_) {
      return false;
    }
  }

  @override
  Future<TrackPoint?> getCurrentLocation() async {
    try {
      if (!await _ensurePermission()) return null;
      final pos = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: TrackingConfig.gpsDistanceFilter,
        ),
      );
      return _toPoint(pos);
    } catch (_) {
      return null;
    }
  }

  TrackPoint _toPoint(Position p) {
    return TrackPoint(
      id: 'gps-${DateTime.now().microsecondsSinceEpoch}',
      trackId: '',
      latitude: p.latitude,
      longitude: p.longitude,
      altitude: p.altitude,
      accuracy: p.accuracy,
      speed: p.speed.isFinite ? p.speed * 3.6 : null, // m/s → km/h
      heading: p.heading,
      timestamp: p.timestamp,
    );
  }

  @override
  Future<void> start() async {
    if (_running) return;
    _controller = StreamController<TrackPoint>.broadcast(onCancel: () {
      // nếu không còn ai nghe, socket được dọn khi stop()
    });
    if (!await _ensurePermission()) return;
    if (!await Geolocator.isLocationServiceEnabled()) return;
    _running = true;
    _sub = Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: TrackingConfig.gpsDistanceFilter,
      ),
    ).listen((p) {
      _controller?.add(_toPoint(p));
    }, onError: (_) {});
  }

  @override
  Future<void> stop() async {
    _running = false;
    await _sub?.cancel();
    _sub = null;
    await _controller?.close();
    _controller = null;
  }

  void dispose() {
    if (_running) {
      _running = false;
      _sub?.cancel();
    }
    _controller?.close();
  }
}