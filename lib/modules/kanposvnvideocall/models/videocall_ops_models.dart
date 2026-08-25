import 'package:isar/isar.dart';

part 'videocall_ops_models.g.dart';

/// §12. Trạng thái cuộc gọi trực tiếp (mô phỏng signaling offline).
enum CallSessionState {
  calling,
  ringing,
  accepted,
  connecting,
  connected,
  reconnecting,
  ended,
  rejected,
  busy,
  missed,
  cancelled,
  failed,
}

/// Cuộc gọi đang/thành lập — lịch sử chi tiết nằm ở CallHistory.
@collection
class VideoCallSession {
  Id id = Isar.autoIncrement;

  bool isSynced = false;

  @Index(unique: true, replace: true)
  String callId = '';

  String callerUuid = '';
  String receiverUuid = '';

  /// voice | video
  String callType = 'voice';

  @enumerated
  CallSessionState state = CallSessionState.calling;

  DateTime createdAt = DateTime.now();
  DateTime? connectedAt;
  DateTime? endedAt;
}

/// §50. Reaction tin nhắn (emoji).
@collection
class VideoCallReaction {
  Id id = Isar.autoIncrement;

  bool isSynced = false;

  @Index(unique: true, replace: true)
  String reactionId = ''; // '<clientMessageId>_<userId>'

  @Index()
  String clientMessageId = '';

  String userId = '';
  String emoji = '👍';

  DateTime createdAt = DateTime.now();
}

/// §43. Hàng đợi đồng bộ offline (message/call/user...).
@collection
class VideoCallSyncQueueItem {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String queueId = '';

  String entityType = 'MESSAGE'; // MESSAGE | USER | CALL ...
  String entityUuid = '';

  /// CREATE | UPDATE | DELETE
  String operation = 'CREATE';
  String payloadJson = '{}';

  int retryCount = 0;
  String? lastError;

  /// PENDING | SYNCING | SYNCED | FAILED
  String status = 'PENDING';

  DateTime updatedAt = DateTime.now();
}
