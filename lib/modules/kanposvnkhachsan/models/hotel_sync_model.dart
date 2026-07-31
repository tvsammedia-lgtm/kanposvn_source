import 'package:isar/isar.dart';

part 'hotel_sync_model.g.dart';

@collection
class HotelSyncQueue {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true, replace: true)
  String operationId = ''; // A unique ID for the operation to prevent duplicate syncs
  
  String collectionName = ''; // E.g., 'HotelRoom', 'RoomCheckIn'
  
  String operationType = ''; // 'CREATE', 'UPDATE', 'DELETE'
  
  String payload = ''; // JSON string of the object
  
  DateTime createdAt = DateTime.now();
  
  int retryCount = 0;
  
  bool isSyncing = false; // To prevent concurrent syncs of the same item
}

@collection
class HotelSyncConfig {
  Id id = Isar.autoIncrement;
  
  String lastSyncToken = ''; // E.g., a timestamp or ID from Neon
  
  DateTime? lastSyncTime;
}
