import 'package:isar/isar.dart';

part 'vantai_sync_model.g.dart';

@collection
class VantaiSyncQueue {
  Id id = Isar.autoIncrement;
  
  String entityType = '';
  String entityId = ''; 
  String action = ''; // 'INSERT', 'UPDATE', 'DELETE'
  String payload = '';
  
  DateTime? createdAt;
  bool isSynced = false;
  
  int retryCount = 0;
  String lastError = '';
}
