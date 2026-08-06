import 'package:flutter/foundation.dart';
import '../models/attendance.dart';
import '../models/payroll.dart';
import '../models/employee.dart';
import '../models/driver.dart';
import 'database_service.dart';

/// Tính lương tự động từ chấm công
class PayrollCalculatorService {
  static PayrollCalculatorService? _instance;
  PayrollCalculatorService._();
  static PayrollCalculatorService get instance =>
      _instance ??= PayrollCalculatorService._();

  final _db = DatabaseService.instance;

  /// Tính lương cho toàn bộ nhân viên trong tháng
  Future<List<Payroll>> calculateMonthlyPayroll(int year, int month) async {
    try {
      debugPrint('PayrollCalculator: Fetching active employees');
      final employees = await _db.getActiveEmployees();
      debugPrint('PayrollCalculator: Found ${employees.length} active employees');
      
      if (employees.isEmpty) {
        debugPrint('PayrollCalculator: No active employees found for payroll calculation');
        return [];
      }

      debugPrint('PayrollCalculator: Fetching all drivers');
      final drivers = await _db.getAllDrivers();
      debugPrint('PayrollCalculator: Found ${drivers.length} drivers');
      final driverIds = {for (final d in drivers) d.employeeId: d};

      final results = <Payroll>[];
      debugPrint('PayrollCalculator: Starting loop through ${employees.length} employees');

      for (final emp in employees) {
        try {
          debugPrint('PayrollCalculator: Processing employee ${emp.employeeCode}');
          final attendance = await _db.getAttendanceByEmployee(emp.id, year, month);
          debugPrint('PayrollCalculator: Got attendance for ${emp.employeeCode}');
          
          final bonuses = await _db.getBonusByMonth(year, month);
          debugPrint('PayrollCalculator: Got bonuses for month');
          
          final empBonuses = bonuses.where((b) => b.employeeId == emp.id);
          final totalBonus = empBonuses.fold<double>(0, (s, b) => s + b.bonusAmount);
          debugPrint('PayrollCalculator: Total bonus for ${emp.employeeCode}: $totalBonus');

          final driver = driverIds[emp.id];
          Payroll payroll;

          if (driver != null) {
            debugPrint('PayrollCalculator: Calculating driver payroll for ${emp.employeeCode}');
            payroll = await _calculateDriverPayroll(
                emp, driver, attendance, totalBonus, year, month);
          } else {
            debugPrint('PayrollCalculator: Calculating office payroll for ${emp.employeeCode}');
            payroll = _calculateOfficePayroll(
                emp, attendance, totalBonus, year, month);
          }

          results.add(payroll);
          debugPrint('PayrollCalculator: Completed payroll for ${emp.employeeCode}');
        } catch (e, stack) {
          debugPrint('PayrollCalculator: Error calculating payroll for employee ${emp.employeeCode}: $e\n$stack');
          // Continue with other employees even if one fails
        }
      }

      debugPrint('PayrollCalculator: Completed all calculations, returning ${results.length} results');
      return results;
    } catch (e, stack) {
      debugPrint('PayrollCalculator: Error in calculateMonthlyPayroll: $e\n$stack');
      rethrow;
    }
  }

  /// Tính lương tài xế
  Future<Payroll> _calculateDriverPayroll(
    Employee emp,
    Driver driver,
    Attendance? attendance,
    double totalBonus,
    int year,
    int month,
  ) async {
    final p = Payroll()
      ..employeeId = emp.id
      ..employeeCode = emp.employeeCode
      ..employeeName = emp.fullName
      ..department = emp.department
      ..position = emp.position
      ..isDriver = true
      ..year = year
      ..month = month
      ..baseSalary = driver.baseSalary;

    if (attendance != null) {
      // Lương chuyến
      p.tripSalary = attendance.totalTrips * driver.salaryPerTrip;
      // Lương km
      p.kmSalary = attendance.totalKm * driver.salaryPerKm;
      // Lương container
      p.containerSalary = attendance.totalContainers * driver.salaryPerKm;

      // Phụ cấp
      p.allowancePhone = driver.allowancePhone;
      p.allowanceMeal = driver.allowanceMeal;
      p.allowanceNightStay = driver.allowanceNightStay;
      p.allowanceFuel = driver.allowanceFuel;
    }

    p.kpiBonus = totalBonus;

    // Tổng thu nhập
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

    // Khấu trừ bảo hiểm
    if (emp.hasSocialInsurance) {
      final insuranceBase = emp.baseSalary;
      p.socialInsurance = insuranceBase * emp.socialInsuranceRate / 100;
      p.healthInsurance = insuranceBase * emp.healthInsuranceRate / 100;
      p.unemploymentInsurance =
          insuranceBase * emp.unemploymentInsuranceRate / 100;
    }

    // Thuế TNCN (biểu thuế lũy tiến)
    p.personalIncomeTax = _calculatePIT(
      p.grossSalary - p.socialInsurance - p.healthInsurance - p.unemploymentInsurance,
      emp.dependents,
    );

    p.totalDeductions = p.socialInsurance +
        p.healthInsurance +
        p.unemploymentInsurance +
        p.personalIncomeTax +
        p.violationPenalty +
        p.accidentPenalty +
        p.cargoPenalty +
        p.advanceDeduction;

    p.netSalary = p.grossSalary - p.totalDeductions;
    return p;
  }

  /// Tính lương nhân viên văn phòng
  Payroll _calculateOfficePayroll(
    Employee emp,
    Attendance? attendance,
    double totalBonus,
    int year,
    int month,
  ) {
    final p = Payroll()
      ..employeeId = emp.id
      ..employeeCode = emp.employeeCode
      ..employeeName = emp.fullName
      ..department = emp.department
      ..position = emp.position
      ..isDriver = false
      ..year = year
      ..month = month
      ..baseSalary = emp.baseSalary;

    const standardDays = 26.0;

    if (attendance != null) {
      p.workingDays = standardDays;
      p.actualWorkingDays = attendance.workingDays;
      p.earnedBaseSalary = emp.baseSalary * attendance.workingDays / standardDays;
      p.overtimeSalary = attendance.overtimeHours *
          (emp.baseSalary / standardDays / 8) * 1.5;
      p.diligenceBonus = attendance.lateDays == 0 ? 200000 : 0;
    } else {
      p.earnedBaseSalary = emp.baseSalary;
    }

    // Phụ cấp
    p.allowancePhone = emp.allowancePhone;
    p.allowanceMeal = emp.allowanceMeal;
    p.allowanceFuel = emp.allowanceTransport; // map transport→fuel
    p.monthlyBonus = totalBonus;

    // Tổng
    p.grossSalary = p.earnedBaseSalary +
        p.overtimeSalary +
        p.diligenceBonus +
        p.allowancePhone +
        p.allowanceMeal +
        p.allowanceFuel +
        p.monthlyBonus;

    // BHXH
    if (emp.hasSocialInsurance) {
      final base = emp.baseSalary;
      p.socialInsurance = base * emp.socialInsuranceRate / 100;
      p.healthInsurance = base * emp.healthInsuranceRate / 100;
      p.unemploymentInsurance = base * emp.unemploymentInsuranceRate / 100;
    }

    // Thuế TNCN
    p.personalIncomeTax = _calculatePIT(
      p.grossSalary - p.socialInsurance - p.healthInsurance - p.unemploymentInsurance,
      emp.dependents,
    );

    p.totalDeductions = p.socialInsurance +
        p.healthInsurance +
        p.unemploymentInsurance +
        p.personalIncomeTax +
        p.advanceDeduction;

    p.netSalary = p.grossSalary - p.totalDeductions;
    return p;
  }

  /// Thuế TNCN theo biểu lũy tiến VN (2024)
  double _calculatePIT(double taxableIncome, int dependents) {
    // Giảm trừ bản thân: 11 triệu/tháng
    // Giảm trừ người phụ thuộc: 4.4 triệu/người/tháng
    const personalDeduction = 11000000.0;
    const dependentDeduction = 4400000.0;

    final totalDeduction = personalDeduction + dependents * dependentDeduction;
    final netTaxable = taxableIncome - totalDeduction;

    if (netTaxable <= 0) return 0;

    // Biểu thuế lũy tiến 7 bậc
    double tax = 0;
    if (netTaxable <= 5000000) {
      tax = netTaxable * 0.05;
    } else if (netTaxable <= 10000000) {
      tax = 250000 + (netTaxable - 5000000) * 0.10;
    } else if (netTaxable <= 18000000) {
      tax = 750000 + (netTaxable - 10000000) * 0.15;
    } else if (netTaxable <= 32000000) {
      tax = 1950000 + (netTaxable - 18000000) * 0.20;
    } else if (netTaxable <= 52000000) {
      tax = 4750000 + (netTaxable - 32000000) * 0.25;
    } else if (netTaxable <= 80000000) {
      tax = 9750000 + (netTaxable - 52000000) * 0.30;
    } else {
      tax = 18150000 + (netTaxable - 80000000) * 0.35;
    }

    return tax;
  }
}
