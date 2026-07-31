import 'package:isar/isar.dart';

part 'vlxd_sync_model.g.dart';

@collection
class VlxdSyncQueue {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true, replace: true)
  String operationId = ''; // A unique ID for the operation to prevent duplicate syncs
  
  String collectionName = ''; // E.g., 'VlxdProduct', 'VlxdOrder'
  
  String operationType = ''; // 'CREATE', 'UPDATE', 'DELETE'
  
  String payload = ''; // JSON string of the object
  
  DateTime createdAt = DateTime.now();
  
  int retryCount = 0;
  
  bool isSyncing = false;
}

@collection
class VlxdSyncConfig {
  Id id = Isar.autoIncrement;
  
  String lastSyncToken = '';
  
  DateTime? lastSyncTime;
}
