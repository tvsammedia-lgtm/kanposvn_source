import 'package:isar/isar.dart';

part 'material.g.dart';

@collection
class CongTrinhMaterialCategory {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String categoryId = '';
  
  String code = ''; // MATERIAL_CEMENT, MATERIAL_SAND...
  String name = '';
  String description = '';
}

@collection
class CongTrinhMaterial {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String materialId = '';
  
  String categoryId = ''; // denormalized scalar key tới Category
  
  String code = '';
  String name = '';
  String defaultUnit = ''; // kg, bao, m3...
  
  String notes = '';
}

@collection
class CongTrinhMaterialNorm {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String normId = '';
  
  String materialId = ''; // denormalized scalar key tới Material
  
  String code = '';
  String name = '';
  
  String buildingGrade = ''; // GRADE_3, GRADE_4...
  String finishLevel = ''; // CO_BAN, KHA...
  String structureType = '';
  String foundationType = '';
  
  String unit = ''; // kg/m2, m3/m2
  double quantityPerM2 = 0;
  
  double wastePercent = 0; // % hao hụt
  double coefficient = 1.0; // Hệ số
  
  DateTime? effectiveFrom;
  DateTime? effectiveTo;
  
  String notes = '';
}

@collection
class CongTrinhMaterialPrice {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String priceId = '';
  
  String materialId = ''; // denormalized scalar key tới Material
  
  String supplierId = ''; 
  String province = '';
  String district = '';
  
  String unit = '';
  double price = 0;
  
  double vatPercent = 0;
  double transportCost = 0;
  
  DateTime? effectiveDate;
  String source = 'SYSTEM'; // SYSTEM, USER, SUPPLIER
  String notes = '';
}
