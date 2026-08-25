import 'package:isar/isar.dart';
import 'user.dart';

part 'call_history.g.dart';

@collection
class VideoCallHistory {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;
  
  String? callerUuid; // Người gọi
  String? receiverUuid; // Người nhận (nếu group thì có thể là conversation_id)
  
  @enumerated
  CallType type = CallType.voice;
  
  @enumerated
  CallHistoryStatus status = CallHistoryStatus.missed;
  
  DateTime? startedAt;
  DateTime? answeredAt; // B bắt máy
  DateTime? endedAt;
  int? durationSeconds; // Thời lượng cuộc gọi
  
  @enumerated
  SyncStatus syncStatus = SyncStatus.synced;
}

enum CallType {
  voice,
  video
}

enum CallHistoryStatus {
  completed,
  missed,
  rejected,
  cancelled
}
