import 'package:isar/isar.dart';

part 'giapha_family.g.dart';

@collection
class GiaphaFamily {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? serverId;
  
  @Index(unique: true)
  String? familyCode;
  
  String? familyName;
  String? surname;
  String? description;
  String? logoUrl;
  String? address;
  String? ownerUserId;
  
  String? status; // ACTIVE, SUSPENDED
  
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? version;
  bool? isDeleted;
}
