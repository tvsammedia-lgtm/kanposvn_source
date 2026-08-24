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

  @Index(unique: false)
  String? propertyCode; // Mã BĐS (vd: BDS0001)

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
  String? propertyType; // Đất thổ cư, Đất nền, Nhà mặt phố, Chung cư 2PN...
  String? legalStatus; // Sổ đỏ, sổ hồng...

  List<String>? features; // Đã sổ đỏ, mặt tiền, ...

  /// Hướng BĐS: Đông, Tây, Nam, Bắc... (PRD mục 10/11 - tiêu chí tìm kiếm).
  String? direction;

  /// Loại mặt tiền: Mặt phố, Góc 2 mặt tiền, Đường 1 chiều,
  /// Đường 2 chiều, Hẻm xe hơi, Hẻm nhỏ...
  String? frontage;

  @Enumerated(EnumType.name)
  PropertyStatus status = PropertyStatus.available;

  // Sync details
  DateTime? updatedAt;
  int? version;
  bool isSynced = false;
}

/// Trạng thái BĐS theo báo cáo PRD mục 15: đã bán / chưa bán / đang giao dịch.
enum PropertyStatus {
  available, // Chưa bán - đang rao
  negotiating, // Đang giao dịch (đang đàm phán)
  deposited, // Đang đặt cọc
  sold, // Đã bán
}
