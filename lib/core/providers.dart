import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth/auth_service.dart';
import 'db/database_service.dart';

final authServiceProvider =
    ChangeNotifierProvider<AuthService>((ref) => AuthService());
final databaseServiceProvider =
    ChangeNotifierProvider<DatabaseService>((ref) => DatabaseService.instance);
