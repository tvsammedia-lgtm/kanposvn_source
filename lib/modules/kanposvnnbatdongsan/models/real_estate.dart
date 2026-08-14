import 'package:isar/isar.dart';

part 'real_estate.g.dart';

@collection
class RealEstate {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;

  String? title;
  double? price;
  double? area;
  String? address;
  String? description;
  String? imageUrl;
  
  double? latitude;
  double? longitude;
  
  @enumerated
  RealEstateStatus status = RealEstateStatus.available;
  
  DateTime? createdAt;
}

enum RealEstateStatus {
  available, // Đang mở bán
  deposited, // Đã đặt cọc
  sold       // Đã bán
}
