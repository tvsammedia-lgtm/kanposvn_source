import 'package:isar/isar.dart';
import 'hostel.dart';

part 'hostel_service.g.dart';

@collection
class HostelService {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String? uuid;

  String? name;
  String? category;
  double? price;
  String? billingType;
  bool isActive = true;

  DateTime? updatedAt;
  DateTime? createdAt;
  bool deleted = false;

  @Enumerated(EnumType.name)
  SyncStatus syncStatus = SyncStatus.pending;
}
