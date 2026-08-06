import 'package:isar/isar.dart';

part 'ride_wallet.g.dart';

@collection
class KanRideWallet {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  
  @Index(unique: true, replace: true)
  String walletId = '';
  
  String userId = ''; // Khách hàng hoặc Tài xế
  String userType = 'customer'; // customer, driver
  
  double balance = 0;
  
  DateTime updatedAt = DateTime.now();
}
