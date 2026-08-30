import 'package:isar/isar.dart';
import 'tt_partner.dart';
import 'tt_product.dart';
import 'tt_stock.dart';

part 'tt_order.g.dart';

enum TtPaymentMethod {
  CASH('Tiền mặt'),
  TRANSFER('Chuyển khoản'),
  QR('QR Code'),
  DEBT('Công nợ');

  final String label;
  const TtPaymentMethod(this.label);
}

enum TtSaleStatus {
  COMPLETED('Đã thanh toán'),
  PARTIAL('Trả một phần'),
  DEBT('Ghi công nợ'),
  CANCELLED('Đã hủy');

  final String label;
  const TtSaleStatus(this.label);
}

/// Hóa đơn bán hàng.
@collection
class TtSalesInvoice {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String invoiceId = ''; // For sync

  String invoiceNumber = ''; // HDB001

  final customer = IsarLink<TtCustomer>();

  DateTime saleDate = DateTime.now();

  double subtotal = 0;
  double discount = 0;
  double loyaltyDiscount = 0; // Chiết khấu đổi điểm
  double totalAmount = 0;

  double costAmount = 0; // Giá vốn hàng bán (FIFO)

  double paidAmount = 0;
  double debtAmount = 0;

  @enumerated
  TtPaymentMethod paymentMethod = TtPaymentMethod.CASH;

  @enumerated
  TtSaleStatus status = TtSaleStatus.COMPLETED;

  String note = '';
  String createdBy = '';
}

@collection
class TtSalesItem {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  final invoice = IsarLink<TtSalesInvoice>();
  final product = IsarLink<TtProduct>();

  String lotId = ''; // Lô xuất (FIFO)
  double quantity = 0;
  String unit = '';
  double unitPrice = 0;
  double costPrice = 0; // Giá vốn đã ghi nhận
  double discount = 0;
  double amount = 0;
}

/// Hóa đơn nhập hàng.
@collection
class TtPurchaseInvoice {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String purchaseId = ''; // For sync

  String invoiceNumber = ''; // PNB001

  final supplier = IsarLink<TtSupplier>();

  DateTime purchaseDate = DateTime.now();

  double totalAmount = 0;
  double discount = 0;
  double paidAmount = 0;
  double debtAmount = 0;

  @enumerated
  TtPaymentMethod paymentMethod = TtPaymentMethod.CASH;

  String note = '';
  String createdBy = '';
}

@collection
class TtPurchaseItem {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  final purchaseInvoice = IsarLink<TtPurchaseInvoice>();
  final product = IsarLink<TtProduct>();
  final lot = IsarLink<TtStockLot>();

  double quantity = 0;
  String unit = '';
  double unitPrice = 0;
  double discount = 0;
  double amount = 0;
  DateTime? expiryDate; // Hạn sử dụng lô nhập
}