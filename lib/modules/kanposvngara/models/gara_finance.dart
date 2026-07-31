import 'package:isar/isar.dart';
import 'gara_customer.dart';
import 'gara_supplier.dart';

part 'gara_finance.g.dart';

enum GaraFinanceTransactionType {
  RECEIPT('Phiếu Thu'),
  PAYMENT('Phiếu Chi');

  final String label;
  const GaraFinanceTransactionType(this.label);
}

@collection
class GaraFinanceTransaction {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String transactionId = '';

  String documentCode = '';

  @enumerated
  GaraFinanceTransactionType type = GaraFinanceTransactionType.RECEIPT;

  double amount = 0.0;
  String description = '';
  DateTime? transactionDate;

  final customer = IsarLink<GaraCustomer>();
  final supplier = IsarLink<GaraSupplier>();
}
