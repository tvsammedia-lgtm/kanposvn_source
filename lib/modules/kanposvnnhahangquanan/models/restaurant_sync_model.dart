import 'package:isar/isar.dart';

part 'restaurant_sync_model.g.dart';

@collection
class RestaurantSyncQueue {
  Id id = Isar.autoIncrement;

  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  String entityType = '';
  String action = ''; // insert, update, delete
  String payload = ''; // JSON string
  
  @Index()
  DateTime createdAt = DateTime.now();

  bool isSynced = false;
}
