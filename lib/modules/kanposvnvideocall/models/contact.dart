import 'package:isar/isar.dart';
import 'user.dart';

part 'contact.g.dart';

@collection
class VideoCallContact {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid; // ID của bản ghi contact
  
  @Index()
  String? ownerUuid; // User sở hữu danh bạ này
  
  @Index()
  String? contactUuid; // User ID của người bạn
  
  String? contactName; // Tên hiển thị tùy chỉnh lưu trên máy
  String? contactAvatarUrl;
  
  @enumerated
  ContactStatus status = ContactStatus.accepted;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  
  @enumerated
  SyncStatus syncStatus = SyncStatus.synced;
}

enum ContactStatus {
  pending,  // Đang chờ kết bạn
  accepted, // Đã là bạn
  blocked,  // Đã chặn
  rejected  // Đã từ chối
}
