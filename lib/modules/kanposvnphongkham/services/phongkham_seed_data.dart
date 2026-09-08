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

    final p4 = Patient()
      ..uuid = 'pat_004'
      ..clinicId = 'clinic_001'
      ..tenantId = 'clinic_001'
      ..patientCode = 'BN1004'
      ..fullName = 'Hoàng Kim Dung'
      ..dateOfBirth = DateTime(2018, 6, 15)
      ..gender = 'Nữ'
      ..phone = '0901000004'
      ..address = '22 Phạm Ngũ Lão, Q1, TP.HCM'
      ..allergies = const []
      ..chronicDiseases = const []
      ..medicalHistory = const []
      ..surgicalHistory = const []
      ..familyHistory = const []
      ..currentMedications = const []
      ..note = 'Trẻ em dưới 10 tuổi'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final p5 = Patient()
      ..uuid = 'pat_005'
      ..clinicId = 'clinic_001'
      ..tenantId = 'clinic_001'
      ..patientCode = 'BN1005'
      ..fullName = 'Phạm Quốc Hùng'
      ..dateOfBirth = DateTime(1950, 11, 2)
      ..gender = 'Nam'
      ..phone = '0901000005'
      ..address = '90 Nguyễn Văn Cừ, Q5, TP.HCM'
      ..allergies = ['Sulfa']
      ..chronicDiseases = ['Tăng huyết áp', 'Đái tháo đường type 2']
      ..medicalHistory = const []
      ..surgicalHistory = const []
      ..familyHistory = const []
      ..currentMedications = ['Amlodipine 5mg', 'Metformin 850mg']
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final p6 = Patient()
      ..uuid = 'pat_006'
      ..clinicId = 'clinic_001'
      ..tenantId = 'clinic_001'
      ..patientCode = 'BN1006'
      ..fullName = 'Vũ Thu Hà'
      ..dateOfBirth = DateTime(1995, 3, 8)
      ..gender = 'Nữ'
      ..phone = '0901000006'
      ..address = '15 Bà Huyện Thanh Quan, Q3, TP.HCM'
      ..allergies = const []
      ..chronicDiseases = const []
      ..medicalHistory = const []
      ..surgicalHistory = const []
      ..familyHistory = const []
      ..currentMedications = const []
      ..note = 'Mang thai tuần 22'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    await isar.writeTxn(() async {
      await isar.patients.putAll([p1, p2, p3, p4, p5, p6]);
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

    final m2 = MedicalRecord()
      ..uuid = 'mdr_002'
      ..patientId = 'pat_002'
      ..clinicId = 'clinic_001'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final enc2 = Encounter()
      ..uuid = 'enc_002'
      ..patientId = 'pat_002'
      ..medicalRecordId = 'mdr_002'
      ..doctorId = 'doc_001'
      ..reasonForVisit = 'Đau bụng sau ăn'
      ..symptoms = 'Đau vùng thượng vị, ợ chua từ 1 tuần'
      ..medicalHistory = 'Không'
      ..bloodPressureSystolic = 118
      ..bloodPressureDiastolic = 76
      ..pulse = 76
      ..temperature = 36.8
      ..spO2 = 98
      ..respiratoryRate = 16
      ..height = 160
      ..weight = 50
      ..bmi = 19.5
      ..physicalExamination = 'Ấn đau vùng thượng vị'
      ..preliminaryDiagnosis = 'Viêm dạ dày'
      ..finalDiagnosis = 'Viêm dạ dày cấp (K29.1)'
      ..icd10Codes = ['K29.1']
      ..notes = 'Ăn nhạt, chia nhỏ bữa'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final m3 = MedicalRecord()
      ..uuid = 'mdr_003'
      ..patientId = 'pat_003'
      ..clinicId = 'clinic_001'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final enc3 = Encounter()
      ..uuid = 'enc_003'
      ..patientId = 'pat_003'
      ..medicalRecordId = 'mdr_003'
      ..doctorId = 'doc_001'
      ..reasonForVisit = 'Tái khám tiểu đường'
      ..symptoms = 'Mệt mỏi, khát nước nhiều'
      ..medicalHistory = 'Đái tháo đường type 2'
      ..bloodPressureSystolic = 132
      ..bloodPressureDiastolic = 86
      ..pulse = 80
      ..temperature = 37.0
      ..spO2 = 97
      ..respiratoryRate = 18
      ..height = 172
      ..weight = 74
      ..bmi = 25.0
      ..physicalExamination = 'Không phù'
      ..preliminaryDiagnosis = 'Đái tháo đường kém kiểm soát'
      ..finalDiagnosis = 'Đái tháo đường type 2 (E11.9)'
      ..icd10Codes = ['E11.9']
      ..notes = 'Tăng vận động'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    await isar.writeTxn(() async {
      await isar.medicalRecords.putAll([m1, m2, m3]);
      await isar.encounters.putAll([enc1, enc2, enc3]);
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

    final d4 = Drug()
      ..uuid = 'drg_004'
      ..clinicId = 'clinic_001'
      ..name = 'Metformin 850mg'
      ..activeIngredient = 'Metformin'
      ..dosage = '850mg'
      ..form = 'Viên nén'
      ..unit = 'Viên'
      ..route = 'Uống'
      ..manufacturer = 'Stada'
      ..category = 'Hạ đường huyết'
      ..contraindications = 'Suy thận nặng'
      ..interactions = 'Cản quang iod'
      ..warnings = 'Theo dõi chức năng thận'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final d5 = Drug()
      ..uuid = 'drg_005'
      ..clinicId = 'clinic_001'
      ..name = 'Ibuprofen 400mg'
      ..activeIngredient = 'Ibuprofen'
      ..dosage = '400mg'
      ..form = 'Viên nang'
      ..unit = 'Viên'
      ..route = 'Uống'
      ..manufacturer = 'DHG Pharma'
      ..category = 'Kháng viêm giảm đau'
      ..contraindications = 'Không dùng cho phụ nữ có thai, loét dạ dày'
      ..interactions = 'Chống đông máu'
      ..warnings = 'Dùng ngắn ngày'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    await isar.writeTxn(() async {
      await isar.drugs.putAll([d1, d2, d3, d4, d5]);
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

    final b4 = DrugBatch()
      ..uuid = 'bt_004'
      ..drugId = 'drg_004'
      ..warehouseId = 'wh_001'
      ..lotNumber = 'LOT-MF-01'
      ..expiryDate = DateTime.now().add(const Duration(days: 400))
      ..purchasePrice = 1200
      ..sellingPrice = 1500
      ..quantity = 5
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final b5 = DrugBatch()
      ..uuid = 'bt_005'
      ..drugId = 'drg_005'
      ..warehouseId = 'wh_001'
      ..lotNumber = 'LOT-IB-01'
      ..expiryDate = DateTime.now().add(const Duration(days: 45))
      ..purchasePrice = 300
      ..sellingPrice = 400
      ..quantity = 30
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final b6 = DrugBatch()
      ..uuid = 'bt_006'
      ..drugId = 'drg_001'
      ..warehouseId = 'wh_001'
      ..lotNumber = 'LOT-PCM-02'
      ..expiryDate = DateTime.now().add(const Duration(days: 90))
      ..purchasePrice = 150
      ..sellingPrice = 200
      ..quantity = 100
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    await isar.writeTxn(() async {
      await isar.warehouses.put(wh);
      await isar.drugBatchs.putAll([b1, b2, b3, b4, b5, b6]);
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

    final rx2 = Prescription()
      ..uuid = 'rx_002'
      ..patientId = 'pat_003'
      ..encounterId = 'enc_003'
      ..doctorId = 'doc_001'
      ..status = 'draft'
      ..diagnosis = 'Đái tháo đường type 2 (E11.9)'
      ..notes = 'Nháp, chờ bác sĩ duyệt'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final rxi2 = PrescriptionItem()
      ..uuid = 'rxi_002'
      ..prescriptionId = 'rx_002'
      ..drugId = 'drg_005'
      ..batchId = 'bt_005'
      ..dosage = '1 viên'
      ..frequency = 'sáng - chiều'
      ..route = 'Uống'
      ..quantity = 10
      ..duration = '5 ngày'
      ..unit = 'Viên'
      ..instruction = 'Uống sau ăn'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    // Đơn đã cấp phát lịch sử (pat_002)
    final rx3 = Prescription()
      ..uuid = 'rx_003'
      ..patientId = 'pat_002'
      ..encounterId = 'enc_002'
      ..doctorId = 'doc_001'
      ..status = 'dispensed'
      ..diagnosis = 'Viêm dạ dày cấp (K29.1)'
      ..notes = 'Đã cấp thuốc'
      ..confirmedAt = DateTime.now()
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final rxi3 = PrescriptionItem()
      ..uuid = 'rxi_003'
      ..prescriptionId = 'rx_003'
      ..drugId = 'drg_001'
      ..batchId = 'bt_001'
      ..dosage = '1 viên'
      ..frequency = 'ngày 2 lần'
      ..route = 'Uống'
      ..quantity = 14
      ..duration = '7 ngày'
      ..unit = 'Viên'
      ..instruction = 'Uống sau ăn'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    await isar.writeTxn(() async {
      await isar.prescriptions.put(rx);
      await isar.prescriptionItems.put(rxi1);
    });

    await isar.writeTxn(() async {
      await isar.prescriptions.putAll([rx2, rx3]);
      await isar.prescriptionItems.putAll([rxi2, rxi3]);
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

    final apt2 = Appointment()
      ..uuid = 'apt_002'
      ..clinicId = 'clinic_001'
      ..tenantId = 'clinic_001'
      ..branchId = 'branch_001'
      ..patientId = 'pat_003'
      ..doctorId = 'doc_001'
      ..specialtyId = 'Nội tổng quát'
      ..roomId = 'P101'
      ..appointmentDate = DateTime.now().add(const Duration(days: 3))
      ..startTime = DateTime.now().add(const Duration(days: 3))
      ..endTime = DateTime.now().add(const Duration(days: 3, hours: 1))
      ..reason = 'Tái khám tiểu đường'
      ..status = 'confirmed'
      ..reminderStatus = 'sent'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final apt3 = Appointment()
      ..uuid = 'apt_003'
      ..clinicId = 'clinic_001'
      ..tenantId = 'clinic_001'
      ..branchId = 'branch_001'
      ..patientId = 'pat_001'
      ..doctorId = 'doc_001'
      ..specialtyId = 'Nội tổng quát'
      ..roomId = 'P102'
      ..appointmentDate = DateTime.now()
      ..startTime = DateTime.now()
      ..endTime = DateTime.now().add(const Duration(hours: 1))
      ..reason = 'Đang khám'
      ..status = 'in_progress'
      ..reminderStatus = 'sent'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final apt4 = Appointment()
      ..uuid = 'apt_004'
      ..clinicId = 'clinic_001'
      ..tenantId = 'clinic_001'
      ..branchId = 'branch_001'
      ..patientId = 'pat_002'
      ..doctorId = 'doc_001'
      ..appointmentDate = DateTime.now().add(const Duration(days: 5))
      ..reason = 'Hủy do mưa'
      ..status = 'cancelled'
      ..reminderStatus = 'none'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final apt5 = Appointment()
      ..uuid = 'apt_005'
      ..clinicId = 'clinic_001'
      ..tenantId = 'clinic_001'
      ..branchId = 'branch_001'
      ..patientId = 'pat_005'
      ..doctorId = 'doc_001'
      ..appointmentDate = DateTime.now().subtract(const Duration(days: 1))
      ..reason = 'Khách vắng mặt'
      ..status = 'no_show'
      ..reminderStatus = 'sent'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final apt6 = Appointment()
      ..uuid = 'apt_006'
      ..clinicId = 'clinic_001'
      ..tenantId = 'clinic_001'
      ..branchId = 'branch_001'
      ..patientId = 'pat_003'
      ..doctorId = 'doc_001'
      ..appointmentDate = DateTime.now().add(const Duration(days: 7))
      ..reason = 'Dời lịch'
      ..status = 'rescheduled'
      ..reminderStatus = 'none'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    await isar.writeTxn(() async {
      await isar.appointments.put(apt);
      await isar.appointments.putAll([apt2, apt3, apt4, apt5, apt6]);
    });

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

    final inv3 = Invoice()
      ..uuid = 'inv_003'
      ..branchId = 'branch_001'
      ..patientId = 'pat_002'
      ..invoiceDate = DateTime.now()
      ..totalAmount = 120000
      ..discount = 0
      ..tax = 0
      ..finalAmount = 120000
      ..status = 'partial'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final i3 = InvoiceItem()
      ..uuid = 'invit_003'
      ..invoiceId = 'inv_003'
      ..serviceId = 'SVC_XN'
      ..quantity = 1
      ..unitPrice = 120000
      ..discount = 0
      ..tax = 0
      ..amount = 120000
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    final pay2 = Payment()
      ..uuid = 'pay_002'
      ..invoiceId = 'inv_003'
      ..branchId = 'branch_001'
      ..amount = 80000
      ..method = 'cash'
      ..paymentDate = DateTime.now()
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final inv4 = Invoice()
      ..uuid = 'inv_004'
      ..branchId = 'branch_001'
      ..patientId = 'pat_003'
      ..invoiceDate = DateTime.now()
      ..totalAmount = 300000
      ..discount = 0
      ..tax = 0
      ..finalAmount = 300000
      ..status = 'pending'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final i4 = InvoiceItem()
      ..uuid = 'invit_004'
      ..invoiceId = 'inv_004'
      ..productId = 'drg_004'
      ..quantity = 2
      ..unitPrice = 150000
      ..discount = 0
      ..tax = 0
      ..amount = 300000
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    final inv5 = Invoice()
      ..uuid = 'inv_005'
      ..branchId = 'branch_001'
      ..patientId = 'pat_003'
      ..invoiceDate = DateTime.now()
      ..totalAmount = 90000
      ..discount = 0
      ..tax = 0
      ..finalAmount = 90000
      ..status = 'cancelled'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    await isar.writeTxn(() async {
      await isar.invoices.putAll([inv1, inv2, inv3, inv4, inv5]);
      await isar.invoiceItems.putAll([i1, i2, i3, i4]);
      await isar.payments.putAll([pay1, pay2]);
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

    final lab2 = LabOrder()
      ..uuid = 'lab_002'
      ..patientId = 'pat_002'
      ..encounterId = 'enc_002'
      ..doctorId = 'doc_001'
      ..priority = 'normal'
      ..status = 'collected'
      ..orderedAt = DateTime.now()
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final lr2 = LabResult()
      ..uuid = 'res_002'
      ..labOrderId = 'lab_002'
      ..testId = 'HB'
      ..parameter = 'Hemoglobin'
      ..result = '13.1'
      ..unit = 'g/dL'
      ..referenceRange = '12.0-16.0'
      ..abnormalFlag = ''
      ..technicianId = 'tech_001'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    final lab3 = LabOrder()
      ..uuid = 'lab_003'
      ..patientId = 'pat_001'
      ..encounterId = 'enc_001'
      ..doctorId = 'doc_001'
      ..priority = 'urgent'
      ..status = 'ordered'
      ..orderedAt = DateTime.now()
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    await isar.writeTxn(() async {
      await isar.labOrders.put(lab);
      await isar.labResults.put(lr);
    });

    await isar.writeTxn(() async {
      await isar.labOrders.putAll([lab2, lab3]);
      await isar.labResults.put(lr2);
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

    final qt2 = QueueTicket()
      ..uuid = 'qt_002'
      ..patientId = 'pat_001'
      ..appointmentId = null
      ..doctorId = 'doc_001'
      ..branchId = 'branch_001'
      ..roomId = 'P102'
      ..number = 2
      ..priority = 'normal'
      ..status = 'called'
      ..calledAt = DateTime.now()
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    final qt3 = QueueTicket()
      ..uuid = 'qt_003'
      ..patientId = 'pat_003'
      ..appointmentId = null
      ..doctorId = 'doc_001'
      ..branchId = 'branch_001'
      ..roomId = 'P101'
      ..number = 3
      ..priority = 'normal'
      ..status = 'done'
      ..calledAt = DateTime.now()
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..syncStatus = 'synced'
      ..deviceId = 'device_001';

    await isar.writeTxn(() async {
      await isar.queueTickets.putAll([qt, qt2, qt3]);
    });
  }
}