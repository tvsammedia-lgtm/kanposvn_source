import 'package:isar/isar.dart';

part 'giapha_user.g.dart';

@collection
class GiaphaUser {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? serverId;
  
  String? email;
  String? phone;
  String? displayName;
  String? avatarUrl;
  String? status;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? version;
  bool? isDeleted;
}
