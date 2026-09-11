import 'package:isar/isar.dart';

part 'giapha_membership.g.dart';

@collection
class GiaphaMembership {
  Id id = Isar.autoIncrement;

  @Index()
  String? serverId;
  
  @Index(composite: [CompositeIndex('userId')])
  String? familyId;
  String? userId;
  
  String? roleId; // OWNER, ADMIN, MEMBER
  String? clanId;
  String? branchId;
  
  String? status;
  DateTime? joinedAt;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? version;
  bool? isDeleted;
}
