import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth/auth_service.dart';
import 'db/database_service.dart';

final authServiceProvider = ChangeNotifierProvider<AuthService>((ref) {
  final auth = AuthService();
  AuthService.instance = auth;
  return auth;
});
final databaseServiceProvider =
    ChangeNotifierProvider<DatabaseService>((ref) => DatabaseService.instance);
