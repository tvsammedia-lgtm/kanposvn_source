import 'package:isar/isar.dart';

part 'bida_sync_model.g.dart';

@collection
class BidaSyncQueue {
  Id id = Isar.autoIncrement;

  String entityType = '';
  String action = ''; // insert, update, delete
  String payload = ''; // JSON string
  
  @Index()
  DateTime createdAt = DateTime.now();

  bool isSynced = false;
}
