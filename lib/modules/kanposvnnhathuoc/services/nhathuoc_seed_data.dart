import 'nhathuoc_isar_service.dart';
import '../models/nhathuoc_medicine.dart';
import '../models/nhathuoc_patient.dart';
import '../models/nhathuoc_supplier.dart';
import '../models/nhathuoc_prescription.dart';
import '../models/nhathuoc_customer.dart';
import '../models/nhathuoc_order.dart';
import '../models/nhathuoc_expense.dart';
import 'package:uuid/uuid.dart';

class NhathuocSeedData {
  static Future<void> seedIfEmpty(NhathuocIsarService service) async {
    final db = await service.db;
    final count = await db.nhathuocMedicines.count();
    
    if (count == 0) {
      await db.writeTxn(() async {
        // ===== MEDICINES (15+) =====
        final m1 = NhathuocMedicine()
          ..medicineId = const Uuid().v4()
          ..barcode = '8934567890123'
          ..name = 'Paracetamol 500mg'
          ..activeIngredient = 'Paracetamol'
          ..strength = '500mg'
          ..category = MedicineCategory.PAINKILLER
          ..isPrescriptionRequired = false
          ..unit = 'Vỉ'
          ..dosageForm = 'Viên nén'
          ..specification = 'Hộp 10 vỉ x 10 viên'
          ..manufacturer = 'Hà Nội Pharma'
          ..countryOfOrigin = 'Việt Nam'
          ..retailPrice = 15000
          ..purchasePrice = 10000
          ..currentStock = 200
          ..expiryDate = DateTime(2027, 6, 15)
          ..batchNumber = 'PAR-2025-A1';

        final m2 = NhathuocMedicine()
          ..medicineId = const Uuid().v4()
          ..barcode = '8934567890124'
          ..name = 'Amoxicillin 500mg'
          ..activeIngredient = 'Amoxicillin'
          ..strength = '500mg'
          ..category = MedicineCategory.ANTIBIOTIC
          ..isPrescriptionRequired = true
          ..unit = 'Hộp'
          ..dosageForm = 'Viên nang'
          ..specification = 'Hộp 20 viên nang x 500mg'
          ..manufacturer = 'DHG Pharma'
          ..countryOfOrigin = 'Việt Nam'
          ..retailPrice = 50000
          ..purchasePrice = 35000
          ..currentStock = 80
          ..expiryDate = DateTime(2027, 3, 20)
          ..batchNumber = 'AMX-2025-B2';

        final m3 = NhathuocMedicine()
          ..medicineId = const Uuid().v4()
          ..barcode = '8934567890125'
          ..name = 'Smecta'
          ..activeIngredient = 'Diosmectite'
          ..strength = '3g'
          ..category = MedicineCategory.DIGESTIVE
          ..isPrescriptionRequired = false
          ..unit = 'Gói'
          ..dosageForm = 'Bột pha hỗn dịch'
          ..specification = 'Hộp 30 gói x 3g'
          ..manufacturer = 'Ipsen Pharma'
          ..countryOfOrigin = 'Pháp'
          ..retailPrice = 4500
          ..purchasePrice = 3000
          ..currentStock = 300
          ..expiryDate = DateTime(2026, 12, 31)
          ..batchNumber = 'SME-2025-C3';

        final m4 = NhathuocMedicine()
          ..medicineId = const Uuid().v4()
          ..barcode = '8934567890126'
          ..name = 'Vitamin C 1000mg'
          ..activeIngredient = 'Ascorbic Acid'
          ..strength = '1000mg'
          ..category = MedicineCategory.VITAMIN
          ..isPrescriptionRequired = false
          ..unit = 'Tuýp'
          ..dosageForm = 'Viên sủi'
          ..specification = 'Tuýp 10 viên sủi'
          ..manufacturer = 'OPC Pharma'
          ..countryOfOrigin = 'Việt Nam'
          ..retailPrice = 65000
          ..purchasePrice = 45000
          ..currentStock = 50
          ..expiryDate = DateTime(2027, 1, 10)
          ..batchNumber = 'VTC-2025-D4';

        final m5 = NhathuocMedicine()
          ..medicineId = const Uuid().v4()
          ..barcode = '8934567890127'
          ..name = 'Cefixime 200mg'
          ..activeIngredient = 'Cefixime'
          ..strength = '200mg'
          ..category = MedicineCategory.ANTIBIOTIC
          ..isPrescriptionRequired = true
          ..unit = 'Hộp'
          ..dosageForm = 'Viên nén'
          ..specification = 'Hộp 10 viên x 200mg'
          ..manufacturer = 'Danapha Pharma'
          ..countryOfOrigin = 'Việt Nam'
          ..retailPrice = 85000
          ..purchasePrice = 65000
          ..currentStock = 40
          ..expiryDate = DateTime(2027, 8, 15)
          ..batchNumber = 'CFX-2025-E5';

        final m6 = NhathuocMedicine()
          ..medicineId = const Uuid().v4()
          ..barcode = '8934567890128'
          ..name = 'Omeprazole 20mg'
          ..activeIngredient = 'Omeprazole'
          ..strength = '20mg'
          ..category = MedicineCategory.DIGESTIVE
          ..isPrescriptionRequired = false
          ..unit = 'Hộp'
          ..dosageForm = 'Viên nang'
          ..specification = 'Hộp 14 viên nang'
          ..manufacturer = 'Stellapharm'
          ..countryOfOrigin = 'Việt Nam'
          ..retailPrice = 35000
          ..purchasePrice = 25000
          ..currentStock = 60
          ..expiryDate = DateTime(2027, 5, 20)
          ..batchNumber = 'OMP-2025-F6';

        final m7 = NhathuocMedicine()
          ..medicineId = const Uuid().v4()
          ..barcode = '8934567890129'
          ..name = 'Loratadine 10mg'
          ..activeIngredient = 'Loratadine'
          ..strength = '10mg'
          ..category = MedicineCategory.ENT
          ..isPrescriptionRequired = false
          ..unit = 'Hộp'
          ..dosageForm = 'Viên nén'
          ..specification = 'Hộp 10 viên'
          ..manufacturer = 'HQ Pharma'
          ..countryOfOrigin = 'Việt Nam'
          ..retailPrice = 30000
          ..purchasePrice = 20000
          ..currentStock = 70
          ..expiryDate = DateTime(2027, 9, 10)
          ..batchNumber = 'LOR-2025-G7';

        final m8 = NhathuocMedicine()
          ..medicineId = const Uuid().v4()
          ..barcode = '8934567890130'
          ..name = 'Cetirizine 10mg'
          ..activeIngredient = 'Cetirizine'
          ..strength = '10mg'
          ..category = MedicineCategory.DERMATOLOGY
          ..isPrescriptionRequired = false
          ..unit = 'Vỉ'
          ..dosageForm = 'Viên nén'
          ..specification = 'Hộp 2 vỉ x 10 viên'
          ..manufacturer = 'OPC Pharma'
          ..countryOfOrigin = 'Việt Nam'
          ..retailPrice = 25000
          ..purchasePrice = 18000
          ..currentStock = 90
          ..expiryDate = DateTime(2027, 7, 25)
          ..batchNumber = 'CTZ-2025-H8';

        final m9 = NhathuocMedicine()
          ..medicineId = const Uuid().v4()
          ..barcode = '8934567890131'
          ..name = 'Amlodipine 5mg'
          ..activeIngredient = 'Amlodipine'
          ..strength = '5mg'
          ..category = MedicineCategory.CARDIOVASCULAR
          ..isPrescriptionRequired = true
          ..unit = 'Hộp'
          ..dosageForm = 'Viên nén'
          ..specification = 'Hộp 30 viên'
          ..manufacturer = 'Pymepharco'
          ..countryOfOrigin = 'Việt Nam'
          ..retailPrice = 45000
          ..purchasePrice = 32000
          ..currentStock = 45
          ..expiryDate = DateTime(2027, 4, 30)
          ..batchNumber = 'AML-2025-I9';

        final m10 = NhathuocMedicine()
          ..medicineId = const Uuid().v4()
          ..barcode = '8934567890132'
          ..name = 'Metformin 500mg'
          ..activeIngredient = 'Metformin'
          ..strength = '500mg'
          ..category = MedicineCategory.ENDOCRINE
          ..isPrescriptionRequired = true
          ..unit = 'Hộp'
          ..dosageForm = 'Viên nén'
          ..specification = 'Hộp 30 viên x 500mg'
          ..manufacturer = 'Huali Pharma'
          ..countryOfOrigin = 'Trung Quốc'
          ..retailPrice = 35000
          ..purchasePrice = 22000
          ..currentStock = 55
          ..expiryDate = DateTime(2027, 10, 1)
          ..batchNumber = 'MET-2025-J10';

        final m11 = NhathuocMedicine()
          ..medicineId = const Uuid().v4()
          ..barcode = '8934567890133'
          ..name = 'Alpha Choay'
          ..activeIngredient = 'Alpha Amylase'
          ..strength = '50mg'
          ..category = MedicineCategory.DIGESTIVE
          ..isPrescriptionRequired = false
          ..unit = 'Hộp'
          ..dosageForm = 'Viên nang'
          ..specification = 'Hộp 20 viên nang'
          ..manufacturer = 'Tanabe Pharma'
          ..countryOfOrigin = 'Nhật Bản'
          ..retailPrice = 55000
          ..purchasePrice = 40000
          ..currentStock = 35
          ..expiryDate = DateTime(2026, 11, 15)
          ..batchNumber = 'ACH-2025-K11';

        final m12 = NhathuocMedicine()
          ..medicineId = const Uuid().v4()
          ..barcode = '8934567890134'
          ..name = 'Gaviscon'
          ..activeIngredient = 'Sodium Alginate'
          ..strength = '500mg'
          ..category = MedicineCategory.DIGESTIVE
          ..isPrescriptionRequired = false
          ..unit = 'Chai'
          ..dosageForm = 'Huyền dịch'
          ..specification = 'Chai 250ml'
          ..manufacturer = 'Reckitt Benckiser'
          ..countryOfOrigin = 'Anh'
          ..retailPrice = 120000
          ..purchasePrice = 90000
          ..currentStock = 25
          ..expiryDate = DateTime(2026, 10, 20)
          ..batchNumber = 'GAV-2025-L12';

        final m13 = NhathuocMedicine()
          ..medicineId = const Uuid().v4()
          ..barcode = '8934567890135'
          ..name = 'Acemuc 200mg'
          ..activeIngredient = 'Acetylcysteine'
          ..strength = '200mg'
          ..category = MedicineCategory.RESPIRATORY
          ..isPrescriptionRequired = false
          ..unit = 'Hộp'
          ..dosageForm = 'Viên sủi'
          ..specification = 'Hộp 10 viên sủi'
          ..manufacturer = 'Sanofi'
          ..countryOfOrigin = 'Pháp'
          ..retailPrice = 48000
          ..purchasePrice = 35000
          ..currentStock = 8
          ..expiryDate = DateTime(2026, 8, 30)
          ..batchNumber = 'ACE-2025-M13';

        final m14 = NhathuocMedicine()
          ..medicineId = const Uuid().v4()
          ..barcode = '8934567890136'
          ..name = 'Terpin Codein'
          ..activeIngredient = 'Terpin Hydrate + Codein'
          ..strength = '50mg+10mg'
          ..category = MedicineCategory.RESPIRATORY
          ..isPrescriptionRequired = true
          ..unit = 'Chai'
          ..dosageForm = 'Si rô'
          ..specification = 'Chai 100ml'
          ..manufacturer = 'DHG Pharma'
          ..countryOfOrigin = 'Việt Nam'
          ..retailPrice = 42000
          ..purchasePrice = 30000
          ..currentStock = 3
          ..expiryDate = DateTime(2026, 9, 25)
          ..batchNumber = 'TPC-2025-N14';

        final m15 = NhathuocMedicine()
          ..medicineId = const Uuid().v4()
          ..barcode = '8934567890137'
          ..name = 'Oresol'
          ..activeIngredient = 'ORS'
          ..strength = '21.8g'
          ..category = MedicineCategory.DIGESTIVE
          ..isPrescriptionRequired = false
          ..unit = 'Gói'
          ..dosageForm = 'Bột pha'
          ..specification = 'Hộp 20 gói'
          ..manufacturer = 'OPC Pharma'
          ..countryOfOrigin = 'Việt Nam'
          ..retailPrice = 3500
          ..purchasePrice = 2000
          ..currentStock = 500
          ..expiryDate = DateTime(2027, 12, 31)
          ..batchNumber = 'ORS-2025-O15';

        final m16 = NhathuocMedicine()
          ..medicineId = const Uuid().v4()
          ..barcode = '8934567890138'
          ..name = 'Men vi sinh Bio-acimin'
          ..activeIngredient = 'Lactobacillus + Bacillus'
          ..strength = ''
          ..category = MedicineCategory.DIGESTIVE
          ..isPrescriptionRequired = false
          ..unit = 'Hộp'
          ..dosageForm = 'Viên nang'
          ..specification = 'Hộp 30 viên'
          ..manufacturer = 'Traphaco'
          ..countryOfOrigin = 'Việt Nam'
          ..retailPrice = 95000
          ..purchasePrice = 70000
          ..currentStock = 40
          ..expiryDate = DateTime(2027, 2, 15)
          ..batchNumber = 'BAC-2025-P16';

        final m17 = NhathuocMedicine()
          ..medicineId = const Uuid().v4()
          ..barcode = '8934567890139'
          ..name = 'Coversyl 5mg'
          ..activeIngredient = 'Perindopril'
          ..strength = '5mg'
          ..category = MedicineCategory.CARDIOVASCULAR
          ..isPrescriptionRequired = true
          ..unit = 'Hộp'
          ..dosageForm = 'Viên nén'
          ..specification = 'Hộp 30 viên'
          ..manufacturer = 'Servier'
          ..countryOfOrigin = 'Pháp'
          ..retailPrice = 180000
          ..purchasePrice = 140000
          ..currentStock = 20
          ..expiryDate = DateTime(2027, 11, 30)
          ..batchNumber = 'COV-2025-Q17';

        await db.nhathuocMedicines.putAll([
          m1, m2, m3, m4, m5, m6, m7, m8, m9, m10,
          m11, m12, m13, m14, m15, m16, m17
        ]);

        // ===== PATIENTS (8) =====
        final p1 = NhathuocPatient()
          ..patientId = const Uuid().v4()
          ..name = 'Nguyễn Văn A'
          ..phone = '0901234567'
          ..address = '123 Nguyễn Trãi, Q.1, TP.HCM'
          ..email = 'nguyenvana@gmail.com'
          ..gender = PatientGender.MALE
          ..dateOfBirth = DateTime(1965, 3, 15)
          ..citizenId = '001234567890'
          ..occupation = 'Giáo viên'
          ..medicalHistory = 'Huyết áp cao'
          ..underlyingDisease = 'Tăng huyết áp'
          ..allergies = 'Paracetamol'
          ..insurance = 'BH0012345678'
          ..currentDebt = 0
          ..rewardPoints = 250;

        final p2 = NhathuocPatient()
          ..patientId = const Uuid().v4()
          ..name = 'Trần Thị B'
          ..phone = '0912345678'
          ..address = '456 Lê Lợi, Q.3, TP.HCM'
          ..gender = PatientGender.FEMALE
          ..dateOfBirth = DateTime(1980, 7, 22)
          ..citizenId = '001234567891'
          ..occupation = 'Nhân viên văn phòng'
          ..medicalHistory = 'Đái tháo đường type 2'
          ..underlyingDisease = 'Tiểu đường'
          ..allergies = ''
          ..insurance = 'BH00123456789'
          ..currentDebt = 150000
          ..rewardPoints = 500;

        final p3 = NhathuocPatient()
          ..patientId = const Uuid().v4()
          ..name = 'Lê Minh C'
          ..phone = '0923456789'
          ..address = '789 Hai Bà Trưng, Q.1, TP.HCM'
          ..gender = PatientGender.MALE
          ..dateOfBirth = DateTime(1955, 11, 8)
          ..occupation = 'Nghỉ hưu'
          ..medicalHistory = 'Bệnh tim'
          ..underlyingDisease = 'Suy tim độ 2, Huyết áp cao'
          ..allergies = 'Cephalosporin'
          ..insurance = 'BH00123456780'
          ..currentDebt = 0
          ..rewardPoints = 120;

        final p4 = NhathuocPatient()
          ..patientId = const Uuid().v4()
          ..name = 'Phạm Thị D'
          ..phone = '0934567890'
          ..gender = PatientGender.FEMALE
          ..dateOfBirth = DateTime(1992, 5, 3)
          ..allergies = ''
          ..medicalHistory = 'Dị ứng thời tiết'
          ..currentDebt = 50000
          ..rewardPoints = 80;

        final p5 = NhathuocPatient()
          ..patientId = const Uuid().v4()
          ..name = 'Hoàng Văn E'
          ..phone = '0945678901'
          ..address = '321 Võ Văn Tần, Q.3, TP.HCM'
          ..gender = PatientGender.MALE
          ..dateOfBirth = DateTime(1978, 9, 12)
          ..citizenId = '001234567892'
          ..occupation = 'Lái xe'
          ..medicalHistory = 'Viêm gan B'
          ..underlyingDisease = 'Viêm gan B mạn'
          ..allergies = 'NSAIDs'
          ..insurance = 'BH001234567891'
          ..currentDebt = 0
          ..rewardPoints = 320;

        final p6 = NhathuocPatient()
          ..patientId = const Uuid().v4()
          ..name = 'Đỗ Thị F'
          ..phone = '0956789012'
          ..gender = PatientGender.FEMALE
          ..dateOfBirth = DateTime(2001, 1, 20)
          ..allergies = ''
          ..medicalHistory = ''
          ..currentDebt = 0
          ..rewardPoints = 45;

        final p7 = NhathuocPatient()
          ..patientId = const Uuid().v4()
          ..name = 'Bùi Văn G'
          ..phone = '0967890123'
          ..address = '654 Điện Biên Phủ, Q.10'
          ..gender = PatientGender.MALE
          ..dateOfBirth = DateTime(1960, 4, 25)
          ..occupation = 'Bác sĩ (nghỉ hưu)'
          ..underlyingDisease = 'Gout'
          ..allergies = 'Allopurinol'
          ..currentDebt = 200000
          ..rewardPoints = 800;

        final p8 = NhathuocPatient()
          ..patientId = const Uuid().v4()
          ..name = 'Vũ Thị H'
          ..phone = '0978901234'
          ..gender = PatientGender.FEMALE
          ..dateOfBirth = DateTime(1988, 12, 1)
          ..allergies = 'Sulfonamides'
          ..medicalHistory = 'Viêm loét dạ dày'
          ..currentDebt = 0
          ..rewardPoints = 150;

        await db.nhathuocPatients.putAll([p1, p2, p3, p4, p5, p6, p7, p8]);

        // ===== SUPPLIERS (5) =====
        final s1 = NhathuocSupplier()
          ..supplierId = const Uuid().v4()
          ..name = 'Công ty DHG Pharma'
          ..phone = '02839502468'
          ..email = 'sales@dhgpharma.com'
          ..address = '48 Huỳnh Thúc Kháng, Q.1, TP.HCM'
          ..taxCode = '0301234567'
          ..contactPerson = 'Nguyễn Văn Sales'
          ..currentDebt = 5000000;

        final s2 = NhathuocSupplier()
          ..supplierId = const Uuid().v4()
          ..name = 'Công ty Stellapharm'
          ..phone = '02838207407'
          ..email = 'order@stellapharm.vn'
          ..address = '21 Bạch Đằng, Q.Tân Bình, TP.HCM'
          ..taxCode = '0302345678'
          ..contactPerson = 'Trần Minh Tuấn'
          ..currentDebt = 0;

        final s3 = NhathuocSupplier()
          ..supplierId = const Uuid().v4()
          ..name = 'Công ty Pymepharco'
          ..phone = '02835261856'
          ..email = 'info@pymepharco.com'
          ..address = '175 Đinh Tiên Hoàng, Q.Bình Thạnh'
          ..taxCode = '0303456789'
          ..contactPerson = 'Lê Thị Hoa'
          ..currentDebt = 3200000;

        final s4 = NhathuocSupplier()
          ..supplierId = const Uuid().v4()
          ..name = 'Công ty OPC Pharma'
          ..phone = '02839316068'
          ..email = 'contact@opcsaigon.com'
          ..address = '303 Đinh Tiên Hoàng, Q.Bình Thạnh'
          ..taxCode = '0304567890'
          ..contactPerson = 'Phạm Đức Lương'
          ..currentDebt = 1800000;

        final s5 = NhathuocSupplier()
          ..supplierId = const Uuid().v4()
          ..name = 'Công ty Traphaco'
          ..phone = '02439428000'
          ..email = 'khdh@traphaco.com.vn'
          ..address = '75 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội'
          ..taxCode = '0105678901'
          ..contactPerson = 'Hoàng Văn Khoa'
          ..currentDebt = 0;

        await db.nhathuocSuppliers.putAll([s1, s2, s3, s4, s5]);

        // ===== CUSTOMERS =====
        final c1 = NhathuocCustomer()
          ..customerId = const Uuid().v4()
          ..name = 'Khách lẻ phổ thông'
          ..phone = '0900000001'
          ..customerType = CustomerType.RETAIL
          ..rewardPoints = 50
          ..totalSpent = 750000;

        final c2 = NhathuocCustomer()
          ..customerId = const Uuid().v4()
          ..name = 'Nhà thuốc Đồng Tâm (MD001)'
          ..phone = '0911111111'
          ..email = 'dongtam@email.com'
          ..address = '12 Lý Tự Trọng, Q.1'
          ..companyName = 'Nhà thuốc Đồng Tâm'
          ..customerType = CustomerType.BUSINESS
          ..currentDebt = 2500000
          ..totalSpent = 45000000
          ..lastPurchaseDate = DateTime.now().subtract(const Duration(days: 3));

        final c3 = NhathuocCustomer()
          ..customerId = const Uuid().v4()
          ..name = 'Nguyễn Minh Vương'
          ..phone = '0922222222'
          ..customerType = CustomerType.VIP
          ..rewardPoints = 2500
          ..totalSpent = 15000000
          ..lastPurchaseDate = DateTime.now().subtract(const Duration(days: 1));

        final c4 = NhathuocCustomer()
          ..customerId = const Uuid().v4()
          ..name = 'Phòng khám Đa khoa An Bình'
          ..phone = '0933333333'
          ..email = 'phongkham@anbinh.vn'
          ..companyName = 'Phòng khám An Bình'
          ..customerType = CustomerType.BUSINESS
          ..currentDebt = 0
          ..totalSpent = 80000000
          ..lastPurchaseDate = DateTime.now();

        await db.nhathuocCustomers.putAll([c1, c2, c3, c4]);

        // ===== PRESCRIPTION TEMPLATES (8) =====
        final t1 = NhathuocPrescriptionTemplate()
          ..templateId = const Uuid().v4()
          ..diseaseName = 'Cảm cúm'
          ..notes = 'Toa cơ bản cho người lớn';
        await db.nhathuocPrescriptionTemplates.put(t1);
        
        final dt1 = NhathuocPrescriptionTemplateDetail()
          ..defaultQuantity = 2
          ..dosageInstructions = 'Sáng 1 vỉ, Tối 1 vỉ (uống sau ăn)';
        dt1.template.value = t1;
        dt1.medicine.value = m1;
        
        final dt2 = NhathuocPrescriptionTemplateDetail()
          ..defaultQuantity = 1
          ..dosageInstructions = 'Mỗi ngày 1 viên sủi, hòa nước';
        dt2.template.value = t1;
        dt2.medicine.value = m4;

        await db.nhathuocPrescriptionTemplateDetails.putAll([dt1, dt2]);
        await dt1.template.save(); await dt1.medicine.save();
        await dt2.template.save(); await dt2.medicine.save();

        final t2 = NhathuocPrescriptionTemplate()
          ..templateId = const Uuid().v4()
          ..diseaseName = 'Viêm họng'
          ..notes = 'Kháng sinh + chống viêm';
        await db.nhathuocPrescriptionTemplates.put(t2);
        final dt3 = NhathuocPrescriptionTemplateDetail()..defaultQuantity = 2..dosageInstructions = 'Sáng 1 viên, Tối 1 viên (7 ngày)';
        dt3.template.value = t2; dt3.medicine.value = m2;
        final dt4 = NhathuocPrescriptionTemplateDetail()..defaultQuantity = 1..dosageInstructions = 'Ngày 3 lần, mỗi lần 1 viên';
        dt4.template.value = t2; dt4.medicine.value = m11;
        await db.nhathuocPrescriptionTemplateDetails.putAll([dt3, dt4]);
        await dt3.template.save(); await dt3.medicine.save();
        await dt4.template.save(); await dt4.medicine.save();

        final t3 = NhathuocPrescriptionTemplate()
          ..templateId = const Uuid().v4()
          ..diseaseName = 'Tiêu chảy'
          ..notes = 'Bù nước + adsorbent + men vi sinh';
        await db.nhathuocPrescriptionTemplates.put(t3);
        final dt5 = NhathuocPrescriptionTemplateDetail()..defaultQuantity = 5..dosageInstructions = 'Pha gói với 1 lít nước, uống nhiều lần';
        dt5.template.value = t3; dt5.medicine.value = m15;
        final dt6 = NhathuocPrescriptionTemplateDetail()..defaultQuantity = 2..dosageInstructions = 'Ngày 3 lần, mỗi lần 1 gói';
        dt6.template.value = t3; dt6.medicine.value = m3;
        final dt7 = NhathuocPrescriptionTemplateDetail()..defaultQuantity = 1..dosageInstructions = 'Ngày 2 lần, sáng tối, sau ăn';
        dt7.template.value = t3; dt7.medicine.value = m16;
        await db.nhathuocPrescriptionTemplateDetails.putAll([dt5, dt6, dt7]);
        await dt5.template.save(); await dt5.medicine.save();
        await dt6.template.save(); await dt6.medicine.save();
        await dt7.template.save(); await dt7.medicine.save();

        final t4 = NhathuocPrescriptionTemplate()
          ..templateId = const Uuid().v4()
          ..diseaseName = 'Viêm dạ dày'
          ..notes = 'Ức chế bơm proton';
        await db.nhathuocPrescriptionTemplates.put(t4);
        final dt8 = NhathuocPrescriptionTemplateDetail()..defaultQuantity = 1..dosageInstructions = 'Sáng 1 viên trước ăn 30 phút';
        dt8.template.value = t4; dt8.medicine.value = m6;
        final dt9 = NhathuocPrescriptionTemplateDetail()..defaultQuantity = 1..dosageInstructions = 'Sau ăn, uống khi đau';
        dt9.template.value = t4; dt9.medicine.value = m12;
        await db.nhathuocPrescriptionTemplateDetails.putAll([dt8, dt9]);
        await dt8.template.save(); await dt8.medicine.save();
        await dt9.template.save(); await dt9.medicine.save();

        final t5 = NhathuocPrescriptionTemplate()
          ..templateId = const Uuid().v4()
          ..diseaseName = 'Dị ứng'
          ..notes = 'Kháng histamine';
        await db.nhathuocPrescriptionTemplates.put(t5);
        final dt10 = NhathuocPrescriptionTemplateDetail()..defaultQuantity = 1..dosageInstructions = 'Ngày 1 viên, sáng';
        dt10.template.value = t5; dt10.medicine.value = m7;
        await db.nhathuocPrescriptionTemplateDetails.put(dt10);
        await dt10.template.save(); await dt10.medicine.save();

        final t6 = NhathuocPrescriptionTemplate()
          ..templateId = const Uuid().v4()
          ..diseaseName = 'Ho'
          ..notes = 'Long đờm + giảm ho';
        await db.nhathuocPrescriptionTemplates.put(t6);
        final dt11 = NhathuocPrescriptionTemplateDetail()..defaultQuantity = 1..dosageInstructions = 'Ngày 3 viên sủi, hòa nước';
        dt11.template.value = t6; dt11.medicine.value = m13;
        final dt12 = NhathuocPrescriptionTemplateDetail()..defaultQuantity = 1..dosageInstructions = 'Ngày 3 lần, mỗi lần 5ml';
        dt12.template.value = t6; dt12.medicine.value = m14;
        await db.nhathuocPrescriptionTemplateDetails.putAll([dt11, dt12]);
        await dt11.template.save(); await dt11.medicine.save();
        await dt12.template.save(); await dt12.medicine.save();

        final t7 = NhathuocPrescriptionTemplate()
          ..templateId = const Uuid().v4()
          ..diseaseName = 'Cao huyết áp'
          ..notes = 'Điều trị tăng huyết áp';
        await db.nhathuocPrescriptionTemplates.put(t7);
        final dt13 = NhathuocPrescriptionTemplateDetail()..defaultQuantity = 1..dosageInstructions = 'Sáng 1 viên, uống cố định giờ';
        dt13.template.value = t7; dt13.medicine.value = m9;
        final dt14 = NhathuocPrescriptionTemplateDetail()..defaultQuantity = 1..dosageInstructions = 'Sáng 1 viên (hoặc theo BS)';
        dt14.template.value = t7; dt14.medicine.value = m17;
        await db.nhathuocPrescriptionTemplateDetails.putAll([dt13, dt14]);
        await dt13.template.save(); await dt13.medicine.save();
        await dt14.template.save(); await dt14.medicine.save();

        final t8 = NhathuocPrescriptionTemplate()
          ..templateId = const Uuid().v4()
          ..diseaseName = 'Tiểu đường'
          ..notes = 'Điều trị đái tháo đường type 2';
        await db.nhathuocPrescriptionTemplates.put(t8);
        final dt15 = NhathuocPrescriptionTemplateDetail()..defaultQuantity = 2..dosageInstructions = 'Sáng 1 viên, Tối 1 viên (trong bữa ăn)';
        dt15.template.value = t8; dt15.medicine.value = m10;
        await db.nhathuocPrescriptionTemplateDetails.put(dt15);
        await dt15.template.save(); await dt15.medicine.save();

        // ===== ORDERS (sales history) =====
        final now = DateTime.now();
        final o1 = NhathuocOrder()
          ..orderId = const Uuid().v4()
          ..orderCode = 'NT-100001'
          ..status = NhathuocOrderStatus.COMPLETED
          ..orderDate = now.subtract(const Duration(days: 5))
          ..paymentMethod = PaymentMethod.CASH
          ..cashReceived = 100000
          ..changeAmount = 5000
          ..totalAmount = 95000;
        o1.patient.value = p1;
        await db.nhathuocOrders.put(o1);

        final d1 = NhathuocOrderDetail()..quantity = 2..unitPrice = 15000..total = 30000..dosageInstructions = 'Sáng 1, Tối 1';
        d1.order.value = o1; d1.medicine.value = m1;
        final d2 = NhathuocOrderDetail()..quantity = 1..unitPrice = 50000..total = 50000..dosageInstructions = 'Ngày 3 lần';
        d2.order.value = o1; d2.medicine.value = m2;
        final d3 = NhathuocOrderDetail()..quantity = 3..unitPrice = 5000..total = 15000;
        d3.order.value = o1; d3.medicine.value = m3;
        await db.nhathuocOrderDetails.putAll([d1, d2, d3]);

        // Order 2 (recent, credit)
        final o2 = NhathuocOrder()
          ..orderId = const Uuid().v4()
          ..orderCode = 'NT-100002'
          ..status = NhathuocOrderStatus.CREDIT
          ..orderDate = now.subtract(const Duration(days: 2))
          ..paymentMethod = PaymentMethod.CREDIT
          ..totalAmount = 150000;
        o2.patient.value = p2;
        await db.nhathuocOrders.put(o2);

        final d4 = NhathuocOrderDetail()..quantity = 3..unitPrice = 45000..total = 135000;
        d4.order.value = o2; d4.medicine.value = m9;
        final d5 = NhathuocOrderDetail()..quantity = 1..unitPrice = 15000..total = 15000;
        d5.order.value = o2; d5.medicine.value = m1;
        await db.nhathuocOrderDetails.putAll([d4, d5]);

        // Order 3 (today)
        final o3 = NhathuocOrder()
          ..orderId = const Uuid().v4()
          ..orderCode = 'NT-100003'
          ..status = NhathuocOrderStatus.COMPLETED
          ..orderDate = now
          ..paymentMethod = PaymentMethod.TRANSFER
          ..transferAmount = 200000
          ..totalAmount = 200000;
        o3.patient.value = p5;
        await db.nhathuocOrders.put(o3);

        final d6 = NhathuocOrderDetail()..quantity = 1..unitPrice = 120000..total = 120000;
        d6.order.value = o3; d6.medicine.value = m12;
        final d7 = NhathuocOrderDetail()..quantity = 2..unitPrice = 35000..total = 70000;
        d7.order.value = o3; d7.medicine.value = m10;
        final d8 = NhathuocOrderDetail()..quantity = 2..unitPrice = 5000..total = 10000;
        d8.order.value = o3; d8.medicine.value = m15;
        await db.nhathuocOrderDetails.putAll([d6, d7, d8]);

        // ===== EXPENSES (thu chi) =====
        final exp1 = NhathuocExpense()
          ..expenseId = const Uuid().v4()
          ..type = ExpenseType.EXPENSE
          ..category = ExpenseCategory.SALARY
          ..amount = 15000000
          ..description = 'Lương nhân viên tháng 7'
          ..createdAt = now.subtract(const Duration(days: 5));
        final exp2 = NhathuocExpense()
          ..expenseId = const Uuid().v4()
          ..type = ExpenseType.EXPENSE
          ..category = ExpenseCategory.RENT
          ..amount = 8000000
          ..description = 'Tiền thuê mặt bằng tháng 8'
          ..createdAt = now.subtract(const Duration(days: 3));
        final exp3 = NhathuocExpense()
          ..expenseId = const Uuid().v4()
          ..type = ExpenseType.EXPENSE
          ..category = ExpenseCategory.ELECTRICITY
          ..amount = 1500000
          ..description = 'Tiền điện tháng 7'
          ..createdAt = now.subtract(const Duration(days: 2));
        final exp4 = NhathuocExpense()
          ..expenseId = const Uuid().v4()
          ..type = ExpenseType.EXPENSE
          ..category = ExpenseCategory.WATER
          ..amount = 300000
          ..description = 'Tiền nước tháng 7'
          ..createdAt = now.subtract(const Duration(days: 2));
        final exp5 = NhathuocExpense()
          ..expenseId = const Uuid().v4()
          ..type = ExpenseType.EXPENSE
          ..category = ExpenseCategory.IMPORT_DRUGS
          ..amount = 25000000
          ..description = 'Nhập hàng từ DHG Pharma'
          ..createdAt = now.subtract(const Duration(days: 7));
        final exp6 = NhathuocExpense()
          ..expenseId = const Uuid().v4()
          ..type = ExpenseType.EXPENSE
          ..category = ExpenseCategory.MARKETING
          ..amount = 500000
          ..description = 'Chi phí quảng cáo Facebook'
          ..createdAt = now;
        final exp7 = NhathuocExpense()
          ..expenseId = const Uuid().v4()
          ..type = ExpenseType.INCOME
          ..category = ExpenseCategory.DEBT_COLLECTION
          ..amount = 1000000
          ..description = 'Thu nợ Bùi Văn G'
          ..createdAt = now.subtract(const Duration(days: 1));

        await db.nhathuocExpenses.putAll([exp1, exp2, exp3, exp4, exp5, exp6, exp7]);
      });
    }
  }
}
