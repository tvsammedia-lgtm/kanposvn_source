import 'package:isar/isar.dart';

part 'crm_sync.g.dart';

@collection
class CrmSyncQueue {
  Id isarId = Isar.autoIncrement;
  
  String operation = ''; // INSERT, UPDATE, DELETE
  String collectionName = ''; // Tên bảng
  String recordId = ''; // ID của bản ghi

  String dataJson = ''; // Dữ liệu JSON

  DateTime createdAt = DateTime.now();
  int retryCount = 0;
}

@collection
class CrmSyncConfig {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String configId = 'default';
  
  String vercelApiUrl = 'https://kanposvn-crm-api.vercel.app';
  String apiKey = 'kanpos_crm_secret';
  
  DateTime? lastSyncTime;
}
