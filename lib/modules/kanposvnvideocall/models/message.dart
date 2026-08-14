import 'package:isar/isar.dart';
import 'user.dart';

part 'message.g.dart';

@collection
class VideoCallMessage {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? clientMessageId; // UUID tạo từ client (Offline-first)
  
  @Index()
  String? serverId; // ID thực tế từ database Cloud sau khi sync
  
  @Index()
  String? conversationUuid;
  
  @Index()
  String? senderUuid;
  
  @enumerated
  MessageType messageType = MessageType.text;
  
  String? content;
  
  // Dành cho gửi file/ảnh
  String? attachmentId;
  String? attachmentUrl;
  
  String? replyToId; // ID của tin nhắn đang được trả lời
  
  @enumerated
  MessageStatus status = MessageStatus.pending; // Mặc định là pending khi chưa sync
  
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  bool isEdited = false;
  
  @enumerated
  SyncStatus syncStatus = SyncStatus.pending;
}

enum MessageType {
  text,
  image,
  video,
  file,
  voice,
  location,
  system // Thông báo hệ thống (VD: "A đã thêm B vào nhóm")
}

enum MessageStatus {
  pending,
  sending,
  sent,      // Gửi lên server thành công
  delivered, // Người kia đã nhận
  read,      // Người kia đã đọc
  failed,
  deleted
}
