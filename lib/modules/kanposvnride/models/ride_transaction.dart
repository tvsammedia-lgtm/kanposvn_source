import 'package:isar/isar.dart';

part 'ride_transaction.g.dart';

@collection
class RideTransaction {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;

  @Index()
  String? userUuid; // ID của khách hàng
  
  double amount = 0.0;
  
  @enumerated
  TransactionType type = TransactionType.topup;
  
  String? description;
  
  DateTime? createdAt;
  
  @enumerated
  TransactionSyncStatus syncStatus = TransactionSyncStatus.pending;
}

enum TransactionType {
  topup,     // Nạp tiền
  withdraw,  // Rút tiền
  payment,   // Thanh toán chuyến đi
  refund,    // Hoàn tiền
  reward     // Thưởng
}

enum TransactionSyncStatus {
  synced,
  pending,
  failed
}
