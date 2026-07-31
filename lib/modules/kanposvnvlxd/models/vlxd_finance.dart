import 'package:isar/isar.dart';
import 'vlxd_partner.dart';
import 'vlxd_order.dart';

part 'vlxd_finance.g.dart';

enum FinanceTransactionType {
  RECEIPT('Phiếu thu'),
  PAYMENT('Phiếu chi');

  final String label;
  const FinanceTransactionType(this.label);
}

@collection
class VlxdFinanceTransaction {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String transactionId = '';

  String documentCode = ''; // PT001, PC001

  @enumerated
  FinanceTransactionType type = FinanceTransactionType.RECEIPT;

  double amount = 0;
  
  String category = ''; // Thu tiền hàng, Thanh toán NCC, Lương, Xăng xe...
  
  final customer = IsarLink<VlxdCustomer>();
  final supplier = IsarLink<VlxdSupplier>();
  final order = IsarLink<VlxdOrder>();

  String paymentMethod = 'Tiền mặt';
  String description = '';
  
  DateTime transactionDate = DateTime.now();
  String createdBy = '';
}
