import '../models/patient.dart';
import '../models/appointment.dart';
import '../models/clinical.dart';
import '../models/prescription.dart';
import '../models/pharmacy.dart';
import '../models/inventory.dart';
import '../models/billing.dart';
import '../models/laboratory.dart';
import '../models/queueticket.dart';
import 'phongkham_isar_service.dart';

/// Dữ liệu mẫu cho module Phòng Khám (§43 nghiệm thu).
class PhongKhamSeedData {
  static Future<void> seedSampleData(PhongKhamIsarService svc) async {
    final isar = await svc.db;

    // ------------------------------------------------ Bệnh nhân (3 khách)
    final p1 = Patient()
      ..uuid = 'pat_001'
      ..clinicId = 'clinic_001'
      ..tenantId = 'clinic_001'
      ..patientCode = 'BN1001'
      ..fullName = 'Nguyễn Văn An'
      ..dateOfBirth = DateTime(1985, 5, 12)
      ..gender = 'Nam'
      ..phone = '0901000001'
      ..address = '12 Lê Lợi, Q1, TP.HCM'
      ..allergies = ['Penicillin']
      ..chronicDiseases = ['Tăng huyết áp']
      ..medicalHistory = ['Viêm họng 2022']
      ..surgicalHistory = const []
      ..familyHistory = ['Tiểu đường (bố)']
      ..currentMedications = ['Amlodipine 5mg']
      ..note = 'Bệnh nhân quen'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final p2 = Patient()
      ..uuid = 'pat_002'
      ..clinicId = 'clinic_001'
      ..tenantId = 'clinic_001'
      ..patientCode = 'BN1002'
      ..fullName = 'Trần Thị Bình'
      ..dateOfBirth = DateTime(1992, 8, 20)
      ..gender = 'Nữ'
      ..phone = '0901000002'
      ..address = '45 Nguyễn Huệ, Q1, TP.HCM'
      ..allergies = const []
      ..chronicDiseases = const []
      ..medicalHistory = const []
      ..surgicalHistory = ['Cắt ruột thừa 2019']
      ..familyHistory = const []
      ..currentMedications = const []
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final p3 = Patient()
      ..uuid = 'pat_003'
      ..clinicId = 'clinic_001'
      ..tenantId = 'clinic_001'
      ..patientCode = 'BN1003'
      ..fullName = 'Lê Minh Cường'
      ..dateOfBirth = DateTime(1978, 1, 3)
      ..gender = 'Nam'
      ..phone = '0901000003'
      ..address = '78 Trần Hưng Đạo, Q5, TP.HCM'
      ..allergies = const ['Aspirin']
      ..chronicDiseases = ['Đái tháo đường type 2']
      ..medicalHistory = const []
      ..surgicalHistory = const []
      ..familyHistory = const []
      ..currentMedications = ['Metformin 850mg']
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    await isar.writeTxn(() async {
      await isar.patients.putAll([p1, p2, p3]);
    });

    // ------------------------------------------------ Bệnh án + lượt khám
    final m1 = MedicalRecord()
      ..uuid = 'mdr_001'
      ..patientId = 'pat_001'
      ..clinicId = 'clinic_001'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final enc1 = Encounter()
      ..uuid = 'enc_001'
      ..patientId = 'pat_001'
      ..medicalRecordId = 'mdr_001'
      ..doctorId = 'doc_001'
      ..reasonForVisit = 'Đau đầu, sốt nhẹ'
      ..symptoms = 'Nhức đầu vùng trán, sốt 38°C từ 2 ngày'
      ..medicalHistory = 'Tăng huyết áp, đang uống Amlodipine'
      ..bloodPressureSystolic = 128
      ..bloodPressureDiastolic = 84
      ..pulse = 78
      ..temperature = 38.2
      ..spO2 = 97
      ..respiratoryRate = 18
      ..height = 168
      ..weight = 62
      ..bmi = 21.9
      ..physicalExamination = 'Họng đỏ, amidan không sưng'
      ..preliminaryDiagnosis = 'Viêm họng cấp'
      ..finalDiagnosis = 'Viêm họng cấp (J02.9)'
      ..icd10Codes = ['J02.9']
      ..notes = 'Chườm ấm, uống nhiều nước'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    await isar.writeTxn(() async {
      await isar.medicalRecords.put(m1);
      await isar.encounters.put(enc1);
    });

    // ------------------------------------------------ Thuốc (nhà thuốc)
    final d1 = Drug()
      ..uuid = 'drg_001'
      ..clinicId = 'clinic_001'
      ..name = 'Paracetamol 500mg'
      ..activeIngredient = 'Paracetamol'
      ..dosage = '500mg'
      ..form = 'Viên nén'
      ..unit = 'Viên'
      ..route = 'Uống'
      ..manufacturer = 'Vidipha'
      ..category = 'Hạ sốt giảm đau'
      ..contraindications = 'Không dùng cho người suy gan nặng'
      ..interactions = 'Tránh uống rượu'
      ..warnings = 'Không dùng quá 4g/ngày'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final d2 = Drug()
      ..uuid = 'drg_002'
      ..clinicId = 'clinic_001'
      ..name = 'Amoxicillin 500mg'
      ..activeIngredient = 'Amoxicillin'
      ..dosage = '500mg'
      ..form = 'Viên nang'
      ..unit = 'Viên'
      ..route = 'Uống'
      ..manufacturer = 'Mekophar'
      ..category = 'Kháng sinh'
      ..contraindications = 'Dị ứng Penicillin'
      ..interactions = 'Tránh dùng chung với tetracycline'
      ..warnings = 'Dùng đủ liệu trình'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final d3 = Drug()
      ..uuid = 'drg_003'
      ..clinicId = 'clinic_001'
      ..name = 'Amoxicillin 250mg'
      ..activeIngredient = 'Amoxicillin'
      ..dosage = '250mg'
      ..form = 'Viên nang'
      ..unit = 'Viên'
      ..route = 'Uống'
      ..manufacturer = 'Mekophar'
      ..category = 'Kháng sinh'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    await isar.writeTxn(() async {
      await isar.drugs.putAll([d1, d2, d3]);
    });

    // ------------------------------------------------ Kho + lô thuốc
    final wh = Warehouse()
      ..uuid = 'wh_001'
      ..branchId = 'branch_001'
      ..name = 'Kho thuốc chính'
      ..type = 'Kho thuốc'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final b1 = DrugBatch()
      ..uuid = 'bt_001'
      ..drugId = 'drg_001'
      ..warehouseId = 'wh_001'
      ..lotNumber = 'LOT-PCM-01'
      ..expiryDate = DateTime.now().add(const Duration(days: 365))
      ..purchasePrice = 150
      ..sellingPrice = 200
      ..quantity = 100
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final b2 = DrugBatch()
      ..uuid = 'bt_002'
      ..drugId = 'drg_002'
      ..warehouseId = 'wh_001'
      ..lotNumber = 'LOT-AMX-01'
      ..expiryDate = DateTime.now().add(const Duration(days: 730))
      ..purchasePrice = 700
      ..sellingPrice = 900
      ..quantity = 40
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final b3 = DrugBatch()
      ..uuid = 'bt_003'
      ..drugId = 'drg_003'
      ..warehouseId = 'wh_001'
      ..lotNumber = 'LOT-AMX-02'
      ..expiryDate = DateTime.now().add(const Duration(days: 100))
      ..purchasePrice = 500
      ..sellingPrice = 650
      ..quantity = 25
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    await isar.writeTxn(() async {
      await isar.warehouses.put(wh);
      await isar.drugBatchs.putAll([b1, b2, b3]);
    });

    // ------------------------------------------------ Đơn thuốc đã xác nhận
    final rx = Prescription()
      ..uuid = 'rx_001'
      ..patientId = 'pat_001'
      ..encounterId = 'enc_001'
      ..doctorId = 'doc_001'
      ..status = 'confirmed'
      ..diagnosis = 'Viêm họng cấp (J02.9)'
      ..notes = 'Uống sau ăn'
      ..confirmedAt = DateTime.now()
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final rxi1 = PrescriptionItem()
      ..uuid = 'rxi_001'
      ..prescriptionId = 'rx_001'
      ..drugId = 'drg_001'
      ..batchId = 'bt_001'
      ..dosage = '1 viên'
      ..frequency = 'sáng - chiều'
      ..route = 'Uống'
      ..quantity = 10
      ..duration = '5 ngày'
      ..unit = 'Viên'
      ..instruction = 'Uống sau ăn'
      ..warning = null
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    await isar.writeTxn(() async {
      await isar.prescriptions.put(rx);
      await isar.prescriptionItems.put(rxi1);
    });

    // ------------------------------------------------ Lịch hẹn
    final apt = Appointment()
      ..uuid = 'apt_001'
      ..clinicId = 'clinic_001'
      ..tenantId = 'clinic_001'
      ..branchId = 'branch_001'
      ..patientId = 'pat_002'
      ..doctorId = 'doc_001'
      ..specialtyId = 'Nội tổng quát'
      ..roomId = 'P101'
      ..appointmentDate = DateTime.now().add(const Duration(days: 1))
      ..startTime = DateTime.now().add(const Duration(days: 1))
      ..endTime = DateTime.now().add(const Duration(days: 1, hours: 1))
      ..reason = 'Khám tổng quát'
      ..status = 'requested'
      ..reminderStatus = 'sent'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    await isar.writeTxn(() async => await isar.appointments.put(apt));

    // ------------------------------------------------ Hóa đơn + thanh toán
    final inv1 = Invoice()
      ..uuid = 'inv_001'
      ..branchId = 'branch_001'
      ..patientId = 'pat_001'
      ..invoiceDate = DateTime.now()
      ..totalAmount = 200000
      ..discount = 0
      ..tax = 0
      ..finalAmount = 200000
      ..status = 'paid'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final i1 = InvoiceItem()
      ..uuid = 'invit_001'
      ..invoiceId = 'inv_001'
      ..serviceId = 'Kham-tổng-quát'
      ..quantity = 1
      ..unitPrice = 200000
      ..discount = 0
      ..tax = 0
      ..amount = 200000
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    final pay1 = Payment()
      ..uuid = 'pay_001'
      ..invoiceId = 'inv_001'
      ..branchId = 'branch_001'
      ..amount = 200000
      ..method = 'cash'
      ..paymentDate = DateTime.now()
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final inv2 = Invoice()
      ..uuid = 'inv_002'
      ..branchId = 'branch_001'
      ..patientId = 'pat_001'
      ..invoiceDate = DateTime.now()
      ..totalAmount = 50000
      ..discount = 0
      ..tax = 0
      ..finalAmount = 50000
      ..status = 'pending'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final i2 = InvoiceItem()
      ..uuid = 'invit_002'
      ..invoiceId = 'inv_002'
      ..productId = 'drg_001'
      ..quantity = 1
      ..unitPrice = 20000
      ..discount = 0
      ..tax = 0
      ..amount = 20000
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    await isar.writeTxn(() async {
      await isar.invoices.putAll([inv1, inv2]);
      await isar.invoiceItems.putAll([i1, i2]);
      await isar.payments.put(pay1);
    });

    // ------------------------------------------------ Xét nghiệm
    final lab = LabOrder()
      ..uuid = 'lab_001'
      ..patientId = 'pat_003'
      ..encounterId = 'enc_001'
      ..doctorId = 'doc_001'
      ..priority = 'normal'
      ..status = 'completed'
      ..orderedAt = DateTime.now()
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final lr = LabResult()
      ..uuid = 'res_001'
      ..labOrderId = 'lab_001'
      ..testId = 'GLU'
      ..parameter = 'Đường huyết'
      ..result = '7.2'
      ..unit = 'mmol/L'
      ..referenceRange = '4.0-6.1'
      ..abnormalFlag = 'H'
      ..technicianId = 'tech_001'
      ..verifiedBy = 'doc_001'
      ..verifiedAt = DateTime.now()
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    await isar.writeTxn(() async {
      await isar.labOrders.put(lab);
      await isar.labResults.put(lr);
    });

    // ------------------------------------------------ Hàng đợi
    final qt = QueueTicket()
      ..uuid = 'qt_001'
      ..patientId = 'pat_002'
      ..appointmentId = null
      ..doctorId = 'doc_001'
      ..branchId = 'branch_001'
      ..roomId = 'P101'
      ..number = 1
      ..priority = 'normal'
      ..status = 'waiting'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    await isar.writeTxn(() async => await isar.queueTickets.put(qt));
  }
}