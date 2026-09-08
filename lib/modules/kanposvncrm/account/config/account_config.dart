/// Cấu hình mô hình login HYBRID cho phần Account của module kanposvncrm.
///
/// online  -> đăng nhập qua cloud Vercel (Admin Web / PostgreSQL).
/// offline -> đăng nhập qua local server Express (SQLite) trên LAN/localhost.
/// auto    -> thử online trước; thất bại (mất mạng) thì chuyển offline local.
enum AccountServerMode { online, offline, auto }

class AccountConfig {
  /// Chế độ mặc định: auto hybrid (online trước, fallback offline).
  static AccountServerMode defaultMode = AccountServerMode.auto;

  /// Cloud login (giống `lib/core/sync/api_config.dart` đang dùng toàn app).
  static const String onlineLoginUrl =
      'https://kanposvn-admin.vercel.app/api/auth/login';

  /// Local login — Express + SQLite (`backend/src/index.js`, port 3000).
  static const String offlineLoginUrl = 'http://127.0.0.1:3000/api/auth/login';

  /// App code khi đăng nhập local (backend seed: KANPOS-VN).
  static const String localAppCode = 'KANPOS-VN';

  static const Duration timeout = Duration(seconds: 10);
}