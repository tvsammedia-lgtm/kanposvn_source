import 'package:isar/isar.dart';

part 'property.g.dart';

@Name('Property')
@Collection(accessor: 'propertys')
class BdsProperty {
  Id id = Isar.autoIncrement; // Local ID
  DateTime? deletedAt;
  String deviceId = "";
  
  @Index(unique: true, replace: true)
  String? remoteId; // Neon DB ID

  String? title;
  String? description;
  String? ownerId; // Owner ID
  String? brokerId; // Assigned broker ID

  // Address
  String? province;
  String? district;
  String? ward;
  String? area;

  // Details
  double? price;
  double? areaSize;
  double? width;
  double? length;
  int? floors;
  int? bedrooms;
  int? bathrooms;

  // Classifications
  String? propertyType; // Đất, Nhà, Chung cư, Mặt bằng
  String? legalStatus; // Sổ đỏ, sổ hồng...
  
  List<String>? features; // Đã sổ đỏ, mặt tiền, ...

  // Sync details
  DateTime? updatedAt;
  int? version;
  bool isSynced = false;
}
