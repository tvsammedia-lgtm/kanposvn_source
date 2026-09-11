import 'package:isar/isar.dart';

part 'giapha_fund.g.dart';

@collection
class GiaphaFund {
  Id id = Isar.autoIncrement;

  @Index()
  String? serverId;
  
  @Index()
  String? familyId;
  
  String? name;
  double? balance;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? version;
  bool? isDeleted;
}
