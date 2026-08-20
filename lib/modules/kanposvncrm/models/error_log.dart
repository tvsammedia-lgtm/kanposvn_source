import 'package:isar/isar.dart';

part 'error_log.g.dart';

@collection
class CrmErrorLog {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;

  @Index(unique: true, replace: true)
  String logId = '';

  String module = '';       // Module nguồn: kanposvncafe, kanposvngara...
  String screen = '';       // Màn hình xảy ra lỗi
  String action = '';       // Action/hành động gây ra lỗi: login, save, sync...
  String level = 'error';   // info, warning, error, critical
  String errorCode = '';    // Mã lỗi: ERR_001, AUTH_FAIL, SYNC_TIMEOUT...
  String message = '';      // Tên/thông báo lỗi
  String stackTrace = '';
  String deviceInfo = '';   // OS, app version
  String userId = '';
  String userName = '';
  String phone = '';        // Số điện thoại user

  DateTime createdAt = DateTime.now();
}
