import 'package:isar/isar.dart';

part 'eshop_ops_models.g.dart';

/// §Voucher. Phạm vi: product | shop | platform.
@collection
class EshopVoucher {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;

  @Index(unique: true, replace: true)
  String code = '';

  /// product | shop | platform
  String scope = 'platform';
  String refId = ''; // productId/shopId nếu scope khác platform

  /// percent | fixedAmount
  String type = 'percent';
  double value = 0;
  double maxDiscount = 0;
  double minOrder = 0;

  DateTime? validTo;
  bool active = true;
  int usageCount = 0;
}

/// §Flash Sale: thời gian + giới hạn số lượng.
@collection
class EshopFlashSale {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;

  @Index(unique: true, replace: true)
  String flashSaleId = '';

  @Index()
  String productId = '';

  double salePrice = 0;

  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(const Duration(hours: 4));

  int limitedQty = 100;
  int soldQty = 0;
}

/// §Đánh giá: 1-5 sao có ảnh.
@collection
class EshopReview {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;

  @Index(unique: true, replace: true)
  String reviewId = '';

  @Index()
  String orderId = '';
  String productId = '';
  String userId = '';

  int stars = 5;
  String comment = '';
  List<String> imageUrls = [];

  DateTime createdAt = DateTime.now();
}

/// §Yêu thích Wishlist.
@collection
class EshopWishlistItem {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String itemId = '';

  @Index()
  String userId = '';
  String productId = '';

  DateTime createdAt = DateTime.now();
}

/// §Theo dõi Shop (Follow).
@collection
class EshopShopFollow {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String followId = '';

  @Index()
  String userId = '';
  String shopId = '';

  DateTime createdAt = DateTime.now();
}

/// §Chat Khách ↔ Shop.
@collection
class EshopChatMessage {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String msgId = '';

  /// roomId = `<userId>|<shopId>`
  @Index()
  String roomId = '';

  /// customer | shop
  String senderRole = 'customer';
  String senderUuid = '';
  String text = '';
  String? imageUrl;

  DateTime createdAt = DateTime.now();
}

/// §Ví điện tử: lịch sử biến động số dư.
@collection
class EshopWalletTransaction {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;

  @Index(unique: true, replace: true)
  String txId = '';

  @Index()
  String ownerId = '';

  double amount = 0; // +/- 

  /// topup | payment | refund | affiliate | points_redeem
  String type = 'topup';
  String description = '';

  DateTime createdAt = DateTime.now();
}

/// §Khiếu nại: hoàn tiền / trả hàng.
@collection
class EshopComplaintTicket {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String ticketId = '';

  @Index()
  String orderId = '';
  String userId = '';

  String reason = '';

  /// open | resolved
  String status = 'open';
  double refundAmount = 0;
  bool restock = true;

  DateTime? resolvedAt;
  DateTime createdAt = DateTime.now();
}

/// §Affiliate: hoa hồng giới thiệu đơn hàng.
@collection
class EshopAffiliateReferral {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;

  @Index(unique: true, replace: true)
  String refId = '';

  String affiliateUserId = '';
  String orderId = '';

  double orderAmount = 0;
  double commission = 0; // 5% mặc định

  DateTime createdAt = DateTime.now();
}

/// §Điểm thưởng: sổ tích/đổi điểm.
@collection
class EshopPointEntry {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String entryId = '';

  @Index()
  String userId = '';

  int points = 0; // +/- 
  String reason = '';

  DateTime createdAt = DateTime.now();
}
