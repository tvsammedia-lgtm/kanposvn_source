import 'package:isar/isar.dart';

part 'sync_queue.g.dart';

@collection
class SyncQueueLocal {
  Id id = Isar.autoIncrement;

  @Index()
  String? uuid;

  String? entity;       // VD: 'booking', 'flight_offer'
  String? entityUuid;   // UUID của record bị thay đổi
  
  String? operation;    // 'CREATE', 'UPDATE', 'DELETE'
  
  String? payload;      // JSON string chứa data mới

  DateTime? createdAt;
  
  @enumerated
  SyncStatus status = SyncStatus.pending;
}

enum SyncStatus {
  pending,
  processing,
  success,
  failed
}
