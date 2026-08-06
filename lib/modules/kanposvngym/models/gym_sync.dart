import 'package:isar/isar.dart';

part 'gym_sync.g.dart';

@collection
class GymSyncQueue {
  Id isarId = Isar.autoIncrement;
  
  String operation = ''; // INSERT, UPDATE, DELETE
  String collectionName = ''; // Tên bảng
  String recordId = ''; // ID của bản ghi

  String dataJson = ''; // Dữ liệu JSON

  DateTime createdAt = DateTime.now();
  int retryCount = 0;
}

@collection
class GymSyncConfig {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String configId = 'default';
  
  String vercelApiUrl = 'https://kanposvn-gym-api.vercel.app';
  String apiKey = 'kanpos_gym_secret';
  
  DateTime? lastSyncTime;
}
