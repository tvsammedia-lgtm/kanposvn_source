import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../isar_service.dart';
import '../models/user.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref.watch(isarProvider));
});

class UserRepository {
  final Isar isar;

  UserRepository(this.isar);

  Future<User?> login(String username, String password) async {
    return await isar.users
        .filter()
        .usernameEqualTo(username)
        .passwordEqualTo(password)
        .findFirst();
  }

  Future<List<User>> getAllUsers() async {
    return await isar.users.where().findAll();
  }

  Future<void> saveUser(User user) async {
    await isar.writeTxn(() async {
      await isar.users.put(user);
    });
  }

  Future<void> deleteUser(int id) async {
    await isar.writeTxn(() async {
      await isar.users.delete(id);
    });
  }
}
