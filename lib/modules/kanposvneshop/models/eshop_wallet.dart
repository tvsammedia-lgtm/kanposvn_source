import 'package:isar/isar.dart';

part 'eshop_wallet.g.dart';

@collection
class KanShopWallet {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  
  @Index(unique: true, replace: true)
  String walletId = '';
  
  String ownerId = ''; // User or Shop
  String ownerType = 'user'; // user, shop
  
  double balance = 0;
  
  DateTime updatedAt = DateTime.now();
}
