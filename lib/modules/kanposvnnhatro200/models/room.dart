import 'package:isar/isar.dart';
import 'hostel.dart';

part 'room.g.dart';

@collection
class Room {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String? uuid;

  String? roomCode;
  String? roomName;
  String? block; // Dãy
  int? floor; // Tầng
  double? areaSize;
  double? rentPrice;
  double? depositAmount;

  @Enumerated(EnumType.name)
  RoomStatus status = RoomStatus.empty;

  String? hostelUuid; // Relationship to Hostel

  // Sync details
  DateTime? updatedAt;
  DateTime? createdAt;
  bool deleted = false;
  
  @Enumerated(EnumType.name)
  SyncStatus syncStatus = SyncStatus.pending;
}

enum RoomStatus {
  empty,
  rented,
  repairing,
  reserved
}
