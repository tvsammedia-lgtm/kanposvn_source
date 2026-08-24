import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvnhrpayroll/models/attendance.dart';
import 'package:kanposvn/modules/kanposvnhrpayroll/models/driver.dart';
import 'package:kanposvn/modules/kanposvnhrpayroll/models/employee.dart';
import 'package:kanposvn/modules/kanposvnhrpayroll/models/kpi.dart';
import 'package:kanposvn/modules/kanposvnhrpayroll/models/leave_request.dart';
import 'package:kanposvn/modules/kanposvnhrpayroll/models/payroll.dart';
import 'package:kanposvn/modules/kanposvnhrpayroll/models/trip.dart';
import 'package:kanposvn/modules/kanposvnhrpayroll/models/vehicle.dart';
import 'package:kanposvn/modules/kanposvnhrpayroll/services/database_service.dart';
import 'package:kanposvn/modules/kanposvnhrpayroll/services/payroll_calculator_service.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

/// Stub path_provider để mở Isar trong môi trường test.
class _FakePathProvider extends PathProviderPlatform {
  final String dirPath;
  _FakePathProvider(this.dirPath);

  @override
  Future<String?> getApplicationDocumentsPath() async => dirPath;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late Isar isar;

  setUpAll(() async {
    // Nạp Isar core DLL từ pub cache (mạng test bị chặn).
    final dllName =
        Platform.isWindows ? r'windows\isar.dll' : 'libisar.so';
    File? dll;
    final root = Directory(
        r'C:\Users\Administrator\AppData\Local\Pub\Cache\hosted\pub.dev');
    if (root.existsSync()) {
      for (final e in root.listSync()) {
        if (e.path.contains('isar_flutter_libs') &&
            e is Directory &&
            File('${e.path}\\$dllName').existsSync()) {
          dll = File('${e.path}\\$dllName');
          break;
        }
      }
    }
    expect(dll, isNotNull, reason: 'Không tìm thấy isar.dll trong pub cache');
    await Isar.initializeIsarCore(download: false, libraries: {
      Abi.windowsX64: dll!.path,
    });

    tempDir = await Directory.systemTemp.createTemp('hrp_test_');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);

    DatabaseService.debugOverride = null;
    final svc = DatabaseService.instance;
    await svc.initialize();
    isar = svc.isar;
  });

  tearDownAll(() async {
    await isar.close(deleteFromDisk: true);
    if (tempDir.existsSync()) tempDir.deleteSync(recursive: true);
  });

  group('Seed dữ liệu mẫu HR Payroll', () {
    test('seedIfEmpty nạp đủ dữ liệu theo nhansu.md', () async {
      await DatabaseService.instance.seedIfEmpty();
      // Lần 2 phải bỏ qua (idempotent).
      await DatabaseService.instance.seedIfEmpty();

      expect(await isar.employees.count(), 23); // 15 văn phòng + 8 tài xế
      expect(await isar.drivers.count(), 8);
      expect(await isar.vehicles.count(), 10);
      expect(await isar.trips.count(), greaterThan(40));
      // Chấm công: 2 tháng x 23 người.
      expect(await isar.attendances.count(), 46);
      expect(await isar.kpiRecords.count(), 6);
      expect(await isar.bonusRecords.count(), 4);
      expect(await isar.disciplineRecords.count(), 3);
      expect(await isar.leaveRequests.count(), 4);
      // Bảng lương tháng trước được tính sẵn.
      final now = DateTime.now();
      final last = DateTime(now.year, now.month - 1);
      final payrolls = await DatabaseService.instance
          .getPayrollByMonth(last.year, last.month);
      expect(payrolls.length, 23);
      for (final p in payrolls) {
        expect(p.netSalary, greaterThan(0), reason: p.employeeCode);
        expect(p.status, PayrollStatus.paid);
      }
    });

    test('Đủ 6 phòng ban theo PRD §2', () async {
      final emps = await isar.employees.where().findAll();
      final depts = emps.map((e) => e.department).toSet();
      expect(
        depts,
        containsAll([
          'Ban Giám đốc',
          'Điều hành vận tải',
          'Phòng nhân sự',
          'Phòng kế toán',
          'Phòng kỹ thuật',
          'Phòng kho',
        ]),
      );
    });

    test('Dữ liệu biên: GPLX sắp hết hạn + xe hết hạn đăng kiểm + xe bảo dưỡng',
        () async {
      final now = DateTime.now();
      final soonLicense = await isar.drivers
          .filter()
          .licenseExpiryDateBetween(now, now.add(const Duration(days: 30)))
          .findAll();
      expect(soonLicense, isNotEmpty);

      final soonReg = await isar.vehicles
          .filter()
          .registrationExpiryBetween(now, now.add(const Duration(days: 30)))
          .findAll();
      expect(soonReg, isNotEmpty);

      final maintenance = await isar.vehicles
          .filter()
          .statusEqualTo(VehicleStatus.maintenance)
          .findAll();
      expect(maintenance, isNotEmpty);
    });

    test('Đơn nghỉ phép có đủ 3 trạng thái xử lý (§8)', () async {
      final leaves = await isar.leaveRequests.where().findAll();
      final statuses = leaves.map((l) => l.status).toSet();
      expect(statuses.contains(LeaveStatus.pending), true);
      expect(statuses.contains(LeaveStatus.approved), true);
      expect(statuses.contains(LeaveStatus.rejected), true);
    });
  });

  group('Tính lương end-to-end trên dữ liệu seed (§9)', () {
    late List<Payroll> payrolls;

    setUpAll(() async {
      final now = DateTime.now();
      payrolls = await PayrollCalculatorService.instance
          .calculateMonthlyPayrollFor(now.year, now.month, isar);
    });

    test('Tính đủ lương cho 23 nhân viên đang làm', () {
      expect(payrolls.length, 23);
    });

    test('Lương tài xế có lương chuyến/km từ chấm công', () async {
      final now = DateTime.now();
      final drivers = payrolls.where((p) => p.isDriver).toList();
      expect(drivers, isNotEmpty);
      for (final p in drivers) {
        final att = await isar.attendances
            .filter()
            .employeeIdEqualTo(p.employeeId)
            .yearEqualTo(now.year)
            .monthEqualTo(now.month)
            .findFirst();
        expect(att, isNotNull, reason: p.employeeCode);
        expect(p.tripSalary, att!.totalTrips * 350000, reason: p.employeeCode);
        expect(p.kmSalary, closeTo(att.totalKm * 1200, 0.01),
            reason: p.employeeCode);
      }
    });

    test('Nhân viên đi trễ mất thưởng chuyên cần, đúng số ngày công', () async {
      final now = DateTime.now();
      final officePayrolls =
          payrolls.where((p) => !p.isDriver).toList();
      for (final p in officePayrolls) {
        final att = await isar.attendances
            .filter()
            .employeeIdEqualTo(p.employeeId)
            .yearEqualTo(now.year)
            .monthEqualTo(now.month)
            .findFirst();
        expect(att, isNotNull, reason: p.employeeCode);
        expect(p.actualWorkingDays, att!.workingDays, reason: p.employeeCode);
        if (att.lateDays > 0) {
          expect(p.diligenceBonus, 0, reason: p.employeeCode);
        } else {
          expect(p.diligenceBonus, 200000, reason: p.employeeCode);
        }
      }
    });

    test('Thưởng tháng (§11) phản ánh vào bảng lương', () async {
      final now = DateTime.now();
      final allBonuses = await isar.bonusRecords.where().findAll();
      final bonusesThisMonth = allBonuses
          .where((b) => b.year == now.year && b.month == now.month)
          .toList();
      expect(bonusesThisMonth, isNotEmpty);
      for (final b in bonusesThisMonth) {
        final p = payrolls.firstWhere((x) => x.employeeId == b.employeeId);
        final bonusInPayroll =
            p.kpiBonus + p.safetyBonus + p.fuelSavingBonus + p.monthlyBonus;
        expect(bonusInPayroll, greaterThanOrEqualTo(b.bonusAmount),
            reason: b.employeeName);
      }
    });

    test('Kỷ luật tháng này trừ phạt vào bảng lương (§12)', () async {
      final now = DateTime.now();
      final allDisciplines = await isar.disciplineRecords.where().findAll();
      final disciplinesThisMonth = allDisciplines
          .where((d) =>
              d.violationDate.year == now.year &&
              d.violationDate.month == now.month)
          .toList();
      for (final d in disciplinesThisMonth) {
        final p = payrolls.firstWhere((x) => x.employeeId == d.employeeId);
        final totalPenalty = p.violationPenalty +
            p.accidentPenalty +
            p.cargoPenalty +
            p.otherPenalty;
        expect(totalPenalty, greaterThanOrEqualTo(d.penaltyAmount),
            reason: d.employeeName);
      }
    });

    test('Dashboard stats hợp lệ (§17)', () async {
      final now = DateTime.now();
      final stats = await DatabaseService.instance
          .getDashboardStats(now.year, now.month);
      expect(stats['totalEmployees'], 23);
      expect(stats['totalDrivers'], 8);
      expect(stats['activeVehicles'], greaterThan(0));
      expect(stats['maintenanceVehicles'], greaterThanOrEqualTo(1));
      expect(stats['totalTrips'], greaterThan(0));
      expect(stats['totalRevenue'], greaterThan(0));
      expect(
        stats['profit'],
        (stats['totalRevenue'] as double) -
            (stats['totalExpenses'] as double),
      );
    });
  });
}
