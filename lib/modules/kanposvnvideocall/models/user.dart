import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class VideoCallUser {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid; // Đồng bộ với user_id trên Cloud
  
  @Index(unique: true)
  String? username;
  
  String? displayName;
  String? phone;
  String? email;
  String? avatarUrl;
  String? bio;
  
  @enumerated
  UserStatus status = UserStatus.offline;
  
  DateTime? lastSeen;
  DateTime? createdAt;
  DateTime? updatedAt;
  
  // Offline-first sync status
  @enumerated
  SyncStatus syncStatus = SyncStatus.synced;
}

enum UserStatus {
  online,
  offline,
  busy
}

enum SyncStatus {
  synced,    // Đã đồng bộ với server
  pending,   // Đang chờ đồng bộ (mới tạo/sửa local)
  failed     // Lỗi đồng bộ
}
