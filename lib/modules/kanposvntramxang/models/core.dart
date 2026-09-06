import 'package:isar/isar.dart';

part 'core.g.dart';

@collection
class TramXangCompany {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String companyId = ''; // For sync (UUID)

  String code = '';
  String name = '';
  String taxCode = '';
  String address = '';
  String phone = '';
  String email = '';
  String accountingMethod = ''; // FIFO, WEIGHTED_AVERAGE
  String fiscalYear = '';
  String currency = 'VND';
  bool active = true;
}

@collection
class TramXangStation {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String stationId = ''; // For sync

  final company = IsarLink<TramXangCompany>();
  
  String code = '';
  String name = '';
  String address = '';
  String timezone = 'Asia/Ho_Chi_Minh';
  bool active = true;
}

@collection
class TramXangBranch {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String branchId = '';

  final company = IsarLink<TramXangCompany>();
  final station = IsarLink<TramXangStation>();

  String code = '';
  String name = '';
}

@collection
class TramXangUser {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String userId = '';

  String username = '';
  String passwordHash = '';
  String employeeId = ''; // Reference to employee
  
  final station = IsarLink<TramXangStation>();
  
  String roleId = ''; // ROLE_OWNER, ROLE_ADMIN, ROLE_CASHIER, vv
  bool active = true;
}
