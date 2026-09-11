import 'package:isar/isar.dart';

part 'giapha_relationship.g.dart';

@collection
class GiaphaRelationship {
  Id id = Isar.autoIncrement;

  @Index()
  String? serverId;
  
  @Index()
  String? familyId;
  
  String? personId;
  String? relatedPersonId;
  String? relationshipType; // FATHER, MOTHER, SPOUSE, CHILD
  
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? version;
  bool? isDeleted;
}
