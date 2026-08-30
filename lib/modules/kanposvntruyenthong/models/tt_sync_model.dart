import 'package:isar/isar.dart';

part 'tt_sync_model.g.dart';

enum TtSyncOperation {
  CREATE('CREATE'),
  UPDATE('UPDATE'),
  DELETE('DELETE');

  final String label;
  const TtSyncOperation(this.label);
}

enum TtSyncStatus {
  PENDING('PENDING'),
  SYNCING('SYNCING'),
  SYNCED('SYNCED'),
  FAILED('FAILED');

  final String label;
  const TtSyncStatus(this.label);
}

@collection
class TtSyncQueue {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String operationId = ''; // A unique ID for the operation

  String entityType = ''; // E.g., 'TtProduct', 'TtSalesInvoice'
  String entityId = '';

  @enumerated
  TtSyncOperation operation = TtSyncOperation.CREATE;

  String payload = ''; // JSON string of the object

  DateTime createdAt = DateTime.now();

  int retryCount = 0;
  String lastError = '';

  @enumerated
  TtSyncStatus status = TtSyncStatus.PENDING;
}

@collection
class TtSyncConfig {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  String lastSyncToken = '';
  DateTime? lastSyncTime;
}

@collection
class TtAppConfig {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String key = '';

  String value = '';
}