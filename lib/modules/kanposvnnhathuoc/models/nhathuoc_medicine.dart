import 'package:isar/isar.dart';

part 'nhathuoc_medicine.g.dart';

enum MedicineCategory {
  ANTIBIOTIC('Kháng sinh'),
  PAINKILLER('Giảm đau'),
  DIGESTIVE('Tiêu hóa'),
  VITAMIN('Vitamin'),
  CARDIOVASCULAR('Tim mạch'),
  OTHER('Khác');

  final String label;
  const MedicineCategory(this.label);
}

@collection
class NhathuocMedicine {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String medicineId = '';
  
  String barcode = '';
  String name = '';
  String activeIngredient = ''; // Hoạt chất
  
  @enumerated
  MedicineCategory category = MedicineCategory.OTHER;
  
  bool isPrescriptionRequired = false; // Thuốc kê đơn hay OTC
  
  String unit = ''; // Đơn vị tính: Hộp, Vỉ, Viên...
  String dosageForm = ''; // Dạng bào chế: Viên nén, Siro...
  
  double retailPrice = 0.0;
  double purchasePrice = 0.0;
  
  double currentStock = 0.0;
  
  DateTime? expiryDate; // Hạn sử dụng (Mẫu)
}
