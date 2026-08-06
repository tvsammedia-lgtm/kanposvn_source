import 'package:isar/isar.dart';

part 'sync_model.g.dart';

@collection
class TapHoaSyncQueue {
  Id id = Isar.autoIncrement;
  
  String operation = ''; // INSERT, UPDATE, DELETE
  String collectionName = ''; // Tên bảng
  String recordId = ''; // ID của bản ghi

  String dataJson = ''; // Dữ liệu JSON

  DateTime createdAt = DateTime.now();
  int retryCount = 0;
}

@collection
class TapHoaSyncConfig {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String configId = 'default';
  
  String vercelApiUrl = 'https://kanposvn-taphoa-api.vercel.app';
  String apiKey = 'taphoa_sync_2026';
  
  DateTime? lastSyncTime;
}
