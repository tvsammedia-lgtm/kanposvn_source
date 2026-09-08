import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as http_mock;

import 'package:kanposvn/modules/kanposvncrm/account/config/account_config.dart';
import 'package:kanposvn/modules/kanposvncrm/account/services/account_auth_service.dart';

/// Tạo JWT mock hợp lệ (header.payload.signature) với role truyền vào.
String _mockJwt(String role) {
  final header = base64Url.encode(utf8.encode('{"alg":"RS256","typ":"JWT"}'));
  final payload = base64Url.encode(utf8.encode(jsonEncode({
    'role': role,
    'sub': 'user123',
  })));
  final sig = base64Url.encode(utf8.encode('sig'));
  return '$header.$payload.$sig';
}

void main() {
  late AccountServerMode _savedMode;

  setUp(() {
    _savedMode = AccountConfig.defaultMode;
    AccountConfig.defaultMode = AccountServerMode.offline;
  });

  tearDown(() {
    AccountConfig.defaultMode = _savedMode;
  });

  group('AccountAuthService offline login', () {
    test('POST /api/auth/login -> 200, access_token + role JWT', () async {
      final mockHttp = http_mock.MockClient((req) async {
        expect(req.method, 'POST');
        expect(req.url.path, contains('/auth/login'));
        final body = jsonDecode(req.body) as Map<String, dynamic>;
        expect(body['username'], 'admin');
        expect(body['app_code'], AccountConfig.localAppCode);
        return http.Response(jsonEncode({
          'success': true,
          'data': {
            'access_token': _mockJwt('ADMIN'),
            'refresh_token': 'mock-refresh',
          },
        }), 200);
      });

      final store = InMemoryTokenStore();
      final svc = AccountAuthService(store: store, httpClient: mockHttp);

      final result = await svc.login('admin', '123456');
      expect(result.success, true);
      expect(result.role, 'ADMIN');
      expect(result.accessToken, isNotNull);

      expect(await store.read('current_role'), 'ADMIN');
      expect(await store.read('current_user'), 'admin');
      expect(await store.read('login_source'), 'offline');
    });

    test('POST /api/auth/login -> 401, wrong password', () async {
      final mockHttp = http_mock.MockClient((req) async {
        return http.Response.bytes(
          utf8.encode(jsonEncode({
            'success': false,
            'message': 'Mật khẩu không đúng',
          })),
          401,
        );
      });

      final svc = AccountAuthService(httpClient: mockHttp);
      final result = await svc.login('admin', 'wrong');
      expect(result.success, false);
      expect(result.error, contains('Mật khẩu không đúng'));
    });

    test('network error returns error, not crash', () async {
      final mockHttp = http_mock.MockClient((req) async {
        throw Exception('Connection refused');
      });

      final svc = AccountAuthService(httpClient: mockHttp);
      final result = await svc.login('admin', 'pass');
      expect(result.success, false);
    });
  });

  group('AccountAuthService auto mode fallback', () {
    test('cloud fails -> fallback offline -> success', () async {
      AccountConfig.defaultMode = AccountServerMode.auto;

      int callCount = 0;
      final mockHttp = http_mock.MockClient((req) async {
        callCount++;
        if (req.url.host.contains('admin.web') || req.url.host.contains('vercel')) {
          return http.Response('Cloud down', 503);
        }
        // offline endpoint
        expect(callCount, 2);
        return http.Response(jsonEncode({
          'success': true,
          'data': {
            'access_token': _mockJwt('STAFF'),
            'refresh_token': null,
          },
        }), 200);
      });

      final svc = AccountAuthService(httpClient: mockHttp);
      final result = await svc.login('staff', '123456');
      expect(result.success, true);
      expect(result.role, 'STAFF');
    });
  });

  group('AccountAuthService decodeJwtPayload', () {
    test('decodes role from valid JWT', () {
      final token = _mockJwt('STAFF');
      final payload = AccountAuthService.decodeJwtPayload(token);
      expect(payload, isNotNull);
      expect(payload!['role'], 'STAFF');
    });

    test('returns null for invalid token', () {
      expect(AccountAuthService.decodeJwtPayload('not-a-jwt'), isNull);
    });
  });
}