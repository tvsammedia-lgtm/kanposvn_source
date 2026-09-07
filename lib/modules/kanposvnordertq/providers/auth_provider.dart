import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

/// State quản lý xem user đã đăng nhập hay chưa (null = loading, false = chưa, true = đã login).
final authStateProvider = StateNotifierProvider<AuthNotifier, bool?>((ref) {
  final authService = ref.watch(authServiceProvider);
  final roleController = ref.read(currentRoleProvider.notifier);
  return AuthNotifier(authService, roleController);
});

/// Role hiện tại của user (ADMIN, STAFF, DRIVER, CUSTOMER).
final currentRoleProvider = StateProvider<String?>((ref) => null);

class AuthNotifier extends StateNotifier<bool?> {
  final AuthService _authService;
  final StateController<String?> _roleController;

  AuthNotifier(this._authService, this._roleController) : super(null) {
    _checkInitialAuth();
  }

  Future<void> _checkInitialAuth() async {
    final token = await _authService.getAccessToken();
    final role = await _authService.getCurrentRole();
    if (role != null) {
      _roleController.state = role;
    }
    state = (token != null && token.isNotEmpty);
  }

  Future<bool> login(String username, String password) async {
    final success = await _authService.login(username, password);
    if (success) {
      final role = await _authService.getCurrentRole();
      if (role != null) {
        _roleController.state = role;
      }
      state = true;
    }
    return success;
  }

  Future<void> logout() async {
    await _authService.logout();
    _roleController.state = null;
    state = false;
  }
}