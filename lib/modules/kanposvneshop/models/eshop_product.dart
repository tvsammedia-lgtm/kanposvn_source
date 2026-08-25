import 'package:isar/isar.dart';

part 'eshop_product.g.dart';

@collection
class KanShopProduct {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  
  @Index(unique: true, replace: true)
  String productId = '';
  
  String shopId = '';
  String categoryId = '';
  
  String sku = '';
  String barcode = '';
  
  String name = '';
  String description = '';
  
  List<String> imageUrls = [];
  String? videoUrl;
  
  double originalPrice = 0;
  double salePrice = 0;
  
  int stockQuantity = 0;
  
  double weightGram = 0;
  
  bool isCombo2x1 = false; // Combo mua 2 tặng 1

  /// Đánh giá trung bình (từ Review).
  double ratingAvg = 0;
  int ratingCount = 0;

  /// Admin duyệt sản phẩm: pending | approved | rejected
  String adminStatus = 'approved';

  String status = 'active'; // active, out_of_stock, hidden
  
  DateTime createdAt = DateTime.now();
}
