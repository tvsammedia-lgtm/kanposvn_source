import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/employee.dart';
import '../models/driver.dart';
import '../models/vehicle.dart';
import '../models/trip.dart';
import '../models/attendance.dart';
import '../models/payroll.dart';
import '../models/kpi.dart';
import '../models/leave_request.dart';
import '../models/account.dart';
import '../models/accounting_entry.dart';
import '../models/payslip.dart';
import '../models/account_default.dart';
import '../seed/hrpayroll_seed_data.dart';

class DatabaseService {
  static DatabaseService? _instance;
  static Isar? _isar;

  /// Cho phép test inject Isar riêng (temp dir) thay vì DB thật.
  static Isar? debugOverride;

  DatabaseService._();
  static DatabaseService get instance => _instance ??= DatabaseService._();

  Isar get isar {
    if (debugOverride != null && debugOverride!.isOpen) return debugOverride!;
    if (_isar == null) throw Exception('Isar not initialized');
    return _isar!;
  }

  Future<void> initialize() async {
    if (debugOverride != null && debugOverride!.isOpen) return;
    if (_isar != null && _isar!.isOpen) return;
    const name = 'hrpayroll_db';
    final existing = Isar.getInstance(name);
    if (existing != null && existing.isOpen) {
      _isar = existing;
      return;
    }
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [
        EmployeeSchema,
        DriverSchema,
        VehicleSchema,
        TripSchema,
        AttendanceSchema,
        PayrollSchema,
        KpiRecordSchema,
        DisciplineRecordSchema,
        BonusRecordSchema,
        LeaveRequestSchema,
        AccountSchema,
        AccountingEntrySchema,
        AccountingEntryLineSchema,
        PayslipSchema,
        AccountDefaultSchema,
      ],
      directory: dir.path,
      name: name,
    );
  }

  // ─── Employee CRUD ────────────────────────────────────────────────────────
  Future<List<Employee>> getAllEmployees() async =>
      isar.employees.where().findAll();

  Future<List<Employee>> getActiveEmployees() async =>
      isar.employees.filter().statusEqualTo(EmployeeStatus.active).findAll();

  Future<Employee?> getEmployeeById(int id) async =>
      isar.employees.get(id);

  Future<Employee?> getEmployeeByCode(String code) async =>
      isar.employees.filter().employeeCodeEqualTo(code).findFirst();

  Future<int> saveEmployee(Employee e) async {
    e.updatedAt = DateTime.now();
    e.needsSync = true;
    return isar.writeTxn(() => isar.employees.put(e));
  }

  Future<bool> deleteEmployee(int id) async =>
      isar.writeTxn(() => isar.employees.delete(id));

  // ─── Driver CRUD ──────────────────────────────────────────────────────────
  Future<List<Driver>> getAllDrivers() async =>
      isar.drivers.where().findAll();

  Future<List<Driver>> getActiveDrivers() async =>
      isar.drivers.filter().statusEqualTo(DriverStatus.driving).findAll();

  Future<Driver?> getDriverById(int id) async =>
      isar.drivers.get(id);

  Future<int> saveDriver(Driver d) async {
    d.updatedAt = DateTime.now();
    d.needsSync = true;
    return isar.writeTxn(() => isar.drivers.put(d));
  }

  Future<bool> deleteDriver(int id) async =>
      isar.writeTxn(() => isar.drivers.delete(id));

  // ─── Vehicle CRUD ─────────────────────────────────────────────────────────
  Future<List<Vehicle>> getAllVehicles() async =>
      isar.vehicles.where().findAll();

  Future<List<Vehicle>> getActiveVehicles() async =>
      isar.vehicles.filter().statusEqualTo(VehicleStatus.active).findAll();

  Future<int> saveVehicle(Vehicle v) async {
    v.updatedAt = DateTime.now();
    v.needsSync = true;
    return isar.writeTxn(() => isar.vehicles.put(v));
  }

  Future<bool> deleteVehicle(int id) async =>
      isar.writeTxn(() => isar.vehicles.delete(id));

  // ─── Trip CRUD ────────────────────────────────────────────────────────────
  Future<List<Trip>> getAllTrips() async =>
      isar.trips.where().sortByTripDateDesc().findAll();

  Future<List<Trip>> getTripsByDriver(int driverId) async =>
      isar.trips.filter().mainDriverIdEqualTo(driverId).findAll();

  Future<List<Trip>> getTripsByMonth(int year, int month) async {
    final start = DateTime(year, month, 1);
    final end = DateTime(year, month + 1, 0, 23, 59, 59);
    return isar.trips
        .filter()
        .tripDateBetween(start, end)
        .findAll();
  }

  Future<int> saveTrip(Trip t) async {
    t.updatedAt = DateTime.now();
    t.needsSync = true;
    return isar.writeTxn(() => isar.trips.put(t));
  }

  Future<bool> deleteTrip(int id) async =>
      isar.writeTxn(() => isar.trips.delete(id));

  // ─── Attendance CRUD ──────────────────────────────────────────────────────
  Future<List<Attendance>> getAttendanceByMonth(int year, int month) async =>
      isar.attendances
          .filter()
          .yearEqualTo(year)
          .monthEqualTo(month)
          .findAll();

  Future<Attendance?> getAttendanceByEmployee(
      int employeeId, int year, int month) async =>
      isar.attendances
          .filter()
          .employeeIdEqualTo(employeeId)
          .yearEqualTo(year)
          .monthEqualTo(month)
          .findFirst();

  Future<int> saveAttendance(Attendance a) async {
    a.updatedAt = DateTime.now();
    a.needsSync = true;
    return isar.writeTxn(() => isar.attendances.put(a));
  }

  // ─── Payroll CRUD ─────────────────────────────────────────────────────────
  Future<List<Payroll>> getPayrollByMonth(int year, int month) async =>
      isar.payrolls
          .filter()
          .yearEqualTo(year)
          .monthEqualTo(month)
          .findAll();

  Future<Payroll?> getPayrollById(int id) async =>
      isar.payrolls.get(id);

  Future<Payroll?> getPayrollByEmployee(
      int employeeId, int year, int month) async =>
      isar.payrolls
          .filter()
          .employeeIdEqualTo(employeeId)
          .yearEqualTo(year)
          .monthEqualTo(month)
          .findFirst();

  Future<int> savePayroll(Payroll p) async {
    p.updatedAt = DateTime.now();
    p.needsSync = true;
    return isar.writeTxn(() => isar.payrolls.put(p));
  }

  Future<List<Payroll>> saveManyPayrolls(List<Payroll> list) async {
    for (final p in list) {
      p.updatedAt = DateTime.now();
      p.needsSync = true;
    }
    await isar.writeTxn(() => isar.payrolls.putAll(list));
    return list;
  }

  // ─── KPI CRUD ─────────────────────────────────────────────────────────────
  Future<List<KpiRecord>> getKpiByMonth(int year, int month) async =>
      isar.kpiRecords
          .filter()
          .yearEqualTo(year)
          .monthEqualTo(month)
          .findAll();

  Future<int> saveKpi(KpiRecord k) async {
    k.updatedAt = DateTime.now();
    k.needsSync = true;
    return isar.writeTxn(() => isar.kpiRecords.put(k));
  }

  // ─── Leave requests (§8: Đơn xin nghỉ / Duyệt nghỉ) ──────────────────────
  Future<List<LeaveRequest>> getAllLeaveRequests() async =>
      isar.leaveRequests.where().sortByCreatedAtDesc().findAll();

  Future<List<LeaveRequest>> getPendingLeaveRequests() async =>
      isar.leaveRequests
          .filter()
          .statusEqualTo(LeaveStatus.pending)
          .sortByCreatedAtDesc()
          .findAll();

  Future<int> saveLeaveRequest(LeaveRequest r) async {
    r.updatedAt = DateTime.now();
    r.needsSync = true;
    return isar.writeTxn(() => isar.leaveRequests.put(r));
  }

  Future<bool> deleteLeaveRequest(int id) async =>
      isar.writeTxn(() => isar.leaveRequests.delete(id));

  // ─── Bonus & Discipline ───────────────────────────────────────────────────
  Future<List<BonusRecord>> getBonusByMonth(int year, int month) async =>
      isar.bonusRecords
          .filter()
          .yearEqualTo(year)
          .monthEqualTo(month)
          .findAll();

  Future<int> saveBonus(BonusRecord b) async =>
      isar.writeTxn(() => isar.bonusRecords.put(b));

  Future<List<DisciplineRecord>> getDisciplineByEmployee(int empId) async =>
      isar.disciplineRecords
          .filter()
          .employeeIdEqualTo(empId)
          .findAll();

  Future<int> saveDiscipline(DisciplineRecord d) async =>
      isar.writeTxn(() => isar.disciplineRecords.put(d));

  // ─── Accounts (Chart of Accounts TT133) ─────────────────────────────────
  Future<List<Account>> getAllAccounts() async =>
      isar.accounts.where().findAll();

  Future<Account?> getAccountByNumber(String number) async =>
      isar.accounts.filter().accountNumberEqualTo(number).findFirst();

  Future<List<Account>> getChildAccounts(int parentId) async =>
      isar.accounts.filter().parentIdEqualTo(parentId).findAll();

  Future<int> saveAccount(Account a) async {
    a.updatedAt = DateTime.now();
    a.needsSync = true;
    return isar.writeTxn(() => isar.accounts.put(a));
  }

  Future<List<int>> saveAccounts(List<Account> list) async {
    for (final a in list) {
      a.updatedAt = DateTime.now();
      a.needsSync = true;
    }
    return isar.writeTxn(() => isar.accounts.putAll(list));
  }

  // ─── Accounting Entries ──────────────────────────────────────────────────
  Future<List<AccountingEntry>> getEntriesByMonth(int year, int month) async =>
      isar.accountingEntrys
          .filter()
          .yearEqualTo(year)
          .monthEqualTo(month)
          .findAll();

  Future<List<AccountingEntry>> getAllEntries() async =>
      isar.accountingEntrys.where().findAll();

  Future<List<AccountingEntryLine>> getEntryLinesByJournal(String journalID) async =>
      isar.accountingEntryLines
          .filter()
          .journalIDEqualTo(journalID)
          .sortByLineOrder()
          .findAll();

  Future<List<AccountingEntryLine>> getEntryLines(int entryId) async =>
      isar.accountingEntryLines.where().findAll();

  Future<int> saveEntry(AccountingEntry e) async {
    e.updatedAt = DateTime.now();
    e.needsSync = true;
    return isar.writeTxn(() => isar.accountingEntrys.put(e));
  }

  Future<int> saveAccountingEntry(AccountingEntry e) async {
    e.updatedAt = DateTime.now();
    e.needsSync = true;
    return isar.writeTxn(() => isar.accountingEntrys.put(e));
  }

  Future<List<int>> saveEntryLines(List<AccountingEntryLine> lines) async =>
      isar.writeTxn(() => isar.accountingEntryLines.putAll(lines));

  Future<List<int>> saveAccountingEntryLines(List<AccountingEntryLine> lines) async =>
      isar.writeTxn(() => isar.accountingEntryLines.putAll(lines));

  // ─── Payslips ───────────────────────────────────────────────────────────
  Future<List<Payslip>> getPayslipsByMonth(int year, int month) async =>
      isar.payslips
          .filter()
          .yearEqualTo(year)
          .monthEqualTo(month)
          .findAll();

  Future<Payslip?> getPayslipByEmployee(
      int employeeId, int year, int month) async =>
      isar.payslips
          .filter()
          .employeeIdEqualTo(employeeId)
          .yearEqualTo(year)
          .monthEqualTo(month)
          .findFirst();

  Future<int> savePayslip(Payslip p) async {
    p.updatedAt = DateTime.now();
    p.needsSync = true;
    return isar.writeTxn(() => isar.payslips.put(p));
  }

  Future<List<int>> savePayslips(List<Payslip> list) async {
    for (final p in list) {
      p.updatedAt = DateTime.now();
      p.needsSync = true;
    }
    return isar.writeTxn(() => isar.payslips.putAll(list));
  }

  // ─── Account Defaults ────────────────────────────────────────────────
  Future<List<AccountDefault>> getAllAccountDefaults() async =>
      isar.accountDefaults.where().findAll();

  Future<AccountDefault?> getAccountDefaultByRefType(int refType) async =>
      isar.accountDefaults.filter().refTypeEqualTo(refType).findFirst();

  Future<List<AccountDefault>> getAccountDefaultsByVoucherType(String vt) async =>
      isar.accountDefaults.filter().voucherTypeEqualTo(vt).findAll();

  Future<int> saveAccountDefault(AccountDefault a) async {
    a.updatedAt = DateTime.now();
    a.needsSync = true;
    return isar.writeTxn(() => isar.accountDefaults.put(a));
  }

  Future<List<int>> saveAccountDefaults(List<AccountDefault> list) async {
    for (final a in list) {
      a.updatedAt = DateTime.now();
      a.needsSync = true;
    }
    return isar.writeTxn(() => isar.accountDefaults.putAll(list));
  }

  // ─── Accounting Entry (bulk / lines query) ────────────────────────────
  Future<List<AccountingEntry>> getAllAccountingEntries() async =>
      isar.accountingEntrys.where().findAll();

  Future<void> postEntry(int entryId, String postedBy) async {
    final entry = await isar.accountingEntrys.get(entryId);
    if (entry == null) return;
    entry.status = EntryStatus.posted;
    entry.postedDate = DateTime.now();
    entry.postedBy = postedBy;
    entry.updatedAt = DateTime.now();
    await isar.writeTxn(() => isar.accountingEntrys.put(entry));
  }

  Future<void> reverseEntry(int entryId, String reversedBy) async {
    final entry = await isar.accountingEntrys.get(entryId);
    if (entry == null) return;
    entry.status = EntryStatus.reversed;
    entry.updatedAt = DateTime.now();
    entry.notes = '${entry.notes ?? ''}\nĐảo bút toán bởi $reversedBy';
    await isar.writeTxn(() => isar.accountingEntrys.put(entry));
  }

  // ─── Dashboard Stats ──────────────────────────────────────────────────────
  Future<Map<String, dynamic>> getDashboardStats(int year, int month) async {
    final totalEmployees = await isar.employees.count();
    final activeEmployees = await isar.employees
        .filter()
        .statusEqualTo(EmployeeStatus.active)
        .count();
    final totalDrivers = await isar.drivers.count();
    final activeVehicles = await isar.vehicles
        .filter()
        .statusEqualTo(VehicleStatus.active)
        .count();
    final maintenanceVehicles = await isar.vehicles
        .filter()
        .statusEqualTo(VehicleStatus.maintenance)
        .count();

    final payrolls = await getPayrollByMonth(year, month);
    final totalPayroll = payrolls.fold<double>(0, (s, p) => s + p.netSalary);

    final trips = await getTripsByMonth(year, month);
    final totalRevenue = trips.fold<double>(0, (s, t) => s + (t.revenue ?? 0));
    final totalExpenses = trips.fold<double>(0, (s, t) => s + (t.expenses ?? 0));

    return {
      'totalEmployees': totalEmployees,
      'activeEmployees': activeEmployees,
      'resignedEmployees': totalEmployees - activeEmployees,
      'totalDrivers': totalDrivers,
      'activeVehicles': activeVehicles,
      'maintenanceVehicles': maintenanceVehicles,
      'totalPayroll': totalPayroll,
      'totalRevenue': totalRevenue,
      'totalExpenses': totalExpenses,
      'profit': totalRevenue - totalExpenses,
      'totalTrips': trips.length,
    };
  }

  // ─── Sync helpers ─────────────────────────────────────────────────────────
  Future<List<Employee>> getUnsyncedEmployees() async =>
      isar.employees.filter().needsSyncEqualTo(true).findAll();

  /// Nạp dữ liệu mẫu nếu DB trống (gọi khi shell khởi động).
  Future<void> seedIfEmpty() async {
    if (await isar.employees.count() > 0) return;
    await HrPayrollSeedData.seed();
  }

  /// Xóa trắng toàn bộ collection rồi seed lại dữ liệu mẫu.
  Future<void> resetAndSeed() async {
    await isar.writeTxn(() => isar.clear());
    await HrPayrollSeedData.seed();
  }

  Future<List<Driver>> getUnsyncedDrivers() async =>
      isar.drivers.filter().needsSyncEqualTo(true).findAll();

  Future<List<Trip>> getUnsyncedTrips() async =>
      isar.trips.filter().needsSyncEqualTo(true).findAll();

  Future<List<Payroll>> getUnsyncedPayrolls() async =>
      isar.payrolls.filter().needsSyncEqualTo(true).findAll();

  Future<void> markSynced<T extends dynamic>(
      List<T> items, Future<void> Function(List<T>) writer) async {
    for (final item in items) {
      item.needsSync = false;
      item.lastSyncAt = DateTime.now();
    }
    await writer(items);
  }
}
