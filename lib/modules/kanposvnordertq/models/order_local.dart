import 'package:isar/isar.dart';

part 'order_local.g.dart';

@collection
class OrderLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String orderId = ''; // UUID for sync

  String? orderCode;
  
  @Index()
  String? customerId;
  
  @Index()
  String? status; // DRAFT, PENDING_CONFIRM, etc.

  String? sourceCountry;
  String? destinationCountry;
  String? currency;
  double? exchangeRate;
  
  double? subtotal;
  double? shippingFee;
  double? serviceFee;
  double? totalAmount;
  double? paidAmount;
  double? debtAmount;
  
  double? weight;
  double? volume;
  String? note;
  String? createdBy;

  DateTime? createdAt;
  DateTime? updatedAt;

  @Index()
  DateTime? syncedAt;
  bool isDeleted = false;
}
