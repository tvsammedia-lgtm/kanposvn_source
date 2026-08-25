import 'package:isar/isar.dart';

part 'eshop_order.g.dart';

/// §Đặt hàng: dòng sản phẩm trong đơn.
@embedded
class EshopOrderItem {
  String productId = '';
  String name = '';
  double price = 0;
  int quantity = 1;
  double get lineTotal => price * quantity;
}

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

  List<EshopOrderItem> items = [];

  /// Voucher áp dụng cho đơn này.
  String voucherCode = '';
  double discount = 0;

  /// Phí sàn thu trên mỗi đơn.
  double platformFee = 0;

  String paymentMethod = 'COD'; // COD | VNPay | Momo | ZaloPay | Stripe | wallet
  String status = 'pending'; // pending, confirmed, shipping, completed, cancelled

  /// Vận chuyển.
  String carrier = ''; // GHN | GHTK | ViettelPost | JandT | NinjaVan
  String trackingCode = '';

  /// Điểm thưởng tích được từ đơn.
  int pointsEarned = 0;

  DateTime createdAt = DateTime.now();
}
