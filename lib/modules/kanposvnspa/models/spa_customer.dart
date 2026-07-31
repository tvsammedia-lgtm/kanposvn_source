import 'package:isar/isar.dart';

part 'spa_customer.g.dart';

@collection
class SpaCustomer {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String customerId = '';

  String name = '';
  String phone = '';
  
  // Health Records (Hồ sơ sức khỏe)
  String skinType = ''; // e.g., Da Dầu, Da Khô, Da Nhạy Cảm
  String allergies = ''; // e.g., Dị ứng mỹ phẩm, Dị ứng cồn
  String medicalCondition = ''; // e.g., Mụn, Nám, Tàn nhang
  String notes = '';

  @Index()
  DateTime createdAt = DateTime.now();
}
