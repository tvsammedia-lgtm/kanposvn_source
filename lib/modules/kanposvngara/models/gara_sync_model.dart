import 'package:isar/isar.dart';

part 'gara_sync_model.g.dart';

@collection
class GaraSyncQueue {
  Id id = Isar.autoIncrement;
  
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  
  String entityType = ''; // e.g. 'GaraCustomer', 'GaraRepairOrder'
  String entityId = ''; // id của đối tượng
  
  String action = ''; // 'INSERT', 'UPDATE', 'DELETE'
  
  String payload = ''; // JSON của đối tượng
  
  DateTime? createdAt;
  bool isSynced = false;
  
  int retryCount = 0;
  String lastError = '';
}
