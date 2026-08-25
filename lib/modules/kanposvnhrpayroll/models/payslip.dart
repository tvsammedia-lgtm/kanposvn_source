import 'package:isar/isar.dart';

part 'payslip.g.dart';

/// Phiếu lương nhân viên — tóm tắt lương tháng theo mẫu phổ biến VN.
@collection
class Payslip {
  Id id = Isar.autoIncrement;

  late int year;
  late int month;

  // ─── Nhân viên ────────────────────────────────────────────────────────
  late int employeeId;
  late String employeeCode;
  late String employeeName;
  late String department;
  late String position;

  // ─── Thời gian ────────────────────────────────────────────────────────
  double workingDays = 0;
  double actualWorkingDays = 0;

  // ─── Thu nhập ─────────────────────────────────────────────────────────
  double baseSalary = 0;
  double earnedBaseSalary = 0;
  double overtimeSalary = 0;
  double tripSalary = 0;
  double kmSalary = 0;
  double containerSalary = 0;
  double revenueSalary = 0;

  // ─── Phụ cấp ─────────────────────────────────────────────────────────
  double allowancePhone = 0;
  double allowanceMeal = 0;
  double allowanceNightStay = 0;
  double allowanceFuel = 0;
  double diligenceBonus = 0;

  // ─── Thưởng ──────────────────────────────────────────────────────────
  double safetyBonus = 0;
  double fuelSavingBonus = 0;
  double kpiBonus = 0;
  double monthlyBonus = 0;
  double otherBonus = 0;

  // ─── Khấu trừ bắt buộc ──────────────────────────────────────────────
  double bhxhEmployee = 0;      // BHXH NLĐ 8%
  double bhytEmployee = 0;      // BHYT NLĐ 1.5%
  double bhtnEmployee = 0;      // BHTN NLĐ 1%
  double bhxhEmployer = 0;      // BHXH NSDL 17.5%
  double bhytEmployer = 0;      // BHYT NSDL 3%
  double bhtnEmployer = 0;      // BHTN NSDL 1%
  double unionFee = 0;          // Kinh phí công đoàn 2%

  // ─── Thuế & Khấu trừ khác ───────────────────────────────────────────
  double personalIncomeTax = 0;
  double advanceDeduction = 0;
  double otherDeduction = 0;

  // ─── Tổng ────────────────────────────────────────────────────────────
  double grossSalary = 0;       // Tổng thu nhập
  double totalEmployeeDeductions = 0; // Tổng khấu trừ NLĐ
  double totalEmployerCost = 0; // Tổng chi phí NSDL
  double netSalary = 0;         // Thực lãnh

  String? notes;
  DateTime? generatedAt;

  // Sync
  String? remoteId;
  DateTime? lastSyncAt;
  bool needsSync = false;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  // ─── Helpers ─────────────────────────────────────────────────────────
  @ignore
  double get totalBhEmployee => bhxhEmployee + bhytEmployee + bhtnEmployee;
  @ignore
  double get totalBhEmployer => bhxhEmployer + bhytEmployer + bhtnEmployer + unionFee;
}
