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

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  String itemId = '';
  String itemName = '';

  int quantity = 0; // Positive for import, negative for export

  @enumerated
  BidaInventoryTxType type = BidaInventoryTxType.IMPORT;

  String note = '';

  @Index()
  DateTime createdAt = DateTime.now();

  /// XV. Giá nhập một đơn vị (phiếu nhập hàng).
  double unitPrice = 0.0;

  /// XV. VAT (%) áp dụng cho phiếu nhập.
  double vatPercent = 0.0;

  /// XV. Chiết khấu phiếu nhập.
  double discountAmount = 0.0;

  /// XV-XVI. Nhà cung cấp của phiếu nhập.
  String supplierId = '';
  String supplierName = '';

  /// Số phiếu nhập.
  String invoiceNo = '';
}
