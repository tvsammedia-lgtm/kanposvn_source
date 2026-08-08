import 'package:isar/isar.dart';

part 'barber_invoice_detail.g.dart';

@collection
class BarberInvoiceDetail {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index()
  String invoiceId = '';

  String itemId = ''; // serviceId hoặc productId
  String itemName = '';
  String itemType = 'Service'; // Service, Product
  
  String? employeeId; // Thợ thực hiện (để tính hoa hồng)
  
  double quantity = 1;
  double unitPrice = 0.0;
  double total = 0.0;

  @Index()
  DateTime createdAt = DateTime.now();
}
