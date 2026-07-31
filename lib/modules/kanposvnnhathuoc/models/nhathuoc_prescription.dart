import 'package:isar/isar.dart';
import 'nhathuoc_medicine.dart';

part 'nhathuoc_prescription.g.dart';

@collection
class NhathuocPrescriptionTemplate {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String templateId = '';
  
  String diseaseName = ''; // Tên bệnh (Cảm cúm, Tiêu chảy...)
  String notes = ''; // Ghi chú thêm
  
  @Backlink(to: 'template')
  final details = IsarLinks<NhathuocPrescriptionTemplateDetail>();
}

@collection
class NhathuocPrescriptionTemplateDetail {
  Id id = Isar.autoIncrement;
  
  double defaultQuantity = 0.0;
  String dosageInstructions = ''; // HDSD (Sáng 1 viên, tối 1 viên...)

  final template = IsarLink<NhathuocPrescriptionTemplate>();
  final medicine = IsarLink<NhathuocMedicine>();
}
