import 'package:isar/isar.dart';
import 'hostel.dart';

part 'water_reading.g.dart';

@collection
class WaterReading {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String? uuid;

  String? roomUuid;
  String? meterNumber;
  int? oldIndex;
  int? newIndex;
  int? consumption;
  double? unitPrice;
  double? totalAmount;
  int? month;
  int? year;

  DateTime? updatedAt;
  DateTime? createdAt;
  bool deleted = false;

  @Enumerated(EnumType.name)
  SyncStatus syncStatus = SyncStatus.pending;
}
