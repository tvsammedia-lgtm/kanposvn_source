import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanposvn/modules/kanposvnordertq/providers/auth_provider.dart';
import 'package:kanposvn/modules/kanposvnordertq/services/auth_service.dart';

// Tạo MockAuthService thủ công để không cần phụ thuộc mockito/mocktail
class MockAuthService extends AuthService {
  bool _mockIsLoggedIn = false;

  MockAuthService() : super(store: InMemoryTokenStore());

  @override
  Future<String?> getAccessToken() async {
    return _mockIsLoggedIn ? 'mock_token' : null;
  }

  @override
  Future<bool> login(String username, String password) async {
    if (username == 'admin' && password == '123456') {
      _mockIsLoggedIn = true;
      return true;
    }
    return false;
  }

  @override
  Future<void> logout() async {
    _mockIsLoggedIn = false;
  }
}

void main() {
  group('AuthNotifier Tests', () {
    late ProviderContainer container;
    late MockAuthService mockAuthService;

    setUp(() {
      mockAuthService = MockAuthService();
      container = ProviderContainer(
        overrides: [
          authServiceProvider.overrideWithValue(mockAuthService),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('Initial state should be null or false based on getAccessToken', () async {
      final authState = container.read(authStateProvider);
      // Ban đầu constructor AuthNotifier gọi _checkInitialAuth() 
      // Do test chạy đồng bộ, có thể state ban đầu là null
      expect(authState, isNull);
      
      // Chờ microtask queue chạy xong _checkInitialAuth
      await Future.delayed(Duration.zero);
      expect(container.read(authStateProvider), isFalse);
    });

    test('Login with valid credentials updates state to true', () async {
      final notifier = container.read(authStateProvider.notifier);
      
      final result = await notifier.login('admin', '123456');
      
      expect(result, isTrue);
      expect(container.read(authStateProvider), isTrue);
    });

    test('Login with invalid credentials keeps state unchanged or false', () async {
      final notifier = container.read(authStateProvider.notifier);
      
      final result = await notifier.login('admin', 'wrong_pass');
      
      expect(result, isFalse);
      // Đảm bảo state không biến thành true
      expect(container.read(authStateProvider), isNot(true));
    });

    test('Logout updates state to false', () async {
      final notifier = container.read(authStateProvider.notifier);
      
      // Đăng nhập trước
      await notifier.login('admin', '123456');
      expect(container.read(authStateProvider), isTrue);
      
      // Sau đó đăng xuất
      await notifier.logout();
      expect(container.read(authStateProvider), isFalse);
    });
  });
}
