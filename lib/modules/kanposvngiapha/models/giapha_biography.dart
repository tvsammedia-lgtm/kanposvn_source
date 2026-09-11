import 'package:isar/isar.dart';

part 'giapha_biography.g.dart';

@collection
class GiaphaBiography {
  Id id = Isar.autoIncrement;

  @Index()
  String? serverId;
  
  @Index()
  String? familyId;
  
  @Index()
  String? personId;
  
  String? content;
  String? occupation;
  String? achievements;
  String? education;
  String? militaryHistory;
  String? notes;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? version;
  bool? isDeleted;
}
