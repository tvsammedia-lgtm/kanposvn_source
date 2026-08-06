import 'package:isar/isar.dart';

part 'invoice.g.dart';

@collection
class TapHoaInvoice {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String invoiceId = ''; // For sync

  String invoiceNumber = ''; // Mã hóa đơn (VD: HD20231015001)
  DateTime createdAt = DateTime.now();
  
  String customerId = '';
  String customerName = '';
  
  double totalAmount = 0; // Tổng tiền trước giảm
  double discountAmount = 0; // Tiền giảm giá
  double finalAmount = 0; // Tổng thanh toán
  double amountPaid = 0; // Khách đưa
  double changeAmount = 0; // Tiền thừa
  
  String paymentMethod = 'cash'; // cash, qr, transfer, debt
  String status = 'completed'; // completed, cancelled, pending

  String note = ''; // Ghi chú
  String cashierName = ''; // Tên thu ngân

  final items = IsarLinks<TapHoaInvoiceItem>();
}

@collection
class TapHoaInvoiceItem {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String invoiceItemId = ''; // For sync
  
  String invoiceId = ''; // Foreign key
  String productId = ''; // Product reference ID
  
  String productName = '';
  String productCode = '';
  
  double quantity = 1;
  double price = 0; // Giá bán lúc đó
  double discount = 0; // Giảm giá trên từng món
  double total = 0; // Thành tiền = (price - discount) * quantity
}
