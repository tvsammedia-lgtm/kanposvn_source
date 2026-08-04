import 'package:isar/isar.dart';

part 'user.g.dart';

@Collection()
class User {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true)
  late String username;

  late String password; // Trong thực tế nên băm (hash) mật khẩu, ở đây lưu plain text cho demo
  late String role;     // 'admin' hoặc 'staff'
}
