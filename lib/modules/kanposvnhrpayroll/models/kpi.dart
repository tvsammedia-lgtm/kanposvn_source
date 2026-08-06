import 'package:isar/isar.dart';

part 'kpi.g.dart';

@collection
class KpiRecord {
  Id id = Isar.autoIncrement;

  late int driverId;
  late String driverName;
  late int year;
  late int month;

  // KPI metrics
  double onTimeScore = 0;       // Đúng giờ (%)
  int totalTrips = 0;           // Số chuyến
  double totalKm = 0;           // Số km
  double fuelConsumption = 0;   // Tiêu hao nhiên liệu (lít/100km)
  double fuelTarget = 0;        // Định mức nhiên liệu
  int violations = 0;           // Số vi phạm
  int accidents = 0;            // Số tai nạn
  double customerRating = 0;    // Điểm đánh giá khách hàng (0-10)

  // Calculated KPI score (0-100)
  double kpiScore = 0;
  double kpiBonus = 0;

  String? notes;

  // Sync
  String? remoteId;
  bool needsSync = false;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}

@collection
class DisciplineRecord {
  Id id = Isar.autoIncrement;

  late int employeeId;
  late String employeeName;
  late String violationType; // Loại vi phạm
  late String description;
  late DateTime violationDate;
  double penaltyAmount = 0;
  String? handledBy;
  String? notes;

  // Sync
  String? remoteId;
  bool needsSync = false;

  DateTime createdAt = DateTime.now();
}

@collection
class BonusRecord {
  Id id = Isar.autoIncrement;

  late int employeeId;
  late String employeeName;
  late String bonusType; // monthly, quarterly, yearly, holiday, safety...
  late String description;
  late DateTime bonusDate;
  late int year;
  late int month;
  double bonusAmount = 0;
  String? approvedBy;
  String? notes;

  // Sync
  String? remoteId;
  bool needsSync = false;

  DateTime createdAt = DateTime.now();
}
