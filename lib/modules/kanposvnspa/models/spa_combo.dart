import 'package:isar/isar.dart';

part 'spa_combo.g.dart';

/// Combo liệu trình (spec §9): vd Combo 10 buổi tặng 2.
@collection
class SpaCombo {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String comboId = '';

  String name = ''; // vd: Combo Massage body 10 tặng 2
  String serviceId = '';
  String serviceName = '';

  int totalSessions = 12; // tổng số buổi (đã gồm tặng)
  int bonusSessions = 2; // số buổi tặng
  double price = 0.0; // giá bán combo

  // Gán cho khách
  String customerId = '';
  String customerName = '';

  int usedCount = 0; // Đã dùng

  DateTime? purchaseDate;
  DateTime? expiryDate; // Hết hạn

  int get remaining => totalSessions - usedCount;
  bool get isExpired =>
      expiryDate != null && expiryDate!.isBefore(DateTime.now());

  @Index()
  DateTime createdAt = DateTime.now();
}
