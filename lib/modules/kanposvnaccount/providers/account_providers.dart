import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../network/api_client.dart';
import '../services/account_auth_service.dart';

/// Provider singleton dịch vụ auth hybrid cho module KanPosVN Account.
///  - App thật: lưu token bằng [SecureTokenStore].
///  - Test: ghi đè `store` bằng [InMemoryTokenStore] hoặc mock AuthService.
final accountAuthServiceProvider = Provider<AccountAuthService>((ref) {
  return AccountAuthService(store: const SecureTokenStore());
});

/// ApiClient đính token đăng nhập hiện tại.
final accountApiClientProvider = Provider<AccountApiClient>((ref) {
  final auth = ref.watch(accountAuthServiceProvider);
  return AccountApiClient(store: auth.tokenStore);
});

/// Trạng thái đăng nhập của account (null = đang kiểm tra, false = chưa, true = đã).
final accountAuthStateProvider =
    StateNotifierProvider<AccountAuthNotifier, bool?>((ref) {
  final authService = ref.watch(accountAuthServiceProvider);
  final roleController = ref.read(accountCurrentRoleProvider.notifier);
  final sourceController = ref.read(accountLoginSourceProvider.notifier);
  return AccountAuthNotifier(authService, roleController, sourceController);
});

/// Role hiện tại (ADMIN, STAFF, DRIVER, CUSTOMER, user...) — local display.
final accountCurrentRoleProvider = StateProvider<String?>((ref) => null);

/// Nguồn đăng nhập hiện tại: 'online' | 'offline' | null.
final accountLoginSourceProvider = StateProvider<String?>((ref) => null);

class AccountAuthNotifier extends StateNotifier<bool?> {
  final AccountAuthService _authService;
  final StateController<String?> _roleController;
  final StateController<String?> _sourceController;

  AccountAuthNotifier(
    this._authService,
    this._roleController,
    this._sourceController,
  ) : super(null) {
    _checkInitialAuth();
  }

  Future<void> _checkInitialAuth() async {
    final token = await _authService.getAccessToken();
    final role = await _authService.getCurrentRole();
    final source = await _authService.getLoginSource();
    if (!mounted) return;
    if (role != null) _roleController.state = role;
    if (source != null) _sourceController.state = source;
    state = (token != null && token.isNotEmpty);
  }

  Future<bool> login(String username, String password) async {
    final result = await _authService.login(username, password);
    if (result.success) {
      final role = await _authService.getCurrentRole();
      if (role != null) _roleController.state = role;
      final source = await _authService.getLoginSource();
      if (source != null) _sourceController.state = source;
      state = true;
    }
    return result.success;
  }

  Future<void> logout() async {
    await _authService.logout();
    _roleController.state = null;
    _sourceController.state = null;
    state = false;
  }
}