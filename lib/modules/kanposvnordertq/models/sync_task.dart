import 'package:isar/isar.dart';

part 'sync_task.g.dart';

@collection
class SyncTask {
  Id id = Isar.autoIncrement;

  @Index()
  String entity = ''; // e.g. 'Order', 'Customer'
  
  @Index()
  String entityId = ''; // uuid of the entity
  
  String operation = ''; // 'CREATE', 'UPDATE', 'DELETE'
  
  String? payload; // JSON payload of the operation
  
  DateTime? createdAt;
  int retryCount = 0;
  String? lastError;
  
  @Index()
  String status = 'PENDING'; // PENDING, PROCESSING, SUCCESS, FAILED
}
