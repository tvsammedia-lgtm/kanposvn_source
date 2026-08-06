import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/employee.dart';
import '../models/driver.dart';
import '../models/vehicle.dart';
import '../models/trip.dart';
import '../models/attendance.dart';
import '../models/payroll.dart';
import '../models/kpi.dart';
import 'database_service.dart';
import 'auth_service.dart';

/// Sync service – đồng bộ với backend kanposvn (kanposvn-admin.vercel.app)
/// qua endpoint chung `/api/sync/push` + `/api/sync/pull` (bảng sync_data),
/// appCode = kanposvnhrpayroll. Mỗi payload đều gắn `storeId` để phân chia
/// dữ liệu theo cửa hàng.
class SyncService {
  static SyncService? _instance;
  SyncService._();
  static SyncService get instance => _instance ??= SyncService._();

  static const _prefKeyUrl = 'sync_api_url';
  static const _prefKeyLastSync = 'last_sync_time';

  static const _apiBaseUrl = 'https://kanposvn-admin.vercel.app';
  static const _apiKey = 'kanposvn_sync_2026';
  static const _appCode = 'kanposvnhrpayroll';

  String _baseUrl = '';

  final DatabaseService _db = DatabaseService.instance;

  Future<void> loadConfig() async {
    final prefs = await SharedPreferences.getInstance();
    _baseUrl = prefs.getString(_prefKeyUrl) ?? '';
    if (_baseUrl.isEmpty) {
      _baseUrl = _apiBaseUrl;
      await prefs.setString(_prefKeyUrl, _baseUrl);
    }
  }

  bool get isConfigured => _baseUrl.isNotEmpty && AuthService.instance.isLoggedIn;

  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

  // ─── Push (Local → Remote) ────────────────────────────────────────────────
  Future<SyncResult> pushAll() async {
    if (!isConfigured) return SyncResult.notConfigured();

    int pushed = 0;
    int failed = 0;
    final errors = <String>[];

    await _pushEmployees(pushed: (n) => pushed += n, failed: (n) => failed += n, errors: errors);
    await _pushDrivers(pushed: (n) => pushed += n, failed: (n) => failed += n, errors: errors);
    await _pushVehicles(pushed: (n) => pushed += n, failed: (n) => failed += n, errors: errors);
    await _pushTrips(pushed: (n) => pushed += n, failed: (n) => failed += n, errors: errors);
    await _pushAttendance(pushed: (n) => pushed += n, failed: (n) => failed += n, errors: errors);
    await _pushPayrolls(pushed: (n) => pushed += n, failed: (n) => failed += n, errors: errors);
    await _pushKpi(pushed: (n) => pushed += n, failed: (n) => failed += n, errors: errors);
    await _pushBonus(pushed: (n) => pushed += n, failed: (n) => failed += n, errors: errors);
    await _pushDiscipline(pushed: (n) => pushed += n, failed: (n) => failed += n, errors: errors);

    // Pull data mới từ remote (các thiết bị khác của cùng cửa hàng).
    await _pullChanges(errors: errors);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefKeyLastSync, DateTime.now().toIso8601String());

    return SyncResult(
      pushed: pushed,
      pulled: 0,
      failed: failed,
      errors: errors,
      syncTime: DateTime.now(),
    );
  }

  Future<void> _pushCollection({
    required String collection,
    required List<Map<String, dynamic>> items,
    required void Function(int) pushed,
    required void Function(int) failed,
    required List<String> errors,
  }) async {
    if (items.isEmpty) return;
    try {
      final body = jsonEncode({
        'appCode': _appCode,
        'apiKey': _apiKey,
        'items': items,
      });
      final resp = await http
          .post(
            Uri.parse('$_baseUrl/api/sync/push'),
            headers: _headers,
            body: body,
          )
          .timeout(const Duration(seconds: 15));
      final data = jsonDecode(utf8.decode(resp.bodyBytes));
      if (resp.statusCode == 200 && data['success'] == true) {
        pushed(items.length);
      } else {
        failed(items.length);
        errors.add('$collection: ${data['error'] ?? data['message']}');
      }
    } catch (e) {
      failed(items.length);
      errors.add('$collection: $e');
    }
  }

  Map<String, dynamic> _item(String collection, String itemId, Map<String, dynamic> payload) => {
        'operationId': '$collection-$itemId',
        'collectionName': collection,
        'operationType': 'UPSERT',
        'payload': payload,
        'createdAt': DateTime.now().toIso8601String(),
      };

  String _itemId(String collection, String? remoteId, int localId) =>
      remoteId ?? '$collection-$localId';

  Future<void> _pushEmployees({
    required void Function(int) pushed,
    required void Function(int) failed,
    required List<String> errors,
  }) async {
    final list = await _db.getUnsyncedEmployees();
    if (list.isEmpty) return;
    final items = <Map<String, dynamic>>[];
    for (final e in list) {
      final itemId = _itemId('employees', e.remoteId, e.id);
      final payload = _employeeToJson(e)..['itemId'] = itemId;
      items.add(_item('employees', itemId, payload));
    }
    await _pushCollection(
      collection: 'employees',
      items: items,
      pushed: pushed,
      failed: failed,
      errors: errors,
    );
    for (final e in list) {
      e.remoteId = _itemId('employees', e.remoteId, e.id);
      e.needsSync = false;
      e.lastSyncAt = DateTime.now();
    }
    await _db.isar.writeTxn(() => _db.isar.employees.putAll(list));
  }

  Future<void> _pushDrivers({
    required void Function(int) pushed,
    required void Function(int) failed,
    required List<String> errors,
  }) async {
    final list = await _db.getUnsyncedDrivers();
    if (list.isEmpty) return;
    final items = <Map<String, dynamic>>[];
    for (final d in list) {
      final itemId = _itemId('drivers', d.remoteId, d.id);
      final payload = _driverToJson(d)..['itemId'] = itemId;
      items.add(_item('drivers', itemId, payload));
    }
    await _pushCollection(
      collection: 'drivers',
      items: items,
      pushed: pushed,
      failed: failed,
      errors: errors,
    );
    for (final d in list) {
      d.remoteId = _itemId('drivers', d.remoteId, d.id);
      d.needsSync = false;
      d.lastSyncAt = DateTime.now();
    }
    await _db.isar.writeTxn(() => _db.isar.drivers.putAll(list));
  }

  Future<void> _pushVehicles({
    required void Function(int) pushed,
    required void Function(int) failed,
    required List<String> errors,
  }) async {
    final list = await _db.getAllVehicles();
    final unsynced = list.where((v) => v.needsSync).toList();
    if (unsynced.isEmpty) return;
    final items = <Map<String, dynamic>>[];
    for (final v in unsynced) {
      final itemId = _itemId('vehicles', v.remoteId, v.id);
      final payload = _vehicleToJson(v)..['itemId'] = itemId;
      items.add(_item('vehicles', itemId, payload));
    }
    await _pushCollection(
      collection: 'vehicles',
      items: items,
      pushed: pushed,
      failed: failed,
      errors: errors,
    );
    for (final v in unsynced) {
      v.remoteId = _itemId('vehicles', v.remoteId, v.id);
      v.needsSync = false;
      v.lastSyncAt = DateTime.now();
    }
    await _db.isar.writeTxn(() => _db.isar.vehicles.putAll(unsynced));
  }

  Future<void> _pushTrips({
    required void Function(int) pushed,
    required void Function(int) failed,
    required List<String> errors,
  }) async {
    final list = await _db.getUnsyncedTrips();
    if (list.isEmpty) return;
    final items = <Map<String, dynamic>>[];
    for (final t in list) {
      final itemId = _itemId('trips', t.remoteId, t.id);
      final payload = _tripToJson(t)..['itemId'] = itemId;
      items.add(_item('trips', itemId, payload));
    }
    await _pushCollection(
      collection: 'trips',
      items: items,
      pushed: pushed,
      failed: failed,
      errors: errors,
    );
    for (final t in list) {
      t.remoteId = _itemId('trips', t.remoteId, t.id);
      t.needsSync = false;
      t.lastSyncAt = DateTime.now();
    }
    await _db.isar.writeTxn(() => _db.isar.trips.putAll(list));
  }

  Future<void> _pushAttendance({
    required void Function(int) pushed,
    required void Function(int) failed,
    required List<String> errors,
  }) async {
    final unsynced =
        await _db.isar.attendances.filter().needsSyncEqualTo(true).findAll();
    if (unsynced.isEmpty) return;
    final items = <Map<String, dynamic>>[];
    for (final a in unsynced) {
      final itemId = _itemId('attendance', a.remoteId, a.id);
      final payload = _attendanceToJson(a)..['itemId'] = itemId;
      items.add(_item('attendance', itemId, payload));
    }
    await _pushCollection(
      collection: 'attendance',
      items: items,
      pushed: pushed,
      failed: failed,
      errors: errors,
    );
    for (final a in unsynced) {
      a.remoteId = _itemId('attendance', a.remoteId, a.id);
      a.needsSync = false;
      a.lastSyncAt = DateTime.now();
    }
    await _db.isar.writeTxn(() => _db.isar.attendances.putAll(unsynced));
  }

  Future<void> _pushPayrolls({
    required void Function(int) pushed,
    required void Function(int) failed,
    required List<String> errors,
  }) async {
    final list = await _db.getUnsyncedPayrolls();
    if (list.isEmpty) return;
    final items = <Map<String, dynamic>>[];
    for (final p in list) {
      final itemId = _itemId('payrolls', p.remoteId, p.id);
      final payload = _payrollToJson(p)..['itemId'] = itemId;
      items.add(_item('payrolls', itemId, payload));
    }
    await _pushCollection(
      collection: 'payrolls',
      items: items,
      pushed: pushed,
      failed: failed,
      errors: errors,
    );
    for (final p in list) {
      p.remoteId = _itemId('payrolls', p.remoteId, p.id);
      p.needsSync = false;
      p.lastSyncAt = DateTime.now();
    }
    await _db.isar.writeTxn(() => _db.isar.payrolls.putAll(list));
  }

  Future<void> _pushKpi({
    required void Function(int) pushed,
    required void Function(int) failed,
    required List<String> errors,
  }) async {
    final unsynced =
        await _db.isar.kpiRecords.filter().needsSyncEqualTo(true).findAll();
    if (unsynced.isEmpty) return;
    final items = <Map<String, dynamic>>[];
    for (final k in unsynced) {
      final itemId = _itemId('kpi', k.remoteId, k.id);
      final payload = _kpiToJson(k)..['itemId'] = itemId;
      items.add(_item('kpi', itemId, payload));
    }
    await _pushCollection(
      collection: 'kpi',
      items: items,
      pushed: pushed,
      failed: failed,
      errors: errors,
    );
    for (final k in unsynced) {
      k.remoteId = _itemId('kpi', k.remoteId, k.id);
      k.needsSync = false;
    }
    await _db.isar.writeTxn(() => _db.isar.kpiRecords.putAll(unsynced));
  }

  Future<void> _pushBonus({
    required void Function(int) pushed,
    required void Function(int) failed,
    required List<String> errors,
  }) async {
    final unsynced =
        await _db.isar.bonusRecords.filter().needsSyncEqualTo(true).findAll();
    if (unsynced.isEmpty) return;
    final items = <Map<String, dynamic>>[];
    for (final b in unsynced) {
      final itemId = _itemId('bonus', b.remoteId, b.id);
      final payload = _bonusToJson(b)..['itemId'] = itemId;
      items.add(_item('bonus', itemId, payload));
    }
    await _pushCollection(
      collection: 'bonus',
      items: items,
      pushed: pushed,
      failed: failed,
      errors: errors,
    );
    for (final b in unsynced) {
      b.remoteId = _itemId('bonus', b.remoteId, b.id);
      b.needsSync = false;
    }
    await _db.isar.writeTxn(() => _db.isar.bonusRecords.putAll(unsynced));
  }

  Future<void> _pushDiscipline({
    required void Function(int) pushed,
    required void Function(int) failed,
    required List<String> errors,
  }) async {
    final unsynced = await _db.isar.disciplineRecords
        .filter()
        .needsSyncEqualTo(true)
        .findAll();
    if (unsynced.isEmpty) return;
    final items = <Map<String, dynamic>>[];
    for (final d in unsynced) {
      final itemId = _itemId('discipline', d.remoteId, d.id);
      final payload = _disciplineToJson(d)..['itemId'] = itemId;
      items.add(_item('discipline', itemId, payload));
    }
    await _pushCollection(
      collection: 'discipline',
      items: items,
      pushed: pushed,
      failed: failed,
      errors: errors,
    );
    for (final d in unsynced) {
      d.remoteId = _itemId('discipline', d.remoteId, d.id);
      d.needsSync = false;
    }
    await _db.isar.writeTxn(() => _db.isar.disciplineRecords.putAll(unsynced));
  }

  // ─── Pull (Remote → Local) ────────────────────────────────────────────────
  Future<void> _pullChanges({required List<String> errors}) async {
    try {
      var url =
          '$_baseUrl/api/sync/pull?appCode=$_appCode&apiKey=$_apiKey';
      final last = await getLastSyncTime();
      if (last != null) {
        url += '&since=${Uri.encodeQueryComponent(last.toIso8601String())}';
      }
      final resp = await http
          .get(Uri.parse(url), headers: _headers)
          .timeout(const Duration(seconds: 15));
      if (resp.statusCode != 200) {
        errors.add('Pull: HTTP ${resp.statusCode}');
        return;
      }
      final data = jsonDecode(utf8.decode(resp.bodyBytes));
      final records = (data['records'] as List<dynamic>?)
              ?.cast<Map<String, dynamic>>() ??
          const [];
      await _mergeRecords(records);
    } catch (e) {
      errors.add('Pull: $e');
    }
  }

  Future<void> _mergeRecords(List<Map<String, dynamic>> records) async {
    for (final record in records) {
      try {
        final collection = record['collection'] as String?;
        final itemId = record['itemId']?.toString();
        final data = record['data'];
        if (collection == null || data is! Map<String, dynamic>) continue;
        if (record['operation'] == 'DELETE') continue;

        switch (collection) {
          case 'employees':
            await _upsertEmployee(data, itemId);
          case 'drivers':
            await _upsertDriver(data, itemId);
          case 'vehicles':
            await _upsertVehicle(data, itemId);
          case 'trips':
            await _upsertTrip(data, itemId);
          case 'attendance':
            await _upsertAttendance(data, itemId);
          case 'payrolls':
            await _upsertPayroll(data, itemId);
          case 'kpi':
            await _upsertKpi(data, itemId);
          case 'bonus':
            await _upsertBonus(data, itemId);
          case 'discipline':
            await _upsertDiscipline(data, itemId);
        }
      } catch (_) {
        // ignore single record merge errors
      }
    }
  }

  Future<void> _upsertEmployee(Map<String, dynamic> data, String? itemId) async {
    final localId = (data['localId'] as num?)?.toInt();
    final existing = localId != null ? await _db.isar.employees.get(localId) : null;
    final remoteUpdated = _dt(data['updatedAt']);
    if (existing != null &&
        remoteUpdated != null &&
        existing.updatedAt.isAfter(remoteUpdated)) {
      return;
    }
    final e = _employeeFromJson(data);
    if (existing != null) e.id = existing.id;
    if (itemId != null) e.remoteId = itemId;
    e.needsSync = false;
    e.lastSyncAt = DateTime.now();
    await _db.isar.writeTxn(() => _db.isar.employees.put(e));
  }

  Future<void> _upsertDriver(Map<String, dynamic> data, String? itemId) async {
    final localId = (data['localId'] as num?)?.toInt();
    final existing = localId != null ? await _db.isar.drivers.get(localId) : null;
    final remoteUpdated = _dt(data['updatedAt']);
    if (existing != null &&
        remoteUpdated != null &&
        existing.updatedAt.isAfter(remoteUpdated)) {
      return;
    }
    final d = _driverFromJson(data);
    if (existing != null) d.id = existing.id;
    if (itemId != null) d.remoteId = itemId;
    d.needsSync = false;
    d.lastSyncAt = DateTime.now();
    await _db.isar.writeTxn(() => _db.isar.drivers.put(d));
  }

  Future<void> _upsertVehicle(Map<String, dynamic> data, String? itemId) async {
    final localId = (data['localId'] as num?)?.toInt();
    final existing = localId != null ? await _db.isar.vehicles.get(localId) : null;
    final remoteUpdated = _dt(data['updatedAt']);
    if (existing != null &&
        remoteUpdated != null &&
        existing.updatedAt.isAfter(remoteUpdated)) {
      return;
    }
    final v = _vehicleFromJson(data);
    if (existing != null) v.id = existing.id;
    if (itemId != null) v.remoteId = itemId;
    v.needsSync = false;
    v.lastSyncAt = DateTime.now();
    await _db.isar.writeTxn(() => _db.isar.vehicles.put(v));
  }

  Future<void> _upsertTrip(Map<String, dynamic> data, String? itemId) async {
    final localId = (data['localId'] as num?)?.toInt();
    final existing = localId != null ? await _db.isar.trips.get(localId) : null;
    final remoteUpdated = _dt(data['updatedAt']);
    if (existing != null &&
        remoteUpdated != null &&
        existing.updatedAt.isAfter(remoteUpdated)) {
      return;
    }
    final t = _tripFromJson(data);
    if (existing != null) t.id = existing.id;
    if (itemId != null) t.remoteId = itemId;
    t.needsSync = false;
    t.lastSyncAt = DateTime.now();
    await _db.isar.writeTxn(() => _db.isar.trips.put(t));
  }

  Future<void> _upsertAttendance(Map<String, dynamic> data, String? itemId) async {
    final localId = (data['localId'] as num?)?.toInt();
    final existing =
        localId != null ? await _db.isar.attendances.get(localId) : null;
    final remoteUpdated = _dt(data['updatedAt']);
    if (existing != null &&
        remoteUpdated != null &&
        existing.updatedAt.isAfter(remoteUpdated)) {
      return;
    }
    final a = _attendanceFromJson(data);
    if (existing != null) a.id = existing.id;
    if (itemId != null) a.remoteId = itemId;
    a.needsSync = false;
    a.lastSyncAt = DateTime.now();
    await _db.isar.writeTxn(() => _db.isar.attendances.put(a));
  }

  Future<void> _upsertPayroll(Map<String, dynamic> data, String? itemId) async {
    final localId = (data['localId'] as num?)?.toInt();
    final existing =
        localId != null ? await _db.isar.payrolls.get(localId) : null;
    final remoteUpdated = _dt(data['updatedAt']);
    if (existing != null &&
        remoteUpdated != null &&
        existing.updatedAt.isAfter(remoteUpdated)) {
      return;
    }
    final p = _payrollFromJson(data);
    if (existing != null) p.id = existing.id;
    if (itemId != null) p.remoteId = itemId;
    p.needsSync = false;
    p.lastSyncAt = DateTime.now();
    await _db.isar.writeTxn(() => _db.isar.payrolls.put(p));
  }

  Future<void> _upsertKpi(Map<String, dynamic> data, String? itemId) async {
    final localId = (data['localId'] as num?)?.toInt();
    final existing =
        localId != null ? await _db.isar.kpiRecords.get(localId) : null;
    final remoteUpdated = _dt(data['updatedAt']);
    if (existing != null &&
        remoteUpdated != null &&
        existing.updatedAt.isAfter(remoteUpdated)) {
      return;
    }
    final k = _kpiFromJson(data);
    if (existing != null) k.id = existing.id;
    if (itemId != null) k.remoteId = itemId;
    k.needsSync = false;
    await _db.isar.writeTxn(() => _db.isar.kpiRecords.put(k));
  }

  Future<void> _upsertBonus(Map<String, dynamic> data, String? itemId) async {
    final localId = (data['localId'] as num?)?.toInt();
    final existing =
        localId != null ? await _db.isar.bonusRecords.get(localId) : null;
    final remoteCreated = _dt(data['created_at']);
    if (existing != null &&
        remoteCreated != null &&
        existing.createdAt.isAfter(remoteCreated)) {
      return;
    }
    final b = _bonusFromJson(data);
    if (existing != null) b.id = existing.id;
    if (itemId != null) b.remoteId = itemId;
    b.needsSync = false;
    await _db.isar.writeTxn(() => _db.isar.bonusRecords.put(b));
  }

  Future<void> _upsertDiscipline(Map<String, dynamic> data, String? itemId) async {
    final localId = (data['localId'] as num?)?.toInt();
    final existing =
        localId != null ? await _db.isar.disciplineRecords.get(localId) : null;
    final remoteUpdated = _dt(data['createdAt']);
    if (existing != null &&
        remoteUpdated != null &&
        existing.createdAt.isAfter(remoteUpdated)) {
      return;
    }
    final d = _disciplineFromJson(data);
    if (existing != null) d.id = existing.id;
    if (itemId != null) d.remoteId = itemId;
    d.needsSync = false;
    await _db.isar.writeTxn(() => _db.isar.disciplineRecords.put(d));
  }

  // ─── HTTP helper ──────────────────────────────────────────────────────────
  Future<DateTime?> getLastSyncTime() async {
    final prefs = await SharedPreferences.getInstance();
    final s = prefs.getString(_prefKeyLastSync);
    return s == null ? null : DateTime.tryParse(s);
  }

  // ─── JSON serializers ─────────────────────────────────────────────────────
  Map<String, dynamic> _employeeToJson(Employee e) => {
        'localId': e.id,
        'storeId': AuthService.instance.storeId,
        'employee_code': e.employeeCode,
        'full_name': e.fullName,
        'birth_date': e.birthDate?.toIso8601String(),
        'cccd': e.cccd,
        'cccd_issue_date': e.cccdIssueDate?.toIso8601String(),
        'cccd_issue_place': e.cccdIssuePlace,
        'address': e.address,
        'phone': e.phone,
        'email': e.email,
        'gender': e.gender.name,
        'marital_status': e.maritalStatus.name,
        'emergency_contact': e.emergencyContact,
        'emergency_phone': e.emergencyPhone,
        'tax_code': e.taxCode,
        'social_insurance_code': e.socialInsuranceCode,
        'bank_account': e.bankAccount,
        'bank_name': e.bankName,
        'department': e.department,
        'position': e.position,
        'join_date': e.joinDate?.toIso8601String(),
        'resign_date': e.resignDate?.toIso8601String(),
        'status': e.status.name,
        'base_salary': e.baseSalary,
        'allowance_phone': e.allowancePhone,
        'allowance_meal': e.allowanceMeal,
        'allowance_transport': e.allowanceTransport,
        'has_social_insurance': e.hasSocialInsurance,
        'social_insurance_rate': e.socialInsuranceRate,
        'health_insurance_rate': e.healthInsuranceRate,
        'unemployment_insurance_rate': e.unemploymentInsuranceRate,
        'dependents': e.dependents,
        'annual_leave_total': e.annualLeaveTotal,
        'annual_leave_used': e.annualLeaveUsed,
        'created_at': e.createdAt.toIso8601String(),
        'updated_at': e.updatedAt.toIso8601String(),
      };

  Map<String, dynamic> _driverToJson(Driver d) => {
        'localId': d.id,
        'storeId': AuthService.instance.storeId,
        'employee_id': d.employeeId,
        'employee_code': d.employeeCode,
        'full_name': d.fullName,
        'license_number': d.licenseNumber,
        'license_class': d.licenseClass.name,
        'license_issue_date': d.licenseIssueDate?.toIso8601String(),
        'license_expiry_date': d.licenseExpiryDate?.toIso8601String(),
        'health_check_date': d.healthCheckDate?.toIso8601String(),
        'health_check_expiry': d.healthCheckExpiry?.toIso8601String(),
        'experience_years': d.experienceYears,
        'can_drive_container': d.canDriveContainer,
        'can_drive_truck': d.canDriveTruck,
        'can_drive_tractor': d.canDriveTractor,
        'can_drive_mooc': d.canDriveMooc,
        'has_adr_certificate': d.hasAdrCertificate,
        'has_dangerous_goods_cert': d.hasDangerousGoodsCert,
        'status': d.status.name,
        'base_salary': d.baseSalary,
        'salary_per_trip': d.salaryPerTrip,
        'salary_per_km': d.salaryPerKm,
        'salary_per_container': d.salaryPerContainer,
        'revenue_share_percent': d.revenueSharePercent,
        'allowance_phone': d.allowancePhone,
        'allowance_meal': d.allowanceMeal,
        'allowance_night_stay': d.allowanceNightStay,
        'allowance_fuel': d.allowanceFuel,
        'created_at': d.createdAt.toIso8601String(),
        'updated_at': d.updatedAt.toIso8601String(),
      };

  Map<String, dynamic> _vehicleToJson(Vehicle v) => {
        'localId': v.id,
        'storeId': AuthService.instance.storeId,
        'license_plate': v.licensePlate,
        'chassis_number': v.chassisNumber,
        'engine_number': v.engineNumber,
        'vehicle_type': v.vehicleType.name,
        'brand': v.brand,
        'manufacturing_year': v.manufacturingYear,
        'load_capacity': v.loadCapacity,
        'registration_date': v.registrationDate?.toIso8601String(),
        'registration_expiry': v.registrationExpiry?.toIso8601String(),
        'insurance_number': v.insuranceNumber,
        'insurance_expiry': v.insuranceExpiry?.toIso8601String(),
        'gps_device_id': v.gpsDeviceId,
        'has_gps': v.hasGps,
        'etc_device_id': v.etcDeviceId,
        'has_etc': v.hasEtc,
        'paired_mooc_plate': v.pairedMoocPlate,
        'status': v.status.name,
        'created_at': v.createdAt.toIso8601String(),
        'updated_at': v.updatedAt.toIso8601String(),
      };

  Map<String, dynamic> _tripToJson(Trip t) => {
        'localId': t.id,
        'storeId': AuthService.instance.storeId,
        'trip_code': t.tripCode,
        'trip_date': t.tripDate?.toIso8601String(),
        'customer_name': t.customerName,
        'pickup_point': t.pickupPoint,
        'delivery_point': t.deliveryPoint,
        'cargo_type': t.cargoType,
        'cargo_weight': t.cargoWeight,
        'container_number': t.containerNumber,
        'vehicle_plate': t.vehiclePlate,
        'mooc_plate': t.moocPlate,
        'main_driver_id': t.mainDriverId,
        'main_driver_name': t.mainDriverName,
        'assistant_driver_id': t.assistantDriverId,
        'assistant_driver_name': t.assistantDriverName,
        'coordinator_name': t.coordinatorName,
        'departure_date': t.departureDate?.toIso8601String(),
        'return_date': t.returnDate?.toIso8601String(),
        'distance_km': t.distanceKm,
        'revenue': t.revenue,
        'expenses': t.expenses,
        'status': t.status.name,
        'notes': t.notes,
        'created_at': t.createdAt.toIso8601String(),
        'updated_at': t.updatedAt.toIso8601String(),
      };

  Map<String, dynamic> _attendanceToJson(Attendance a) => {
        'localId': a.id,
        'storeId': AuthService.instance.storeId,
        'employee_id': a.employeeId,
        'employee_code': a.employeeCode,
        'employee_name': a.employeeName,
        'year': a.year,
        'month': a.month,
        'attendance_type': a.attendanceType.name,
        'working_days': a.workingDays,
        'morning_shifts': a.morningShifts,
        'afternoon_shifts': a.afternoonShifts,
        'overtime_hours': a.overtimeHours,
        'leave_days': a.leaveDays,
        'holiday_days': a.holidayDays,
        'late_days': a.lateDays,
        'early_leave_days': a.earlyLeaveDays,
        'total_trips': a.totalTrips,
        'total_km': a.totalKm,
        'total_containers': a.totalContainers,
        'total_driving_hours': a.totalDrivingHours,
        'rest_hours': a.restHours,
        'driver_leave_days': a.driverLeaveDays,
        'annual_leave_days': a.annualLeaveDays,
        'sick_leave_days': a.sickLeaveDays,
        'maternity_leave_days': a.maternityLeaveDays,
        'unpaid_leave_days': a.unpaidLeaveDays,
        'notes': a.notes,
        'created_at': a.createdAt.toIso8601String(),
        'updated_at': a.updatedAt.toIso8601String(),
      };

  Map<String, dynamic> _payrollToJson(Payroll p) => {
        'localId': p.id,
        'storeId': AuthService.instance.storeId,
        'employee_id': p.employeeId,
        'employee_code': p.employeeCode,
        'employee_name': p.employeeName,
        'department': p.department,
        'position': p.position,
        'is_driver': p.isDriver,
        'year': p.year,
        'month': p.month,
        'base_salary': p.baseSalary,
        'working_days': p.workingDays,
        'actual_working_days': p.actualWorkingDays,
        'earned_base_salary': p.earnedBaseSalary,
        'trip_salary': p.tripSalary,
        'km_salary': p.kmSalary,
        'container_salary': p.containerSalary,
        'revenue_salary': p.revenueSalary,
        'allowance_phone': p.allowancePhone,
        'allowance_meal': p.allowanceMeal,
        'allowance_night_stay': p.allowanceNightStay,
        'allowance_fuel': p.allowanceFuel,
        'business_expense': p.businessExpense,
        'overtime_salary': p.overtimeSalary,
        'diligence_bonus': p.diligenceBonus,
        'safety_bonus': p.safetyBonus,
        'fuel_saving_bonus': p.fuelSavingBonus,
        'kpi_bonus': p.kpiBonus,
        'monthly_bonus': p.monthlyBonus,
        'other_bonus': p.otherBonus,
        'violation_penalty': p.violationPenalty,
        'accident_penalty': p.accidentPenalty,
        'cargo_penalty': p.cargoPenalty,
        'other_penalty': p.otherPenalty,
        'social_insurance': p.socialInsurance,
        'health_insurance': p.healthInsurance,
        'unemployment_insurance': p.unemploymentInsurance,
        'personal_income_tax': p.personalIncomeTax,
        'advance_deduction': p.advanceDeduction,
        'other_deduction': p.otherDeduction,
        'gross_salary': p.grossSalary,
        'total_deductions': p.totalDeductions,
        'net_salary': p.netSalary,
        'status': p.status.name,
        'notes': p.notes,
        'paid_date': p.paidDate?.toIso8601String(),
        'created_at': p.createdAt.toIso8601String(),
        'updated_at': p.updatedAt.toIso8601String(),
      };

  Map<String, dynamic> _kpiToJson(KpiRecord k) => {
        'localId': k.id,
        'storeId': AuthService.instance.storeId,
        'driver_id': k.driverId,
        'driver_name': k.driverName,
        'year': k.year,
        'month': k.month,
        'on_time_score': k.onTimeScore,
        'total_trips': k.totalTrips,
        'total_km': k.totalKm,
        'fuel_consumption': k.fuelConsumption,
        'fuel_target': k.fuelTarget,
        'violations': k.violations,
        'accidents': k.accidents,
        'customer_rating': k.customerRating,
        'kpi_score': k.kpiScore,
        'kpi_bonus': k.kpiBonus,
        'notes': k.notes,
        'created_at': k.createdAt.toIso8601String(),
        'updated_at': k.updatedAt.toIso8601String(),
      };

  Map<String, dynamic> _bonusToJson(BonusRecord b) => {
        'localId': b.id,
        'storeId': AuthService.instance.storeId,
        'employee_id': b.employeeId,
        'employee_name': b.employeeName,
        'bonus_type': b.bonusType,
        'description': b.description,
        'bonus_date': b.bonusDate.toIso8601String(),
        'year': b.year,
        'month': b.month,
        'bonus_amount': b.bonusAmount,
        'approved_by': b.approvedBy,
        'notes': b.notes,
        'created_at': b.createdAt.toIso8601String(),
      };

  Map<String, dynamic> _disciplineToJson(DisciplineRecord d) => {
        'localId': d.id,
        'storeId': AuthService.instance.storeId,
        'employee_id': d.employeeId,
        'employee_name': d.employeeName,
        'violation_type': d.violationType,
        'description': d.description,
        'violation_date': d.violationDate.toIso8601String(),
        'penalty_amount': d.penaltyAmount,
        'handled_by': d.handledBy,
        'notes': d.notes,
        'created_at': d.createdAt.toIso8601String(),
      };

  // ─── JSON deserializers ───────────────────────────────────────────────────
  Employee _employeeFromJson(Map<String, dynamic> j) => Employee()
    ..employeeCode = _s(j['employee_code'])
    ..fullName = _s(j['full_name'])
    ..birthDate = _dt(j['birth_date'])
    ..cccd = j['cccd']?.toString()
    ..cccdIssueDate = _dt(j['cccd_issue_date'])
    ..cccdIssuePlace = j['cccd_issue_place']?.toString()
    ..address = j['address']?.toString()
    ..phone = j['phone']?.toString()
    ..email = j['email']?.toString()
    ..gender = _gender(j['gender'])
    ..maritalStatus = _marital(j['marital_status'])
    ..emergencyContact = j['emergency_contact']?.toString()
    ..emergencyPhone = j['emergency_phone']?.toString()
    ..taxCode = j['tax_code']?.toString()
    ..socialInsuranceCode = j['social_insurance_code']?.toString()
    ..bankAccount = j['bank_account']?.toString()
    ..bankName = j['bank_name']?.toString()
    ..department = _s(j['department'])
    ..position = _s(j['position'])
    ..joinDate = _dt(j['join_date'])
    ..resignDate = _dt(j['resign_date'])
    ..status = _empStatus(j['status'])
    ..baseSalary = _d(j['base_salary'])
    ..allowancePhone = _d(j['allowance_phone'])
    ..allowanceMeal = _d(j['allowance_meal'])
    ..allowanceTransport = _d(j['allowance_transport'])
    ..hasSocialInsurance = _b(j['has_social_insurance'])
    ..socialInsuranceRate = _d(j['social_insurance_rate'])
    ..healthInsuranceRate = _d(j['health_insurance_rate'])
    ..unemploymentInsuranceRate = _d(j['unemployment_insurance_rate'])
    ..dependents = _i(j['dependents'])
    ..annualLeaveTotal = _i(j['annual_leave_total'])
    ..annualLeaveUsed = _i(j['annual_leave_used'])
    ..createdAt = _dt(j['created_at']) ?? DateTime.now()
    ..updatedAt = _dt(j['updated_at']) ?? DateTime.now();

  Driver _driverFromJson(Map<String, dynamic> j) => Driver()
    ..employeeId = _i(j['employee_id'])
    ..employeeCode = _s(j['employee_code'])
    ..fullName = _s(j['full_name'])
    ..licenseNumber = j['license_number']?.toString()
    ..licenseClass = _licClass(j['license_class'])
    ..licenseIssueDate = _dt(j['license_issue_date'])
    ..licenseExpiryDate = _dt(j['license_expiry_date'])
    ..healthCheckDate = _dt(j['health_check_date'])
    ..healthCheckExpiry = _dt(j['health_check_expiry'])
    ..experienceYears = _i(j['experience_years'])
    ..canDriveContainer = _b(j['can_drive_container'])
    ..canDriveTruck = _b(j['can_drive_truck'])
    ..canDriveTractor = _b(j['can_drive_tractor'])
    ..canDriveMooc = _b(j['can_drive_mooc'])
    ..hasAdrCertificate = _b(j['has_adr_certificate'])
    ..hasDangerousGoodsCert = _b(j['has_dangerous_goods_cert'])
    ..status = _drvStatus(j['status'])
    ..baseSalary = _d(j['base_salary'])
    ..salaryPerTrip = _d(j['salary_per_trip'])
    ..salaryPerKm = _d(j['salary_per_km'])
    ..salaryPerContainer = _d(j['salary_per_container'])
    ..revenueSharePercent = _d(j['revenue_share_percent'])
    ..allowancePhone = _d(j['allowance_phone'])
    ..allowanceMeal = _d(j['allowance_meal'])
    ..allowanceNightStay = _d(j['allowance_night_stay'])
    ..allowanceFuel = _d(j['allowance_fuel'])
    ..createdAt = _dt(j['created_at']) ?? DateTime.now()
    ..updatedAt = _dt(j['updated_at']) ?? DateTime.now();

  Vehicle _vehicleFromJson(Map<String, dynamic> j) => Vehicle()
    ..licensePlate = _s(j['license_plate'])
    ..chassisNumber = j['chassis_number']?.toString()
    ..engineNumber = j['engine_number']?.toString()
    ..vehicleType = _vehType(j['vehicle_type'])
    ..brand = j['brand']?.toString()
    ..manufacturingYear = (j['manufacturing_year'] as num?)?.toInt()
    ..loadCapacity = (j['load_capacity'] as num?)?.toDouble()
    ..registrationDate = _dt(j['registration_date'])
    ..registrationExpiry = _dt(j['registration_expiry'])
    ..insuranceNumber = j['insurance_number']?.toString()
    ..insuranceExpiry = _dt(j['insurance_expiry'])
    ..gpsDeviceId = j['gps_device_id']?.toString()
    ..hasGps = _b(j['has_gps'])
    ..etcDeviceId = j['etc_device_id']?.toString()
    ..hasEtc = _b(j['has_etc'])
    ..pairedMoocPlate = j['paired_mooc_plate']?.toString()
    ..status = _vehStatus(j['status'])
    ..createdAt = _dt(j['created_at']) ?? DateTime.now()
    ..updatedAt = _dt(j['updated_at']) ?? DateTime.now();

  Trip _tripFromJson(Map<String, dynamic> j) => Trip()
    ..tripCode = _s(j['trip_code'])
    ..tripDate = _dt(j['trip_date'])
    ..customerName = j['customer_name']?.toString()
    ..pickupPoint = j['pickup_point']?.toString()
    ..deliveryPoint = j['delivery_point']?.toString()
    ..cargoType = j['cargo_type']?.toString()
    ..cargoWeight = (j['cargo_weight'] as num?)?.toDouble()
    ..containerNumber = j['container_number']?.toString()
    ..vehiclePlate = j['vehicle_plate']?.toString()
    ..moocPlate = j['mooc_plate']?.toString()
    ..mainDriverId = (j['main_driver_id'] as num?)?.toInt()
    ..mainDriverName = j['main_driver_name']?.toString()
    ..assistantDriverId = (j['assistant_driver_id'] as num?)?.toInt()
    ..assistantDriverName = j['assistant_driver_name']?.toString()
    ..coordinatorName = j['coordinator_name']?.toString()
    ..departureDate = _dt(j['departure_date'])
    ..returnDate = _dt(j['return_date'])
    ..distanceKm = (j['distance_km'] as num?)?.toDouble()
    ..revenue = (j['revenue'] as num?)?.toDouble()
    ..expenses = (j['expenses'] as num?)?.toDouble()
    ..status = _tripStatus(j['status'])
    ..notes = j['notes']?.toString()
    ..createdAt = _dt(j['created_at']) ?? DateTime.now()
    ..updatedAt = _dt(j['updated_at']) ?? DateTime.now();

  Attendance _attendanceFromJson(Map<String, dynamic> j) => Attendance()
    ..employeeId = _i(j['employee_id'])
    ..employeeCode = _s(j['employee_code'])
    ..employeeName = _s(j['employee_name'])
    ..year = _i(j['year'])
    ..month = _i(j['month'])
    ..attendanceType = _attType(j['attendance_type'])
    ..workingDays = _d(j['working_days'])
    ..morningShifts = _d(j['morning_shifts'])
    ..afternoonShifts = _d(j['afternoon_shifts'])
    ..overtimeHours = _d(j['overtime_hours'])
    ..leaveDays = _d(j['leave_days'])
    ..holidayDays = _d(j['holiday_days'])
    ..lateDays = _d(j['late_days'])
    ..earlyLeaveDays = _d(j['early_leave_days'])
    ..totalTrips = _i(j['total_trips'])
    ..totalKm = _d(j['total_km'])
    ..totalContainers = _i(j['total_containers'])
    ..totalDrivingHours = _d(j['total_driving_hours'])
    ..restHours = _d(j['rest_hours'])
    ..driverLeaveDays = _d(j['driver_leave_days'])
    ..annualLeaveDays = _d(j['annual_leave_days'])
    ..sickLeaveDays = _d(j['sick_leave_days'])
    ..maternityLeaveDays = _d(j['maternity_leave_days'])
    ..unpaidLeaveDays = _d(j['unpaid_leave_days'])
    ..notes = j['notes']?.toString()
    ..createdAt = _dt(j['created_at']) ?? DateTime.now()
    ..updatedAt = _dt(j['updated_at']) ?? DateTime.now();

  Payroll _payrollFromJson(Map<String, dynamic> j) => Payroll()
    ..employeeId = _i(j['employee_id'])
    ..employeeCode = _s(j['employee_code'])
    ..employeeName = _s(j['employee_name'])
    ..department = _s(j['department'])
    ..position = _s(j['position'])
    ..isDriver = _b(j['is_driver'])
    ..year = _i(j['year'])
    ..month = _i(j['month'])
    ..baseSalary = _d(j['base_salary'])
    ..workingDays = _d(j['working_days'])
    ..actualWorkingDays = _d(j['actual_working_days'])
    ..earnedBaseSalary = _d(j['earned_base_salary'])
    ..tripSalary = _d(j['trip_salary'])
    ..kmSalary = _d(j['km_salary'])
    ..containerSalary = _d(j['container_salary'])
    ..revenueSalary = _d(j['revenue_salary'])
    ..allowancePhone = _d(j['allowance_phone'])
    ..allowanceMeal = _d(j['allowance_meal'])
    ..allowanceNightStay = _d(j['allowance_night_stay'])
    ..allowanceFuel = _d(j['allowance_fuel'])
    ..businessExpense = _d(j['business_expense'])
    ..overtimeSalary = _d(j['overtime_salary'])
    ..diligenceBonus = _d(j['diligence_bonus'])
    ..safetyBonus = _d(j['safety_bonus'])
    ..fuelSavingBonus = _d(j['fuel_saving_bonus'])
    ..kpiBonus = _d(j['kpi_bonus'])
    ..monthlyBonus = _d(j['monthly_bonus'])
    ..otherBonus = _d(j['other_bonus'])
    ..violationPenalty = _d(j['violation_penalty'])
    ..accidentPenalty = _d(j['accident_penalty'])
    ..cargoPenalty = _d(j['cargo_penalty'])
    ..otherPenalty = _d(j['other_penalty'])
    ..socialInsurance = _d(j['social_insurance'])
    ..healthInsurance = _d(j['health_insurance'])
    ..unemploymentInsurance = _d(j['unemployment_insurance'])
    ..personalIncomeTax = _d(j['personal_income_tax'])
    ..advanceDeduction = _d(j['advance_deduction'])
    ..otherDeduction = _d(j['other_deduction'])
    ..grossSalary = _d(j['gross_salary'])
    ..totalDeductions = _d(j['total_deductions'])
    ..netSalary = _d(j['net_salary'])
    ..status = _payStatus(j['status'])
    ..notes = j['notes']?.toString()
    ..paidDate = _dt(j['paid_date'])
    ..createdAt = _dt(j['created_at']) ?? DateTime.now()
    ..updatedAt = _dt(j['updated_at']) ?? DateTime.now();

  KpiRecord _kpiFromJson(Map<String, dynamic> j) => KpiRecord()
    ..driverId = _i(j['driver_id'])
    ..driverName = _s(j['driver_name'])
    ..year = _i(j['year'])
    ..month = _i(j['month'])
    ..onTimeScore = _d(j['on_time_score'])
    ..totalTrips = _i(j['total_trips'])
    ..totalKm = _d(j['total_km'])
    ..fuelConsumption = _d(j['fuel_consumption'])
    ..fuelTarget = _d(j['fuel_target'])
    ..violations = _i(j['violations'])
    ..accidents = _i(j['accidents'])
    ..customerRating = _d(j['customer_rating'])
    ..kpiScore = _d(j['kpi_score'])
    ..kpiBonus = _d(j['kpi_bonus'])
    ..notes = j['notes']?.toString()
    ..createdAt = _dt(j['created_at']) ?? DateTime.now()
    ..updatedAt = _dt(j['updated_at']) ?? DateTime.now();

  BonusRecord _bonusFromJson(Map<String, dynamic> j) => BonusRecord()
    ..employeeId = _i(j['employee_id'])
    ..employeeName = _s(j['employee_name'])
    ..bonusType = _s(j['bonus_type'])
    ..description = _s(j['description'])
    ..bonusDate = _dt(j['bonus_date']) ?? DateTime.now()
    ..year = _i(j['year'])
    ..month = _i(j['month'])
    ..bonusAmount = _d(j['bonus_amount'])
    ..approvedBy = j['approved_by']?.toString()
    ..notes = j['notes']?.toString()
    ..createdAt = _dt(j['created_at']) ?? DateTime.now();

  DisciplineRecord _disciplineFromJson(Map<String, dynamic> j) =>
      DisciplineRecord()
        ..employeeId = _i(j['employee_id'])
        ..employeeName = _s(j['employee_name'])
        ..violationType = _s(j['violation_type'])
        ..description = _s(j['description'])
        ..violationDate = _dt(j['violation_date']) ?? DateTime.now()
        ..penaltyAmount = _d(j['penalty_amount'])
        ..handledBy = j['handled_by']?.toString()
        ..notes = j['notes']?.toString()
        ..createdAt = _dt(j['created_at']) ?? DateTime.now();

  // ─── Type helpers ─────────────────────────────────────────────────────────
  static double _d(dynamic v) => (v as num?)?.toDouble() ?? 0;
  static int _i(dynamic v) => (v as num?)?.toInt() ?? 0;
  static String _s(dynamic v) => v?.toString() ?? '';
  static bool _b(dynamic v) => v == true;
  static DateTime? _dt(dynamic v) =>
      (v == null || v == '') ? null : DateTime.tryParse(v.toString());

  static Gender _gender(dynamic v) => Gender.values.firstWhere(
        (e) => e.name == v,
        orElse: () => Gender.male,
      );

  static MaritalStatus _marital(dynamic v) => MaritalStatus.values.firstWhere(
        (e) => e.name == v,
        orElse: () => MaritalStatus.single,
      );

  static EmployeeStatus _empStatus(dynamic v) =>
      EmployeeStatus.values.firstWhere(
        (e) => e.name == v,
        orElse: () => EmployeeStatus.active,
      );

  static DriverLicenseClass _licClass(dynamic v) =>
      DriverLicenseClass.values.firstWhere(
        (e) => e.name == v,
        orElse: () => DriverLicenseClass.b2,
      );

  static DriverStatus _drvStatus(dynamic v) => DriverStatus.values.firstWhere(
        (e) => e.name == v,
        orElse: () => DriverStatus.driving,
      );

  static VehicleType _vehType(dynamic v) => VehicleType.values.firstWhere(
        (e) => e.name == v,
        orElse: () => VehicleType.tractor,
      );

  static VehicleStatus _vehStatus(dynamic v) => VehicleStatus.values.firstWhere(
        (e) => e.name == v,
        orElse: () => VehicleStatus.active,
      );

  static TripStatus _tripStatus(dynamic v) => TripStatus.values.firstWhere(
        (e) => e.name == v,
        orElse: () => TripStatus.assigned,
      );

  static AttendanceType _attType(dynamic v) => AttendanceType.values.firstWhere(
        (e) => e.name == v,
        orElse: () => AttendanceType.office,
      );

  static PayrollStatus _payStatus(dynamic v) => PayrollStatus.values.firstWhere(
        (e) => e.name == v,
        orElse: () => PayrollStatus.draft,
      );
}

class SyncResult {
  final int pushed;
  final int pulled;
  final int failed;
  final List<String> errors;
  final DateTime syncTime;
  final bool configured;

  SyncResult({
    required this.pushed,
    required this.pulled,
    required this.failed,
    required this.errors,
    required this.syncTime,
    this.configured = true,
  });

  factory SyncResult.notConfigured() => SyncResult(
        pushed: 0,
        pulled: 0,
        failed: 0,
        errors: ['Chưa cấu hình API URL và Token'],
        syncTime: DateTime.now(),
        configured: false,
      );

  bool get hasErrors => errors.isNotEmpty;
  String get summary =>
      'Đã đẩy: $pushed | Kéo về: $pulled | Lỗi: $failed';
}
