import 'package:isar/isar.dart';

part 'employee.g.dart';

enum Gender { male, female, other }
enum MaritalStatus { single, married, divorced, widowed }
enum EmployeeStatus { active, resigned, suspended, maternity }

@collection
class Employee {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String employeeCode;

  late String fullName;
  DateTime? birthDate;
  String? cccd;
  DateTime? cccdIssueDate;
  String? cccdIssuePlace;
  String? address;
  String? phone;
  String? email;

  @Enumerated(EnumType.name)
  Gender gender = Gender.male;

  @Enumerated(EnumType.name)
  MaritalStatus maritalStatus = MaritalStatus.single;

  String? emergencyContact;
  String? emergencyPhone;
  String? taxCode;
  String? socialInsuranceCode;
  String? bankAccount;
  String? bankName;
  String? avatarPath;

  // Employment info
  late String department;
  late String position;
  DateTime? joinDate;
  DateTime? resignDate;

  @Enumerated(EnumType.name)
  EmployeeStatus status = EmployeeStatus.active;

  // Salary config
  double baseSalary = 0;
  double allowancePhone = 0;
  double allowanceMeal = 0;
  double allowanceTransport = 0;

  // BHXH
  bool hasSocialInsurance = true;
  double socialInsuranceRate = 8.0; // %
  double healthInsuranceRate = 1.5; // %
  double unemploymentInsuranceRate = 1.0; // %

  // Contract
  String? contractType;          // xác định thời hạn / không xác định / seasonal
  DateTime? contractStartDate;
  DateTime? contractEndDate;

  // Tax
  int dependents = 0;

  // Trade union
  bool isUnionMember = true;
  double unionFeeRate = 2.0;    // % phí công đoàn (NSDL đóng)

  // Annual leave
  int annualLeaveTotal = 12;
  int annualLeaveUsed = 0;

  // Sync
  String? remoteId;
  DateTime? lastSyncAt;
  bool needsSync = false;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @ignore
  int get annualLeaveRemaining => annualLeaveTotal - annualLeaveUsed;

  @ignore
  double get totalInsuranceDeduction =>
      baseSalary * (socialInsuranceRate + healthInsuranceRate + unemploymentInsuranceRate) / 100;
}
