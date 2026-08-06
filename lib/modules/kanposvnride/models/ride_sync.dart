import 'package:isar/isar.dart';

part 'ride_sync.g.dart';

@collection
class KanRideSyncQueue {
  Id isarId = Isar.autoIncrement;
  
  String operation = ''; // INSERT, UPDATE, DELETE
  String collectionName = '';
  String recordId = '';

  String dataJson = '';

  DateTime createdAt = DateTime.now();
  int retryCount = 0;
}

@collection
class KanRideSyncConfig {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String configId = 'default';
  
  String vercelApiUrl = 'https://kanposvn-ride-api.vercel.app';
  String apiKey = 'kanpos_ride_secret';
  
  DateTime? lastSyncTime;
}
