import 'package:isar/isar.dart';

part 'nhathuoc_medicine.g.dart';

enum MedicineCategory {
  ANTIBIOTIC('Kháng sinh'),
  PAINKILLER('Giảm đau'),
  DIGESTIVE('Tiêu hóa'),
  VITAMIN('Vitamin'),
  CARDIOVASCULAR('Tim mạch'),
  ENDOCRINE('Tiểu đường'),
  RESPIRATORY('Hô hấp'),
  DERMATOLOGY('Da liễu'),
  ENT('Tai mũi họng'),
  OPHTHALM('Mắt'),
  GYNECOLOGY('Phụ khoa'),
  HEPATOBILIARY('Gan mật'),
  NEUROLOGICAL('Thần kinh'),
  ONCOLOGICAL('Ung bướu'),
  OTHER('Khác');

  final String label;
  const MedicineCategory(this.label);
}

@collection
class NhathuocMedicine {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String medicineId = '';
  
  String barcode = '';
  String name = '';
  String activeIngredient = ''; // Hoạt chất
  String strength = ''; // Hàm lượng
  
  @enumerated
  MedicineCategory category = MedicineCategory.OTHER;
  
  bool isPrescriptionRequired = false; // Thuốc kê đơn hay OTC
  
  String unit = ''; // Đơn vị tính: Hộp, Vỉ, Viên...
  String dosageForm = ''; // Dạng bào chế: Viên nén, Siro...
  String specification = ''; // Quy cách: Hộp 10 vỉ x 10 viên
  
  String manufacturer = ''; // Nhà sản xuất
  String countryOfOrigin = ''; // Nước sản xuất
  String drugGroup = ''; // Nhóm thuốc
  String drugType = ''; // Loại thuốc
  
  double retailPrice = 0.0;
  double purchasePrice = 0.0;
  double vat = 0.0; // VAT %
  
  double currentStock = 0.0;
  
  DateTime? expiryDate; // Hạn sử dụng (Mẫu)
  String batchNumber = ''; // Số lô
  String registrationNumber = ''; // Số đăng ký
  
  String description = ''; // Mô tả
  String imageUrl = ''; // Hình ảnh
  String note = ''; // Ghi chú
}
