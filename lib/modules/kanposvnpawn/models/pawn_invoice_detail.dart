import 'package:isar/isar.dart';
import 'invoice.dart';
import 'product.dart';

part 'pawn_invoice_detail.g.dart';

@collection
class PawnInvoiceDetail {
  Id id = Isar.autoIncrement;

  final invoice = IsarLink<Invoice>();
  final product = IsarLink<Product>();

  String? productName;
  String? imei;
  int? quantity;
  double? unitPrice;
  double? total;

  DateTime? createdAt;
}
