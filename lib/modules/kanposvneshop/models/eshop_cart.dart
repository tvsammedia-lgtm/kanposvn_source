import 'package:isar/isar.dart';

part 'eshop_cart.g.dart';

@collection
class KanShopCartItem {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  
  @Index(unique: true, replace: true)
  String cartItemId = '';
  
  String userId = '';
  String shopId = '';
  String productId = '';
  
  int quantity = 1;
  double price = 0;
  
  DateTime createdAt = DateTime.now();
}
