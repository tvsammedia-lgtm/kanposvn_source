import 'package:uuid/uuid.dart';
import 'package:isar/isar.dart';
import '../models/vlxd_product.dart';
import 'vlxd_isar_service.dart';

class VlxdSeedData {
  static Future<void> seedIfEmpty(VlxdIsarService isarService) async {
    final db = await isarService.db;
    final categoryCount = await db.vlxdProductCategorys.count();
    
    if (categoryCount == 0) {
      final uuid = const Uuid();
      
      // Categories
      final cats = [
        VlxdProductCategory()..categoryId = uuid.v4()..name = 'Sắt Thép',
        VlxdProductCategory()..categoryId = uuid.v4()..name = 'Xi Măng',
        VlxdProductCategory()..categoryId = uuid.v4()..name = 'Gạch Cát Đá',
      ];
      
      await db.writeTxn(() async {
        await db.vlxdProductCategorys.putAll(cats);
      });
      
      final savedCats = await db.vlxdProductCategorys.where().findAll();
      final catSat = savedCats.firstWhere((c) => c.name == 'Sắt Thép');
      final catXiMang = savedCats.firstWhere((c) => c.name == 'Xi Măng');
      final catGach = savedCats.firstWhere((c) => c.name == 'Gạch Cát Đá');

      // Products
      final products = [
        VlxdProduct()
          ..productId = uuid.v4()
          ..productCode = 'THP-D10'
          ..productName = 'Thép Hòa Phát D10'
          ..unit = 'Cây'
          ..specification = '11.7m'
          ..purchasePrice = 95000
          ..retailPrice = 105000
          ..category.value = catSat,
          
        VlxdProduct()
          ..productId = uuid.v4()
          ..productCode = 'THP-D12'
          ..productName = 'Thép Hòa Phát D12'
          ..unit = 'Cây'
          ..specification = '11.7m'
          ..purchasePrice = 140000
          ..retailPrice = 155000
          ..category.value = catSat,
          
        VlxdProduct()
          ..productId = uuid.v4()
          ..productCode = 'XM-HT'
          ..productName = 'Xi Măng Hà Tiên 1'
          ..unit = 'Bao'
          ..specification = '50kg'
          ..purchasePrice = 85000
          ..retailPrice = 92000
          ..category.value = catXiMang,
          
        VlxdProduct()
          ..productId = uuid.v4()
          ..productCode = 'CAT-XD'
          ..productName = 'Cát xây tô'
          ..unit = 'Khối'
          ..specification = 'Khối'
          ..purchasePrice = 200000
          ..retailPrice = 250000
          ..category.value = catGach,
          
        VlxdProduct()
          ..productId = uuid.v4()
          ..productCode = 'GACH-TUYNEL'
          ..productName = 'Gạch Tuynel 4 lỗ'
          ..unit = 'Viên'
          ..specification = '8x8x18'
          ..purchasePrice = 1100
          ..retailPrice = 1300
          ..category.value = catGach,
      ];
      
      await db.writeTxn(() async {
        for (var p in products) {
          await db.vlxdProducts.put(p);
          await p.category.save();
        }
      });
    }
  }
}
