import 'package:isar/isar.dart';

part 'eshop_order.g.dart';

@collection
class KanShopOrder {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  
  @Index(unique: true, replace: true)
  String orderId = '';
  
  String userId = '';
  String shopId = '';
  
  double subTotal = 0;
  double shippingFee = 0;
  double totalAmount = 0;
  
  String paymentMethod = 'COD';
  String status = 'pending'; // pending, confirmed, shipping, completed, cancelled
  
  DateTime createdAt = DateTime.now();
}
