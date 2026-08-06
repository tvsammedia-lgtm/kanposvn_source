import 'package:isar/isar.dart';

part 'parking_sync.g.dart';

@collection
class ParkingSyncQueue {
  Id isarId = Isar.autoIncrement;
  
  String operation = ''; // INSERT, UPDATE, DELETE
  String collectionName = ''; // Tên bảng
  String recordId = '';

  String dataJson = '';

  DateTime createdAt = DateTime.now();
  int retryCount = 0;
}

@collection
class ParkingSyncConfig {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String configId = 'default';
  
  String vercelApiUrl = 'https://kanposvn-parking-api.vercel.app';
  String apiKey = 'kanpos_parking_secret';
  
  DateTime? lastSyncTime;
}
