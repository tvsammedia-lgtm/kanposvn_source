import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
import '../services/database_service.dart';
import '../services/sync_service.dart';
import '../services/auth_service.dart';
import '../services/payroll_calculator_service.dart';

final dbProvider = Provider<DatabaseService>((ref) => DatabaseService.instance);
final syncProvider = Provider<SyncService>((ref) => SyncService.instance);
final authProvider = Provider<AuthService>((ref) => AuthService.instance);
final calcProvider = Provider<PayrollCalculatorService>(
    (ref) => PayrollCalculatorService.instance);

// ─── Selected Month ────────────────────────────────────────────────────────
class SelectedMonth {
  final int year;
  final int month;
  const SelectedMonth(this.year, this.month);
}

class SelectedMonthNotifier extends Notifier<SelectedMonth> {
  @override
  SelectedMonth build() {
    final now = DateTime.now();
    return SelectedMonth(now.year, now.month);
  }

  void setMonth(int year, int month) =>
      state = SelectedMonth(year, month);

  void previousMonth() {
    if (state.month == 1) {
      state = SelectedMonth(state.year - 1, 12);
    } else {
      state = SelectedMonth(state.year, state.month - 1);
    }
  }

  void nextMonth() {
    final now = DateTime.now();
    if (state.year == now.year && state.month == now.month) return;
    if (state.month == 12) {
      state = SelectedMonth(state.year + 1, 1);
    } else {
      state = SelectedMonth(state.year, state.month + 1);
    }
  }
}

final selectedMonthProvider =
    NotifierProvider<SelectedMonthNotifier, SelectedMonth>(
        SelectedMonthNotifier.new);

// ─── Dashboard ─────────────────────────────────────────────────────────────
final dashboardStatsProvider =
    FutureProvider.family<Map<String, dynamic>, SelectedMonth>(
        (ref, month) async {
  final db = ref.watch(dbProvider);
  return db.getDashboardStats(month.year, month.month);
});

// ─── Employees ─────────────────────────────────────────────────────────────
final employeeListProvider = FutureProvider<List<Employee>>((ref) async {
  final db = ref.watch(dbProvider);
  return db.getAllEmployees();
});

final activeEmployeeProvider = FutureProvider<List<Employee>>((ref) async {
  final db = ref.watch(dbProvider);
  return db.getActiveEmployees();
});

final employeeSearchProvider =
    StateProvider<String>((ref) => '');

final filteredEmployeesProvider = FutureProvider<List<Employee>>((ref) async {
  final employees = await ref.watch(employeeListProvider.future);
  final query = ref.watch(employeeSearchProvider).toLowerCase();
  if (query.isEmpty) return employees;
  return employees
      .where((e) =>
          e.fullName.toLowerCase().contains(query) ||
          e.employeeCode.toLowerCase().contains(query) ||
          (e.phone ?? '').contains(query))
      .toList();
});

class EmployeeNotifier extends Notifier<AsyncValue<List<Employee>>> {
  @override
  AsyncValue<List<Employee>> build() {
    _load();
    return const AsyncValue.loading();
  }

  Future<void> _load() async {
    state = const AsyncValue.loading();
    try {
      final list = await ref.read(dbProvider).getAllEmployees();
      state = AsyncValue.data(list);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> save(Employee emp) async {
    await ref.read(dbProvider).saveEmployee(emp);
    await _load();
  }

  Future<void> delete(int id) async {
    await ref.read(dbProvider).deleteEmployee(id);
    await _load();
  }

  Future<void> refresh() => _load();
}

final employeeNotifierProvider =
    NotifierProvider<EmployeeNotifier, AsyncValue<List<Employee>>>(
        EmployeeNotifier.new);

// ─── Drivers ───────────────────────────────────────────────────────────────
class DriverNotifier extends Notifier<AsyncValue<List<Driver>>> {
  @override
  AsyncValue<List<Driver>> build() {
    _load();
    return const AsyncValue.loading();
  }

  Future<void> _load() async {
    state = const AsyncValue.loading();
    try {
      final list = await ref.read(dbProvider).getAllDrivers();
      state = AsyncValue.data(list);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> save(Driver d) async {
    await ref.read(dbProvider).saveDriver(d);
    await _load();
  }

  Future<void> delete(int id) async {
    await ref.read(dbProvider).deleteDriver(id);
    await _load();
  }

  Future<void> refresh() => _load();
}

final driverNotifierProvider =
    NotifierProvider<DriverNotifier, AsyncValue<List<Driver>>>(
        DriverNotifier.new);

// ─── Vehicles ──────────────────────────────────────────────────────────────
class VehicleNotifier extends Notifier<AsyncValue<List<Vehicle>>> {
  @override
  AsyncValue<List<Vehicle>> build() {
    _load();
    return const AsyncValue.loading();
  }

  Future<void> _load() async {
    state = const AsyncValue.loading();
    try {
      final list = await ref.read(dbProvider).getAllVehicles();
      state = AsyncValue.data(list);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> save(Vehicle v) async {
    await ref.read(dbProvider).saveVehicle(v);
    await _load();
  }

  Future<void> refresh() => _load();
}

final vehicleNotifierProvider =
    NotifierProvider<VehicleNotifier, AsyncValue<List<Vehicle>>>(
        VehicleNotifier.new);

// ─── Trips ─────────────────────────────────────────────────────────────────
class TripNotifier extends Notifier<AsyncValue<List<Trip>>> {
  @override
  AsyncValue<List<Trip>> build() {
    _load();
    return const AsyncValue.loading();
  }

  Future<void> _load() async {
    state = const AsyncValue.loading();
    try {
      final list = await ref.read(dbProvider).getAllTrips();
      state = AsyncValue.data(list);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> save(Trip t) async {
    await ref.read(dbProvider).saveTrip(t);
    await _load();
  }

  Future<void> delete(int id) async {
    await ref.read(dbProvider).deleteTrip(id);
    await _load();
  }

  Future<void> refresh() => _load();
}

final tripNotifierProvider =
    NotifierProvider<TripNotifier, AsyncValue<List<Trip>>>(TripNotifier.new);

// ─── Attendance ────────────────────────────────────────────────────────────
final attendanceByMonthProvider =
    FutureProvider.family<List<Attendance>, SelectedMonth>((ref, month) async {
  final db = ref.watch(dbProvider);
  return db.getAttendanceByMonth(month.year, month.month);
});

// ─── Leave requests (§8: Đơn xin nghỉ / Duyệt nghỉ) ────────────────────────
final leaveRequestsProvider = FutureProvider<List<LeaveRequest>>((ref) async {
  final db = ref.watch(dbProvider);
  return db.getAllLeaveRequests();
});

// ─── Payroll ───────────────────────────────────────────────────────────────
final payrollByMonthProvider =
    FutureProvider.family<List<Payroll>, SelectedMonth>((ref, month) async {
  final db = ref.watch(dbProvider);
  return db.getPayrollByMonth(month.year, month.month);
});

class PayrollNotifier
    extends FamilyNotifier<AsyncValue<List<Payroll>>, SelectedMonth> {
  @override
  AsyncValue<List<Payroll>> build(SelectedMonth arg) {
    _load(arg);
    return const AsyncValue.loading();
  }

  Future<void> _load(SelectedMonth m) async {
    state = const AsyncValue.loading();
    try {
      final list =
          await ref.read(dbProvider).getPayrollByMonth(m.year, m.month);
      state = AsyncValue.data(list);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> calculateAndSave(int year, int month) async {
    try {
      debugPrint('PayrollNotifier: Starting calculation');
      final list =
          await ref.read(calcProvider).calculateMonthlyPayroll(year, month);
      debugPrint('PayrollNotifier: Calculation returned ${list.length} records');
      if (list.isEmpty) {
        debugPrint('PayrollNotifier: No records calculated, setting empty data');
        state = AsyncValue.data([]);
        return;
      }
      debugPrint('PayrollNotifier: Saving ${list.length} payroll records');
      await ref.read(dbProvider).saveManyPayrolls(list);
      debugPrint('PayrollNotifier: Save completed, setting data state');
      state = AsyncValue.data(list);
    } catch (e, s) {
      debugPrint('PayrollNotifier: Error occurred - $e\n$s');
      state = AsyncValue.error(e, s);
    }
  }
}

final payrollNotifierProvider =
    NotifierProviderFamily<PayrollNotifier, AsyncValue<List<Payroll>>,
        SelectedMonth>(PayrollNotifier.new);

// ─── KPI ───────────────────────────────────────────────────────────────────
final kpiByMonthProvider =
    FutureProvider.family<List<KpiRecord>, SelectedMonth>((ref, month) async {
  final db = ref.watch(dbProvider);
  return db.getKpiByMonth(month.year, month.month);
});

// ─── Accounts (Chart of Accounts) ─────────────────────────────────────
final allAccountsProvider = FutureProvider<List<Account>>((ref) async {
  final db = ref.watch(dbProvider);
  return db.getAllAccounts();
});

final parentAccountsProvider = FutureProvider<List<Account>>((ref) async {
  final accounts = await ref.watch(allAccountsProvider.future);
  return accounts.where((a) => a.isParent).toList();
});

final leafAccountsProvider = FutureProvider<List<Account>>((ref) async {
  final accounts = await ref.watch(allAccountsProvider.future);
  return accounts.where((a) => !a.isParent).toList();
});

// ─── Account Defaults ─────────────────────────────────────────────────
final allAccountDefaultsProvider = FutureProvider<List<AccountDefault>>((ref) async {
  final db = ref.watch(dbProvider);
  return db.getAllAccountDefaults();
});

final accountDefaultsByVoucherProvider =
    FutureProvider.family<List<AccountDefault>, String>((ref, voucherType) async {
  final db = ref.watch(dbProvider);
  return db.getAccountDefaultsByVoucherType(voucherType);
});

// ─── Accounting Entries ────────────────────────────────────────────────
final entriesByMonthProvider =
    FutureProvider.family<List<AccountingEntry>, SelectedMonth>((ref, month) async {
  final db = ref.watch(dbProvider);
  return db.getEntriesByMonth(month.year, month.month);
});

final allEntriesProvider = FutureProvider<List<AccountingEntry>>((ref) async {
  final db = ref.watch(dbProvider);
  return db.getAllEntries();
});

final entryLinesProvider =
    FutureProvider.family<List<AccountingEntryLine>, String>((ref, journalID) async {
  final db = ref.watch(dbProvider);
  return db.getEntryLinesByJournal(journalID);
});

// ─── Payslips ──────────────────────────────────────────────────────────
final payslipsByMonthProvider =
    FutureProvider.family<List<Payslip>, SelectedMonth>((ref, month) async {
  final db = ref.watch(dbProvider);
  return db.getPayslipsByMonth(month.year, month.month);
});

final payslipByEmployeeProvider =
    FutureProvider.family<Payslip?, ({int employeeId, int year, int month})>(
        (ref, params) async {
  final db = ref.watch(dbProvider);
  return db.getPayslipByEmployee(params.employeeId, params.year, params.month);
});

// ─── Accounting Summary ───────────────────────────────────────────────
final accountingSummaryProvider =
    FutureProvider.family<Map<String, dynamic>, SelectedMonth>((ref, month) async {
  final entries = await ref.watch(entriesByMonthProvider(month).future);
  final totalDr = entries.fold<double>(0, (s, e) => s + e.totalDebit);
  final totalCr = entries.fold<double>(0, (s, e) => s + e.totalCredit);
  final posted = entries.where((e) => e.status == EntryStatus.posted).length;
  final draft = entries.where((e) => e.status == EntryStatus.draft).length;
  return {
    'totalEntries': entries.length,
    'postedEntries': posted,
    'draftEntries': draft,
    'totalDebit': totalDr,
    'totalCredit': totalCr,
  };
});

// ─── Sync ──────────────────────────────────────────────────────────────────
class SyncNotifier extends Notifier<SyncState> {
  @override
  SyncState build() => const SyncState.idle();

  Future<void> syncNow() async {
    state = const SyncState.syncing();
    try {
      final result = await ref.read(syncProvider).pushAll();
      state = SyncState.done(result);
    } catch (e) {
      state = SyncState.error(e.toString());
    }
  }
}

final syncNotifierProvider =
    NotifierProvider<SyncNotifier, SyncState>(SyncNotifier.new);

class SyncState {
  final SyncStatus status;
  final SyncResult? result;
  final String? errorMessage;

  const SyncState._({required this.status, this.result, this.errorMessage});
  const SyncState.idle() : this._(status: SyncStatus.idle);
  const SyncState.syncing() : this._(status: SyncStatus.syncing);
  SyncState.done(SyncResult r)
      : this._(status: SyncStatus.done, result: r);
  SyncState.error(String msg)
      : this._(status: SyncStatus.error, errorMessage: msg);
}

enum SyncStatus { idle, syncing, done, error }
