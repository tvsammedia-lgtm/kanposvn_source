import 'nhathuoc_isar_service.dart';
import '../models/nhathuoc_medicine.dart';
import '../models/nhathuoc_patient.dart';
import '../models/nhathuoc_prescription.dart';
import 'package:uuid/uuid.dart';

class NhathuocSeedData {
  static Future<void> seedIfEmpty(NhathuocIsarService service) async {
    final db = await service.db;
    final count = await db.nhathuocMedicines.count();
    
    if (count == 0) {
      await db.writeTxn(() async {
        // 1. Seed Medicines
        final mPara = NhathuocMedicine()
            ..medicineId = const Uuid().v4()
            ..barcode = '8934567890123'
            ..name = 'Paracetamol 500mg'
            ..activeIngredient = 'Paracetamol'
            ..category = MedicineCategory.PAINKILLER
            ..isPrescriptionRequired = false
            ..unit = 'Vỉ'
            ..dosageForm = 'Viên nén'
            ..retailPrice = 15000
            ..purchasePrice = 10000
            ..currentStock = 100;
            
        final mAmox = NhathuocMedicine()
            ..medicineId = const Uuid().v4()
            ..barcode = '8934567890124'
            ..name = 'Amoxicillin 500mg'
            ..activeIngredient = 'Amoxicillin'
            ..category = MedicineCategory.ANTIBIOTIC
            ..isPrescriptionRequired = true
            ..unit = 'Hộp'
            ..dosageForm = 'Viên nang'
            ..retailPrice = 50000
            ..purchasePrice = 35000
            ..currentStock = 50;
            
        final mSmecta = NhathuocMedicine()
            ..medicineId = const Uuid().v4()
            ..barcode = '8934567890125'
            ..name = 'Smecta'
            ..activeIngredient = 'Diosmectite'
            ..category = MedicineCategory.DIGESTIVE
            ..isPrescriptionRequired = false
            ..unit = 'Gói'
            ..dosageForm = 'Bột pha hỗn dịch'
            ..retailPrice = 4500
            ..purchasePrice = 3000
            ..currentStock = 200;
            
        final mVitC = NhathuocMedicine()
            ..medicineId = const Uuid().v4()
            ..barcode = '8934567890126'
            ..name = 'Vitamin C 1000mg'
            ..activeIngredient = 'Ascorbic Acid'
            ..category = MedicineCategory.VITAMIN
            ..isPrescriptionRequired = false
            ..unit = 'Tuýp'
            ..dosageForm = 'Viên sủi'
            ..retailPrice = 65000
            ..purchasePrice = 45000
            ..currentStock = 30;
            
        await db.nhathuocMedicines.putAll([mPara, mAmox, mSmecta, mVitC]);

        // 2. Seed Patient (with allergy)
        final p1 = NhathuocPatient()
          ..patientId = const Uuid().v4()
          ..name = 'Nguyễn Văn A'
          ..phone = '0901234567'
          ..medicalHistory = 'Huyết áp cao'
          ..allergies = 'Paracetamol';
        await db.nhathuocPatients.put(p1);

        // 3. Seed Prescription Templates
        final tFlu = NhathuocPrescriptionTemplate()
          ..templateId = const Uuid().v4()
          ..diseaseName = 'Cảm cúm'
          ..notes = 'Toa cơ bản cho người lớn';
        await db.nhathuocPrescriptionTemplates.put(tFlu);
        
        final dtFlu1 = NhathuocPrescriptionTemplateDetail()
          ..defaultQuantity = 2
          ..dosageInstructions = 'Sáng 1 vỉ, Tối 1 vỉ';
        dtFlu1.template.value = tFlu;
        dtFlu1.medicine.value = mPara;
        
        final dtFlu2 = NhathuocPrescriptionTemplateDetail()
          ..defaultQuantity = 1
          ..dosageInstructions = 'Mỗi ngày 1 viên sủi';
        dtFlu2.template.value = tFlu;
        dtFlu2.medicine.value = mVitC;

        await db.nhathuocPrescriptionTemplateDetails.putAll([dtFlu1, dtFlu2]);
        await dtFlu1.template.save();
        await dtFlu1.medicine.save();
        await dtFlu2.template.save();
        await dtFlu2.medicine.save();
      });
    }
  }
}
