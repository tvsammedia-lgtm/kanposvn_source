import 'package:isar/isar.dart';

part 'labor.g.dart';

@collection
class CongTrinhLaborType {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String laborTypeId = '';
  
  String code = ''; // THO_XAY, THO_DIEN, THO_NUOC...
  String name = '';
  String description = '';
  bool active = true;
}

@collection
class CongTrinhLaborNorm {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String laborNormId = '';

  String laborTypeId = ''; // denormalized scalar key tới LaborType
  
  String unit = 'cong/m2'; // Công/m2
  double quantityPerM2 = 0;
  double unitPrice = 0; // Đơn giá / công
  
  String buildingGrade = '';
  String finishLevel = '';
  
  DateTime? effectiveFrom;
  DateTime? effectiveTo;
}
