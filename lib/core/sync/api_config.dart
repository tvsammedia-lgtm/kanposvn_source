import '../module_enum.dart';

class ApiConfig {
  static const String baseUrl = 'https://kanposvn-admin.vercel.app';

  /// Web Localhost (admin-web tương đương) chạy ngay trên máy này — dùng cho
  /// đăng nhập Ngoại tuyến (Offline) của NHẤT ĐỊNH MỌI module. Nếu web này không
  /// chạy thì KHÔNG được đăng nhập Offline (khách bị chặn sử dụng).
  static const String offlineBaseUrl = 'http://127.0.0.1:3000';
  static const String syncApiKey = 'kanposvn_sync_2026';
  static const Duration timeout = Duration(seconds: 10);
  static const int maxBatchSize = 100;
  static const Duration pullInterval = Duration(minutes: 5);

  static String get pushUrl => '$baseUrl/api/sync/push';
  static String get pullUrl => '$baseUrl/api/sync/pull';
  static String get updateUrl => '$baseUrl/api/update/latest';
  static String get licenseCheckUrl => '$baseUrl/api/license/check';

  static String getAppName(AppModule module) => module.appCode;
}
