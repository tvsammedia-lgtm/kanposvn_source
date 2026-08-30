import 'package:isar/isar.dart';
import 'tt_product.dart';
import 'tt_partner.dart';

part 'tt_stock.g.dart';

enum TtMovementType {
  PURCHASE('Nhập hàng'),
  SALE('Bán hàng'),
  SALE_RETURN('Trả hàng bán'),
  PURCHASE_RETURN('Trả nhà cung cấp'),
  DAMAGE('Hư hỏng'),
  WASTE('Hao hụt'),
  ADJUSTMENT_IN('Điều chỉnh tăng'),
  ADJUSTMENT_OUT('Điều chỉnh giảm'),
  INTERNAL_USE('Sử dụng nội bộ');

  final String label;
  const TtMovementType(this.label);
}

enum TtIssueType {
  SALE('Xuất bán hàng'),
  RETURN_SUPPLIER('Xuất trả NCC'),
  WASTE('Xuất hao hụt'),
  DAMAGE('Xuất hư hỏng'),
  INTERNAL_USE('Xuất sử dụng nội bộ'),
  ADJUSTMENT('Xuất điều chỉnh');

  final String label;
  const TtIssueType(this.label);
}

/// Lô hàng nhập — theo dõi hạn sử dụng và tồn theo lô (FIFO).
@collection
class TtStockLot {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String lotId = ''; // For sync

  final product = IsarLink<TtProduct>();
  final supplier = IsarLink<TtSupplier>();

  String lotNumber = '';
  DateTime purchaseDate = DateTime.now();
  DateTime? expiryDate; // Hạn sử dụng

  double quantityIn = 0; // Số nhập (baseUnit)
  double quantityOut = 0; // Số xuất
  double quantityRemaining = 0; // Tồn lô

  double unitCost = 0; // Giá vốn lô
}

/// Phiếu xuất kho (hao hụt, hư hỏng, trả NCC...).
@collection
class TtStockIssue {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String issueId = ''; // For sync

  String issueNumber = '';
  @enumerated
  TtIssueType issueType = TtIssueType.WASTE;

  DateTime date = DateTime.now();
  String note = '';
  double totalCost = 0;
  String createdBy = '';
}

/// Ghi nhận mọi biến động tồn kho (nhập/xuất/điều chỉnh/trả).
@collection
class TtStockMovement {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String movementId = ''; // For sync

  final product = IsarLink<TtProduct>();
  final lot = IsarLink<TtStockLot>();

  @enumerated
  TtMovementType movementType = TtMovementType.PURCHASE;

  String referenceId = ''; // HDB/PNB/ID phiếu xuất
  double quantity = 0; // Dương = nhập, âm = xuất
  double unitCost = 0;
  double totalCost = 0;

  DateTime createdAt = DateTime.now();
}