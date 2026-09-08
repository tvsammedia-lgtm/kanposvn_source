import 'dart:async';
import 'tracking_models.dart';

/// Giao diện nguồn vị trí GPS — §3.3/§7.
///
/// `start()` bắt đầu stream vị trí theo cấu hình distance/interval. Stream phát
/// ra các điểm GPS đã lọc sơ bộ (accuracy) để TrackingController xử lý tiếp.
abstract class TrackingLocationSource {
  Stream<TrackPoint> get positionStream;
  Future<bool> isLocationEnabled();
  Future<TrackPoint?> getCurrentLocation();

  /// Bắt đầu lắng nghe GPS. Idempotent.
  Future<void> start();

  /// Dừng lắng nghe GPS. Idempotent.
  Future<void> stop();
}

/// Nguồn GPS mô phỏng — dùng trong test/demo/offline (như MockLocationServiceImpl
/// của kanposvnordertq). Đi chậm đều theo hình chữ nhật quanh 1 điểm trung tâm.
class MockTrackingLocationSource implements TrackingLocationSource {
  Timer? _timer;
  int _step = 0;
  double lat = 10.762622;
  double lng = 106.660172;
  final _controller = StreamController<TrackPoint>.broadcast();

  @override
  Stream<TrackPoint> get positionStream => _controller.stream;

  @override
  Future<TrackPoint?> getCurrentLocation() async =>
      TrackPoint(id: 'mock-now', trackId: '', latitude: lat, longitude: lng, timestamp: DateTime.now());

  @override
  Future<bool> isLocationEnabled() async => true;

  @override
  Future<void> start() async {
    if (_timer != null) return;
    // Đi vòng nhỏ quanh điểm trung tâm để thấy marker di chuyển.
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      _step++;
      final radians = _step * 0.2;
      final nextLat = 10.762622 + 0.0015 * sin(radians);
      final nextLng = 106.660172 + 0.0015 * cos(radians);
      lat = nextLat;
      lng = nextLng;
      _controller.add(TrackPoint(
        id: 'mock-${DateTime.now().millisecondsSinceEpoch}',
        trackId: '',
        latitude: nextLat,
        longitude: nextLng,
        accuracy: 5,
        speed: _step.isEven ? 28.0 : 35.0,
        heading: radians * 180 / 3.14159,
        timestamp: DateTime.now(),
      ));
    });
  }

  @override
  Future<void> stop() async {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    _timer?.cancel();
    _controller.close();
  }
}

double sin(double r) => _sin(r);
double _sin(double r) {
  var x = r;
  var sum = x;
  var term = x;
  for (var i = 1; i < 12; i++) {
    term *= -x * x / ((2 * i) * (2 * i + 1));
    sum += term;
  }
  return sum;
}

double cos(double r) {
  final x = r;
  var sum = 1.0;
  var term = 1.0;
  for (var i = 1; i < 12; i++) {
    term *= -x * x / ((2 * i - 1) * (2 * i));
    sum += term;
  }
  return sum;
}