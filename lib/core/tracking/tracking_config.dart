/// Cấu hình trung tâm của hệ thống bản đồ + GPS tracking.
/// (FREE_TRACK_MAP_FLUTTER.md §73 — các giá trị configurable, không hard-code rải rác.)
class TrackingConfig {
  TrackingConfig._();

  /// Ngưỡng khoảng cách (mét) giữa 2 điểm GPS liên tiếp mới được ghi.
  static const int gpsDistanceFilter = 10;

  /// Bỏ qua điểm GPS có accuracy lớn hơn ngưỡng này (mét) — §31.
  static const int maxGpsAccuracy = 50;

  /// Tần suất lấy GPS khi tracking bật (milli giây) — §7.2/§27 NORMAL.
  static const Duration gpsInterval = Duration(seconds: 10);

  /// Khoảng thời gian không có GPS → tự dừng tracking (đề phòng app "đứng").
  static const Duration noGpsStopTimeout = Duration(minutes: 5);

  /// Số điểm tối đa trong một batch sync lên cloud — §12.
  static const int syncBatchSize = 100;

  /// Khoảng cách giới hạn tính ETA mặc định (mét) — §35.
  static const double defaultGeofenceRadius = 200;

  /// Tốc độ tối đa hợp lý (km/h) — §31 reject khi speed vượt quá.
  static const double maxPlausibleSpeedKmh = 200;

  /// URL tile OpenStreetMap công cộng — §38/§39.
  static const String osmTileUrl = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';

  /// Attribution của OpenStreetMap — §39/§67.
  static const String osmAttribution = '© OpenStreetMap contributors';
}