import 'package:isar/isar.dart';

part 'payment.g.dart';

@collection
class ViecPayment {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  
  @Index(unique: true, replace: true)
  String paymentId = '';
  
  String contractId = ''; // Liên kết hợp đồng
  String employerId = ''; // Thu tiền từ ai
  
  double amount = 0; // Phí môi giới
  String paymentMethod = 'cash'; // cash, transfer
  
  String status = 'paid'; // paid, pending
  
  DateTime createdAt = DateTime.now();
}
