import 'package:isar/isar.dart';

part 'viec_sync.g.dart';

@collection
class ViecSyncQueue {
  Id isarId = Isar.autoIncrement;
  
  String operation = ''; // INSERT, UPDATE, DELETE
  String collectionName = ''; // Tên bảng
  String recordId = '';

  String dataJson = '';

  DateTime createdAt = DateTime.now();
  int retryCount = 0;
}

@collection
class ViecSyncConfig {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String configId = 'default';
  
  String vercelApiUrl = 'https://kanposvn-viec-api.vercel.app';
  String apiKey = 'kanpos_viec_secret';
  
  DateTime? lastSyncTime;
}
