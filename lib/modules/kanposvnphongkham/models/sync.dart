import 'package:isar/isar.dart';

part 'sync.g.dart';

@collection
class SyncQueue {
  Id id = Isar.autoIncrement;

  @Index()
  String? entityId;

  @Index()
  String? entityType; // Patient, Appointment, ...

  /// upsert, delete
  String? operation;

  String? dataJson; // JSON representation of the entity

  @Index()
  String? status; // pending, syncing, failed, synced

  int? retryCount;
  String? errorMessage;

  DateTime? createdAt;
  DateTime? updatedAt;
}

@collection
class SyncConflict {
  Id id = Isar.autoIncrement;

  @Index()
  String? entityId;

  String? entityType;
  String? localDataJson;
  String? remoteDataJson;

  @Index()
  String? status; // unresolved, resolved_local, resolved_remote

  DateTime? createdAt;
  DateTime? resolvedAt;
}
