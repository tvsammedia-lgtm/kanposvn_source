import 'package:isar/isar.dart';

part 'restaurant_sync_model.g.dart';

@collection
class RestaurantSyncQueue {
  Id id = Isar.autoIncrement;

  String entityType = '';
  String action = ''; // insert, update, delete
  String payload = ''; // JSON string
  
  @Index()
  DateTime createdAt = DateTime.now();

  bool isSynced = false;
}
