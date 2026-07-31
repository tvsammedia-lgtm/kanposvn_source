import 'package:isar/isar.dart';
import 'hostel.dart';

part 'tenant.g.dart';

@collection
class Tenant {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;

  String? fullName;
  String? cccd;
  DateTime? birthDate;
  String? phone;
  String? email;
  String? permanentAddress;
  String? occupation;
  String? licensePlate;

  // Sync details
  DateTime? updatedAt;
  DateTime? createdAt;
  bool deleted = false;
  
  @Enumerated(EnumType.name)
  SyncStatus syncStatus = SyncStatus.pending;
}
