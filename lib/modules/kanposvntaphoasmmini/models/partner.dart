import 'package:isar/isar.dart';

part 'partner.g.dart';

@collection
class TapHoaCustomer {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String customerId = '';

  String name = '';
  String phone = '';
  String address = '';
  
  double debtAmount = 0; // Công nợ
  double totalSpent = 0; // Tổng chi tiêu (để phân hạng)
  int rewardPoints = 0; // Điểm thưởng
  
  String memberTier = 'Silver'; // Silver, Gold, Platinum, Diamond
}

@collection
class TapHoaSupplier {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String supplierId = '';

  String name = '';
  String phone = '';
  String address = '';
  
  double debtAmount = 0; // Nợ nhà cung cấp
}
