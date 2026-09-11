import 'package:isar/isar.dart';

part 'electronic_invoice.g.dart';

@collection
class ElectronicInvoice {
  Id id = Isar.autoIncrement;

  @Index()
  String? tenantId;
  
  String? businessId;
  String? branchId;
  
  String? providerCode;
  String? invoiceType;
  String? invoiceSeries;
  String? invoiceNumber;
  DateTime? invoiceDate;
  
  String? customerName;
  String? customerTaxCode;
  
  double? subtotal;
  double? vatAmount;
  double? totalAmount;
  
  String? status; // Draft, Issued, Cancelled, Adjusted, Replaced
  String? taxAuthorityCode;
  String? lookupCode;
  
  String? xmlFileId;
  String? pdfFileId;
  String? sourceDocumentId;
  
  DateTime? issuedAt;
  DateTime? cancelledAt;
  String? adjustedFromId;
  
  DateTime? updatedAt;
}
