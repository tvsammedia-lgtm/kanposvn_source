import 'package:isar/isar.dart';
import 'product.dart';

part 'tank.g.dart';

@collection
class TramXangTank {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String tankId = ''; 

  String stationId = '';
  String code = '';
  String name = '';
  
  final product = IsarLink<TramXangProduct>();
  @Index()
  String productId = '';
  
  double capacityLiter = 0;
  double safeCapacityLiter = 0;
  double minLevelLiter = 0;
  double criticalLevelLiter = 0;
  
  double currentQuantity = 0;
  double openingQuantity = 0;
  
  bool active = true;
}

@collection
class TramXangTankReading {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String readingId = ''; 

  final tank = IsarLink<TramXangTank>();
  
  DateTime readingTime = DateTime.now();
  
  double quantity = 0;
  double height = 0;
  double temperature = 0;
  double waterLevel = 0;
  double density = 0;
  
  String source = 'MANUAL'; // MANUAL, SENSOR, IMPORT, PUMP_SYSTEM
  String employeeId = '';
}

@collection
class TramXangPump {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String pumpId = ''; 

  String stationId = '';
  String code = '';
  String name = '';
  String manufacturer = '';
  String model = '';
  
  String ipAddress = '';
  int port = 0;
  String protocol = '';
  
  bool active = true;
}

@collection
class TramXangPumpNozzle {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String nozzleId = ''; 

  final pump = IsarLink<TramXangPump>();
  final product = IsarLink<TramXangProduct>();
  final tank = IsarLink<TramXangTank>();
  
  @Index()
  String pumpId = '';
  @Index()
  String productId = '';
  @Index()
  String tankId = '';
  
  int nozzleNo = 1;
  
  double totalizerOpen = 0;
  double totalizerClose = 0;
  
  String meterType = '';
}
