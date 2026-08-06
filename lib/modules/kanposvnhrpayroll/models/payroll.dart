import 'package:isar/isar.dart';

part 'payroll.g.dart';

enum PayrollStatus { draft, confirmed, paid }

@collection
class Payroll {
  Id id = Isar.autoIncrement;

  late int employeeId;
  late String employeeCode;
  late String employeeName;
  late String department;
  late String position;
  late bool isDriver;

  late int year;
  late int month;

  // Base
  double baseSalary = 0;
  double workingDays = 0;
  double actualWorkingDays = 0;

  // Earned base
  double earnedBaseSalary = 0;

  // Driver-specific earnings
  double tripSalary = 0;        // Lương chuyến
  double kmSalary = 0;          // Lương km
  double containerSalary = 0;   // Lương container
  double revenueSalary = 0;     // Lương theo doanh thu

  // Allowances
  double allowancePhone = 0;
  double allowanceMeal = 0;
  double allowanceNightStay = 0;
  double allowanceFuel = 0;
  double businessExpense = 0;

  // Office-specific
  double overtimeSalary = 0;
  double diligenceBonus = 0;

  // Bonuses
  double safetyBonus = 0;
  double fuelSavingBonus = 0;
  double kpiBonus = 0;
  double monthlyBonus = 0;
  double otherBonus = 0;

  // Penalties
  double violationPenalty = 0;
  double accidentPenalty = 0;
  double cargoPenalty = 0;
  double otherPenalty = 0;

  // Deductions
  double socialInsurance = 0;    // BHXH 8%
  double healthInsurance = 0;    // BHYT 1.5%
  double unemploymentInsurance = 0; // BHTN 1%
  double personalIncomeTax = 0;  // Thuế TNCN
  double advanceDeduction = 0;   // Tạm ứng
  double otherDeduction = 0;

  // Summary
  double grossSalary = 0;        // Tổng thu nhập
  double totalDeductions = 0;    // Tổng khấu trừ
  double netSalary = 0;          // Thực lĩnh

  @Enumerated(EnumType.name)
  PayrollStatus status = PayrollStatus.draft;

  String? notes;
  DateTime? paidDate;

  // Sync
  String? remoteId;
  DateTime? lastSyncAt;
  bool needsSync = false;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
