import 'package:isar/isar.dart';

part 'hostel.g.dart';

@collection
class Hostel {
  Id id = Isar.autoIncrement; // Local ID

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String? uuid; // Neon DB ID

  String? name;
  String? address;
  String? managerName;
  String? notes;

  // Sync details
  DateTime? updatedAt;
  DateTime? createdAt;
  bool deleted = false;
  
  @Enumerated(EnumType.name)
  SyncStatus syncStatus = SyncStatus.pending;
}

enum SyncStatus {
  pending,
  synced,
  error
}
