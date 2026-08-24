import 'package:isar/isar.dart';

import '../models/attendance.dart';
import '../models/payroll.dart';
import '../models/employee.dart';
import '../models/driver.dart';
import '../models/trip.dart';
import '../models/kpi.dart';
import 'database_service.dart';

/// Tính lương tự động từ chấm công + kỷ luật + thưởng (nhansu.md §9/§11/§12).
class PayrollCalculatorService {
  static PayrollCalculatorService? _instance;
  PayrollCalculatorService._();
  static PayrollCalculatorService get instance =>
      _instance ??= PayrollCalculatorService._();

  final _db = DatabaseService.instance;

  /// Tính lương cho toàn bộ nhân viên trong tháng (dùng DB của app).
  Future<List<Payroll>> calculateMonthlyPayroll(int year, int month) =>
      calculateMonthlyPayrollFor(year, month, null);

  /// Bản cho phép test inject Isar riêng.
  Future<List<Payroll>> calculateMonthlyPayrollFor(
      int year, int month, Isar? isarOverride) async {
    final Isar isar;
    if (isarOverride != null) {
      isar = isarOverride;
    } else {
      isar = _db.isar;
    }

    final employees =
        await isar.employees.filter().statusEqualTo(EmployeeStatus.active).findAll();
    if (employees.isEmpty) return [];

    final drivers = await isar.drivers.where().findAll();
    final driverByEmpId = {for (final d in drivers) d.employeeId: d};

    final attendances = await isar.attendances
        .filter()
        .yearEqualTo(year)
        .monthEqualTo(month)
        .findAll();
    final attendanceByEmpId = {for (final a in attendances) a.employeeId: a};

    // Thưởng tháng (§11) — query MỘT lần ngoài vòng lặp (trước đây query N lần).
    final bonuses =
        await isar.bonusRecords.filter().yearEqualTo(year).monthEqualTo(month).findAll();

    // Kỷ luật trong tháng (§12) -> phạt trừ vào lương (trước đây bị bỏ qua).
    final disciplines = await isar.disciplineRecords.where().findAll();
    double penaltyOf(int empId) => disciplines
        .where((x) =>
            x.employeeId == empId &&
            x.violationDate.year == year &&
            x.violationDate.month == month)
        .fold<double>(0, (s, x) => s + x.penaltyAmount);

    double revenueOf(int driverEmpId) {
      final start = DateTime(year, month, 1);
      final end = DateTime(year, month + 1, 0, 23, 59, 59);
      return isar.trips
          .filter()
          .mainDriverIdEqualTo(driverEmpId)
          .tripDateBetween(start, end)
          .statusEqualTo(TripStatus.completed)
          .findAllSync()
          .fold<double>(0, (s, t) => s + (t.revenue ?? 0));
    }

    final results = <Payroll>[];
    for (final empRec in employees) {
      final bonusTotal = bonuses
          .where((b) => b.employeeId == empRec.id)
          .fold<double>(0, (s, b) => s + b.bonusAmount);
      final penalty = penaltyOf(empRec.id);

      final driverCfg = driverByEmpId[empRec.id];
      final att = attendanceByEmpId[empRec.id];

      final payroll = driverCfg != null
          ? buildDriverPayroll(
              year: year,
              month: month,
              employee: empRec,
              driver: driverCfg,
              attendance: att,
              bonusTotal: bonusTotal,
              penaltyTotal: penalty,
              monthRevenue: revenueOf(empRec.id),
            )
          : buildOfficePayroll(
              year: year,
              month: month,
              employee: empRec,
              attendance: att,
              bonusTotal: bonusTotal,
              penaltyTotal: penalty,
            );
      results.add(payroll);
    }
    return results;
  }

  // ══════════════════ HÀM THUẦN (test được không cần DB) ══════════════════

  /// Lương tài xế: cơ bản + chuyến + km + container + % doanh thu +
  /// phụ cấp + thưởng - phạt - BHXH - thuế TNCN.
  static Payroll buildDriverPayroll({
    required int year,
    required int month,
    required Employee employee,
    required Driver driver,
    Attendance? attendance,
    double bonusTotal = 0,
    double penaltyTotal = 0,
    double monthRevenue = 0,
  }) {
    final p = _base(employee, true, year, month);
    p.baseSalary = driver.baseSalary;
    p.workingDays = 26;

    if (attendance != null) {
      p.actualWorkingDays = attendance.totalTrips.toDouble();
      p.tripSalary = attendance.totalTrips * driver.salaryPerTrip;
      p.kmSalary = attendance.totalKm * driver.salaryPerKm;
      // FIX: trước đây nhân nhầm đơn giá salaryPerKm.
      p.containerSalary =
          attendance.totalContainers * driver.salaryPerContainer;
    }
    // FIX: lương theo doanh thu (% trên doanh thu chuyến hoàn thành).
    p.revenueSalary =
        monthRevenue * driver.revenueSharePercent / 100;

    p.allowancePhone = driver.allowancePhone;
    p.allowanceMeal = driver.allowanceMeal;
    p.allowanceNightStay = driver.allowanceNightStay;
    p.allowanceFuel = driver.allowanceFuel;

    p.kpiBonus = bonusTotal;
    // Phạt kỷ luật trừ thẳng vào lương (violationPenalty làm dòng tổng).
    p.violationPenalty = penaltyTotal;

    p.grossSalary = p.baseSalary +
        p.tripSalary +
        p.kmSalary +
        p.containerSalary +
        p.revenueSalary +
        p.allowancePhone +
        p.allowanceMeal +
        p.allowanceNightStay +
        p.allowanceFuel +
        p.safetyBonus +
        p.fuelSavingBonus +
        p.kpiBonus +
        p.monthlyBonus;

    // FIX: BHXH tính trên lương cơ bản CỦA TÀI XẾ (trước đây lấy lương
    // văn phòng trong Employee -> tài xế bị BHXH = 0 nếu emp.baseSalary = 0).
    _applyInsuranceAndTax(p, employee, driver.baseSalary);
    return p;
  }

  /// Lương văn phòng: lương theo ngày công thực tế + OT 150% +
  /// chuyên cần + phụ cấp + thưởng - khấu trừ.
  static Payroll buildOfficePayroll({
    required int year,
    required int month,
    required Employee employee,
    Attendance? attendance,
    double bonusTotal = 0,
    double penaltyTotal = 0,
  }) {
    final p = _base(employee, false, year, month);
    p.baseSalary = employee.baseSalary;

    const standardDays = 26.0;
    p.workingDays = standardDays;
    if (attendance != null) {
      p.actualWorkingDays = attendance.workingDays;
      p.earnedBaseSalary =
          employee.baseSalary * attendance.workingDays / standardDays;
      p.overtimeSalary =
          attendance.overtimeHours * (employee.baseSalary / standardDays / 8) * 1.5;
      p.diligenceBonus = attendance.lateDays == 0 ? 200000 : 0;
    } else {
      p.earnedBaseSalary = employee.baseSalary;
      p.actualWorkingDays = standardDays;
    }

    p.allowancePhone = employee.allowancePhone;
    p.allowanceMeal = employee.allowanceMeal;
    p.allowanceFuel = employee.allowanceTransport;
    p.monthlyBonus = bonusTotal;
    p.otherPenalty = penaltyTotal;

    p.grossSalary = p.earnedBaseSalary +
        p.overtimeSalary +
        p.diligenceBonus +
        p.allowancePhone +
        p.allowanceMeal +
        p.allowanceFuel +
        p.monthlyBonus;

    _applyInsuranceAndTax(p, employee, employee.baseSalary);
    return p;
  }

  static Payroll _base(Employee e, bool isDriver, int year, int month) =>
      Payroll()
        ..employeeId = e.id
        ..employeeCode = e.employeeCode
        ..employeeName = e.fullName
        ..department = e.department
        ..position = e.position
        ..isDriver = isDriver
        ..year = year
        ..month = month;

  static void _applyInsuranceAndTax(
      Payroll p, Employee employee, double insuranceBase) {
    if (employee.hasSocialInsurance) {
      p.socialInsurance = insuranceBase * employee.socialInsuranceRate / 100;
      p.healthInsurance = insuranceBase * employee.healthInsuranceRate / 100;
      p.unemploymentInsurance =
          insuranceBase * employee.unemploymentInsuranceRate / 100;
    }
    p.personalIncomeTax = calculatePIT(
      p.grossSalary -
          p.socialInsurance -
          p.healthInsurance -
          p.unemploymentInsurance,
      employee.dependents,
    );
    p.totalDeductions = p.socialInsurance +
        p.healthInsurance +
        p.unemploymentInsurance +
        p.personalIncomeTax +
        p.violationPenalty +
        p.accidentPenalty +
        p.cargoPenalty +
        p.otherPenalty +
        p.advanceDeduction;
    p.netSalary = p.grossSalary - p.totalDeductions;
  }

  /// Thuế TNCN theo biểu lũy tiến VN (7 bậc, giảm trừ 11tr + 4.4tr/người phụ thuộc).
  static double calculatePIT(double taxableIncome, int dependents) {
    const personalDeduction = 11000000.0;
    const dependentDeduction = 4400000.0;

    final netTaxable =
        taxableIncome - personalDeduction - dependents * dependentDeduction;
    if (netTaxable <= 0) return 0;

    if (netTaxable <= 5000000) return netTaxable * 0.05;
    if (netTaxable <= 10000000) return 250000 + (netTaxable - 5000000) * 0.10;
    if (netTaxable <= 18000000) {
      return 750000 + (netTaxable - 10000000) * 0.15;
    }
    if (netTaxable <= 32000000) {
      return 1950000 + (netTaxable - 18000000) * 0.20;
    }
    if (netTaxable <= 52000000) {
      return 4750000 + (netTaxable - 32000000) * 0.25;
    }
    if (netTaxable <= 80000000) {
      return 9750000 + (netTaxable - 52000000) * 0.30;
    }
    return 18150000 + (netTaxable - 80000000) * 0.35;
  }
}
