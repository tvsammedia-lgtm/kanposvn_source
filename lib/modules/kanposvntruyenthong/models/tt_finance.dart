import 'package:isar/isar.dart';
import 'tt_partner.dart';

part 'tt_finance.g.dart';

enum TtReceiptType {
  CUSTOMER_PAYMENT('Khách trả nợ'),
  SUPPLIER_PAYMENT('Trả nhà cung cấp'),
  OTHER_INCOME('Thu khác');

  final String label;
  const TtReceiptType(this.label);
}

/// Phiếu thu.
@collection
class TtReceipt {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String receiptId = ''; // For sync

  String receiptNumber = ''; // PT001

  final customer = IsarLink<TtCustomer>();
  final supplier = IsarLink<TtSupplier>();

  @enumerated
  TtReceiptType type = TtReceiptType.OTHER_INCOME;

  double amount = 0;
  String paymentMethod = 'Tiền mặt';
  DateTime date = DateTime.now();
  String referenceInvoiceId = ''; // Hóa đơn liên quan (nếu có)
  String note = '';
  String createdBy = '';
}

@collection
class TtExpenseCategory {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String categoryId = ''; // For sync

  String name = ''; // Vận chuyển, Thuê sạp, Điện nước, Nhân công, Đá, Bao bì...
}

/// Phiếu chi.
@collection
class TtExpense {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String expenseId = ''; // For sync

  String expenseNumber = ''; // PC001

  final supplier = IsarLink<TtSupplier>();
  final category = IsarLink<TtExpenseCategory>();

  double amount = 0;
  String paymentMethod = 'Tiền mặt';
  DateTime date = DateTime.now();
  String description = '';
  String createdBy = '';
}