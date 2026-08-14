import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class NgoaiNguUser {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;
  
  String? centerId;
  String? branchId;

  String? username;
  String? passwordHash;
  String? fullName;
  String? phone;
  String? email;
  
  @enumerated
  NgoaiNguUserRole role = NgoaiNguUserRole.staff;
  
  bool isActive = true;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  bool isDeleted = false;
  int syncVersion = 1;
}

enum NgoaiNguUserRole {
  superAdmin,
  centerAdmin,
  manager,
  teacher,
  staff,
  student
}
