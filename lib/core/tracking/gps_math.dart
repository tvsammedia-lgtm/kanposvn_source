import 'dart:math' as math;
import 'tracking_models.dart';
import 'tracking_config.dart';

/// Các phép toán GPS thuần — §22 (Haversine), §23 (speed), §31 (lọc điểm).
class GpsMath {
  GpsMath._();

  static const double _earthRadiusMeters = 6371000;

  /// Khoảng cách Haversine giữa 2 điểm (mét) — §22.
  static double distanceMeters(double lat1, double lng1, double lat2, double lng2) {
    final dLat = _toRad(lat2 - lat1);
    final dLng = _toRad(lng2 - lng1);
    final a = math.pow(math.sin(dLat / 2), 2) +
        math.cos(_toRad(lat1)) * math.cos(_toRad(lat2)) * math.pow(math.sin(dLng / 2), 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return _earthRadiusMeters * c;
  }

  static double distanceBetween(TrackPoint a, TrackPoint b) =>
      distanceMeters(a.latitude, a.longitude, b.latitude, b.longitude);

  static double _toRad(double deg) => deg * math.pi / 180;

  /// Tổng quãng đường của chuỗi điểm (mét) — §22.
  static double totalDistance(List<TrackPoint> points) {
    if (points.length < 2) return 0;
    var sum = 0.0;
    for (var i = 1; i < points.length; i++) {
      sum += distanceBetween(points[i - 1], points[i]);
    }
    return sum;
  }

  /// Tốc độ giữa 2 điểm (km/h) — §23.
  static double speedKmh(TrackPoint a, TrackPoint b) {
    final d = distanceBetween(a, b);
    final t = b.timestamp.difference(a.timestamp).inSeconds;
    if (t <= 0) return 0;
    return d / 1000 / (t / 3600);
  }

  /// Kiểm tra điểm có hợp lệ để ghi hay không — §31:
  /// - accuracy tệ hơn ngưỡng → bỏ.
  /// - lat/lng ngoài phạm vi → bỏ.
  /// - tốc độ vượt mức hợp lý → bỏ.
  /// - nhảy xa bất thường trong thời gian ngắn (vd 40km/h mà nhảy 5km/2s) → bỏ.
  static bool isValidPoint(TrackPoint p, {TrackPoint? previous}) {
    if (p.latitude < -90 || p.latitude > 90) return false;
    if (p.longitude < -180 || p.longitude > 180) return false;
    final acc = p.accuracy;
    if (acc != null && acc > TrackingConfig.maxGpsAccuracy) return false;
    final sp = p.speed;
    if (sp != null && (sp < 0 || sp > TrackingConfig.maxPlausibleSpeedKmh)) return false;
    if (previous != null) {
      final d = distanceBetween(previous, p);
      final dt = p.timestamp.difference(previous.timestamp).inSeconds;
      if (dt > 0) {
        final impliedKmh = d / 1000 / (dt / 3600);
        // Nhảy xa > 5 lần tốc độ hợp lý trong khoảng thời gian ngắn → nhiễu GPS.
        if (impliedKmh > TrackingConfig.maxPlausibleSpeedKmh * 5) return false;
        return d >= TrackingConfig.gpsDistanceFilter;
      }
    }
    return true;
  }
}