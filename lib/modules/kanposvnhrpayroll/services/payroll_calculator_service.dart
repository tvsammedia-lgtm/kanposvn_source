import 'package:isar/isar.dart';

import '../models/attendance.dart';
import '../models/payroll.dart';
import '../models/employee.dart';
import '../models/driver.dart';
import '../models/trip.dart';
import '../models/kpi.dart';
import '../models/accounting_entry.dart';
import '../models/payslip.dart';
import 'database_service.dart';

/// Tính lương tự động từ chấm công + kỷ luật + thưởng (nhansu.md §9/§11/§12).
/// Bổ sung: hạch toán TT133, phí BCNLĐ,.generate payslip.
class PayrollCalculatorService {
  static PayrollCalculatorService? _instance;
  PayrollCalculatorService._();
  static PayrollCalculatorService get instance =>
      _instance ??= PayrollCalculatorService._();

  final _db = DatabaseService.instance;

  // ══════════════════ TỶ LỆ PHÍ BCNLĐ (Circular 26/2023-BLĐTBXH) ══════════════════
  // NLĐ (employee) đóng:
  static const double bhxhEmployeeRate = 8.0;
  static const double bhytEmployeeRate = 1.5;
  static const double bhtnEmployeeRate = 1.0;

  // NSDL (employer) đóng:
  static const double bhxhEmployerRate = 17.5;
  static const double bhytEmployerRate = 3.0;
  static const double bhtnEmployerRate = 1.0;
  static const double unionFeeRate = 2.0;

  // ══════════════════ BIẾU THUẾ TNCN LŨY TIẾN 7 BẬC (TT111/2013/TT-BTC) ══════════════════
  /// [TaxGrade, TaxRate, FromMonth, ToMonth]
  static const List<List<double>> _pitBrackets = [
    [1, 0.05, 0, 5000000],
    [2, 0.10, 5000001, 10000000],
    [3, 0.15, 10000001, 18000000],
    [4, 0.20, 18000001, 32000000],
    [5, 0.25, 32000001, 52000000],
    [6, 0.30, 52000001, 80000000],
    [7, 0.35, 80000001, 999999999],
  ];

  static const double personalDeduction = 11000000.0;
  static const double dependentDeduction = 4400000.0;

  /// Tính lương cho toàn bộ nhân viên trong tháng (dùng DB của app).
  Future<List<Payroll>> calculateMonthlyPayroll(int year, int month) =>
      calculateMonthlyPayrollFor(year, month, null);

  /// Bản cho phép test inject Isar riêng.
  Future<List<Payroll>> calculateMonthlyPayrollFor(
      int year, int month, Isar? isarOverride) async {
    final Isar isar = isarOverride ?? _db.isar;

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

    // Thưởng tháng (§11) — query MỘT lần ngoài vòng lặp.
    final bonuses =
        await isar.bonusRecords.filter().yearEqualTo(year).monthEqualTo(month).findAll();

    // Kỷ luật trong tháng (§12) -> phạt trừ vào lương.
    final disciplines = await isar.disciplineRecords.where().findAll();
    double penaltyOf(int empId) => disciplines
        .where((x) =>
            x.employeeId == empId &&
            x.violationDate.year == year &&
            x.violationDate.month == month)
        .fold<double>(0, (s, x) => s + x.penaltyAmount);

    Future<double> revenueOf(int driverEmpId) async {
      final start = DateTime(year, month, 1);
      final end = DateTime(year, month + 1, 0, 23, 59, 59);
      final trips = await isar.trips
          .filter()
          .mainDriverIdEqualTo(driverEmpId)
          .tripDateBetween(start, end)
          .statusEqualTo(TripStatus.completed)
          .findAll();
      return trips.fold<double>(0, (s, t) => s + (t.revenue ?? 0));
    }

    final results = <Payroll>[];
    for (final empRec in employees) {
      final bonusTotal = bonuses
          .where((b) => b.employeeId == empRec.id)
          .fold<double>(0, (s, b) => s + b.bonusAmount);
      final penalty = penaltyOf(empRec.id);

      final driverCfg = driverByEmpId[empRec.id];
      final att = attendanceByEmpId[empRec.id];

      final monthRevenue = driverCfg != null ? await revenueOf(empRec.id) : 0.0;

      final payroll = driverCfg != null
          ? buildDriverPayroll(
              year: year,
              month: month,
              employee: empRec,
              driver: driverCfg,
              attendance: att,
              bonusTotal: bonusTotal,
              penaltyTotal: penalty,
              monthRevenue: monthRevenue,
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
      p.containerSalary =
          attendance.totalContainers * driver.salaryPerContainer;
    }
    p.revenueSalary =
        monthRevenue * driver.revenueSharePercent / 100;

    p.allowancePhone = driver.allowancePhone;
    p.allowanceMeal = driver.allowanceMeal;
    p.allowanceNightStay = driver.allowanceNightStay;
    p.allowanceFuel = driver.allowanceFuel;

    p.kpiBonus = bonusTotal;
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

  /// Tính BHXH/BHYT/BHTN cả NLĐ + NSDL, thuế TNCN, tổng khấu trừ.
  static void _applyInsuranceAndTax(
      Payroll p, Employee employee, double insuranceBase) {
    if (employee.hasSocialInsurance) {
      // NLĐ đóng
      p.socialInsurance =
          (insuranceBase * bhxhEmployeeRate / 100).roundToDouble();
      p.healthInsurance =
          (insuranceBase * bhytEmployeeRate / 100).roundToDouble();
      p.unemploymentInsurance =
          (insuranceBase * bhtnEmployeeRate / 100).roundToDouble();

      // NSDL đóng (§17 nhansu.md — chi phí BCNLĐ)
      p.employerBhxh =
          (insuranceBase * bhxhEmployerRate / 100).roundToDouble();
      p.employerBhyt =
          (insuranceBase * bhytEmployerRate / 100).roundToDouble();
      p.employerBhtn =
          (insuranceBase * bhtnEmployerRate / 100).roundToDouble();
    }

    // Kinh phí công đoàn 2% (trên lương cơ bản, trần 20x lương cơ sở)
    const salaryFloor = 2340000.0;
    const maxContribBase = 20 * salaryFloor;
    final unionBase = insuranceBase.clamp(0, maxContribBase);
    p.unionFee = (unionBase * unionFeeRate / 100).roundToDouble();

    // Thuế TNCN trên thu nhập chịu thuế
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
        p.advanceDeduction +
        p.otherDeduction;

    // Tổng chi phí NSDL = lương gross + phần NSDL đóng
    p.totalEmployerCost = p.grossSalary +
        p.employerBhxh +
        p.employerBhyt +
        p.employerBhtn +
        p.unionFee;

    p.netSalary = p.grossSalary - p.totalDeductions;
  }

  /// Thuế TNCN theo biểu lũy tiến VN (7 bậc, giảm trừ 11tr + 4.4tr/NPT).
  /// Nguồn: TT111/2013/TT-BTC + các thông tư sửa đổi.
  static double calculatePIT(double taxableIncome, int dependents) {
    final netTaxable =
        taxableIncome - personalDeduction - dependents * dependentDeduction;
    if (netTaxable <= 0) return 0;

    double accumulatedTax = 0;
    double prevUpper = 0;
    for (final bracket in _pitBrackets) {
      final rate = bracket[1];
      final upper = bracket[3];
      if (netTaxable <= upper) {
        return accumulatedTax + (netTaxable - prevUpper) * rate;
      }
      accumulatedTax += (upper - prevUpper) * rate;
      prevUpper = upper;
    }
    return accumulatedTax;
  }

  // ══════════════════ HẠCH TOÁN KẾ TOÁN TT133 (PASalaryExpense) ══════════════════

  /// Tạo journalID nhóm các bút toán cùng 1 bảng lương.
  static String makeJournalID(int year, int month) =>
      'JRN-${year.toString().padLeft(4, '0')}${month.toString().padLeft(2, '0')}-SAL';

  /// Tạo bút toán kế toán cho bảng lương tháng (PASalaryExpense).
  /// Dr 6422 — Chi phí lương + BCNLĐ
  /// Cr 334  — Phải trả NLĐ
  /// Cr 3383 — BHXH NSDL, 3384 — BHYT NSDL, 3385 — BHTN NSDL, 3382 — CĐ
  static AccountingEntry buildSalaryJournalEntry({
    required int year,
    required int month,
    required List<Payroll> payrolls,
    int sequenceNo = 1,
  }) {
    final totalGross = payrolls.fold<double>(0, (s, p) => s + p.grossSalary);
    final totalBhxhEmp = payrolls.fold<double>(0, (s, p) => s + p.employerBhxh);
    final totalBhytEmp = payrolls.fold<double>(0, (s, p) => s + p.employerBhyt);
    final totalBhtnEmp = payrolls.fold<double>(0, (s, p) => s + p.employerBhtn);
    final totalUnion = payrolls.fold<double>(0, (s, p) => s + p.unionFee);
    final totalDrCost = totalGross + totalBhxhEmp + totalBhytEmp + totalBhtnEmp + totalUnion;

    final voucherNo = 'GL-${year.toString().padLeft(4, '0')}/${month.toString().padLeft(2, '0')}-${sequenceNo.toString().padLeft(3, '0')}';
    final journalID = makeJournalID(year, month);

    return AccountingEntry()
      ..voucherNumber = voucherNo
      ..journalID = journalID
      ..year = year
      ..month = month
      ..entryType = EntryType.salary
      ..status = EntryStatus.draft
      ..postingDate = DateTime(year, month + 1, 5)
      ..documentDate = DateTime.now()
      ..refType = 4010
      ..description = 'Hạch toán chi phí lương tháng $month/$year - ${payrolls.length} nhân viên'
      ..totalDebit = totalDrCost
      ..totalCredit = totalDrCost
      ..isAutoGenerated = true
      ..createdBy = 'System';
  }

  /// Tạo dòng chi tiết bút toán DR/CR cho lương (GLVoucherDetail).
  static List<AccountingEntryLine> buildSalaryEntryLines({
    required String journalID,
    required List<Payroll> payrolls,
  }) {
    final totalGross = payrolls.fold<double>(0, (s, p) => s + p.grossSalary);
    final totalBhxhEmp = payrolls.fold<double>(0, (s, p) => s + p.employerBhxh);
    final totalBhytEmp = payrolls.fold<double>(0, (s, p) => s + p.employerBhyt);
    final totalBhtnEmp = payrolls.fold<double>(0, (s, p) => s + p.employerBhtn);
    final totalUnion = payrolls.fold<double>(0, (s, p) => s + p.unionFee);

    var lineNo = 0;
    return [
      AccountingEntryLine()
        ..journalID = journalID
        ..lineOrder = ++lineNo
        ..debitAccountNumber = '6422'
        ..creditAccountNumber = ''
        ..amount = totalGross
        ..description = 'Chi phí lương nhân viên',
      AccountingEntryLine()
        ..journalID = journalID
        ..lineOrder = ++lineNo
        ..debitAccountNumber = ''
        ..creditAccountNumber = '334'
        ..amount = totalGross
        ..description = 'Phải trả người lao động',
      AccountingEntryLine()
        ..journalID = journalID
        ..lineOrder = ++lineNo
        ..debitAccountNumber = '6422'
        ..creditAccountNumber = ''
        ..amount = totalBhxhEmp + totalBhytEmp + totalBhtnEmp + totalUnion
        ..description = 'Chi phí BCNLĐ NSDL',
      AccountingEntryLine()
        ..journalID = journalID
        ..lineOrder = ++lineNo
        ..debitAccountNumber = ''
        ..creditAccountNumber = '3383'
        ..amount = totalBhxhEmp
        ..description = 'BHXH phần NSDL đóng',
      AccountingEntryLine()
        ..journalID = journalID
        ..lineOrder = ++lineNo
        ..debitAccountNumber = ''
        ..creditAccountNumber = '3384'
        ..amount = totalBhytEmp
        ..description = 'BHYT phần NSDL đóng',
      AccountingEntryLine()
        ..journalID = journalID
        ..lineOrder = ++lineNo
        ..debitAccountNumber = ''
        ..creditAccountNumber = '3385'
        ..amount = totalBhtnEmp
        ..description = 'BHTN phần NSDL đóng',
      AccountingEntryLine()
        ..journalID = journalID
        ..lineOrder = ++lineNo
        ..debitAccountNumber = ''
        ..creditAccountNumber = '3382'
        ..amount = totalUnion
        ..description = 'Kinh phí công đoàn 2%',
    ];
  }

  /// Bút toán khấu trừ thuế TNCN: Dr 334 / Cr 3335.
  static AccountingEntry buildPitJournalEntry({
    required int year,
    required int month,
    required List<Payroll> payrolls,
    int sequenceNo = 2,
  }) {
    final totalPit = payrolls.fold<double>(0, (s, p) => s + p.personalIncomeTax);
    final voucherNo = 'GL-${year.toString().padLeft(4, '0')}/${month.toString().padLeft(2, '0')}-${sequenceNo.toString().padLeft(3, '0')}';
    final journalID = '${makeJournalID(year, month)}-PIT';

    return AccountingEntry()
      ..voucherNumber = voucherNo
      ..journalID = journalID
      ..year = year
      ..month = month
      ..entryType = EntryType.pit
      ..status = EntryStatus.draft
      ..postingDate = DateTime(year, month + 1, 5)
      ..documentDate = DateTime.now()
      ..refType = 4010
      ..description = 'Khấu trừ thuế TNCN tháng $month/$year'
      ..totalDebit = totalPit
      ..totalCredit = totalPit
      ..isAutoGenerated = true
      ..createdBy = 'System';
  }

  /// Bút toán chi tiền lương: Dr 334 / Cr 112 (CAPayment/BAWithDraw).
  static AccountingEntry buildPaymentJournalEntry({
    required int year,
    required int month,
    required List<Payroll> payrolls,
    int sequenceNo = 3,
    String paymentMethod = 'bank',
  }) {
    final totalNet = payrolls.fold<double>(0, (s, p) => s + p.netSalary);
    final prefix = paymentMethod == 'cash' ? 'PC' : 'BA';
    final voucherNo = '$prefix-${year.toString().padLeft(4, '0')}/${month.toString().padLeft(2, '0')}-${sequenceNo.toString().padLeft(3, '0')}';
    final journalID = '${makeJournalID(year, month)}-PAY';

    return AccountingEntry()
      ..voucherNumber = voucherNo
      ..journalID = journalID
      ..year = year
      ..month = month
      ..entryType = EntryType.payment
      ..status = EntryStatus.draft
      ..postingDate = DateTime(year, month + 1, 10)
      ..documentDate = DateTime.now()
      ..refType = paymentMethod == 'cash' ? 111 : 112
      ..description = 'Chi tiền lương tháng $month/$year qua ${paymentMethod == 'cash' ? 'tiền mặt' : 'ngân hàng'}'
      ..totalDebit = totalNet
      ..totalCredit = totalNet
      ..paymentMethod = paymentMethod
      ..isAutoGenerated = true
      ..createdBy = 'System';
  }

  /// Bút toán tạm ứng: Dr 141 / Cr 112.
  static AccountingEntry buildAdvanceJournalEntry({
    required int year,
    required int month,
    required String employeeCode,
    required String employeeName,
    required double amount,
    int sequenceNo = 4,
  }) {
    final voucherNo = 'TU-${year.toString().padLeft(4, '0')}/${month.toString().padLeft(2, '0')}-${sequenceNo.toString().padLeft(3, '0')}';
    final journalID = 'JRN-${year.toString().padLeft(4, '0')}${month.toString().padLeft(2, '0')}-ADV-$employeeCode';

    return AccountingEntry()
      ..voucherNumber = voucherNo
      ..journalID = journalID
      ..year = year
      ..month = month
      ..entryType = EntryType.advance
      ..status = EntryStatus.draft
      ..postingDate = DateTime(year, month + 1, 3)
      ..documentDate = DateTime.now()
      ..refType = 141
      ..description = 'Tạm ứng lương $employeeName'
      ..employeeCode = employeeCode
      ..employeeName = employeeName
      ..totalDebit = amount
      ..totalCredit = amount
      ..isAutoGenerated = false
      ..createdBy = 'System';
  }

  /// Bút toán thưởng: Dr 6422 / Cr 334.
  static AccountingEntry buildBonusJournalEntry({
    required int year,
    required int month,
    required List<Payroll> payrolls,
    int sequenceNo = 5,
  }) {
    final totalBonus = payrolls.fold<double>(0, (s, p) =>
        s + p.safetyBonus + p.fuelSavingBonus + p.kpiBonus + p.monthlyBonus + p.otherBonus);
    if (totalBonus <= 0) {
      return AccountingEntry()
        ..voucherNumber = ''
        ..journalID = ''
      ..year = year
      ..month = month
      ..entryType = EntryType.bonus
      ..postingDate = DateTime.now()
      ..documentDate = DateTime.now()
      ..totalDebit = 0
      ..totalCredit = 0;
    }

    final voucherNo = 'GL-${year.toString().padLeft(4, '0')}/${month.toString().padLeft(2, '0')}-${sequenceNo.toString().padLeft(3, '0')}';
    final journalID = '${makeJournalID(year, month)}-BON';

    return AccountingEntry()
      ..voucherNumber = voucherNo
      ..journalID = journalID
      ..year = year
      ..month = month
      ..entryType = EntryType.bonus
      ..status = EntryStatus.draft
      ..postingDate = DateTime(year, month + 1, 5)
      ..documentDate = DateTime.now()
      ..refType = 4010
      ..description = 'Hạch toán thưởng tháng $month/$year'
      ..totalDebit = totalBonus
      ..totalCredit = totalBonus
      ..isAutoGenerated = true
      ..createdBy = 'System';
  }

  // ══════════════════ TẠO PHIẾU LƯƠNG ══════════════════

  /// Tạo phiếu lương từ bản ghi payroll.
  static Payslip generatePayslip(Payroll p) {
    return Payslip()
      ..year = p.year
      ..month = p.month
      ..employeeId = p.employeeId
      ..employeeCode = p.employeeCode
      ..employeeName = p.employeeName
      ..department = p.department
      ..position = p.position
      ..workingDays = p.workingDays
      ..actualWorkingDays = p.actualWorkingDays
      ..baseSalary = p.baseSalary
      ..earnedBaseSalary = p.earnedBaseSalary
      ..overtimeSalary = p.overtimeSalary
      ..tripSalary = p.tripSalary
      ..kmSalary = p.kmSalary
      ..containerSalary = p.containerSalary
      ..revenueSalary = p.revenueSalary
      ..allowancePhone = p.allowancePhone
      ..allowanceMeal = p.allowanceMeal
      ..allowanceNightStay = p.allowanceNightStay
      ..allowanceFuel = p.allowanceFuel
      ..diligenceBonus = p.diligenceBonus
      ..safetyBonus = p.safetyBonus
      ..fuelSavingBonus = p.fuelSavingBonus
      ..kpiBonus = p.kpiBonus
      ..monthlyBonus = p.monthlyBonus
      ..otherBonus = p.otherBonus
      ..bhxhEmployee = p.socialInsurance
      ..bhytEmployee = p.healthInsurance
      ..bhtnEmployee = p.unemploymentInsurance
      ..bhxhEmployer = p.employerBhxh
      ..bhytEmployer = p.employerBhyt
      ..bhtnEmployer = p.employerBhtn
      ..unionFee = p.unionFee
      ..personalIncomeTax = p.personalIncomeTax
      ..advanceDeduction = p.advanceDeduction
      ..otherDeduction = p.otherDeduction
      ..grossSalary = p.grossSalary
      ..totalEmployeeDeductions = p.totalDeductions
      ..totalEmployerCost = p.totalEmployerCost
      ..netSalary = p.netSalary
      ..generatedAt = DateTime.now();
  }
}
