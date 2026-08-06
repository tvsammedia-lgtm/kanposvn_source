import 'package:isar/isar.dart';

part 'attendance.g.dart';

enum AttendanceType { office, driver }
enum LeaveType { annual, sick, maternity, unpaid, holiday }

@collection
class Attendance {
  Id id = Isar.autoIncrement;

  late int employeeId;
  late String employeeCode;
  late String employeeName;

  late int year;
  late int month;

  @Enumerated(EnumType.name)
  AttendanceType attendanceType = AttendanceType.office;

  // For office staff
  double workingDays = 0;
  double morningShifts = 0;
  double afternoonShifts = 0;
  double overtimeHours = 0;
  double leaveDays = 0;
  double holidayDays = 0;
  double lateDays = 0;
  double earlyLeaveDays = 0;

  // For drivers
  int totalTrips = 0;
  double totalKm = 0;
  int totalContainers = 0;
  double totalDrivingHours = 0;
  double restHours = 0;
  double driverLeaveDays = 0;

  // Leave breakdown
  double annualLeaveDays = 0;
  double sickLeaveDays = 0;
  double maternityLeaveDays = 0;
  double unpaidLeaveDays = 0;

  String? notes;

  // Sync
  String? remoteId;
  DateTime? lastSyncAt;
  bool needsSync = false;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
