import 'package:isar/isar.dart';

part 'tax_expense_entry.g.dart';

@collection
class TaxExpenseEntry {
  Id id = Isar.autoIncrement;

  @Index()
  String? tenantId;
  
  String? businessId;
  String? branchId;
  DateTime? expenseDate;
  String? expenseCategoryId;
  String? supplierId;
  String? description;
  
  double? amountBeforeTax;
  double? vatAmount;
  double? totalAmount;
  
  String? invoiceNumber;
  DateTime? invoiceDate;
  String? paymentMethod;
  List<String>? attachmentIds;
  
  String? deductibleStatus; // Deductible, NonDeductible, Pending
  String? rejectionReason;
  String? accountingAccount;
  String? taxPeriod;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? serverVersion;
  DateTime? deletedAt;
}
