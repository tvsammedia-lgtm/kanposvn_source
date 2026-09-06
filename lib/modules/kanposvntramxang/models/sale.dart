import 'package:isar/isar.dart';
import 'product.dart';
import 'tank.dart';

part 'sale.g.dart';

@collection
class TramXangShift {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String shiftId = ''; 

  String stationId = '';
  String employeeId = '';
  
  DateTime openedAt = DateTime.now();
  DateTime? closedAt;
  
  double openingCash = 0;
  double closingCash = 0;
  double expectedCash = 0;
  double actualCash = 0;
  double difference = 0;
  
  String status = 'OPEN'; // OPEN, CLOSED, BALANCED, SHORT, OVER
}

@collection
class TramXangCustomer {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String customerId = ''; 

  String code = '';
  String name = '';
  String phone = '';
  String taxCode = '';
  String address = '';
  
  double creditLimit = 0;
  int paymentTerm = 0;
  double openingBalance = 0;
  
  bool active = true;
}

@collection
class TramXangSale {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String saleId = ''; 

  String saleNo = '';
  String stationId = '';
  
  final shift = IsarLink<TramXangShift>();
  final customer = IsarLink<TramXangCustomer>();
  
  String saleType = 'FUEL'; // FUEL, GROCERY
  String paymentMethod = 'CASH'; // CASH, TRANSFER, QR
  
  double subtotal = 0;
  double discount = 0;
  double tax = 0;
  double total = 0;
  double paid = 0;
  double debt = 0;
  
  String status = 'COMPLETED'; // DRAFT, COMPLETED, CANCELLED
  String createdBy = '';
}

@collection
class TramXangSaleLine {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String saleLineId = ''; 

  final sale = IsarLink<TramXangSale>();
  final product = IsarLink<TramXangProduct>();
  final tank = IsarLink<TramXangTank>();
  final pumpNozzle = IsarLink<TramXangPumpNozzle>();
  
  double quantity = 0;
  String unit = '';
  double unitPrice = 0;
  double discount = 0;
  
  double taxRate = 0;
  double taxAmount = 0;
  
  double costPrice = 0;
  double costAmount = 0;
  
  double amount = 0;
}

@collection
class TramXangPumpTransaction {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String transactionId = ''; 

  String stationId = '';
  
  final pump = IsarLink<TramXangPump>();
  final nozzle = IsarLink<TramXangPumpNozzle>();
  final sale = IsarLink<TramXangSale>();
  
  DateTime transactionTime = DateTime.now();
  
  double totalizerBefore = 0;
  double totalizerAfter = 0;
  double quantity = 0;
  double unitPrice = 0;
  double amount = 0;
  
  String employeeId = '';
}
