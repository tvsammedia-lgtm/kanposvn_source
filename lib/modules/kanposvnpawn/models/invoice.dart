import 'package:isar/isar.dart';
import 'customer.dart';
import 'user.dart';

part 'invoice.g.dart';

@collection
class Invoice {
  Id id = Isar.autoIncrement;

  String? invoiceNumber;
  
  final customer = IsarLink<Customer>();
  final user = IsarLink<User>(); // Nhân viên bán hàng
  
  @enumerated
  InvoiceType type = InvoiceType.sale;
  
  double? subTotal;
  double? discount;
  double? tax;
  double? totalAmount;
  double? amountPaid;
  double? change;
  
  @enumerated
  PaymentMethod paymentMethod = PaymentMethod.cash;
  
  String? note;
  String? invoiceTypeLabel;
  
  DateTime? createdAt;
  DateTime? updatedAt;
}

enum InvoiceType {
  purchase,
  sale,
  repair,
  consignment
}

enum PaymentMethod {
  cash,
  bankTransfer,
  qrCode,
  eWallet
}
