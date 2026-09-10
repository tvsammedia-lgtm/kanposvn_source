import 'package:dio/dio.dart';

import '../config/account_config.dart';
import '../services/account_auth_service.dart';

/// ApiClient dùng chung cho phần Account của kanposvncrm: tự đính token (Bearer) vào
/// mọi request. Base URL được chọn theo [AccountConfig.defaultMode]:
///  - online  -> cloud Vercel (Admin Web).
///  - offline -> Admin Web chạy local (Next.js + PostgreSQL) trên localhost:3000.
class AccountApiClient {
  final Dio _dio;
  final TokenStore _store;

  AccountApiClient({TokenStore? store})
      : _store = store ?? InMemoryTokenStore(),
        _dio = Dio(
          BaseOptions(
            baseUrl: AccountApis.baseUrl,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
          ),
        ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _store.read('access_token');
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) => handler.next(response),
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            // Refresh token có thể nối vào đây (sau khi có endpoint refresh).
          }
          return handler.next(e);
        },
      ),
    );
  }

  Dio get dio => _dio;

  TokenStore get tokenStore => _store;
}

/// Base URL nghiệp vụ theo mode hybrid (cloud Vercel hoặc local).
class AccountApis {
  static String get baseUrl {
    final mode = AccountConfig.defaultMode;
    if (mode == AccountServerMode.offline) {
      return 'http://127.0.0.1:3000/api';
    }
    return 'https://kanposvn-admin.vercel.app/api';
  }
}