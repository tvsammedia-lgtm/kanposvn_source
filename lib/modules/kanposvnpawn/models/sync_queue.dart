import 'package:isar/isar.dart';

part 'sync_queue.g.dart';

@collection
class SyncQueue {
  Id id = Isar.autoIncrement;

  String? entityName; // Ví dụ: Customer, Product, PawnContract
  String? entityId; // ID của entity (UUID hoặc String)
  
  @enumerated
  SyncAction action = SyncAction.insert;
  
  String? payload; // Dữ liệu JSON
  
  int retryCount = 0;
  String? errorMessage;
  
  DateTime? createdAt;
}

enum SyncAction {
  insert,
  update,
  delete
}
