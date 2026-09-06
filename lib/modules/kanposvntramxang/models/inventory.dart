import 'package:isar/isar.dart';
import 'product.dart';
import 'tank.dart';

part 'inventory.g.dart';

@collection
class TramXangSupplier {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String supplierId = ''; 

  String code = '';
  String name = '';
  String taxCode = '';
  String phone = '';
  String address = '';
  int paymentTerm = 0;
  double openingBalance = 0;
}

@collection
class TramXangPurchase {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String purchaseId = ''; 

  final supplier = IsarLink<TramXangSupplier>();
  final product = IsarLink<TramXangProduct>();
  final tank = IsarLink<TramXangTank>();

  @Index()
  String supplierId = '';
  @Index()
  String productId = '';
  @Index()
  String tankId = '';

  String invoiceNo = '';
  DateTime invoiceDate = DateTime.now();
  String warehouseId = ''; // TANK-* hoặc SHOP/WAREHOUSE

  double quantity = 0;
  double unitCost = 0;
  double taxRate = 0;
  double taxAmount = 0;
  double total = 0;

  String status = 'COMPLETED'; // DRAFT, COMPLETED, CANCELLED
  String createdBy = '';
}

@collection
class TramXangInventoryTransaction {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String transactionId = ''; 

  String warehouseId = ''; // Location (TANK-RON95, SHOP, WAREHOUSE)
  
  final product = IsarLink<TramXangProduct>();
  
  @Index()
  String productId = '';
  
  String documentType = ''; // IMPORT, EXPORT, SALE, ADJUSTMENT
  String documentId = ''; // Reference ID
  
  double inQty = 0;
  double outQty = 0;
  double unitCost = 0;
  
  double balanceQty = 0;
  double balanceValue = 0;
}
