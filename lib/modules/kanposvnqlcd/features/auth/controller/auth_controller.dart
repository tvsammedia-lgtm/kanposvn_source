import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/user.dart';
import '../../../data/repositories/user_repository.dart';

final authProvider = StateNotifierProvider<AuthNotifier, User?>((ref) {
  return AuthNotifier(ref.watch(userRepositoryProvider));
});

class AuthNotifier extends StateNotifier<User?> {
  final UserRepository repo;

  AuthNotifier(this.repo) : super(null);

  Future<bool> login(String username, String password) async {
    final user = await repo.login(username, password);
    if (user != null) {
      state = user;
      return true;
    }
    return false;
  }

  void setUser(User user) {
    state = user;
  }

  void logout() {
    state = null;
  }
}
