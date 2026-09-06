import 'package:isar/isar.dart';

part 'project.g.dart';

@collection
class CongTrinhProject {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String projectId = '';

  String projectCode = '';
  String projectName = '';
  String customerName = '';
  String customerPhone = '';
  
  String address = '';
  String province = '';
  String district = '';
  String ward = '';
  
  double constructionArea = 0; // m2
  int numberOfFloors = 1;
  
  String buildingGrade = 'GRADE_3'; // GRADE_1, GRADE_2, GRADE_3, GRADE_4
  double roofArea = 0;
  
  String foundationType = 'MONG_BANG'; // MONG_DON, MONG_BANG, MONG_COC
  String structureType = 'BTCT';
  String finishLevel = 'CO_BAN'; // THO, CO_BAN, KHA, CAO_CAP
  
  DateTime? startDate;
  DateTime? expectedEndDate;
  
  String notes = '';
}

@collection
class CongTrinhEstimate {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String estimateId = '';
  
  String projectId = ''; // denormalized scalar key tới Project (để lọc nhanh)
  
  String estimateCode = '';
  int estimateVersion = 1; // v1, v2, v3
  
  double area = 0; // Total calculated area
  
  double totalMaterial = 0;
  double totalLabor = 0;
  double totalOther = 0;
  
  double subtotal = 0;
  double vat = 0;
  double contingency = 0;
  double grandTotal = 0;
}

@collection
class CongTrinhEstimateItem {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String estimateItemId = '';
  
  String estimateId = ''; // denormalized scalar key tới Estimate
  
  String category = ''; // A. CÁT, B. ĐÁ, C. XI MĂNG...
  
  String? materialId; // Optional link to Material
  String? laborTypeId; // Optional link to LaborType
  
  String description = '';
  double quantity = 0;
  String unit = '';
  double unitPrice = 0;
  
  double wastePercent = 0; // Hao hụt
  double amount = 0; // Thành tiền
  
  String calculationMode = 'AUTO'; // AUTO, MANUAL
  
  String notes = '';
}
