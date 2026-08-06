import 'package:isar/isar.dart';

part 'eshop_sync.g.dart';

@collection
class KanShopSyncQueue {
  Id isarId = Isar.autoIncrement;
  
  String operation = ''; // INSERT, UPDATE, DELETE
  String collectionName = '';
  String recordId = '';

  String dataJson = '';

  DateTime createdAt = DateTime.now();
  int retryCount = 0;
}

@collection
class KanShopSyncConfig {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String configId = 'default';
  
  String vercelApiUrl = 'https://kanposvn-eshop-api.vercel.app';
  String apiKey = 'kanpos_eshop_secret';
  
  DateTime? lastSyncTime;
}
