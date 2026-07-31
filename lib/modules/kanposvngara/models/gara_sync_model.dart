import 'package:isar/isar.dart';

part 'gara_sync_model.g.dart';

@collection
class GaraSyncQueue {
  Id id = Isar.autoIncrement;
  
  String entityType = ''; // e.g. 'GaraCustomer', 'GaraRepairOrder'
  String entityId = ''; // id của đối tượng
  
  String action = ''; // 'INSERT', 'UPDATE', 'DELETE'
  
  String payload = ''; // JSON của đối tượng
  
  DateTime? createdAt;
  bool isSynced = false;
  
  int retryCount = 0;
  String lastError = '';
}
