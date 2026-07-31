import 'gara_isar_service.dart';
import '../models/gara_product.dart';
import 'package:uuid/uuid.dart';

class GaraSeedData {
  static Future<void> seedIfEmpty(GaraIsarService service) async {
    final db = await service.db;
    final count = await db.garaProducts.count();
    if (count == 0) {
      await db.writeTxn(() async {
        final List<GaraProduct> defaultProducts = [
          GaraProduct()
            ..productId = const Uuid().v4()
            ..sku = 'SV-RUACHOT'
            ..name = 'Rửa xe bọt tuyết'
            ..type = GaraProductType.SERVICE
            ..retailPrice = 50000
            ..unit = 'Lần',
          GaraProduct()
            ..productId = const Uuid().v4()
            ..sku = 'SV-THAYNHOT'
            ..name = 'Công thay nhớt'
            ..type = GaraProductType.SERVICE
            ..retailPrice = 30000
            ..unit = 'Lần',
          GaraProduct()
            ..productId = const Uuid().v4()
            ..sku = 'PT-CASTROL'
            ..name = 'Nhớt Castrol Magnatec 10W-40'
            ..type = GaraProductType.PART
            ..retailPrice = 120000
            ..purchasePrice = 90000
            ..unit = 'Chai'
            ..currentStock = 50,
          GaraProduct()
            ..productId = const Uuid().v4()
            ..sku = 'PT-BOSCH'
            ..name = 'Bugi Bosch'
            ..type = GaraProductType.PART
            ..retailPrice = 80000
            ..purchasePrice = 50000
            ..unit = 'Cái'
            ..currentStock = 100,
        ];
        await db.garaProducts.putAll(defaultProducts);
      });
    }
  }
}
