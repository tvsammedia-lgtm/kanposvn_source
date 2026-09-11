import 'package:isar/isar.dart';

part 'giapha_person.g.dart';

@collection
class GiaphaPerson {
  Id id = Isar.autoIncrement;

  @Index()
  String? serverId;
  
  @Index()
  String? familyId;
  
  String? clanId;
  String? branchId;
  
  String? fullName;
  String? gender;
  
  DateTime? birthDate;
  DateTime? deathDate;
  
  String? birthPlace;
  String? deathPlace;
  String? biography;
  String? photoUrl;
  
  int? generationNo; // Đời thứ mấy
  bool? isLiving;
  bool? isPublic;
  
  String? createdBy;
  String? updatedBy;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? version;
  bool? isDeleted;
}
