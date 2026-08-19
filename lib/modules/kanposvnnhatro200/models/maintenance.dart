import 'package:isar/isar.dart';
import 'hostel.dart';

part 'maintenance.g.dart';

@collection
class Maintenance {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String? uuid;

  String? roomUuid;
  String? equipment;
  DateTime? repairDate;
  String? content;
  String? repairUnit;
  double? cost;
  String? performer;

  DateTime? updatedAt;
  DateTime? createdAt;
  bool deleted = false;

  @Enumerated(EnumType.name)
  SyncStatus syncStatus = SyncStatus.pending;
}
