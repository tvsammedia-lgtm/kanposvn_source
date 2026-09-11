import 'package:isar/isar.dart';

part 'tax_payment.g.dart';

@collection
class TaxPayment {
  Id id = Isar.autoIncrement;

  @Index()
  String? tenantId;
  
  String? declarationId;
  String? taxPeriod;
  
  DateTime? paymentDate;
  double? amount;
  String? paymentMethod;
  String? receiptNumber;
  String? taxAuthorityAccount;
  
  String? status; // Pending, Completed, Failed
  List<String>? attachmentIds;
  
  DateTime? createdAt;
}
