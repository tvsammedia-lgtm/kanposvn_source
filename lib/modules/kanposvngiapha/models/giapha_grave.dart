import 'package:isar/isar.dart';

part 'giapha_grave.g.dart';

@collection
class GiaphaGrave {
  Id id = Isar.autoIncrement;

  @Index()
  String? serverId;
  
  @Index()
  String? familyId;
  
  String? personId;
  String? name;
  String? cemeteryName;
  String? address;
  
  double? latitude;
  double? longitude;
  String? graveImageUrl;
  String? note;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? version;
  bool? isDeleted;
}
