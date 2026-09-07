import 'dart:convert';
import 'package:isar/isar.dart';

import '../models/patient.dart';
import '../models/appointment.dart';
import '../models/clinical.dart';
import '../models/prescription.dart';
import '../models/pharmacy.dart';
import '../models/inventory.dart';
import '../models/billing.dart';
import '../models/laboratory.dart';
import '../models/sync.dart';
import '../models/ai.dart';
import '../models/queueticket.dart';
import 'phongkham_seed_data.dart';

/// Interface cho sync API. Test dùng mock.
abstract class SyncApiClient {
  Future<Map<String, dynamic>> push({
    required String deviceId,
    required List<Map<String, dynamic>> operations,
  });
  Future<Map<String, dynamic>> pull({
    required String deviceId,
    String? lastCursor,
  });
}

/// Simple in-memory mock cho tests.
class MockSyncApiClient implements SyncApiClient {
  @override
  Future<Map<String, dynamic>> push({
    required String deviceId,
    required List<Map<String, dynamic>> operations,
  }) async => {'status': 'ok', 'processed': operations.length};

  @override
  Future<Map<String, dynamic>> pull({
    required String deviceId,
    String? lastCursor,
  }) async => {'status': 'ok', 'updates': <dynamic>[]};
}

/// Appointment status transitions allowed per spec.
const Map<String, List<String>> appointmentTransitions = {
  'requested': ['confirmed', 'rescheduled', 'cancelled', 'no_show'],
  'confirmed': ['checked_in', 'rescheduled', 'cancelled', 'no_show'],
  'checked_in': ['waiting', 'in_progress', 'completed', 'cancelled'],
  'waiting': ['in_progress', 'completed', 'cancelled'],
  'in_progress': ['completed', 'cancelled'],
  'rescheduled': ['confirmed', 'cancelled'],
};

/// Prescription status transitions per spec.
const List<String> prescriptionStatuses = [
  'draft', 'doctor_review', 'confirmed', 'dispensed', 'cancelled',
];

/// LabOrder status transitions per spec.
const List<String> labOrderStatuses = [
  'ordered', 'collected', 'processing', 'completed', 'verified', 'cancelled',
];

/// RBAC: role -> permission set.
const Map<String, Set<String>> phongKhamPermissions = {
  'SUPER_ADMIN': {'*'},
  'CLINIC_ADMIN': {
    'clinic.manage', 'patient.*', 'appointment.*', 'encounter.*',
    'prescription.*', 'drug.*', 'stock.*', 'lab.*', 'billing.*',
    'payment.*', 'expense.*', 'debt.*', 'report.*', 'sync.*', 'ai.*',
    'inventory.*', 'queueticket.*',
  },
  'DOCTOR': {
    'patient.read', 'record.view', 'encounter.*', 'diagnosis.*',
    'prescription.create', 'prescription.confirm', 'prescription.validate',
    'appointment.update', 'lab.order', 'lab.verify', 'ai.*',
    'followup.create', 'vital.create',
  },
  'NURSE': {
    'patient.read', 'reception.checkin', 'vital.create', 'queue.*',
    'appointment.read',
  },
  'RECEPTIONIST': {
    'patient.*', 'appointment.*', 'queue.*', 'payment.create',
    'checkin.receive', 'reception.*',
  },
  'PHARMACIST': {
    'drug.*', 'stock.*', 'prescription.dispense', 'inventory.*',
    'prescription.read',
  },
  'LAB_TECHNICIAN': {
    'lab.result', 'lab.verify', 'lab.read',
  },
  'ACCOUNTANT': {
    'invoice.*', 'payment.*', 'expense.*', 'debt.*', 'report.*',
    'stock.read', 'accounting.*', 'billing.read',
  },
};

class PhongKhamIsarService {
  late Future<Isar> db;
  final SyncApiClient _syncClient;
  final String _deviceId;
  final String _clinicId;
  final String _branchId;

  PhongKhamIsarService({
    SyncApiClient? syncClient,
    String? deviceId,
    String? clinicId,
    String? branchId,
    Isar? isar,
  })  : _syncClient = syncClient ?? MockSyncApiClient(),
        _deviceId = deviceId ?? 'device_001',
        _clinicId = clinicId ?? 'clinic_001',
        _branchId = branchId ?? 'branch_001' {
    if (isar != null) {
      db = Future.value(isar);
    } else {
      db = Isar.open(
        [
          PatientSchema,
          AppointmentSchema,
          MedicalRecordSchema,
          EncounterSchema,
          PrescriptionSchema,
          PrescriptionItemSchema,
          DrugSchema,
          WarehouseSchema,
          DrugBatchSchema,
          StockTransactionSchema,
          InvoiceSchema,
          InvoiceItemSchema,
          PaymentSchema,
          LabOrderSchema,
          LabResultSchema,
          QueueTicketSchema,
          SyncQueueSchema,
          SyncConflictSchema,
          AIRequestSchema,
          AuditLogSchema,
        ],
        directory: '.',
        name: 'kanposvnphongkham',
      );
    }
  }

  // ---------------------------------------------- shared instance for UI/tests
  static PhongKhamIsarService? _shared;
  static PhongKhamIsarService get instance {
    final s = _shared;
    if (s != null) return s;
    throw StateError('PhongKhamIsarService.instance chưa được khởi tạo. '
        'Override qua .shared trong main/test.');
  }

  static set shared(PhongKhamIsarService value) => _shared = value;

  // ------------------------------------------------------------------- RBAC
  bool hasPermission(String role, String action) {
    final perms = phongKhamPermissions[role];
    if (perms == null) return false;
    if (perms.contains('*')) return true;
    return perms.any((p) => p == action || p.endsWith('.*') && action.startsWith(p.substring(0, p.length - 1)));
  }

  void _check(String role, String action) {
    if (!hasPermission(role, action)) {
      throw StateError('FORBIDDEN: $action');
    }
  }

  // ------------------------------------------------------------------- audit
  Future<void> _addAuditLog({
    required String userId,
    required String action,
    String? details,
  }) async {
    final isar = await db;
    final log = AuditLog()
      ..userId = userId
      ..action = action
      ..details = details
      ..createdAt = DateTime.now();
    await isar.writeTxn(() async => await isar.auditLogs.put(log));
  }

  Future<List<AuditLog>> getAuditLogs({String? userId, String? action}) async {
    final isar = await db;
    final logs = await isar.auditLogs.where().findAll();
    return logs
        .where((l) =>
            (userId == null || l.userId == userId) &&
            (action == null || l.action == action))
        .toList();
  }

  // -------------------------------------------------------------- enqueue sync
  Future<void> _enqueueSync({
    required String entityType,
    required String entityId,
    required String operation,
    String? dataJson,
  }) async {
    final isar = await db;
    final q = SyncQueue()
      ..entityType = entityType
      ..entityId = entityId
      ..operation = operation
      ..dataJson = dataJson
      ..status = 'pending'
      ..retryCount = 0
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();
    await isar.writeTxn(() async => await isar.syncQueues.put(q));
  }

  // ------------------------------------------------------------------ patients
  Future<String> createPatient({
    required String fullName,
    String? phone,
    DateTime? dateOfBirth,
    String? gender,
    String? address,
    String? emergencyContact,
    List<String>? allergies,
    List<String>? chronicDiseases,
    List<String>? medicalHistory,
    List<String>? surgicalHistory,
    List<String>? familyHistory,
    List<String>? currentMedications,
    String? note,
    String? patientCode,
    required String createdBy,
    required String role,
  }) async {
    _check(role, 'patient.create');
    final isar = await db;
    final code = patientCode ?? 'BN${(await isar.patients.count()) + 1000}';
    final uuid = 'pat_${DateTime.now().millisecondsSinceEpoch}';
    final p = Patient()
      ..uuid = uuid
      ..clinicId = _clinicId
      ..tenantId = _clinicId
      ..patientCode = code
      ..fullName = fullName
      ..dateOfBirth = dateOfBirth
      ..gender = gender
      ..phone = phone
      ..address = address
      ..emergencyContact = emergencyContact
      ..allergies = allergies
      ..chronicDiseases = chronicDiseases
      ..medicalHistory = medicalHistory
      ..surgicalHistory = surgicalHistory
      ..familyHistory = familyHistory
      ..currentMedications = currentMedications
      ..note = note
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'pending_sync'
      ..deviceId = _deviceId;
    await isar.writeTxn(() async => await isar.patients.put(p));
    await _enqueueSync(entityType: 'Patient', entityId: uuid, operation: 'upsert');
    await _addAuditLog(userId: createdBy, action: 'PATIENT_CREATE', details: '${p.fullName} $code');
    return uuid;
  }

  Future<Patient?> getPatient(String uuid) async {
    final isar = await db;
    return isar.patients.where().uuidEqualTo(uuid).findFirst();
  }

  Future<List<Patient>> listPatients({String? search, String? phone}) async {
    final isar = await db;
    final all = await isar.patients.where().findAll();
    return all.where((p) {
      if (search != null && search.isNotEmpty) {
        final s = search.toLowerCase();
        final nameMatch = (p.fullName ?? '').toLowerCase().contains(s);
        final codeMatch = (p.patientCode ?? '').toLowerCase().contains(s);
        if (!nameMatch && !codeMatch) return false;
      }
      if (phone != null && p.phone != phone) return false;
      return p.deletedAt == null;
    }).toList();
  }

  Future<void> updatePatient(Patient patient, {required String userId, required String role}) async {
    _check(role, 'patient.update');
    final isar = await db;
    patient.updatedAt = DateTime.now();
    patient.version = (patient.version ?? 0) + 1;
    patient.syncStatus = 'pending_sync';
    await isar.writeTxn(() async => await isar.patients.put(patient));
    await _enqueueSync(entityType: 'Patient', entityId: patient.uuid!, operation: 'upsert');
    await _addAuditLog(userId: userId, action: 'PATIENT_UPDATE', details: patient.uuid);
  }

  Future<void> deletePatient(String uuid, {required String userId, required String role}) async {
    _check(role, 'patient.delete');
    final isar = await db;
    final p = await getPatient(uuid);
    if (p == null) return;
    p.deletedAt = DateTime.now();
    p.syncStatus = 'deleted';
    await isar.writeTxn(() async => await isar.patients.put(p));
    await _enqueueSync(entityType: 'Patient', entityId: uuid, operation: 'delete');
    await _addAuditLog(userId: userId, action: 'PATIENT_UPDATE', details: 'deleted $uuid');
  }

  // -------------------------------------------------------------- appointments
  Future<String> createAppointment({
    required String patientId,
    required String doctorId,
    required DateTime appointmentDate,
    String? specialtyId,
    String? roomId,
    DateTime? startTime,
    DateTime? endTime,
    String? reason,
    String? note,
    String? status = 'requested',
    required String createdBy,
    required String role,
  }) async {
    _check(role, 'appointment.create');
    final isar = await db;
    final uuid = 'apt_${DateTime.now().millisecondsSinceEpoch}';
    final a = Appointment()
      ..uuid = uuid
      ..clinicId = _clinicId
      ..tenantId = _clinicId
      ..branchId = _branchId
      ..patientId = patientId
      ..doctorId = doctorId
      ..specialtyId = specialtyId
      ..roomId = roomId
      ..appointmentDate = appointmentDate
      ..startTime = startTime ?? appointmentDate
      ..endTime = endTime
      ..reason = reason
      ..note = note
      ..status = status
      ..reminderStatus = 'none'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'pending_sync'
      ..deviceId = _deviceId;
    await isar.writeTxn(() async => await isar.appointments.put(a));
    await _enqueueSync(entityType: 'Appointment', entityId: uuid, operation: 'upsert');
    return uuid;
  }

  Future<Appointment?> getAppointment(String uuid) async {
    final isar = await db;
    return isar.appointments.where().uuidEqualTo(uuid).findFirst();
  }

  Future<List<Appointment>> listAppointments({String? patientId, DateTime? onDate}) async {
    final isar = await db;
    final all = await isar.appointments.where().findAll();
    return all.where((a) {
      if (patientId != null && a.patientId != patientId) return false;
      if (onDate != null && a.appointmentDate != null) {
        final sameDay = a.appointmentDate!.year == onDate.year &&
            a.appointmentDate!.month == onDate.month &&
            a.appointmentDate!.day == onDate.day;
        if (!sameDay) return false;
      }
      return a.deletedAt == null;
    }).toList();
  }

  Future<void> changeAppointmentStatus(
    String uuid,
    String newStatus, {
    required String userId,
    required String role,
  }) async {
    _check(role, 'appointment.update');
    final isar = await db;
    final a = await getAppointment(uuid);
    if (a == null) throw StateError('Appointment $uuid không tồn tại');
    final allowed = appointmentTransitions[a.status] ?? const <String>[];
    if (!allowed.contains(newStatus)) {
      throw StateError('Invalid appointment transition: ${a.status} -> $newStatus');
    }
    a.status = newStatus;
    a.updatedAt = DateTime.now();
    a.version = (a.version ?? 0) + 1;
    await isar.writeTxn(() async => await isar.appointments.put(a));
    await _enqueueSync(entityType: 'Appointment', entityId: uuid, operation: 'upsert');
  }

  Future<QueueTicket> checkInAppointment(
    String uuid, {
    required String userId,
    required String role,
    int? number,
    String? priority,
  }) async {
    _check(role, 'reception.checkin');
    final isar = await db;
    final a = await getAppointment(uuid);
    if (a == null) throw StateError('Appointment $uuid không tồn tại');
    final allowed = appointmentTransitions[a.status] ?? const <String>[];
    if (!allowed.contains('checked_in')) {
      throw StateError('Không thể check-in từ trạng thái ${a.status}');
    }
    final ticketNumber = number ?? (await isar.auditLogs.count()) + 1;
    final ticket = QueueTicket()
      ..uuid = 'qt_${DateTime.now().millisecondsSinceEpoch}'
      ..patientId = a.patientId
      ..appointmentId = uuid
      ..doctorId = a.doctorId
      ..branchId = _branchId
      ..roomId = a.roomId
      ..number = ticketNumber
      ..priority = priority ?? 'normal'
      ..status = 'waiting'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'pending_sync'
      ..deviceId = _deviceId
      ..calledAt = null;
    await isar.writeTxn(() async {
      await isar.queueTickets.put(ticket);
      a.status = 'checked_in';
      a.updatedAt = DateTime.now();
      a.version = (a.version ?? 0) + 1;
      await isar.appointments.put(a);
    });
    return ticket;
  }

  Future<void> callQueueTicket(String ticketId, {required String userId, required String role}) async {
    _check(role, 'queue.call');
    final isar = await db;
    final t = await getQueueTicket(ticketId);
    if (t == null) throw StateError('Ticket $ticketId không tồn tại');
    t.status = 'called';
    t.calledAt = DateTime.now();
    await isar.writeTxn(() async => await isar.queueTickets.put(t));
  }

  Future<QueueTicket?> getQueueTicket(String uuid) async {
    final isar = await db;
    return isar.queueTickets.where().uuidEqualTo(uuid).findFirst();
  }

  Future<List<QueueTicket>> listQueueTickets({String? date}) async {
    final isar = await db;
    final all = await isar.queueTickets.where().findAll();
    return all.where((t) {
      if (date == null) return true;
      return t.createdAt != null &&
          t.createdAt!.toIso8601String().startsWith(date);
    }).toList();
  }

  // --------------------------------------------------------------- encounters
  Future<String> createEncounter({
    required String patientId,
    required String doctorId,
    String? reasonForVisit,
    String? symptoms,
    String? medicalHistory,
    String? notes,
    required String createdBy,
    required String role,
  }) async {
    _check(role, 'encounter.create');
    final isar = await db;
    var record = await isar.medicalRecords.where().patientIdEqualTo(patientId).findFirst();
    if (record == null) {
      final newRecord = MedicalRecord()
        ..uuid = 'mdr_${DateTime.now().millisecondsSinceEpoch}'
        ..patientId = patientId
        ..clinicId = _clinicId
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..version = 1
        ..syncStatus = 'pending_sync'
        ..deviceId = _deviceId;
      await isar.writeTxn(() async => await isar.medicalRecords.put(newRecord));
      record = newRecord;
    }
    final recordUuid = record.uuid;
    final uuid = 'enc_${DateTime.now().millisecondsSinceEpoch}';
    final e = Encounter()
      ..uuid = uuid
      ..patientId = patientId
      ..medicalRecordId = recordUuid
      ..doctorId = doctorId
      ..reasonForVisit = reasonForVisit
      ..symptoms = symptoms
      ..medicalHistory = medicalHistory
      ..notes = notes
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'pending_sync'
      ..deviceId = _deviceId;
    await isar.writeTxn(() async => await isar.encounters.put(e));
    await _enqueueSync(entityType: 'Encounter', entityId: uuid, operation: 'upsert');
    await _addAuditLog(userId: createdBy, action: 'ENCOUNTER_CREATE', details: uuid);
    return uuid;
  }

  Future<Encounter?> getEncounter(String uuid) async {
    final isar = await db;
    return isar.encounters.where().uuidEqualTo(uuid).findFirst();
  }

  Future<List<Encounter>> listEncounters({String? patientId}) async {
    final isar = await db;
    final all = await isar.encounters.where().findAll();
    return all.where((e) => patientId == null || e.patientId == patientId).toList();
  }

  Future<void> saveVitals({
    required String encounterId,
    required double systolic,
    required double diastolic,
    double? pulse,
    double? temperature,
    double? spO2,
    double? respiratoryRate,
    double? height,
    double? weight,
    required String userId,
    required String role,
  }) async {
    _check(role, 'vital.create');
    final isar = await db;
    final e = await getEncounter(encounterId);
    if (e == null) throw StateError('Encounter $encounterId không tồn tại');
    e
      ..bloodPressureSystolic = systolic
      ..bloodPressureDiastolic = diastolic
      ..pulse = pulse
      ..temperature = temperature
      ..spO2 = spO2
      ..respiratoryRate = respiratoryRate
      ..height = height
      ..weight = weight;
    if (height != null && height > 0 && weight != null) {
      final h = height / 100;
      e.bmi = double.parse((weight / (h * h)).toStringAsFixed(1));
    }
    await isar.writeTxn(() async => await isar.encounters.put(e));
    await _addAuditLog(userId: userId, action: 'VITALS_CREATE', details: encounterId);
  }

  Future<void> setDiagnosis({
    required String encounterId,
    required String diagnosis,
    List<String>? icd10,
    String? type = 'confirmed',
    required String userId,
    required String role,
  }) async {
    _check(role, 'diagnosis.create');
    final isar = await db;
    final e = await getEncounter(encounterId);
    if (e == null) throw StateError('Encounter $encounterId không tồn tại');
    if (type == 'suspected' || type == 'differential') {
      e.preliminaryDiagnosis = diagnosis;
    } else {
      e.finalDiagnosis = diagnosis;
    }
    e
      ..icd10Codes = icd10 ?? e.icd10Codes
      ..updatedAt = DateTime.now();
    await isar.writeTxn(() async => await isar.encounters.put(e));
    await _addAuditLog(userId: userId, action: 'DIAGNOSIS_CREATE', details: '$encounterId | $diagnosis');
  }

  // ------------------------------------------------------------- prescriptions
  Future<String> createPrescription({
    required String patientId,
    required String encounterId,
    required String doctorId,
    String? diagnosis,
    String? notes,
    String? status = 'draft',
    List<Map<String, dynamic>> items = const [],
    required String createdBy,
    required String role,
  }) async {
    _check(role, 'prescription.create');
    final isar = await db;
    if (!prescriptionStatuses.contains(status)) {
      throw StateError('Invalid prescription status: $status');
    }
    final uuid = 'rx_${DateTime.now().millisecondsSinceEpoch}';
    final rx = Prescription()
      ..uuid = uuid
      ..patientId = patientId
      ..encounterId = encounterId
      ..doctorId = doctorId
      ..status = status
      ..diagnosis = diagnosis
      ..notes = notes
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'pending_sync'
      ..deviceId = _deviceId;
    await isar.writeTxn(() async => await isar.prescriptions.put(rx));
    for (final item in items) {
      await addPrescriptionItem(prescriptionId: uuid, data: item, userId: createdBy, role: role);
    }
    await _enqueueSync(entityType: 'Prescription', entityId: uuid, operation: 'upsert');
    await _addAuditLog(userId: createdBy, action: 'PRESCRIPTION_CREATE', details: uuid);
    return uuid;
  }

  Future<void> addPrescriptionItem({
    required String prescriptionId,
    required Map<String, dynamic> data,
    required String userId,
    required String role,
  }) async {
    _check(role, 'prescription.create');
    final isar = await db;
    final item = PrescriptionItem()
      ..uuid = 'rxi_${DateTime.now().microsecondsSinceEpoch}'
      ..prescriptionId = prescriptionId
      ..drugId = data['drugId'] as String?
      ..batchId = data['batchId'] as String?
      ..dosage = data['dosage'] as String?
      ..frequency = data['frequency'] as String?
      ..route = data['route'] as String?
      ..quantity = (data['quantity'] as num?)?.toDouble()
      ..duration = data['duration'] as String?
      ..unit = data['unit'] as String?
      ..instruction = data['instruction'] as String?
      ..warning = data['warning'] as String?
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'pending_sync'
      ..deviceId = _deviceId;
    await isar.writeTxn(() async => await isar.prescriptionItems.put(item));
  }

  Future<Prescription?> getPrescription(String uuid) async {
    final isar = await db;
    return isar.prescriptions.where().uuidEqualTo(uuid).findFirst();
  }

  Future<List<PrescriptionItem>> getPrescriptionItems(String rxId) async {
    final isar = await db;
    return isar.prescriptionItems.where().prescriptionIdEqualTo(rxId).findAll();
  }

  /// Kiểm tra an toàn toa thuốc: dị ứng, trùng hoạt chất, tồn kho, hạn dùng.
  Future<List<String>> validatePrescription(
    String rxId, {
    required String userId,
    required String role,
  }) async {
    _check(role, 'prescription.validate');
    final rx = await getPrescription(rxId);
    final warnings = <String>[];
    if (rx == null) {
      throw StateError('Prescription $rxId không tồn tại');
    }
    final patient = await getPatient(rx.patientId ?? '');
    final items = await getPrescriptionItems(rxId);
    for (final item in items) {
      final drug = item.drugId == null ? null : await getDrug(item.drugId!);
      if (drug == null) continue;
      final drugName = drug.name?.toLowerCase() ?? '';
      final ingredient = drug.activeIngredient?.toLowerCase() ?? '';
      for (final allergy in patient?.allergies ?? const <String>[]) {
        if (drugName.contains(allergy.toLowerCase()) ||
            ingredient.contains(allergy.toLowerCase())) {
          warnings.add('Dị ứng: $drugName ($allergy)');
        }
      }
      for (final other in items) {
        if (other.id != item.id && other.drugId == item.drugId) {
          warnings.add('Trùng thuốc: ${drug.name} xuất hiện nhiều lần');
        }
      }
      if (ingredient.isNotEmpty) {
        for (final other in items) {
          if (other.id == item.id) continue;
          final otherDrug = other.drugId == null ? null : await getDrug(other.drugId!);
          if (otherDrug == null) continue;
          final otherIngredient = otherDrug.activeIngredient?.toLowerCase() ?? '';
          if (otherIngredient == ingredient && other.drugId != item.drugId) {
            warnings.add('Trùng hoạt chất: $ingredient (${drug.name} + ${otherDrug.name})');
          }
        }
      }
      final batch = item.batchId == null ? null : await getDrugBatch(item.batchId!);
      if (batch == null) {
        warnings.add('Thiếu lô hàng (batch) cho ${drug.name}');
        continue;
      }
      final qty = item.quantity ?? 0;
      if (batch.quantity != null && batch.quantity! < qty) {
        warnings.add('Tồn kho không đủ cho ${drug.name}: cần $qty, có ${batch.quantity}');
      }
      if (batch.expiryDate != null && batch.expiryDate!.isBefore(DateTime.now())) {
        warnings.add('Thuốc ${drug.name} hết hạn ngày ${batch.expiryDate!.day}/${batch.expiryDate!.month}/${batch.expiryDate!.year}');
      }
    }
    return warnings;
  }

  Future<void> validateAndConfirmPrescription(
    String rxId, {
    required String userId,
    required String role,
  }) async {
    final warnings = await validatePrescription(rxId, userId: userId, role: role);
    if (warnings.isNotEmpty) {
      throw StateError('Prescription safety check failed: ${warnings.join('; ')}');
    }
    final isar = await db;
    final rx = await getPrescription(rxId);
    if (rx == null) throw StateError('Prescription $rxId không tồn tại');
    if (rx.status != 'draft' && rx.status != 'doctor_review') {
      throw StateError('Không thể xác nhận toa ở trạng thái ${rx.status}');
    }
    rx
      ..status = 'confirmed'
      ..confirmedAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = (rx.version ?? 0) + 1;
    await isar.writeTxn(() async => await isar.prescriptions.put(rx));
    await _enqueueSync(entityType: 'Prescription', entityId: rxId, operation: 'upsert');
    await _addAuditLog(userId: userId, action: 'PRESCRIPTION_CONFIRM', details: rxId);
  }

  Future<void> dispensePrescription(
    String rxId, {
    required String userId,
    required String role,
  }) async {
    _check(role, 'prescription.dispense');
    final isar = await db;
    final rx = await getPrescription(rxId);
    if (rx == null) throw StateError('Prescription $rxId không tồn tại');
    if (rx.status != 'confirmed') {
      throw StateError('Chỉ toa đã xác nhận mới cấp phát được (status: ${rx.status})');
    }
    final items = await getPrescriptionItems(rxId);
    for (final item in items) {
      final batchId = item.batchId;
      if (batchId == null) continue;
      await stockOut(
        batchId: batchId,
        quantity: item.quantity ?? 0,
        sourceDocumentId: rxId,
        createdBy: userId,
        role: role,
        type: 'dispense',
      );
    }
    rx
      ..status = 'dispensed'
      ..updatedAt = DateTime.now()
      ..version = (rx.version ?? 0) + 1;
    await isar.writeTxn(() async => await isar.prescriptions.put(rx));
    await _enqueueSync(entityType: 'Prescription', entityId: rxId, operation: 'upsert');
    await _addAuditLog(userId: userId, action: 'PRESCRIPTION_DISPENSE', details: rxId);
  }

  Future<void> cancelPrescription(String rxId, {required String userId, required String role}) async {
    _check(role, 'prescription.confirm');
    final isar = await db;
    final rx = await getPrescription(rxId);
    if (rx == null) throw StateError('Prescription $rxId không tồn tại');
    rx
      ..status = 'cancelled'
      ..updatedAt = DateTime.now();
    await isar.writeTxn(() async => await isar.prescriptions.put(rx));
    await _addAuditLog(userId: userId, action: 'PRESCRIPTION_CREATE', details: 'cancelled $rxId');
  }

  // ------------------------------------------------------------------- drugs
  Future<String> createDrug({
    required String name,
    String? activeIngredient,
    String? dosage,
    String? form,
    String? unit,
    String? route,
    String? manufacturer,
    String? category,
    String? contraindications,
    String? interactions,
    String? warnings,
    required String createdBy,
    required String role,
  }) async {
    _check(role, 'drug.create');
    final isar = await db;
    final uuid = 'drg_${DateTime.now().millisecondsSinceEpoch}';
    final d = Drug()
      ..uuid = uuid
      ..clinicId = _clinicId
      ..name = name
      ..activeIngredient = activeIngredient
      ..dosage = dosage
      ..form = form
      ..unit = unit
      ..route = route
      ..manufacturer = manufacturer
      ..category = category
      ..contraindications = contraindications
      ..interactions = interactions
      ..warnings = warnings
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'pending_sync'
      ..deviceId = _deviceId;
    await isar.writeTxn(() async => await isar.drugs.put(d));
    await _enqueueSync(entityType: 'Drug', entityId: uuid, operation: 'upsert');
    return uuid;
  }

  Future<Drug?> getDrug(String uuid) async {
    final isar = await db;
    return isar.drugs.where().uuidEqualTo(uuid).findFirst();
  }

  Future<List<Drug>> listDrugs({String? search}) async {
    final isar = await db;
    final all = await isar.drugs.where().findAll();
    return all.where((d) {
      if (search == null || search.isEmpty) return true;
      final s = search.toLowerCase();
      return (d.name ?? '').toLowerCase().contains(s) ||
          (d.activeIngredient ?? '').toLowerCase().contains(s);
    }).toList();
  }

  // ------------------------------------------------------------------ batches
  Future<String> createWarehouse({
    required String name,
    String? type,
    required String createdBy,
    required String role,
  }) async {
    _check(role, 'inventory.create');
    final isar = await db;
    final uuid = 'wh_${DateTime.now().millisecondsSinceEpoch}';
    final w = Warehouse()
      ..uuid = uuid
      ..branchId = _branchId
      ..name = name
      ..type = type ?? 'Kho thuốc'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'pending_sync'
      ..deviceId = _deviceId;
    await isar.writeTxn(() async => await isar.warehouses.put(w));
    return uuid;
  }

  Future<String> createDrugBatch({
    required String drugId,
    required String warehouseId,
    required String lotNumber,
    required DateTime expiryDate,
    required double purchasePrice,
    required double sellingPrice,
    required double quantity,
    required String createdBy,
    required String role,
  }) async {
    _check(role, 'inventory.create');
    final isar = await db;
    final uuid = 'bt_${DateTime.now().millisecondsSinceEpoch}';
    final b = DrugBatch()
      ..uuid = uuid
      ..drugId = drugId
      ..warehouseId = warehouseId
      ..lotNumber = lotNumber
      ..expiryDate = expiryDate
      ..purchasePrice = purchasePrice
      ..sellingPrice = sellingPrice
      ..quantity = quantity
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'pending_sync'
      ..deviceId = _deviceId;
    await isar.writeTxn(() async => await isar.drugBatchs.put(b));
    await _enqueueSync(entityType: 'DrugBatch', entityId: uuid, operation: 'upsert');
    return uuid;
  }

  Future<DrugBatch?> getDrugBatch(String uuid) async {
    final isar = await db;
    return isar.drugBatchs.where().uuidEqualTo(uuid).findFirst();
  }

  /// FEFO: lô sắp hết hạn trước.
  Future<DrugBatch?> findFEFOBatch(String drugId, {String? warehouseId}) async {
    final isar = await db;
    final batches = await isar.drugBatchs.where().drugIdEqualTo(drugId).findAll();
    final valid = batches.where((b) {
      if (b.expiryDate == null || b.expiryDate!.isBefore(DateTime.now())) return false;
      if (b.quantity == null || b.quantity! <= 0) return false;
      if (warehouseId != null && b.warehouseId != warehouseId) return false;
      return true;
    }).toList();
    valid.sort((a, b) => a.expiryDate!.compareTo(b.expiryDate!));
    return valid.isEmpty ? null : valid.first;
  }

  Future<List<DrugBatch>> listExpiringBatches({int withinDays = 30}) async {
    final isar = await db;
    final all = await isar.drugBatchs.where().findAll();
    return all.where((b) {
      if (b.expiryDate == null) return false;
      final days = b.expiryDate!.difference(DateTime.now()).inDays;
      return days >= 0 && days <= withinDays;
    }).toList();
  }

  Future<List<DrugBatch>> listLowStock({double threshold = 10}) async {
    final isar = await db;
    final all = await isar.drugBatchs.where().findAll();
    return all.where((b) => (b.quantity ?? 0) <= threshold).toList();
  }

  // ------------------------------------------------------------------ stock
  Future<void> stockOut({
    required String batchId,
    required double quantity,
    String? sourceDocumentId,
    String? type = 'sale',
    required String createdBy,
    required String role,
  }) async {
    _check(role, 'stock.update');
    final isar = await db;
    final batch = await getDrugBatch(batchId);
    if (batch == null) throw StateError('Batch $batchId không tồn tại');
    if ((batch.quantity ?? 0) < quantity) {
      throw StateError('Tồn kho không đủ: ${batch.quantity} < $quantity');
    }
    batch.quantity = (batch.quantity ?? 0) - quantity;
    await isar.writeTxn(() async {
      await isar.drugBatchs.put(batch);
      final t = StockTransaction()
        ..warehouseId = batch.warehouseId
        ..batchId = batchId
        ..type = type
        ..sourceDocumentId = sourceDocumentId
        ..quantity = quantity
        ..unitCost = batch.purchasePrice
        ..createdBy = createdBy
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..version = 1
        ..syncStatus = 'pending_sync'
        ..deviceId = _deviceId;
      await isar.stockTransactions.put(t);
    });
    await _enqueueSync(entityType: 'StockTransaction', entityId: batchId, operation: 'upsert');
    await _addAuditLog(userId: createdBy, action: 'STOCK_ADJUST', details: '$batchId -$quantity');
  }

  Future<void> stockIn({
    required String batchId,
    required double quantity,
    String? sourceDocumentId,
    String? type = 'purchase',
    required String createdBy,
    required String role,
  }) async {
    _check(role, 'stock.update');
    final isar = await db;
    final batch = await getDrugBatch(batchId);
    if (batch == null) throw StateError('Batch $batchId không tồn tại');
    batch.quantity = (batch.quantity ?? 0) + quantity;
    await isar.writeTxn(() async {
      await isar.drugBatchs.put(batch);
      final t = StockTransaction()
        ..warehouseId = batch.warehouseId
        ..batchId = batchId
        ..type = type
        ..sourceDocumentId = sourceDocumentId
        ..quantity = quantity
        ..unitCost = batch.purchasePrice
        ..createdBy = createdBy
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..version = 1
        ..syncStatus = 'pending_sync'
        ..deviceId = _deviceId;
      await isar.stockTransactions.put(t);
    });
  }

  Future<List<StockTransaction>> listStockTransactions({String? batchId}) async {
    final isar = await db;
    final all = await isar.stockTransactions.where().findAll();
    return all.where((t) => batchId == null || t.batchId == batchId).toList();
  }

  // -------------------------------------------------------------------- lab
  Future<String> createLabOrder({
    required String patientId,
    required String encounterId,
    required String doctorId,
    String? priority = 'normal',
    required String createdBy,
    required String role,
  }) async {
    _check(role, 'lab.order');
    final isar = await db;
    final uuid = 'lab_${DateTime.now().millisecondsSinceEpoch}';
    final o = LabOrder()
      ..uuid = uuid
      ..patientId = patientId
      ..encounterId = encounterId
      ..doctorId = doctorId
      ..priority = priority
      ..status = 'ordered'
      ..orderedAt = DateTime.now()
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'pending_sync'
      ..deviceId = _deviceId;
    await isar.writeTxn(() async => await isar.labOrders.put(o));
    await _enqueueSync(entityType: 'LabOrder', entityId: uuid, operation: 'upsert');
    return uuid;
  }

  Future<void> changeLabOrderStatus(String uuid, String newStatus, {required String userId, required String role}) async {
    _check(role, 'lab.result');
    final isar = await db;
    final o = await getLabOrder(uuid);
    if (o == null) throw StateError('LabOrder $uuid không tồn tại');
    final idx = labOrderStatuses.indexOf(o.status!);
    final newIdx = labOrderStatuses.indexOf(newStatus);
    if (newIdx < 0 || newIdx < idx) {
      throw StateError('Invalid lab status transition: ${o.status} -> $newStatus');
    }
    o.status = newStatus;
    o.updatedAt = DateTime.now();
    await isar.writeTxn(() async => await isar.labOrders.put(o));
  }

  Future<LabOrder?> getLabOrder(String uuid) async {
    final isar = await db;
    return isar.labOrders.where().uuidEqualTo(uuid).findFirst();
  }

  Future<List<LabOrder>> listLabOrders({String? patientId}) async {
    final isar = await db;
    final all = await isar.labOrders.where().findAll();
    return all.where((o) => patientId == null || o.patientId == patientId).toList();
  }

  Future<String> addLabResult({
    required String labOrderId,
    required String testId,
    required String parameter,
    required String result,
    String? unit,
    String? referenceRange,
    String? abnormalFlag,
    String? note,
    required String technicianId,
    required String role,
  }) async {
    _check(role, 'lab.result');
    final isar = await db;
    final uuid = 'res_${DateTime.now().microsecondsSinceEpoch}';
    final r = LabResult()
      ..uuid = uuid
      ..labOrderId = labOrderId
      ..testId = testId
      ..parameter = parameter
      ..result = result
      ..unit = unit
      ..referenceRange = referenceRange
      ..abnormalFlag = abnormalFlag
      ..technicianId = technicianId
      ..note = note
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();
    await isar.writeTxn(() async => await isar.labResults.put(r));
    final o = await getLabOrder(labOrderId);
    if (o != null && o.status == 'ordered') {
      await changeLabOrderStatus(labOrderId, 'collected', userId: technicianId, role: role);
    }
    await _addAuditLog(userId: technicianId, action: 'LAB_RESULT_CREATE', details: uuid);
    return uuid;
  }

  Future<List<LabResult>> getLabResults(String labOrderId) async {
    final isar = await db;
    return isar.labResults.where().labOrderIdEqualTo(labOrderId).findAll();
  }

  Future<void> verifyLabResult(String resultId, {required String byUser, required String role}) async {
    _check(role, 'lab.verify');
    final isar = await db;
    final r = await getLabResult(resultId);
    if (r == null) throw StateError('LabResult $resultId không tồn tại');
    r
      ..verifiedBy = byUser
      ..verifiedAt = DateTime.now();
    await isar.writeTxn(() async => await isar.labResults.put(r));
    final order = r.labOrderId == null ? null : await getLabOrder(r.labOrderId!);
    if (order != null && order.status != 'verified') {
      order.status = 'verified';
      order.updatedAt = DateTime.now();
      await isar.writeTxn(() async => await isar.labOrders.put(order));
    }
    await _addAuditLog(userId: byUser, action: 'LAB_RESULT_VERIFY', details: resultId);
  }

  Future<LabResult?> getLabResult(String uuid) async {
    final isar = await db;
    return isar.labResults.where().uuidEqualTo(uuid).findFirst();
  }

  // ----------------------------------------------------------------- billing
  Future<String> createInvoice({
    required String patientId,
    required List<Map<String, dynamic>> items,
    double? discount = 0,
    double? tax = 0,
    required String createdBy,
    required String role,
  }) async {
    _check(role, 'invoice.create');
    final isar = await db;
    final uuid = 'inv_${DateTime.now().millisecondsSinceEpoch}';
    double total = 0;
    for (final it in items) {
      final qty = (it['quantity'] as num?)?.toDouble() ?? 0;
      final price = (it['unitPrice'] as num?)?.toDouble() ?? 0;
      total += qty * price;
    }
    final disc = discount ?? 0;
    final taxAmt = (total - disc) * (tax ?? 0) / 100;
    final finalAmount = total - disc + taxAmt;
    final inv = Invoice()
      ..uuid = uuid
      ..branchId = _branchId
      ..patientId = patientId
      ..invoiceDate = DateTime.now()
      ..totalAmount = total
      ..discount = disc
      ..tax = tax
      ..finalAmount = double.parse(finalAmount.toStringAsFixed(2))
      ..status = 'pending'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'pending_sync'
      ..deviceId = _deviceId;
    await isar.writeTxn(() async => await isar.invoices.put(inv));
    for (final it in items) {
      final qty = (it['quantity'] as num?)?.toDouble() ?? 0;
      final price = (it['unitPrice'] as num?)?.toDouble() ?? 0;
      final itDisc = (it['discount'] as num?)?.toDouble() ?? 0;
      final itTax = (it['tax'] as num?)?.toDouble() ?? 0;
      final amount = qty * price - itDisc + (qty * price - itDisc) * itTax / 100;
      final line = InvoiceItem()
        ..uuid = 'invit_${DateTime.now().microsecondsSinceEpoch}'
        ..invoiceId = uuid
        ..serviceId = it['serviceId'] as String?
        ..productId = it['productId'] as String?
        ..quantity = qty
        ..unitPrice = price
        ..discount = itDisc
        ..tax = itTax
        ..amount = double.parse(amount.toStringAsFixed(2))
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now();
      await isar.writeTxn(() async => await isar.invoiceItems.put(line));
    }
    await _enqueueSync(entityType: 'Invoice', entityId: uuid, operation: 'upsert');
    await _addAuditLog(userId: createdBy, action: 'INVOICE_CREATE', details: '$uuid total=$finalAmount');
    return uuid;
  }

  Future<Invoice?> getInvoice(String uuid) async {
    final isar = await db;
    return isar.invoices.where().uuidEqualTo(uuid).findFirst();
  }

  Future<List<InvoiceItem>> getInvoiceItems(String invId) async {
    final isar = await db;
    return isar.invoiceItems.where().invoiceIdEqualTo(invId).findAll();
  }

  Future<void> addPayment({
    required String invoiceId,
    required double amount,
    String? method = 'cash',
    required String createdBy,
    required String role,
  }) async {
    _check(role, 'payment.create');
    final isar = await db;
    final inv = await getInvoice(invoiceId);
    if (inv == null) throw StateError('Invoice $invoiceId không tồn tại');
    if (inv.status == 'paid') throw StateError('Invoice đã thanh toán đủ');
    final paidSoFar = await _sumPayments(invoiceId);
    final total = inv.finalAmount ?? 0;
    final remaining = total - paidSoFar;
    if (amount > remaining) {
      throw StateError('Số tiền vượt quá còn lại: $amount > $remaining');
    }
    final p = Payment()
      ..uuid = 'pay_${DateTime.now().microsecondsSinceEpoch}'
      ..invoiceId = invoiceId
      ..branchId = _branchId
      ..amount = amount
      ..method = method
      ..paymentDate = DateTime.now()
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'pending_sync'
      ..deviceId = _deviceId;
    await isar.writeTxn(() async => await isar.payments.put(p));
    if ((paidSoFar + amount) >= total - 0.001) {
      inv.status = 'paid';
    } else {
      inv.status = 'partial';
    }
    inv.updatedAt = DateTime.now();
    inv.version = (inv.version ?? 0) + 1;
    await isar.writeTxn(() async => await isar.invoices.put(inv));
    await _enqueueSync(entityType: 'Payment', entityId: p.uuid!, operation: 'upsert');
    await _addAuditLog(userId: createdBy, action: 'PAYMENT_CREATE', details: '$invoiceId amount=$amount');
  }

  Future<double> _sumPayments(String invoiceId) async {
    final isar = await db;
    final payments = await isar.payments.where().invoiceIdEqualTo(invoiceId).findAll();
    double sum = 0;
    for (final p in payments) {
      sum += p.amount ?? 0.0;
    }
    return sum;
  }

  Future<List<Payment>> getPayments({String? invoiceId}) async {
    final isar = await db;
    final all = await isar.payments.where().findAll();
    return all.where((p) => invoiceId == null || p.invoiceId == invoiceId).toList();
  }

  /// Công nợ của khách hàng: tổng phải thu trừ đã thu.
  Future<double> getCustomerDebt(String patientId) async {
    final isar = await db;
    final invoices = await isar.invoices.where().findAll();
    final forPatient = invoices.where((i) => i.patientId == patientId).toList();
    double total = 0;
    for (final inv in forPatient) {
      if (inv.status == 'cancelled') continue;
      final paid = await _sumPayments(inv.uuid!);
      total += (inv.finalAmount ?? 0) - paid;
    }
    return double.parse(total.toStringAsFixed(2));
  }

  Future<List<Map<String, dynamic>>> listCustomerDebts() async {
    final isar = await db;
    final invoices = await isar.invoices.where().findAll();
    final byPatient = <String, double>{};
    for (final inv in invoices) {
      if (inv.status == 'cancelled' || inv.patientId == null) continue;
      final paid = await _sumPayments(inv.uuid!);
      byPatient[inv.patientId!] =
          (byPatient[inv.patientId!] ?? 0) + ((inv.finalAmount ?? 0) - paid);
    }
    return byPatient.entries.where((e) => e.value > 0).map((e) {
      return {'patientId': e.key, 'debt': double.parse(e.value.toStringAsFixed(2))};
    }).toList();
  }

  // ----------------------------------------------------------------- reports
  Future<Map<String, dynamic>> getRevenueReport({DateTime? from, DateTime? to}) async {
    final isar = await db;
    final invoices = await isar.invoices.where().findAll();
    double revenue = 0;
    int count = 0;
    for (final inv in invoices) {
      if (inv.status == 'cancelled') continue;
      if (from != null && inv.invoiceDate != null && inv.invoiceDate!.isBefore(from)) continue;
      if (to != null && inv.invoiceDate != null && inv.invoiceDate!.isAfter(to)) continue;
      revenue += inv.finalAmount ?? 0;
      count++;
    }
    return {'invoiceCount': count, 'revenue': double.parse(revenue.toStringAsFixed(2))};
  }

  Future<Map<String, dynamic>> getProfitLossReport({DateTime? from, DateTime? to}) async {
    final revenue = await getRevenueReport(from: from, to: to);
    final isar = await db;
    final txns = await isar.stockTransactions.where().findAll();
    double cogs = 0;
    for (final t in txns) {
      if (t.type != 'sale' && t.type != 'dispense') continue;
      if (from != null && t.createdAt != null && t.createdAt!.isBefore(from)) continue;
      if (to != null && t.createdAt != null && t.createdAt!.isAfter(to)) continue;
      cogs += (t.quantity ?? 0) * (t.unitCost ?? 0);
    }
    final profit = (revenue['revenue'] as double) - cogs;
    return {
      'revenue': revenue['revenue'],
      'cogs': double.parse(cogs.toStringAsFixed(2)),
      'profit': double.parse(profit.toStringAsFixed(2)),
    };
  }

  Future<Map<String, dynamic>> getDashboardStats() async {
    final today = DateTime.now();
    final isar = await db;
    final patients = await isar.patients.where().findAll();
    final appointments = await isar.appointments.where().findAll();
    final encounters = await isar.encounters.where().findAll();
    final todayAppointments = appointments.where((a) =>
        a.appointmentDate != null &&
        a.appointmentDate!.year == today.year &&
        a.appointmentDate!.month == today.month &&
        a.appointmentDate!.day == today.day).length;
    return {
      'patients': patients.length,
      'appointments': appointments.length,
      'todayAppointments': todayAppointments,
      'encounters': encounters.length,
      'revenue': (await getRevenueReport())['revenue'],
      'debts': await listCustomerDebts(),
    };
  }

  // --------------------------------------------------------------------- AI
  Future<AIRequest> generatePrescriptionDraft({
    required String patientId,
    required String encounterId,
    required String doctorId,
    required String symptoms,
    required String diagnosis,
    required String userId,
    required String role,
  }) async {
    _check(role, 'ai.draft');
    final isar = await db;
    final suggestion = jsonEncode({
      'suggestions': [
        {
          'drug': 'Paracetamol 500mg',
          'dose': '1 viên',
          'frequency': 'sáng - chiều',
          'duration': '5 ngày',
          'reason': 'Giảm đau, hạ sốt',
        }
      ],
      'warnings': ['Kiểm tra dị ứng trước khi kê'],
      'requiresDoctorReview': true,
    });
    final request = AIRequest()
      ..uuid = 'ai_${DateTime.now().microsecondsSinceEpoch}'
      ..doctorId = doctorId
      ..patientId = patientId
      ..encounterId = encounterId
      ..requestType = 'prescription_draft'
      ..promptVersion = 'v1'
      ..requestHash = 'req_$symptoms'
      ..responseHash = 'resp_$symptoms'
      ..suggestionDataJson = suggestion
      ..doctorAction = null
      ..createdAt = DateTime.now();
    await isar.writeTxn(() async => await isar.aIRequests.put(request));
    await _addAuditLog(userId: userId, action: 'AI_REQUEST', details: request.uuid);
    return request;
  }

  Future<void> logAiDoctorAction({
    required String aiRequestId,
    required String action, // accepted, rejected, edited
    List<String>? acceptedItems,
    List<String>? rejectedItems,
    List<String>? editedItems,
    required String userId,
  }) async {
    final isar = await db;
    final req = await isar.aIRequests.where().uuidEqualTo(aiRequestId).findFirst();
    if (req == null) throw StateError('AIRequest $aiRequestId không tồn tại');
    req
      ..doctorAction = action
      ..acceptedItemsJson = jsonEncode(acceptedItems ?? const [])
      ..rejectedItemsJson = jsonEncode(rejectedItems ?? const [])
      ..editedItemsJson = jsonEncode(editedItems ?? const []);
    await isar.writeTxn(() async => await isar.aIRequests.put(req));
    await _addAuditLog(
      userId: userId,
      action: action == 'accepted' ? 'AI_SUGGESTION_ACCEPT' : 'AI_SUGGESTION_REJECT',
      details: aiRequestId,
    );
  }

  Future<List<AIRequest>> listAiRequests({String? requestType}) async {
    final isar = await db;
    final all = await isar.aIRequests.where().findAll();
    return all.where((r) => requestType == null || r.requestType == requestType).toList();
  }

  // ------------------------------------------------------------------- sync
  Future<List<SyncQueue>> getPendingSync() async {
    final isar = await db;
    return isar.syncQueues.where().statusEqualTo('pending').findAll();
  }

  Future<void> pushSync() async {
    final isar = await db;
    final tasks = await isar.syncQueues.where().statusEqualTo('pending').findAll();
    if (tasks.isEmpty) return;
    final ops = tasks.map((t) => {
      'entity': t.entityType,
      'id': t.entityId,
      'operation': t.operation ?? 'upsert',
      'data': t.dataJson,
    }).toList();
    try {
      final result = await _syncClient.push(deviceId: _deviceId, operations: ops);
      if (result['status'] == 'ok') {
        await isar.writeTxn(() async {
          for (final t in tasks) {
            t.status = 'synced';
            t.updatedAt = DateTime.now();
            await isar.syncQueues.put(t);
          }
        });
      }
    } catch (_) {
      await isar.writeTxn(() async {
        for (final t in tasks) {
          t.status = 'failed';
          t.retryCount = (t.retryCount ?? 0) + 1;
          t.updatedAt = DateTime.now();
          await isar.syncQueues.put(t);
        }
      });
    }
  }

  Future<Map<String, dynamic>> pullSync({String? cursor}) async {
    final result = await _syncClient.pull(deviceId: _deviceId, lastCursor: cursor);
    final updates = (result['updates'] as List<dynamic>?) ?? const [];
    return {'status': 'ok', 'received': updates.length};
  }

  // ----------------------------------------------------------------- seeding
  Future<bool> isSeeded() async {
    final isar = await db;
    return await isar.patients.count() > 0;
  }

  Future<void> seedIfEmpty() async {
    if (!await isSeeded()) {
      await seedSampleData();
    }
  }

  Future<void> seedSampleData() async {
    await PhongKhamSeedData.seedSampleData(this);
  }
}