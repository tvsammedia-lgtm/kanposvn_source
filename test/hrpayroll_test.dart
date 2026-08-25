import 'package:flutter_test/flutter_test.dart';
import 'package:kanposvn/modules/kanposvnhrpayroll/models/attendance.dart';
import 'package:kanposvn/modules/kanposvnhrpayroll/models/driver.dart';
import 'package:kanposvn/modules/kanposvnhrpayroll/models/employee.dart';
import 'package:kanposvn/modules/kanposvnhrpayroll/models/accounting_entry.dart';
import 'package:kanposvn/modules/kanposvnhrpayroll/services/payroll_calculator_service.dart';

Employee _emp({double base = 10000000, int dependents = 0}) => Employee()
  ..employeeCode = 'NVTEST'
  ..fullName = 'Nhân viên test'
  ..department = 'Phòng kế toán'
  ..position = 'Kế toán'
  ..status = EmployeeStatus.active
  ..baseSalary = base
  ..dependents = dependents;

Driver _driver({
  double base = 9000000,
  double perTrip = 350000,
  double perKm = 1200,
  double perContainer = 150000,
  double revenuePct = 1.5,
}) =>
    Driver()
      ..employeeId = 1
      ..employeeCode = 'TXTEST'
      ..fullName = 'Tài xế test'
      ..baseSalary = base
      ..salaryPerTrip = perTrip
      ..salaryPerKm = perKm
      ..salaryPerContainer = perContainer
      ..revenueSharePercent = revenuePct
      ..allowancePhone = 200000
      ..allowanceMeal = 700000
      ..allowanceNightStay = 400000
      ..allowanceFuel = 0;

Attendance _att({
  double workingDays = 24,
  double otHours = 0,
  double lateDays = 0,
  int trips = 10,
  double km = 900,
  int containers = 8,
}) =>
    Attendance()
      ..employeeId = 1
      ..employeeCode = 'X'
      ..employeeName = 'X'
      ..year = 2026
      ..month = 8
      ..workingDays = workingDays
      ..overtimeHours = otHours
      ..lateDays = lateDays
      ..totalTrips = trips
      ..totalKm = km
      ..totalContainers = containers;

void main() {
  // ══════════════════ THUẾ TNCN 7 BẬC (§16) ══════════════════
  group('calculatePIT - biểu thuế lũy tiến', () {
    test('Thu nhập dưới ngưỡng giảm trừ -> 0 đồng', () {
      expect(PayrollCalculatorService.calculatePIT(8000000, 0), 0);
      expect(PayrollCalculatorService.calculatePIT(11000000, 0), 0);
      expect(
        PayrollCalculatorService.calculatePIT(15000000, 1),
        0,
        reason: '11tr bản thân + 4.4tr người phụ thuộc = 15.4tr',
      );
    });

    test('Bậc 1: 5% cho phần <= 5 triệu', () {
      final double taxable = 14000000; // sau giảm trừ còn 3tr
      expect(PayrollCalculatorService.calculatePIT(taxable, 0),
          closeTo(3000000 * 0.05, 0.01));
    });

    test('Bậc 2: biên 10% đúng công thức', () {
      final double taxable = 20000000; // còn 9tr -> 250k + 4tr*10%
      expect(PayrollCalculatorService.calculatePIT(taxable, 0),
          closeTo(650000, 0.01));
    });

    test('Bậc 3: biên 15%', () {
      final double taxable = 28000000; // còn 17tr -> 750k + 7tr*15%
      expect(PayrollCalculatorService.calculatePIT(taxable, 0),
          closeTo(1800000, 0.01));
    });

    test('Bậc 4: biên 20%', () {
      final double taxable = 42000000; // còn 31tr -> 1950k + 13tr*20%
      expect(PayrollCalculatorService.calculatePIT(taxable, 0),
          closeTo(4550000, 0.01));
    });

    test('Bậc 5: biên 25%', () {
      final double taxable = 62000000; // còn 51tr -> 4750k + 19tr*25%
      expect(PayrollCalculatorService.calculatePIT(taxable, 0),
          closeTo(9500000, 0.01));
    });

    test('Bậc 6: biên 30%', () {
      final double taxable = 90000000; // còn 79tr -> 9750k + 27tr*30%
      expect(PayrollCalculatorService.calculatePIT(taxable, 0),
          closeTo(17850000, 0.01));
    });

    test('Bậc 7: biên 35%', () {
      final double taxable = 200000000; // còn 189tr -> 18150k + 109tr*35%
      expect(PayrollCalculatorService.calculatePIT(taxable, 0),
          closeTo(56300000, 0.01));
    });

    test('Người phụ thuộc giảm trừ đúng 4.4tr/người/tháng', () {
      final double income = 40000000;
      final noDep = PayrollCalculatorService.calculatePIT(income, 0);
      final twoDep = PayrollCalculatorService.calculatePIT(income, 2);
      expect(twoDep, lessThan(noDep));
      // noDep: chịu thuế 29tr (bậc 4) = 1950k + 11tr*20% = 4.150k
      expect(noDep, closeTo(4150000, 0.01));
      // twoDep: chịu thuế 29 - 2x4.4 = 20.2tr (bậc 4) =
      // 1950k + 2.2tr*20% = 2.390k
      expect(twoDep, closeTo(2390000, 0.01));
    });
  });

  // ══════════════════ LƯƠNG VĂN PHÒNG (§9) ══════════════════
  group('buildOfficePayroll', () {
    test('Đủ ngày công, không trễ -> chuyên cần + OT 150%', () {
      final emp = _emp(base: 10400000)
        ..allowancePhone = 200000
        ..allowanceMeal = 600000
        ..allowanceTransport = 300000;
      final p = PayrollCalculatorService.buildOfficePayroll(
        year: 2026,
        month: 8,
        employee: emp,
        attendance: _att(workingDays: 26, otHours: 4, lateDays: 0),
        bonusTotal: 500000,
      );
      expect(p.year, 2026);
      expect(p.month, 8);
      expect(p.isDriver, false);
      expect(p.earnedBaseSalary, 10400000);
      // OT = 4h x (10.4tr/26/8) x 1.5 = 300000
      expect(p.overtimeSalary, closeTo(300000, 0.01));
      expect(p.diligenceBonus, 200000);
      expect(p.monthlyBonus, 500000);
      expect(
          p.grossSalary,
          closeTo(
              10400000 + 300000 + 200000 + 200000 + 600000 + 300000 + 500000,
              0.01));
      expect(p.socialInsurance, closeTo(10400000 * 0.08, 0.01));
      expect(p.healthInsurance, closeTo(10400000 * 0.015, 0.01));
      expect(p.unemploymentInsurance, closeTo(10400000 * 0.01, 0.01));
      expect(p.netSalary, closeTo(p.grossSalary - p.totalDeductions, 0.01));
    });

    test('Thiếu ngày công -> lương tính theo tỷ lệ ngày công thực', () {
      final p = PayrollCalculatorService.buildOfficePayroll(
        year: 2026,
        month: 8,
        employee: _emp(base: 13000000),
        attendance: _att(workingDays: 13),
      );
      expect(p.earnedBaseSalary, closeTo(13000000 * 13 / 26, 0.01));
    });

    test('Có ngày đi trễ -> mất thưởng chuyên cần', () {
      final p = PayrollCalculatorService.buildOfficePayroll(
        year: 2026,
        month: 8,
        employee: _emp(),
        attendance: _att(lateDays: 2),
      );
      expect(p.diligenceBonus, 0);
    });

    test('Phạt kỷ luật trừ vào tổng khấu trừ', () {
      final withPenalty = PayrollCalculatorService.buildOfficePayroll(
        year: 2026,
        month: 8,
        employee: _emp(),
        attendance: _att(workingDays: 26),
        penaltyTotal: 100000,
      );
      final without = PayrollCalculatorService.buildOfficePayroll(
        year: 2026,
        month: 8,
        employee: _emp(),
        attendance: _att(workingDays: 26),
      );
      expect(withPenalty.otherPenalty, 100000);
      expect(withPenalty.netSalary, closeTo(without.netSalary - 100000, 0.01));
    });
  });

  // ══════════════════ LƯƠNG TÀI XẾ (§4, §9) ══════════════════
  group('buildDriverPayroll', () {
    test('REGR containerSalary dùng đúng đơn giá salaryPerContainer', () {
      final p = PayrollCalculatorService.buildDriverPayroll(
        year: 2026,
        month: 8,
        employee: _emp(base: 0),
        driver: _driver(perContainer: 150000),
        attendance: _att(trips: 10, km: 900, containers: 8),
        monthRevenue: 0,
      );
      // Bug cũ: containers * salaryPerKm = 8 * 1200 = 9600
      expect(p.containerSalary, 8 * 150000);
    });

    test('Lương chuyến + km + % doanh thu chuyến hoàn thành', () {
      final p = PayrollCalculatorService.buildDriverPayroll(
        year: 2026,
        month: 8,
        employee: _emp(base: 0),
        driver: _driver(revenuePct: 1.5),
        attendance: _att(trips: 12, km: 1200, containers: 6),
        monthRevenue: 60000000,
      );
      expect(p.tripSalary, 12 * 350000);
      expect(p.kmSalary, 1200 * 1200);
      expect(p.revenueSalary, closeTo(60000000 * 1.5 / 100, 0.01));
    });

    test('BHXH tài xế tính trên LƯƠNG TÀI XẾ (bug cũ lấy lương văn phòng)',
        () {
      final emp = _emp(base: 0); // Employee.baseSalary = 0
      final p = PayrollCalculatorService.buildDriverPayroll(
        year: 2026,
        month: 8,
        employee: emp,
        driver: _driver(base: 9000000),
        attendance: _att(),
      );
      expect(p.socialInsurance, closeTo(9000000 * 0.08, 0.01));
      expect(p.healthInsurance, closeTo(9000000 * 0.015, 0.01));
      expect(p.unemploymentInsurance, closeTo(9000000 * 0.01, 0.01));
    });

    test('Phạt kỷ luật được trừ vào thực lĩnh', () {
      final withPenalty = PayrollCalculatorService.buildDriverPayroll(
        year: 2026,
        month: 8,
        employee: _emp(base: 0),
        driver: _driver(),
        attendance: _att(),
        penaltyTotal: 500000,
      );
      final without = PayrollCalculatorService.buildDriverPayroll(
        year: 2026,
        month: 8,
        employee: _emp(base: 0),
        driver: _driver(),
        attendance: _att(),
      );
      expect(withPenalty.violationPenalty, 500000);
      expect(withPenalty.netSalary, closeTo(without.netSalary - 500000, 0.01));
    });

    test('Không có chấm công vẫn có lương cơ bản + phụ cấp cấu hình', () {
      final p = PayrollCalculatorService.buildDriverPayroll(
        year: 2026,
        month: 8,
        employee: _emp(base: 0),
        driver: _driver(),
        attendance: null,
      );
      expect(p.baseSalary, 9000000);
      expect(p.allowancePhone, 200000);
      expect(p.allowanceMeal, 700000);
      expect(p.allowanceNightStay, 400000);
      expect(p.tripSalary, 0);
      expect(p.kmSalary, 0);
      expect(p.revenueSalary, 0);
    });
  });

  // ══════════════════ PHÍ BCNLĐ NSDL (Circular 26/2023) ══════════════════
  group('Employer insurance - chi phí BCNLĐ', () {
    test('BHXH NSDL 17.5% trên lương cơ bản', () {
      final p = PayrollCalculatorService.buildOfficePayroll(
        year: 2026,
        month: 8,
        employee: _emp(base: 10000000),
        attendance: _att(),
      );
      expect(p.employerBhxh, closeTo(1750000, 1));
    });

    test('BHYT NSDL 3% trên lương cơ bản', () {
      final p = PayrollCalculatorService.buildOfficePayroll(
        year: 2026,
        month: 8,
        employee: _emp(base: 10000000),
        attendance: _att(),
      );
      expect(p.employerBhyt, closeTo(300000, 1));
    });

    test('BHTN NSDL 1% trên lương cơ bản', () {
      final p = PayrollCalculatorService.buildOfficePayroll(
        year: 2026,
        month: 8,
        employee: _emp(base: 10000000),
        attendance: _att(),
      );
      expect(p.employerBhtn, closeTo(100000, 1));
    });

    test('Kinh phí công đoàn 2% trên lương cơ bản', () {
      final p = PayrollCalculatorService.buildOfficePayroll(
        year: 2026,
        month: 8,
        employee: _emp(base: 10000000),
        attendance: _att(),
      );
      expect(p.unionFee, closeTo(200000, 1));
    });

    test('totalEmployerCost = gross + NSDL đóng', () {
      final p = PayrollCalculatorService.buildOfficePayroll(
        year: 2026,
        month: 8,
        employee: _emp(base: 10000000),
        attendance: _att(),
      );
      expect(p.totalEmployerCost, greaterThan(p.grossSalary));
      expect(p.totalEmployerCost,
          closeTo(p.grossSalary + p.employerBhxh + p.employerBhyt + p.employerBhtn + p.unionFee, 1));
    });

    test('Tài xế BHXH NSDL tính trên driver.baseSalary (không phải emp.baseSalary)', () {
      final emp = _emp(base: 0); // emp.baseSalary = 0
      final p = PayrollCalculatorService.buildDriverPayroll(
        year: 2026,
        month: 8,
        employee: emp,
        driver: _driver(base: 9000000),
        attendance: _att(),
      );
      // BHXH NSDL 17.5% trên 9tr = 1,575,000 (không phải 0)
      expect(p.employerBhxh, closeTo(1575000, 1));
    });
  });

  // ══════════════════ BÚT TOÁN KẾ TOÁN TT133 ══════════════════
  group('Journal entries - hạch toán TT133', () {
    test('Bút toán lương DR 6422 / Cr 334', () {
      final emp = _emp(base: 10000000);
      final p = PayrollCalculatorService.buildOfficePayroll(
        year: 2026,
        month: 8,
        employee: emp,
        attendance: _att(),
      );
      final entry = PayrollCalculatorService.buildSalaryJournalEntry(
        year: 2026,
        month: 8,
        payrolls: [p],
      );
      expect(entry.voucherNumber, contains('GL-2026/08'));
      expect(entry.totalDebit, greaterThan(0));
      expect(entry.totalCredit, entry.totalDebit);
      expect(entry.status, EntryStatus.draft);
    });

    test('Dòng bút toán lương có đủ 7 dòng DR/CR', () {
      final p = PayrollCalculatorService.buildOfficePayroll(
        year: 2026,
        month: 8,
        employee: _emp(base: 10000000),
        attendance: _att(),
      );
      final entry = PayrollCalculatorService.buildSalaryJournalEntry(
        year: 2026,
        month: 8,
        payrolls: [p],
      );
      final lines = PayrollCalculatorService.buildSalaryEntryLines(
        journalID: entry.journalID,
        payrolls: [p],
      );
      expect(lines.length, 7);
      // Dr 6422 - Cr 334
      expect(lines[0].debitAccountNumber, '6422');
      expect(lines[1].creditAccountNumber, '334');
      // Dr 6422 - Cr 3383/3384/3385/3382
      expect(lines[3].creditAccountNumber, '3383');
      expect(lines[4].creditAccountNumber, '3384');
      expect(lines[5].creditAccountNumber, '3385');
      expect(lines[6].creditAccountNumber, '3382');
    });

    test('Bút toán thuế TNCN DR 334 / Cr 3335', () {
      final p = PayrollCalculatorService.buildOfficePayroll(
        year: 2026,
        month: 8,
        employee: _emp(base: 30000000),
        attendance: _att(),
      );
      final entry = PayrollCalculatorService.buildPitJournalEntry(
        year: 2026,
        month: 8,
        payrolls: [p],
      );
      expect(entry.voucherNumber, contains('GL-2026/08'));
      expect(entry.entryType, EntryType.pit);
      expect(entry.totalDebit, p.personalIncomeTax);
    });

    test('Bút toán chi lương DR 334 / Cr 112', () {
      final p = PayrollCalculatorService.buildOfficePayroll(
        year: 2026,
        month: 8,
        employee: _emp(base: 10000000),
        attendance: _att(),
      );
      final entry = PayrollCalculatorService.buildPaymentJournalEntry(
        year: 2026,
        month: 8,
        payrolls: [p],
      );
      expect(entry.voucherNumber, contains('BA-2026/08'));
      expect(entry.entryType, EntryType.payment);
      expect(entry.totalDebit, p.netSalary);
    });

    test('Tổng Nợ = Tổng Có (double-entry)', () {
      final p1 = PayrollCalculatorService.buildOfficePayroll(
        year: 2026, month: 8, employee: _emp(base: 10000000), attendance: _att());
      final p2 = PayrollCalculatorService.buildOfficePayroll(
        year: 2026, month: 8, employee: _emp(base: 15000000), attendance: _att());
      final entry = PayrollCalculatorService.buildSalaryJournalEntry(
        year: 2026, month: 8, payrolls: [p1, p2],
      );
      expect(entry.totalDebit, entry.totalCredit);
    });
  });

  // ══════════════════ PHIẾU LƯƠNG ══════════════════
  group('Payslip generation', () {
    test('Phiếu lương có đủ thông tin NLĐ + NSDL', () {
      final p = PayrollCalculatorService.buildOfficePayroll(
        year: 2026,
        month: 8,
        employee: _emp(base: 10000000, dependents: 1),
        attendance: _att(workingDays: 24),
      );
      final slip = PayrollCalculatorService.generatePayslip(p);
      expect(slip.year, 2026);
      expect(slip.month, 8);
      expect(slip.baseSalary, 10000000);
      expect(slip.bhxhEmployee, p.socialInsurance);
      expect(slip.bhxhEmployer, p.employerBhxh);
      expect(slip.unionFee, p.unionFee);
      expect(slip.netSalary, p.netSalary);
      expect(slip.totalEmployerCost, p.totalEmployerCost);
    });
  });
}
