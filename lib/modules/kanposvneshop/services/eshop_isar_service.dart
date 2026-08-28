import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/eshop_shop.dart';
import '../models/eshop_product.dart';
import '../models/eshop_category.dart';
import '../models/eshop_cart.dart';
import '../models/eshop_order.dart';
import '../models/eshop_wallet.dart';
import '../models/eshop_sync.dart';
import '../models/eshop_ops_models.dart';
import '../models/eshop_gps_models.dart';

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
    try {
      return await _open(dir.path);
    } on IsarError catch (e) {
      if (e.message.toLowerCase().contains('schema')) {
        final oldDir = Directory('${dir.path}/kanposvneshop_db.isar');
        if (oldDir.existsSync()) {
          oldDir.renameSync('${dir.path}/kanposvneshop_db_backup_${DateTime.now().millisecondsSinceEpoch}.isar');
        }
        return await _open(dir.path);
      }
      rethrow;
    }
  }

  Future<Isar> _open(String dirPath) {
    return Isar.open(
      [
        KanShopStoreSchema,
        KanShopProductSchema,
        KanShopCategorySchema,
        KanShopCartItemSchema,
        KanShopOrderSchema,
        KanShopWalletSchema,
        KanShopSyncQueueSchema,
        KanShopSyncConfigSchema,
        EshopVoucherSchema,
        EshopFlashSaleSchema,
        EshopReviewSchema,
        EshopWishlistItemSchema,
        EshopShopFollowSchema,
        EshopChatMessageSchema,
        EshopWalletTransactionSchema,
        EshopComplaintTicketSchema,
        EshopAffiliateReferralSchema,
        EshopPointEntrySchema,
        EshopShipmentSchema,
        EshopGpsPingSchema,
      ],
      inspector: true,
      directory: dirPath,
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
