import 'package:dio/dio.dart';
import 'package:kanposvn/modules/kanposvnordertq/services/auth_service.dart';

class ApiClient {
  static const String baseUrl = 'https://kanposvn-vercel-api.example.com/api/v1'; // Mock URL

  final Dio _dio;
  final TokenStore _store;

  ApiClient({Dio? dio, TokenStore? store})
      : _store = store ?? InMemoryTokenStore(),
        _dio = dio ??
            Dio(BaseOptions(
              baseUrl: baseUrl,
              connectTimeout: const Duration(seconds: 15),
              receiveTimeout: const Duration(seconds: 15),
            )) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _store.read('access_token');
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          // TODO: Refresh token logic
        }
        return handler.next(e);
      },
    ));
  }

  Dio get dio => _dio;
  TokenStore get tokenStore => _store;
}
