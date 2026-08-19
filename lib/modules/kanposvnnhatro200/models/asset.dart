import 'package:isar/isar.dart';
import 'hostel.dart';

part 'asset.g.dart';

@collection
class Asset {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String? uuid;

  String? name;
  String? roomUuid;
  DateTime? purchaseDate;
  double? purchasePrice;
  double? depreciationRate;
  int? usefulLifeMonths;
  String? warrantyExpiry;
  String? condition;

  DateTime? updatedAt;
  DateTime? createdAt;
  bool deleted = false;

  @Enumerated(EnumType.name)
  SyncStatus syncStatus = SyncStatus.pending;
}
