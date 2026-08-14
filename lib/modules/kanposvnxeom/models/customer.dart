import 'package:isar/isar.dart';

part 'customer.g.dart';

@collection
class XeOmCustomer {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;
  
  String? fullName;
  String? phone;
  String? email;
  String? address;
  
  int rewardPoints = 0; // Điểm thưởng
  int totalBookings = 0; // Tổng số chuyến
  double totalRevenue = 0.0; // Tổng chi tiêu
  
  String? notes;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  bool isDeleted = false;
  int syncVersion = 1;
}
