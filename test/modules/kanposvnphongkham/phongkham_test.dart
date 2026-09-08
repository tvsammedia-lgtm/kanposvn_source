import 'dart:ffi' show Abi;
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvnphongkham/models/patient.dart';
import 'package:kanposvn/modules/kanposvnphongkham/models/appointment.dart';
import 'package:kanposvn/modules/kanposvnphongkham/models/clinical.dart';
import 'package:kanposvn/modules/kanposvnphongkham/models/prescription.dart';
import 'package:kanposvn/modules/kanposvnphongkham/models/pharmacy.dart';
import 'package:kanposvn/modules/kanposvnphongkham/models/inventory.dart';
import 'package:kanposvn/modules/kanposvnphongkham/models/billing.dart';
import 'package:kanposvn/modules/kanposvnphongkham/models/laboratory.dart';
import 'package:kanposvn/modules/kanposvnphongkham/models/sync.dart';
import 'package:kanposvn/modules/kanposvnphongkham/models/ai.dart';
import 'package:kanposvn/modules/kanposvnphongkham/models/queueticket.dart';
import 'package:kanposvn/modules/kanposvnphongkham/services/phongkham_isar_service.dart';

class _FailingSyncApi implements SyncApiClient {
  @override
  Future<Map<String, dynamic>> push({
    required String deviceId,
    required List<Map<String, dynamic>> operations,
  }) async => throw Exception('network down');

  @override
  Future<Map<String, dynamic>> pull({
    required String deviceId,
    String? lastCursor,
  }) async => throw Exception('network down');
}

/// Mock có thể cấu hình updates trả về khi pull.
class _DrivenSyncApi implements SyncApiClient {
  List<Map<String, dynamic>> updates = [];
  int pushCalls = 0;

  @override
  Future<Map<String, dynamic>> push({
    required String deviceId,
    required List<Map<String, dynamic>> operations,
  }) async {
    pushCalls++;
    return {'status': 'ok', 'processed': operations.length};
  }

  @override
  Future<Map<String, dynamic>> pull({
    required String deviceId,
    String? lastCursor,
  }) async {
    return {'status': 'ok', 'updates': updates};
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tmpDir;
  late Directory dllDir;
  late Isar isar;
  late PhongKhamIsarService service;

  setUpAll(() async {
    tmpDir = await Directory.systemTemp.createTemp('phongkham_test');
    dllDir = await Directory.systemTemp.createTemp('isar_dll');
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await dll.copy('${dllDir.path}/isar.dll');
      Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
  });

  tearDownAll(() async {
    await tmpDir.delete(recursive: true);
    await dllDir.delete(recursive: true);
  });

  setUp(() async {
    isar = await Isar.open(
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
      directory: tmpDir.path,
    );
    service = PhongKhamIsarService(isar: isar);
  });

  tearDown(() async {
    await service.db;
    await isar.close(deleteFromDisk: true);
  });

  group('PhongKham RBAC', () {
    test('permissions by role', () {
      expect(service.hasPermission('DOCTOR', 'encounter.create'), isTrue);
      expect(service.hasPermission('DOCTOR', 'invoice.create'), isFalse);
      expect(service.hasPermission('PHARMACIST', 'prescription.dispense'), isTrue);
      expect(service.hasPermission('PHARMACIST', 'diagnosis.create'), isFalse);
      expect(service.hasPermission('ACCOUNTANT', 'debt.read'), isTrue);
      expect(service.hasPermission('ACCOUNTANT', 'surgery'), isFalse);
      expect(service.hasPermission('SUPER_ADMIN', 'anything.at.all'), isTrue);
    });

    test('createPatient rejected without permission', () async {
      await expectLater(
        service.createPatient(fullName: 'X', createdBy: 'ph', role: 'LAB_TECHNICIAN'),
        throwsA(isA<StateError>()),
      );
    });
  });

  group('PhongKham Patients', () {
    test('create + get + search patient', () async {
      final id = await service.createPatient(
        fullName: 'Nguyễn Thị Test',
        phone: '0901234567',
        allergies: const ['Penicillin'],
        createdBy: 'user1',
        role: 'RECEPTIONIST',
      );
      final p = await service.getPatient(id);
      expect(p!.fullName, 'Nguyễn Thị Test');
      expect(p.patientCode, isNotNull);
      final found = await service.listPatients(search: 'Thị');
      expect(found.length, 1);
      final byPhone = await service.listPatients(phone: '0901234567');
      expect(byPhone.length, 1);
      final audit = await service.getAuditLogs(action: 'PATIENT_CREATE');
      expect(audit.isNotEmpty, isTrue);
    });

    test('update increments version + enqueues sync', () async {
      await service.seedSampleData();
      final p = await service.getPatient('pat_001');
      p!.fullName = 'Nguyễn Văn An (Cập nhật)';
      await service.updatePatient(p, userId: 'u1', role: 'CLINIC_ADMIN');
      final after = await service.getPatient('pat_001');
      expect(after!.fullName, contains('Cập nhật'));
      expect(after.version, greaterThan(1));
      final pending = await service.getPendingSync();
      expect(pending.any((s) => s.entityId == 'pat_001'), isTrue);
    });
  });

  group('PhongKham Appointments', () {
    test('full lifecycle requested -> confirmed -> checked_in -> completed', () async {
      await service.seedSampleData();
      final id = await service.createAppointment(
        patientId: 'pat_001',
        doctorId: 'doc_001',
        appointmentDate: DateTime.now().add(const Duration(days: 2)),
        reason: 'Tái khám',
        createdBy: 'recep1',
        role: 'RECEPTIONIST',
      );
      final a = await service.getAppointment(id);
      expect(a!.status, 'requested');
      await service.changeAppointmentStatus(id, 'confirmed', userId: 'recep1', role: 'RECEPTIONIST');
      await service.changeAppointmentStatus(id, 'checked_in', userId: 'recep1', role: 'RECEPTIONIST');
      await service.changeAppointmentStatus(id, 'in_progress', userId: 'doc1', role: 'DOCTOR');
      await service.changeAppointmentStatus(id, 'completed', userId: 'doc1', role: 'DOCTOR');
      final done = await service.getAppointment(id);
      expect(done!.status, 'completed');
      expect(done.version, 5);
    });

    test('invalid appointment transition throws', () async {
      await service.seedSampleData();
      await expectLater(
        service.changeAppointmentStatus('apt_001', 'completed', userId: 'recep1', role: 'RECEPTIONIST'),
        throwsA(isA<StateError>()),
      );
    });

    test('check-in creates queue ticket', () async {
      await service.seedSampleData();
      final id = await service.createAppointment(
        patientId: 'pat_003',
        doctorId: 'doc_001',
        appointmentDate: DateTime.now().add(const Duration(days: 1)),
        createdBy: 'recep1',
        role: 'RECEPTIONIST',
      );
      await service.changeAppointmentStatus(id, 'confirmed', userId: 'recep1', role: 'RECEPTIONIST');
      final ticket = await service.checkInAppointment(id, userId: 'nurse1', role: 'NURSE', number: 7);
      expect(ticket.number, 7);
      expect(ticket.status, 'waiting');
      final apt = await service.getAppointment(id);
      expect(apt!.status, 'checked_in');
    });
  });

  group('PhongKham Encounters', () {
    test('createEncounter auto-creates medical record', () async {
      await service.seedSampleData();
      final encId = await service.createEncounter(
        patientId: 'pat_002',
        doctorId: 'doc_001',
        reasonForVisit: 'Đau bụng',
        symptoms: 'Đau vùng hạ sườn phải',
        createdBy: 'doc1',
        role: 'DOCTOR',
      );
      final enc = await service.getEncounter(encId);
      expect(enc!.medicalRecordId, isNotNull);
      final records = await isar.medicalRecords.where().findAll();
      expect(records.any((r) => r.patientId == 'pat_002'), isTrue);
    });

    test('saveVitals computes BMI', () async {
      final encId = await service.createEncounter(
        patientId: 'pat_001',
        doctorId: 'doc_001',
        createdBy: 'doc1',
        role: 'DOCTOR',
      );
      await service.saveVitals(
        encounterId: encId,
        systolic: 120,
        diastolic: 80,
        height: 170,
        weight: 68,
        userId: 'nurse1',
        role: 'NURSE',
      );
      final enc = await service.getEncounter(encId);
      expect(enc!.bmi, closeTo(23.5, 0.2));
    });

    test('setDiagnosis confirmed writes finalDiagnosis; suspected writes preliminary', () async {
      final encId = await service.createEncounter(
        patientId: 'pat_001',
        doctorId: 'doc_001',
        createdBy: 'doc1',
        role: 'DOCTOR',
      );
      await service.setDiagnosis(
        encounterId: encId,
        diagnosis: 'Viêm dạ dày',
        icd10: const ['K29.7'],
        type: 'suspected',
        userId: 'doc1',
        role: 'DOCTOR',
      );
      await service.setDiagnosis(
        encounterId: encId,
        diagnosis: 'Viêm dạ dày mạn',
        icd10: const ['K29.7'],
        userId: 'doc1',
        role: 'DOCTOR',
      );
      final enc = await service.getEncounter(encId);
      expect(enc!.preliminaryDiagnosis, 'Viêm dạ dày');
      expect(enc.finalDiagnosis, 'Viêm dạ dày mạn');
      expect(enc.icd10Codes!.first, 'K29.7');
    });
  });

  group('PhongKham Prescriptions', () {
    test('create draft + items + confirm', () async {
      await service.seedSampleData();
      final rxId = await service.createPrescription(
        patientId: 'pat_001',
        encounterId: 'enc_001',
        doctorId: 'doc_001',
        diagnosis: 'Viêm họng cấp',
        items: [
          {'drugId': 'drg_001', 'batchId': 'bt_001', 'quantity': 10, 'dosage': '1 viên', 'frequency': 'sáng - chiều', 'unit': 'Viên'},
        ],
        createdBy: 'doc1',
        role: 'DOCTOR',
      );
      final rx = await service.getPrescription(rxId);
      expect(rx!.status, 'draft');
      final items = await service.getPrescriptionItems(rxId);
      expect(items.length, 1);
      expect(items.first.drugId, 'drg_001');
    });

    test('safety check flags duplicate active ingredient', () async {
      await service.seedSampleData();
      final rxId = await service.createPrescription(
        patientId: 'pat_001',
        encounterId: 'enc_001',
        doctorId: 'doc_001',
        diagnosis: 'Nhiễm trùng',
        items: [
          {'drugId': 'drg_002', 'batchId': 'bt_002', 'quantity': 14, 'dosage': '1 viên', 'frequency': 'ngày 2 lần', 'unit': 'Viên'},
          {'drugId': 'drg_003', 'batchId': 'bt_003', 'quantity': 14, 'dosage': '1 viên', 'frequency': 'ngày 2 lần', 'unit': 'Viên'},
        ],
        createdBy: 'doc1',
        role: 'DOCTOR',
      );
      final warnings = await service.validatePrescription(rxId, userId: 'doc1', role: 'DOCTOR');
      expect(warnings.any((w) => w.contains('Amoxicillin')), isTrue);
      // confirm must fail
      await expectLater(
        service.validateAndConfirmPrescription(rxId, userId: 'doc1', role: 'DOCTOR'),
        throwsA(isA<StateError>()),
      );
    });

    test('confirm + dispense reduces stock (FEFO)', () async {
      await service.seedSampleData();
      final rxId = await service.createPrescription(
        patientId: 'pat_001',
        encounterId: 'enc_001',
        doctorId: 'doc_001',
        items: [
          {'drugId': 'drg_001', 'batchId': 'bt_001', 'quantity': 20, 'dosage': '1 viên', 'frequency': 'sáng - chiều', 'unit': 'Viên'},
        ],
        createdBy: 'doc1',
        role: 'DOCTOR',
      );
      await service.validateAndConfirmPrescription(rxId, userId: 'doc1', role: 'DOCTOR');
      final confirmed = await service.getPrescription(rxId);
      expect(confirmed!.status, 'confirmed');
      expect(confirmed.confirmedAt, isNotNull);
      await service.dispensePrescription(rxId, userId: 'ph1', role: 'PHARMACIST');
      final dispensed = await service.getPrescription(rxId);
      expect(dispensed!.status, 'dispensed');
      final batch = await service.getDrugBatch('bt_001');
      expect(batch!.quantity, 80);
      final txns = await service.listStockTransactions(batchId: 'bt_001');
      expect(txns.any((t) => t.type == 'dispense' && t.quantity == 20), isTrue);
      final audit = await service.getAuditLogs(action: 'PRESCRIPTION_DISPENSE');
      expect(audit.isNotEmpty, isTrue);
    });

    test('insufficient stock confirmation fails', () async {
      await service.seedSampleData();
      final rxId = await service.createPrescription(
        patientId: 'pat_001',
        encounterId: 'enc_001',
        doctorId: 'doc_001',
        items: [
          {'drugId': 'drg_002', 'batchId': 'bt_002', 'quantity': 999, 'dosage': '1 viên', 'frequency': 'ngày 2 lần', 'unit': 'Viên'},
        ],
        createdBy: 'doc1',
        role: 'DOCTOR',
      );
      await expectLater(
        service.validateAndConfirmPrescription(rxId, userId: 'doc1', role: 'DOCTOR'),
        throwsA(isA<StateError>()),
      );
    });
  });

  group('PhongKham Pharmacy & FEFO', () {
    test('FEFO picks soonest-expiring valid batch', () async {
      await service.seedSampleData();
      final b = await service.findFEFOBatch('drg_002');
      expect(b!.uuid, 'bt_002'); // drg_003 is a different drug
      final bAmox250 = await service.findFEFOBatch('drg_003');
      expect(bAmox250!.uuid, 'bt_003');
    });

    test('expired batch excluded from FEFO', () async {
      await service.seedSampleData();
      final expired = await service.createDrugBatch(
        drugId: 'drg_001',
        warehouseId: 'wh_001',
        lotNumber: 'LOT-EXP',
        expiryDate: DateTime.now().subtract(const Duration(days: 1)),
        purchasePrice: 100,
        sellingPrice: 150,
        quantity: 50,
        createdBy: 'ph1',
        role: 'PHARMACIST',
      );
      final b = await service.findFEFOBatch('drg_001');
      expect(b!.uuid, isNot(expired));
    });

    test('stockOut insufficient throws', () async {
      await service.seedSampleData();
      await expectLater(
        service.stockOut(batchId: 'bt_002', quantity: 500, createdBy: 'ph1', role: 'PHARMACIST'),
        throwsA(isA<StateError>()),
      );
    });

    test('listExpiringBatches catches soon expiry', () async {
      await service.seedSampleData();
      final soon = await service.listExpiringBatches(withinDays: 120);
      expect(soon.any((b) => b.uuid == 'bt_003'), isTrue);
    });
  });

  group('PhongKham Laboratory', () {
    test('lab order -> result -> verify', () async {
      await service.seedSampleData();
      final labId = await service.createLabOrder(
        patientId: 'pat_001',
        encounterId: 'enc_001',
        doctorId: 'doc_001',
        createdBy: 'doc1',
        role: 'DOCTOR',
      );
      final resultId = await service.addLabResult(
        labOrderId: labId,
        testId: 'HB',
        parameter: 'Hemoglobin',
        result: '9.2',
        unit: 'g/dL',
        referenceRange: '12.0-16.0',
        abnormalFlag: 'L',
        technicianId: 'tech_001',
        role: 'LAB_TECHNICIAN',
      );
      var order = await service.getLabOrder(labId);
      expect(order!.status, 'collected');
      await service.verifyLabResult(resultId, byUser: 'doc_001', role: 'DOCTOR');
      order = await service.getLabOrder(labId);
      expect(order!.status, 'verified');
      final audit = await service.getAuditLogs(action: 'LAB_RESULT_VERIFY');
      expect(audit.isNotEmpty, isTrue);
    });

    test('invalid lab status regression throws', () async {
      await service.seedSampleData();
      final labId = await service.createLabOrder(
        patientId: 'pat_001',
        encounterId: 'enc_001',
        doctorId: 'doc_001',
        createdBy: 'doc1',
        role: 'DOCTOR',
      );
      await service.changeLabOrderStatus(labId, 'collected', userId: 'tech', role: 'LAB_TECHNICIAN');
      await expectLater(
        service.changeLabOrderStatus(labId, 'ordered', userId: 'tech', role: 'LAB_TECHNICIAN'),
        throwsA(isA<StateError>()),
      );
    });
  });

  group('PhongKham Billing & Debt', () {
    test('createInvoice totals + partial then full payment', () async {
      await service.seedSampleData();
      final invId = await service.createInvoice(
        patientId: 'pat_002',
        items: [
          {'serviceId': 'SVC_KHAM', 'quantity': 1, 'unitPrice': 200000},
          {'serviceId': 'SVC_XN', 'quantity': 2, 'unitPrice': 50000},
        ],
        createdBy: 'acc1',
        role: 'ACCOUNTANT',
      );
      final inv = await service.getInvoice(invId);
      expect(inv!.totalAmount, 300000);
      expect(inv.status, 'pending');
      await service.addPayment(invoiceId: invId, amount: 100000, createdBy: 'recep1', role: 'RECEPTIONIST');
      expect((await service.getInvoice(invId))!.status, 'partial');
      await service.addPayment(invoiceId: invId, amount: 200000, createdBy: 'recep1', role: 'RECEPTIONIST');
      expect((await service.getInvoice(invId))!.status, 'paid');
    });

    test('overpayment blocked', () async {
      await service.seedSampleData();
      final invId = await service.createInvoice(
        patientId: 'pat_002',
        items: [
          {'serviceId': 'SVC_KHAM', 'quantity': 1, 'unitPrice': 100000},
        ],
        createdBy: 'acc1',
        role: 'ACCOUNTANT',
      );
      await expectLater(
        service.addPayment(invoiceId: invId, amount: 150000, createdBy: 'recep1', role: 'RECEPTIONIST'),
        throwsA(isA<StateError>()),
      );
    });

    test('getCustomerDebt = unpaid invoices', () async {
      await service.seedSampleData();
      // pat_001: inv_001 paid full (0), inv_002 pending full (50000)
      final debt = await service.getCustomerDebt('pat_001');
      expect(debt, 50000);
    });

    test('revenue report + profit/loss reflect invoices & COGS', () async {
      await service.seedSampleData();
      final revenue = await service.getRevenueReport();
      expect(revenue['revenue'], 670000); // 200000 + 50000 + 120000 + 300000 (inv_005 cancelled loại trừ)
      expect(revenue['invoiceCount'], 4);
      final pnl = await service.getProfitLossReport();
      expect(pnl['revenue'], 670000);
      expect(pnl['profit'], greaterThanOrEqualTo(0));
    });
  });

  group('PhongKham AI', () {
    test('draft requested + doctor action audited', () async {
      await service.seedSampleData();
      final req = await service.generatePrescriptionDraft(
        patientId: 'pat_001',
        encounterId: 'enc_001',
        doctorId: 'doc_001',
        symptoms: 'Sốt, đau đầu',
        diagnosis: 'Viêm họng cấp',
        userId: 'doc_001',
        role: 'DOCTOR',
      );
      expect(req.suggestionDataJson, contains('requiresDoctorReview'));
      expect(req.doctorAction, isNull);
      await service.logAiDoctorAction(
        aiRequestId: req.uuid!,
        action: 'accepted',
        acceptedItems: ['Paracetamol'],
        userId: 'doc_001',
      );
      final audit = await service.getAuditLogs(action: 'AI_SUGGESTION_ACCEPT');
      expect(audit.isNotEmpty, isTrue);
    });
  });

  group('PhongKham Sync', () {
    test('pending sync tasks resolved to synced after push', () async {
      await service.seedSampleData();
      // create patient enqueues a pending task
      final id = await service.createPatient(fullName: 'SyncMe', role: 'RECEPTIONIST', createdBy: 'u1');
      expect((await service.getPendingSync()).any((s) => s.entityId == id), isTrue);
      await service.pushSync();
      final tasks = await service.getPendingSync();
      expect(tasks.isEmpty, isTrue);
    });

    test('push with failing client marks failed', () async {
      final failing = _FailingSyncApi();
      service = PhongKhamIsarService(isar: isar, syncClient: failing);
      await service.createPatient(fullName: 'WillFail', role: 'RECEPTIONIST', createdBy: 'u1');
      await service.pushSync();
      final failed = await isar.syncQueues.where().statusEqualTo('failed').findAll();
      expect(failed.isNotEmpty, isTrue);
      expect(failed.first.retryCount, 1);
    });

    test('pullSync returns received count', () async {
      final res = await service.pullSync();
      expect(res['status'], 'ok');
      expect(res['received'], 0);
    });

    test('pull with pending local change records unresolved conflict', () async {
      final driven = _DrivenSyncApi();
      service = PhongKhamIsarService(isar: isar, syncClient: driven);
      final id = await service.createPatient(fullName: 'Xung đột', role: 'RECEPTIONIST', createdBy: 'u1');
      driven.updates = [
        {'entityType': 'Patient', 'id': id, 'fullName': 'Xung đột (sửa máy khác)'},
      ];
      final res = await service.pullSync();
      expect(res['received'], 1);
      final conflicts = await service.getSyncConflicts();
      expect(conflicts.any((c) => c.entityId == id), isTrue);
      expect(conflicts.first.status, 'unresolved');
      await service.resolveSyncConflict(conflicts.first, resolveTo: 'remote');
      final resolved = await service.getSyncConflicts(status: 'resolved_remote');
      expect(resolved.any((c) => c.entityId == id), isTrue);
      expect(conflicts.first.resolvedAt, isNotNull);
    });

    test('push is a no-op when nothing pending', () async {
      final driven = _DrivenSyncApi();
      service = PhongKhamIsarService(isar: isar, syncClient: driven);
      await service.pushSync();
      expect(driven.pushCalls, 0);
      expect((await service.getPendingSync()).isEmpty, isTrue);
    });
  });

  group('PhongKham Patients (acceptance)', () {
    test('patient codes never duplicate after seed', () async {
      await service.seedSampleData();
      final a = await service.createPatient(fullName: 'Khách A', role: 'RECEPTIONIST', createdBy: 'u1');
      final b = await service.createPatient(fullName: 'Khách B', role: 'RECEPTIONIST', createdBy: 'u1');
      expect((await service.getPatient(a))!.patientCode, 'BN1007');
      expect((await service.getPatient(b))!.patientCode, 'BN1008');
      final all = await service.listPatients();
      expect(all.map((p) => p.patientCode).toSet().length, all.length);
    });

    test('delete is soft and excluded from list/search', () async {
      final id = await service.createPatient(
          fullName: 'Nguyễn Văn Xóa', phone: '0901999999', role: 'RECEPTIONIST', createdBy: 'u1');
      await service.deletePatient(id, userId: 'u1', role: 'RECEPTIONIST');
      final p = await service.getPatient(id);
      expect(p!.deletedAt, isNotNull);
      expect((await service.listPatients(search: 'Xóa')).isEmpty, isTrue);
      expect((await service.listPatients(phone: '0901999999')).isEmpty, isTrue);
    });

    test('getPatientHistory aggregates patient history', () async {
      await service.seedSampleData();
      final h = await service.getPatientHistory('pat_001');
      expect(h['appointments'], 1); // apt_003
      expect(h['encounters'], 1); // enc_001
      expect(h['prescriptions'], 1); // rx_001
      expect(h['labOrders'], 1); // lab_003
      expect(h['invoices'], 2); // inv_001 + inv_002
    });
  });

  group('PhongKham Appointments & Queue (acceptance)', () {
    test('reschedule -> confirmed -> no_show flow; no_show terminal', () async {
      await service.seedSampleData();
      final id = await service.createAppointment(
        patientId: 'pat_003',
        doctorId: 'doc_001',
        appointmentDate: DateTime.now().add(const Duration(days: 2)),
        createdBy: 'recep1',
        role: 'RECEPTIONIST',
      );
      await service.changeAppointmentStatus(id, 'rescheduled', userId: 'recep1', role: 'RECEPTIONIST');
      expect((await service.getAppointment(id))!.status, 'rescheduled');
      await service.changeAppointmentStatus(id, 'confirmed', userId: 'recep1', role: 'RECEPTIONIST');
      await service.changeAppointmentStatus(id, 'no_show', userId: 'recep1', role: 'RECEPTIONIST');
      expect((await service.getAppointment(id))!.status, 'no_show');
      await expectLater(
        service.changeAppointmentStatus(id, 'completed', userId: 'recep1', role: 'RECEPTIONIST'),
        throwsA(isA<StateError>()),
      );
    });

    test('same-status transition rejected', () async {
      await service.seedSampleData();
      await expectLater(
        service.changeAppointmentStatus('apt_002', 'confirmed', userId: 'recep1', role: 'RECEPTIONIST'),
        throwsA(isA<StateError>()),
      );
    });

    test('queue ticket auto-number continues from max', () async {
      await service.seedSampleData();
      final ticket = await service.checkInAppointment('apt_002', userId: 'nurse1', role: 'NURSE');
      expect(ticket.number, 4); // seed tối đa hiện là 3
    });

    test('callQueueTicket sets called + calledAt', () async {
      await service.seedSampleData();
      await service.callQueueTicket('qt_001', userId: 'nurse1', role: 'NURSE');
      final t = await service.getQueueTicket('qt_001');
      expect(t!.status, 'called');
      expect(t.calledAt, isNotNull);
    });

    test('listQueueTickets filters by date', () async {
      await service.seedSampleData();
      final day = DateTime.now().toIso8601String().substring(0, 10);
      final tickets = await service.listQueueTickets(date: day);
      expect(tickets.length, 3);
    });
  });

  group('PhongKham Encounters (acceptance)', () {
    test('savePhysicalExamination persists PE note', () async {
      await service.seedSampleData();
      await service.savePhysicalExamination(
          encounterId: 'enc_001', text: 'Phổi trong, tim đều', userId: 'doc1', role: 'DOCTOR');
      final e = await service.getEncounter('enc_001');
      expect(e!.physicalExamination, 'Phổi trong, tim đều');
    });

    test('differential diagnosis written to preliminaryDiagnosis', () async {
      final encId = await service.createEncounter(
          patientId: 'pat_001', doctorId: 'doc_001', createdBy: 'doc1', role: 'DOCTOR');
      await service.setDiagnosis(
          encounterId: encId, diagnosis: 'Hội chứng kích thích ruột', icd10: ['K58'], type: 'differential', userId: 'doc1', role: 'DOCTOR');
      final e = await service.getEncounter(encId);
      expect(e!.preliminaryDiagnosis, 'Hội chứng kích thích ruột');
    });

    test('vitals without weight leaves bmi null', () async {
      final encId = await service.createEncounter(
          patientId: 'pat_001', doctorId: 'doc_001', createdBy: 'doc1', role: 'DOCTOR');
      await service.saveVitals(
          encounterId: encId, systolic: 120, diastolic: 80, height: 170, userId: 'nurse1', role: 'NURSE');
      expect((await service.getEncounter(encId))!.bmi, isNull);
    });

    test('new encounter reuses existing medical record', () async {
      await service.seedSampleData();
      final encId = await service.createEncounter(
          patientId: 'pat_002', doctorId: 'doc_001', createdBy: 'doc1', role: 'DOCTOR');
      expect((await service.getEncounter(encId))!.medicalRecordId, 'mdr_002');
    });
  });

  group('PhongKham Prescriptions (acceptance)', () {
    test('only draft/doctor_review allowed at create', () async {
      await service.seedSampleData();
      await expectLater(
        service.createPrescription(
            patientId: 'pat_001', encounterId: 'enc_001', doctorId: 'doc_001', status: 'confirmed', createdBy: 'doc1', role: 'DOCTOR'),
        throwsA(isA<StateError>()),
      );
    });

    test('validation flags contraindication for Penicillin-allergy patient', () async {
      await service.seedSampleData();
      final rxId = await service.createPrescription(
        patientId: 'pat_001',
        encounterId: 'enc_001',
        doctorId: 'doc_001',
        items: [
          {'drugId': 'drg_002', 'batchId': 'bt_002', 'quantity': 10, 'dosage': '1 viên', 'frequency': 'ngày 2 lần', 'unit': 'Viên'},
        ],
        createdBy: 'doc1',
        role: 'DOCTOR',
      );
      final warnings = await service.validatePrescription(rxId, userId: 'doc1', role: 'DOCTOR');
      expect(
        warnings.any((w) =>
            w.contains('Chống chỉ định') &&
            w.contains('dị ứng Penicillin') &&
            w.toLowerCase().contains('amoxicillin')),
        isTrue,
      );
    });

    test('validation warns when batch expired', () async {
      await service.seedSampleData();
      final expiredId = await service.createDrugBatch(
        drugId: 'drg_001',
        warehouseId: 'wh_001',
        lotNumber: 'LOT-EXP2',
        expiryDate: DateTime.now().subtract(const Duration(days: 2)),
        purchasePrice: 100,
        sellingPrice: 150,
        quantity: 50,
        createdBy: 'ph1',
        role: 'PHARMACIST',
      );
      final rxId = await service.createPrescription(
        patientId: 'pat_001',
        encounterId: 'enc_001',
        doctorId: 'doc_001',
        items: [
          {'drugId': 'drg_001', 'batchId': expiredId, 'quantity': 5, 'dosage': '1 viên', 'frequency': 'sáng - chiều', 'unit': 'Viên'},
        ],
        createdBy: 'doc1',
        role: 'DOCTOR',
      );
      final warnings = await service.validatePrescription(rxId, userId: 'doc1', role: 'DOCTOR');
      expect(warnings.any((w) => w.contains('hết hạn')), isTrue);
    });

    test('validation warns when batch missing', () async {
      await service.seedSampleData();
      final rxId = await service.createPrescription(
        patientId: 'pat_001',
        encounterId: 'enc_001',
        doctorId: 'doc_001',
        items: [
          {'drugId': 'drg_001', 'quantity': 5, 'dosage': '1 viên', 'frequency': 'sáng - chiều', 'unit': 'Viên'},
        ],
        createdBy: 'doc1',
        role: 'DOCTOR',
      );
      final warnings = await service.validatePrescription(rxId, userId: 'doc1', role: 'DOCTOR');
      expect(warnings.any((w) => w.contains('Thiếu lô hàng')), isTrue);
    });

    test('confirm auto-assigns FEFO batch when batch not pre-assigned', () async {
      await service.seedSampleData();
      final rxId = await service.createPrescription(
        patientId: 'pat_002',
        encounterId: 'enc_002',
        doctorId: 'doc_001',
        diagnosis: 'Cảm cúm',
        items: [
          {'drugId': 'drg_001', 'quantity': 10, 'dosage': '1 viên', 'frequency': 'ngày 2 lần', 'unit': 'Viên'},
        ],
        createdBy: 'doc1',
        role: 'DOCTOR',
      );
      await service.validateAndConfirmPrescription(rxId, userId: 'doc1', role: 'DOCTOR');
      await service.dispensePrescription(rxId, userId: 'ph1', role: 'PHARMACIST');
      final items = await service.getPrescriptionItems(rxId);
      expect(items.first.batchId, 'bt_006'); // lô sớm hạn nhất cho drg_001
      expect((await service.getDrugBatch('bt_006'))!.quantity, 90);
    });

    test('cancel prescription', () async {
      await service.seedSampleData();
      final rxId = await service.createPrescription(
          patientId: 'pat_001', encounterId: 'enc_001', doctorId: 'doc_001', createdBy: 'doc1', role: 'DOCTOR');
      await service.cancelPrescription(rxId, userId: 'doc1', role: 'DOCTOR');
      expect((await service.getPrescription(rxId))!.status, 'cancelled');
    });
  });

  group('PhongKham Pharmacy & Inventory (acceptance)', () {
    test('listDrugs search by name and ingredient', () async {
      await service.seedSampleData();
      expect((await service.listDrugs(search: 'Paracetamol')).length, 1);
      expect((await service.listDrugs(search: 'amoxi')).length, 2);
    });

    test('listLowStock catches low batches', () async {
      await service.seedSampleData();
      final low = await service.listLowStock();
      expect(low.any((b) => b.uuid == 'bt_004'), isTrue);
    });

    test('FEFO respects warehouse filter', () async {
      await service.seedSampleData();
      final b = await service.findFEFOBatch('drg_001', warehouseId: 'wh_001');
      expect(b!.uuid, 'bt_006');
      expect(await service.findFEFOBatch('drg_001', warehouseId: 'wh_999'), isNull);
    });

    test('stockIn adds quantity + purchase transaction', () async {
      await service.seedSampleData();
      await service.stockIn(batchId: 'bt_004', quantity: 50, type: 'purchase', createdBy: 'ph1', role: 'PHARMACIST');
      expect((await service.getDrugBatch('bt_004'))!.quantity, 55);
      final txns = await service.listStockTransactions(batchId: 'bt_004');
      expect(txns.any((t) => t.type == 'purchase' && t.quantity == 50), isTrue);
    });

    test('stockOut sale txn enqueues sync with txn uuid', () async {
      await service.seedSampleData();
      await service.stockOut(batchId: 'bt_006', quantity: 5, type: 'sale', createdBy: 'ph1', role: 'PHARMACIST');
      final txns = await service.listStockTransactions(batchId: 'bt_006');
      final sale = txns.firstWhere((t) => t.type == 'sale');
      final pending = await service.getPendingSync();
      expect(pending.any((s) => s.entityType == 'StockTransaction' && s.entityId == sale.uuid), isTrue);
    });
  });

  group('PhongKham Laboratory (acceptance)', () {
    test('full status progression to verified', () async {
      await service.seedSampleData();
      final labId = await service.createLabOrder(
          patientId: 'pat_001', encounterId: 'enc_001', doctorId: 'doc_001', createdBy: 'doc1', role: 'DOCTOR');
      for (final s in ['collected', 'processing', 'completed']) {
        await service.changeLabOrderStatus(labId, s, userId: 'tech', role: 'LAB_TECHNICIAN');
      }
      final lr = await service.addLabResult(
          labOrderId: labId, testId: 'WBC', parameter: 'Bạch cầu', result: '11.2', unit: 'K/uL',
          referenceRange: '4-10', abnormalFlag: 'H', technicianId: 'tech_001', role: 'LAB_TECHNICIAN');
      await service.verifyLabResult(lr, byUser: 'doc_001', role: 'DOCTOR');
      expect((await service.getLabOrder(labId))!.status, 'verified');
    });

    test('second result keeps collected status and history', () async {
      await service.seedSampleData();
      final labId = await service.createLabOrder(
          patientId: 'pat_001', encounterId: 'enc_001', doctorId: 'doc_001', createdBy: 'doc1', role: 'DOCTOR');
      await service.addLabResult(
          labOrderId: labId, testId: 'HB', parameter: 'Hemoglobin', result: '13.0', unit: 'g/dL',
          referenceRange: '12-16', technicianId: 'tech_001', role: 'LAB_TECHNICIAN');
      expect((await service.getLabOrder(labId))!.status, 'collected');
      await service.addLabResult(
          labOrderId: labId, testId: 'GLU', parameter: 'Đường huyết', result: '6.0', unit: 'mmol/L',
          referenceRange: '4-6.1', technicianId: 'tech_001', role: 'LAB_TECHNICIAN');
      expect((await service.getLabOrder(labId))!.status, 'collected');
      expect((await service.getLabResults(labId)).length, 2);
    });

    test('cancel lab order', () async {
      await service.seedSampleData();
      final labId = await service.createLabOrder(
          patientId: 'pat_001', encounterId: 'enc_001', doctorId: 'doc_001', createdBy: 'doc1', role: 'DOCTOR');
      await service.changeLabOrderStatus(labId, 'cancelled', userId: 'tech', role: 'LAB_TECHNICIAN');
      expect((await service.getLabOrder(labId))!.status, 'cancelled');
    });

    test('lab history per patient', () async {
      await service.seedSampleData();
      expect((await service.listLabOrders(patientId: 'pat_001')).length, 1); // lab_003
      expect((await service.listLabOrders(patientId: 'pat_002')).length, 1); // lab_002
    });
  });

  group('PhongKham Billing (acceptance)', () {
    test('invoice with discount + tax math', () async {
      final invId = await service.createInvoice(
        patientId: 'pat_001',
        items: [
          {'serviceId': 'SVC_KHAM', 'quantity': 1, 'unitPrice': 100000},
        ],
        discount: 10000,
        tax: 8,
        createdBy: 'acc1',
        role: 'ACCOUNTANT',
      );
      final inv = await service.getInvoice(invId);
      expect(inv!.totalAmount, 100000);
      expect(inv.finalAmount, 97200); // discount là số tiền tuyệt đối 10000; tax 8%
    });

    test('cancelled invoice excluded from debt + revenue', () async {
      await service.seedSampleData();
      final before = await service.getRevenueReport();
      final invId = await service.createInvoice(
        patientId: 'pat_004',
        items: [
          {'serviceId': 'SVC_KHAM', 'quantity': 1, 'unitPrice': 99000},
        ],
        createdBy: 'acc1',
        role: 'ACCOUNTANT',
      );
      final inv = (await service.getInvoice(invId))!;
      inv.status = 'cancelled';
      final isar = await service.db;
      await isar.writeTxn(() async => await isar.invoices.put(inv));
      expect(await service.getCustomerDebt('pat_004'), 0);
      expect((await service.getRevenueReport())['revenue'], before['revenue']);
    });

    test('listCustomerDebts shows partial + pending balances', () async {
      await service.seedSampleData();
      final debts = await service.listCustomerDebts();
      final byId = {for (final d in debts) d['patientId']: d['debt'] as double};
      expect(byId['pat_001'], 50000); // inv_002 pending
      expect(byId['pat_002'], 40000); // inv_003 partial (120k - 80k)
      expect(byId['pat_003'], 300000); // inv_004 pending
      expect(byId.containsKey('pat_004'), isFalse);
    });

    test('getPayments filters by invoice', () async {
      await service.seedSampleData();
      final payments = await service.getPayments(invoiceId: 'inv_003');
      expect(payments.length, 1);
      expect(payments.first.amount, 80000);
    });

    test('revenue report respects date range', () async {
      await service.seedSampleData();
      final tomorrow = DateTime.now().add(const Duration(days: 1));
      expect((await service.getRevenueReport(from: tomorrow))['revenue'], 0);
      expect(((await service.getRevenueReport())['invoiceCount'] as int) > 0, isTrue);
    });
  });

  group('PhongKham Reports (acceptance)', () {
    test('P&L COGS grows after dispense', () async {
      await service.seedSampleData();
      final before = await service.getProfitLossReport();
      final rxId = await service.createPrescription(
        patientId: 'pat_002',
        encounterId: 'enc_002',
        doctorId: 'doc_001',
        items: [
          {'drugId': 'drg_001', 'batchId': 'bt_001', 'quantity': 10, 'dosage': '1 viên', 'frequency': 'sáng - chiều', 'unit': 'Viên'},
        ],
        createdBy: 'doc1',
        role: 'DOCTOR',
      );
      await service.validateAndConfirmPrescription(rxId, userId: 'doc1', role: 'DOCTOR');
      await service.dispensePrescription(rxId, userId: 'ph1', role: 'PHARMACIST');
      final after = await service.getProfitLossReport();
      expect((after['cogs'] as double) - (before['cogs'] as double), 1500); // bt_001 giá mua 150 x 10
    });
  });

  group('PhongKham AI (acceptance)', () {
    test('edited suggestion logs AI_SUGGESTION_EDITED', () async {
      await service.seedSampleData();
      final req = await service.generatePrescriptionDraft(
        patientId: 'pat_001', encounterId: 'enc_001', doctorId: 'doc_001',
        symptoms: 'Đau đầu', diagnosis: 'Viêm xoang', userId: 'doc_001', role: 'DOCTOR');
      await service.logAiDoctorAction(
          aiRequestId: req.uuid!, action: 'edited', editedItems: ['Paracetamol 500mg x2'], userId: 'doc_001');
      expect((await service.getAuditLogs(action: 'AI_SUGGESTION_EDITED')).isNotEmpty, isTrue);
      expect((await service.listAiRequests()).first.doctorAction, 'edited');
    });

    test('listAiRequests filters by type', () async {
      await service.seedSampleData();
      await service.generatePrescriptionDraft(
        patientId: 'pat_001', encounterId: 'enc_001', doctorId: 'doc_001',
        symptoms: 'S', diagnosis: 'D', userId: 'doc_001', role: 'DOCTOR');
      expect((await service.listAiRequests(requestType: 'prescription_draft')).length, 1);
      expect((await service.listAiRequests(requestType: 'summary')).isEmpty, isTrue);
    });
  });

  group('PhongKham Seed & Dashboard', () {
    test('seedIfEmpty seeds once', () async {
      await service.seedIfEmpty();
      expect(await service.isSeeded(), isTrue);
      final patients = await service.listPatients();
      expect(patients.length, 6);
      final drugs = await service.listDrugs();
      expect(drugs.length, 5);
      final invoices = await service.listAllInvoicesCount();
      expect(invoices, 5);
      // chạy lại không nhân đôi
      await service.seedIfEmpty();
      expect((await service.listPatients()).length, 6);
    });

    test('dashboard stats sane', () async {
      await service.seedSampleData();
      final s = await service.getDashboardStats();
      expect(s['patients'], 6);
      expect(s['appointments'], 6);
      expect(s['encounters'], 3);
      // các chỉ số bổ sung theo spec §21 dashboard
      expect(s['waitingQueue'], 1);
      expect(s['inProgress'], 1);
      expect((s['expiringSoon'] as int), greaterThanOrEqualTo(2));
      expect((s['lowStock'] as int), greaterThanOrEqualTo(1));
      expect(s['todayAppointments'], 1);
    });
  });
}

extension PhongKhamTestHelpers on PhongKhamIsarService {
  Future<int> listAllInvoicesCount() async {
    final isar = await db;
    return isar.invoices.count();
  }
}