import 'package:isar/isar.dart';

part 'spa_customer.g.dart';

@collection
class SpaCustomer {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String customerId = '';

  // Thông tin chung (spec §3)
  String name = '';
  String phone = '';
  String gender = 'Nữ';
  DateTime? birthDate;
  String zalo = '';
  String facebook = '';
  String email = '';
  String address = '';
  String referrer = ''; // Người giới thiệu
  String customerGroup = 'Vãng lai'; // Nhóm khách hàng
  String notes = '';

  // Hồ sơ sức khỏe (spec §3)
  String skinType = ''; // Da Dầu, Da Khô, Da Nhạy Cảm
  String allergies = ''; // Dị ứng mỹ phẩm / thuốc
  String medicalCondition = ''; // Mụn, Nám, Tàn nhang...
  bool isPregnant = false;
  String agingLevel = ''; // Mức độ lão hóa

  // Tài chính (spec §3 Lịch sử)
  double debtAmount = 0; // Công nợ
  int loyaltyPoints = 0; // Điểm tích lũy

  @Index()
  DateTime createdAt = DateTime.now();
}
