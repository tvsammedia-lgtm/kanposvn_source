import 'package:isar/isar.dart';

part 'finance.g.dart';

@collection
class TapHoaCashTransaction {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String transactionId = '';

  String title = '';
  String type = 'INCOME'; // INCOME, EXPENSE
  String category = ''; // Bán hàng, Nhập hàng, Điện nước...
  
  double amount = 0;
  String paymentMethod = 'Tiền mặt'; // Tiền mặt, Chuyển khoản
  
  DateTime timestamp = DateTime.now();
  String performerName = '';
  String note = '';
}
