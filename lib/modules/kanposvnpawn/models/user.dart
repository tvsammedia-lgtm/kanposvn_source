import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;

  String? username;
  String? passwordHash;
  String? fullName;
  String? phone;
  String? email;
  
  @enumerated
  UserRole role = UserRole.cashier;
  
  bool isActive = true;
  
  DateTime? createdAt;
  DateTime? updatedAt;
}

enum UserRole {
  owner,
  manager,
  cashier,
  technician,
  pawnBroker
}
