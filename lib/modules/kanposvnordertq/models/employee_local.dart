import 'package:isar/isar.dart';

part 'employee_local.g.dart';

@collection
class EmployeeLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String employeeId = '';

  String? employeeCode;
  String? name;
  String? phone;
  String? department;
  String? status;

  @Index()
  String? userId;

  DateTime? createdAt;
  DateTime? updatedAt;

  @Index()
  DateTime? syncedAt;
  bool isDeleted = false;
}
