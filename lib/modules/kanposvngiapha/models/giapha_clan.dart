import 'package:isar/isar.dart';

part 'giapha_clan.g.dart';

@collection
class GiaphaClan {
  Id id = Isar.autoIncrement;

  @Index()
  String? serverId;
  
  @Index()
  String? familyId;
  
  String? name;
  String? description;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? version;
  bool? isDeleted;
}
