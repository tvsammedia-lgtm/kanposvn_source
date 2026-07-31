import 'package:isar/isar.dart';

part 'user.g.dart';

@Collection()
class User {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String username;

  late String password; // Trong thực tế nên băm (hash) mật khẩu, ở đây lưu plain text cho demo
  late String role;     // 'admin' hoặc 'staff'
}
