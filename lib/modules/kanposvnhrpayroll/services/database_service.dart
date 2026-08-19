import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/employee.dart';
import '../models/driver.dart';
import '../models/vehicle.dart';
import '../models/trip.dart';
import '../models/attendance.dart';
import '../models/payroll.dart';
import '../models/kpi.dart';

class DatabaseService {
  static DatabaseService? _instance;
  static Isar? _isar;

  DatabaseService._();
  static DatabaseService get instance => _instance ??= DatabaseService._();

  Isar get isar {
    if (_isar == null) throw Exception('Isar not initialized');
    return _isar!;
  }

  Future<void> initialize() async {
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
