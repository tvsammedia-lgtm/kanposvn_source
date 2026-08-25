import 'package:isar/isar.dart';
import '../models/eshop_category.dart';
import '../models/eshop_ops_models.dart';
import '../models/eshop_product.dart';
import '../models/eshop_shop.dart';
import '../models/eshop_wallet.dart';

/// Bộ dữ liệu mẫu KanShop theo kanposvneshop.md.
class EshopSeedData {
  static Future<void> seedIfEmpty(Isar db) async {
    if (await db.kanShopStores.count() > 0) return;
    final now = DateTime.now();

    await db.writeTxn(() async {
      // ── §Shop. 3 cửa hàng ─────────────────────────────────────
      await db.kanShopStores.putAll([
        KanShopStore()
          ..shopId = 'shop_phone'
          ..ownerId = 'seller_phones'
          ..name = 'PhoneStore Chính Hãng'
          ..description = 'Chuyên điện thoại chính hãng'
          ..rating = 4.8
          ..followersCount = 120
          ..status = 'active',
        KanShopStore()
          ..shopId = 'shop_fashion'
          ..ownerId = 'seller_fashion'
          ..name = 'Thời Trang GenZ'
          ..description = 'Áo thun, hoodie trẻ trung'
          ..rating = 4.5
          ..followersCount = 300
          ..status = 'active',
        KanShopStore()
          ..shopId = 'shop_book'
          ..ownerId = 'seller_books'
          ..name = 'Sách Hay Mỗi Ngày'
          ..description = 'Sách văn học, kỹ năng'
          ..rating = 4.9
          ..followersCount = 85
          ..status = 'active',
      ]);

      // ── §Danh mục đa cấp: Điện thoại > Android > Samsung ──────
      await db.kanShopCategorys.putAll([
        KanShopCategory()..categoryId = 'cat_dt'..name = 'Điện thoại'..sortOrder = 1,
        KanShopCategory()
          ..categoryId = 'cat_android'
          ..parentId = 'cat_dt'
          ..name = 'Android'
          ..sortOrder = 2,
        KanShopCategory()
          ..categoryId = 'cat_samsung'
          ..parentId = 'cat_android'
          ..name = 'Samsung'
          ..sortOrder = 3,
        KanShopCategory()..categoryId = 'cat_ao'..name = 'Áo thun'..sortOrder = 4,
        KanShopCategory()..categoryId = 'cat_sach'..name = 'Sách'..sortOrder = 5,
      ]);

      // ── §Sản phẩm ─────────────────────────────────────────────
      await db.kanShopProducts.putAll([
        KanShopProduct()
          ..productId = 'sp_galaxy_s24'
          ..shopId = 'shop_phone'
          ..categoryId = 'cat_samsung'
          ..sku = 'SKU-S24-256'
          ..barcode = '8806090000001'
          ..name = 'Samsung Galaxy S24 256GB'
          ..description = 'Máy mới 100% chính hãng VN/A.'
          ..originalPrice = 21990000
          ..salePrice = 18990000
          ..stockQuantity = 10
          ..weightGram = 168
          ..adminStatus = 'approved',
        KanShopProduct() // hết hàng
          ..productId = 'sp_iphone15'
          ..shopId = 'shop_phone'
          ..categoryId = 'cat_dt'
          ..sku = 'SKU-IP15-128'
          ..barcode = '1942534000001'
          ..name = 'iPhone 15 128GB'
          ..originalPrice = 22990000
          ..salePrice = 20990000
          ..stockQuantity = 0
          ..status = 'out_of_stock'
          ..adminStatus = 'approved',
        KanShopProduct() // flash sale đang chạy
          ..productId = 'sp_aothun_den'
          ..shopId = 'shop_fashion'
          ..categoryId = 'cat_ao'
          ..sku = 'SKU-AO-DEN-M'
          ..name = 'Áo Thun Đen Basic'
          ..originalPrice = 250000
          ..salePrice = 180000
          ..stockQuantity = 50
          ..adminStatus = 'approved',
        KanShopProduct() // combo 2 tặng 1
          ..productId = 'sp_aothun_trang'
          ..shopId = 'shop_fashion'
          ..categoryId = 'cat_ao'
          ..sku = 'SKU-AO-TRANG-L'
          ..name = 'Áo Thun Trắng Oversize (Combo 2 tặng 1)'
          ..originalPrice = 320000
          ..salePrice = 290000
          ..stockQuantity = 30
          ..isCombo2x1 = true
          ..adminStatus = 'approved',
        KanShopProduct() // chờ admin duyệt
          ..productId = 'sp_hoodie'
          ..shopId = 'shop_fashion'
          ..categoryId = 'cat_ao'
          ..sku = 'SKU-HOODIE-XL'
          ..name = 'Hoodie GenZ Xám'
          ..salePrice = 450000
          ..stockQuantity = 20
          ..adminStatus = 'pending',
        KanShopProduct()
          ..productId = 'sp_sach_nghigiau'
          ..shopId = 'shop_book'
          ..categoryId = 'cat_sach'
          ..sku = 'SKU-SACH-001'
          ..name = 'Đọc Vị Bất Kỳ Ai (Bìa Mềm)'
          ..originalPrice = 139000
          ..salePrice = 99000
          ..stockQuantity = 100
          ..adminStatus = 'approved',
      ]);

      // Flash sale cho áo đen: giảm còn 129k, giới hạn 20 chiếc.
      await db.eshopFlashSales.put(EshopFlashSale()
        ..flashSaleId = 'fs_ao_den'
        ..productId = 'sp_aothun_den'
        ..salePrice = 129000
        ..startTime = now.subtract(const Duration(hours: 1))
        ..endTime = now.add(const Duration(hours: 3))
        ..limitedQty = 20
        ..soldQty = 5);

      // ── §Voucher: platform % · shop tiền mặt ──────────────────
      await db.eshopVouchers.putAll([
        EshopVoucher()
          ..code = 'SALE10'
          ..scope = 'platform'
          ..type = 'percent'
          ..value = 10
          ..maxDiscount = 100000
          ..minOrder = 200000
          ..validTo = now.add(const Duration(days: 30)),
        EshopVoucher()
          ..code = 'FREESHIP50K'
          ..scope = 'shop'
          ..refId = 'shop_fashion'
          ..type = 'fixedAmount'
          ..value = 50000
          ..minOrder = 300000
          ..validTo = now.add(const Duration(days: 15)),
      ]);

      // Ví mẫu: khách đã có 500k, shop phone chưa mở.
      await db.kanShopWallets.put(KanShopWallet()
        ..walletId = 'w_user_kh_hung'
        ..ownerId = 'kh_hung'
        ..ownerType = 'user'
        ..balance = 500000);
    });
  }
}
