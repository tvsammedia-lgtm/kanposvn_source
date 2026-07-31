import 'package:isar/isar.dart';

part 'bida_inventory_tx.g.dart';

enum BidaInventoryTxType {
  IMPORT('Nhập Hàng'),
  EXPORT('Xuất Hàng/Hao hụt');

  final String label;
  const BidaInventoryTxType(this.label);
}

@collection
class BidaInventoryTx {
  Id id = Isar.autoIncrement;

  String itemId = '';
  String itemName = '';
  
  int quantity = 0; // Positive for import, negative for export

  @enumerated
  BidaInventoryTxType type = BidaInventoryTxType.IMPORT;

  String note = '';

  @Index()
  DateTime createdAt = DateTime.now();
}
