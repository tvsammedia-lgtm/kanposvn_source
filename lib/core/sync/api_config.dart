import '../module_enum.dart';

class ApiConfig {
  static const String baseUrl = 'https://kanposvn-admin.vercel.app';
  static const String syncApiKey = 'kanposvn_sync_2026';
  static const Duration timeout = Duration(seconds: 10);
  static const int maxBatchSize = 100;
  static const Duration pullInterval = Duration(minutes: 5);

  static String get pushUrl => '$baseUrl/api/sync/push';
  static String get pullUrl => '$baseUrl/api/sync/pull';

  static String getAppName(AppModule module) => module.appCode;
}
