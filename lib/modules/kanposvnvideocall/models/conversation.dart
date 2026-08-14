import 'package:isar/isar.dart';
import 'user.dart';

part 'conversation.g.dart';

@collection
class VideoCallConversation {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid; // conversation_id trên Cloud
  
  @enumerated
  ConversationType type = ConversationType.direct;
  
  String? name; // Dành cho group
  String? avatarUrl; // Dành cho group
  
  List<String> memberUuids = []; // Danh sách ID các thành viên
  
  String? lastMessageId;
  String? lastMessageContent;
  DateTime? lastMessageAt;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  
  @enumerated
  SyncStatus syncStatus = SyncStatus.synced;
}

enum ConversationType {
  direct, // Chat 1-1
  group   // Chat nhóm
}
