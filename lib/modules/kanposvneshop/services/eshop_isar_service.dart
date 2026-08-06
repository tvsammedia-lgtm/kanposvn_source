import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/eshop_shop.dart';
import '../models/eshop_product.dart';
import '../models/eshop_category.dart';
import '../models/eshop_cart.dart';
import '../models/eshop_order.dart';
import '../models/eshop_wallet.dart';
import '../models/eshop_sync.dart';

class EshopIsarService {
  late Future<Isar> db;

  EshopIsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains('kanposvneshop_db')) {
      return Isar.getInstance('kanposvneshop_db')!;
    }
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        KanShopStoreSchema,
        KanShopProductSchema,
        KanShopCategorySchema,
        KanShopCartItemSchema,
        KanShopOrderSchema,
        KanShopWalletSchema,
        KanShopSyncQueueSchema,
        KanShopSyncConfigSchema,
      ],
      inspector: true,
      directory: dir.path,
      name: 'kanposvneshop_db',
    );
  }

  Future<List<KanShopProduct>> getAllProducts() async {
    final isar = await db;
    return await isar.kanShopProducts.where().findAll();
  }

  Future<void> saveProduct(KanShopProduct product) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.kanShopProducts.put(product);
    });
  }
}
