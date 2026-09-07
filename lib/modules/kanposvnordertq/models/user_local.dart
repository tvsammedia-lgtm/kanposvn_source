import 'package:isar/isar.dart';

part 'user_local.g.dart';

@collection
class UserLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String userId = ''; // UUID for sync

  @Index()
  String? username;

  String? passwordHash;

  @Index()
  String? role; // ADMIN, STAFF, DRIVER, CUSTOMER

  String? status; // ACTIVE, INACTIVE

  @Index()
  String? customerId; // for CUSTOMER role

  String? employeeId; // for STAFF/DRIVER roles

  DateTime? lastLoginAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  @Index()
  DateTime? syncedAt;
  bool isDeleted = false;
}
