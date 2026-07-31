import 'package:uuid/uuid.dart';
import 'bida_isar_service.dart';
import '../models/bida_table.dart';
import '../models/bida_item.dart';

class BidaSeedData {
  static Future<void> seedIfEmpty(BidaIsarService isarService) async {
    final db = await isarService.db;
    final tableCount = await db.bidaTables.count();
    
    if (tableCount == 0) {
      await db.writeTxn(() async {
        // Seed Tables
        List<BidaTable> tables = [];
        
        // 5 Bàn Libre
        for (int i = 1; i <= 5; i++) {
          tables.add(BidaTable()
            ..tableId = const Uuid().v4()
            ..name = 'Bàn Libre ${i.toString().padLeft(2, '0')}'
            ..type = BidaTableType.LIBRE
            ..status = BidaTableStatus.EMPTY
            ..hourlyPrice = 60000);
        }
        
        // 3 Bàn Lỗ
        for (int i = 1; i <= 3; i++) {
          tables.add(BidaTable()
            ..tableId = const Uuid().v4()
            ..name = 'Bàn Lỗ ${i.toString().padLeft(2, '0')}'
            ..type = BidaTableType.LO
            ..status = BidaTableStatus.EMPTY
            ..hourlyPrice = 70000);
        }

        // 2 Bàn 3 Băng
        for (int i = 1; i <= 2; i++) {
          tables.add(BidaTable()
            ..tableId = const Uuid().v4()
            ..name = 'Bàn 3 Băng ${i.toString().padLeft(2, '0')}'
            ..type = BidaTableType.BANG_3
            ..status = BidaTableStatus.EMPTY
            ..hourlyPrice = 90000);
        }
        
        await db.bidaTables.putAll(tables);

        // Seed Items
        final sting = BidaItem()
          ..itemId = const Uuid().v4()
          ..name = 'Sting Dâu'
          ..category = BidaItemCategory.DRINK
          ..price = 15000
          ..stock = 100;
          
        final redbull = BidaItem()
          ..itemId = const Uuid().v4()
          ..name = 'Redbull'
          ..category = BidaItemCategory.DRINK
          ..price = 20000
          ..stock = 100;
          
        final nood = BidaItem()
          ..itemId = const Uuid().v4()
          ..name = 'Mì trứng xúc xích'
          ..category = BidaItemCategory.FOOD
          ..price = 35000
          ..stock = 50;

        await db.bidaItems.putAll([sting, redbull, nood]);
      });
    }
  }
}
