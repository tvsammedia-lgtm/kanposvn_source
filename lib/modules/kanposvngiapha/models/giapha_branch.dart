import 'package:isar/isar.dart';

part 'giapha_branch.g.dart';

@collection
class GiaphaBranch {
  Id id = Isar.autoIncrement;

  @Index()
  String? serverId;
  
  @Index()
  String? familyId;
  
  String? clanId;
  
  String? name;
  String? description;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? version;
  bool? isDeleted;
}
