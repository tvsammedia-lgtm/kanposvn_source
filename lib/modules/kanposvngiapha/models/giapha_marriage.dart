import 'package:isar/isar.dart';

part 'giapha_marriage.g.dart';

@collection
class GiaphaMarriage {
  Id id = Isar.autoIncrement;

  @Index()
  String? serverId;
  
  @Index()
  String? familyId;
  
  String? person1Id;
  String? person2Id;
  
  DateTime? marriageDate;
  DateTime? divorceDate;
  String? note;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? version;
  bool? isDeleted;
}
