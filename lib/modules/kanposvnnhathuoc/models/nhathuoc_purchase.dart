import 'package:isar/isar.dart';
import 'nhathuoc_medicine.dart';
import 'nhathuoc_supplier.dart';

part 'nhathuoc_purchase.g.dart';

@collection
class NhathuocPurchase {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String purchaseId = '';
  
  String documentCode = '';
  DateTime? purchaseDate;
  
  double totalAmount = 0.0;
  
  final supplier = IsarLink<NhathuocSupplier>();
  
  @Backlink(to: 'purchase')
  final details = IsarLinks<NhathuocPurchaseDetail>();
}

@collection
class NhathuocPurchaseDetail {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  
  String batchNumber = ''; // Số lô
  DateTime? expiryDate; // Hạn sử dụng của lô nhập
  
  double quantity = 0.0;
  double purchasePrice = 0.0;
  double totalAmount = 0.0;

  final purchase = IsarLink<NhathuocPurchase>();
  final medicine = IsarLink<NhathuocMedicine>();
}
