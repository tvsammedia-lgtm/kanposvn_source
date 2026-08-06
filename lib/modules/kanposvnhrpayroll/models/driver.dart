import 'package:isar/isar.dart';

part 'driver.g.dart';

enum DriverLicenseClass { b1, b2, c, d, e, f }
enum DriverStatus { driving, onLeave, resigned, suspended }

@collection
class Driver {
  Id id = Isar.autoIncrement;

  // Links to Employee
  late int employeeId;
  late String employeeCode;
  late String fullName;

  // License
  String? licenseNumber;

  @Enumerated(EnumType.name)
  DriverLicenseClass licenseClass = DriverLicenseClass.b2;

  DateTime? licenseIssueDate;
  DateTime? licenseExpiryDate;

  // Health check
  DateTime? healthCheckDate;
  DateTime? healthCheckExpiry;

  // Experience (years)
  int experienceYears = 0;

  // Vehicle types allowed
  bool canDriveContainer = false;
  bool canDriveTruck = false;
  bool canDriveTractor = false;
  bool canDriveMooc = false;

  // Certificates
  bool hasAdrCertificate = false;
  bool hasDangerousGoodsCert = false;

  @Enumerated(EnumType.name)
  DriverStatus status = DriverStatus.driving;

  // Salary config
  double baseSalary = 0;
  double salaryPerTrip = 0;
  double salaryPerKm = 0;
  double salaryPerContainer = 0;
  double revenueSharePercent = 0;

  // Allowances
  double allowancePhone = 200000;
  double allowanceMeal = 500000;
  double allowanceNightStay = 0;
  double allowanceFuel = 0;

  // Sync
  String? remoteId;
  DateTime? lastSyncAt;
  bool needsSync = false;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
