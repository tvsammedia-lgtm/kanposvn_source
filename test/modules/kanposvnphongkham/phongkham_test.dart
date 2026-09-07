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
      expect(revenue['revenue'], 250000); // 200000 + 50000
      expect(revenue['invoiceCount'], 2);
      final pnl = await service.getProfitLossReport();
      expect(pnl['revenue'], 250000);
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
  });

  group('PhongKham Seed & Dashboard', () {
    test('seedIfEmpty seeds once', () async {
      await service.seedIfEmpty();
      expect(await service.isSeeded(), isTrue);
      final patients = await service.listPatients();
      expect(patients.length, 3);
      final drugs = await service.listDrugs();
      expect(drugs.length, 3);
      final invoices = await service.listAllInvoicesCount();
      expect(invoices, 2);
      // chạy lại không nhân đôi
      await service.seedIfEmpty();
      expect((await service.listPatients()).length, 3);
    });

    test('dashboard stats sane', () async {
      await service.seedSampleData();
      final s = await service.getDashboardStats();
      expect(s['patients'], 3);
      expect(s['appointments'], 1);
      expect(s['encounters'], 1);
    });
  });
}

extension PhongKhamTestHelpers on PhongKhamIsarService {
  Future<int> listAllInvoicesCount() async {
    final isar = await db;
    return isar.invoices.count();
  }
}