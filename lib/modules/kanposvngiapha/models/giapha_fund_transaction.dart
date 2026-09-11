import 'package:isar/isar.dart';

part 'giapha_fund_transaction.g.dart';

@collection
class GiaphaFundTransaction {
  Id id = Isar.autoIncrement;

  @Index()
  String? serverId;
  
  @Index()
  String? familyId;
  
  String? fundId;
  String? type; // IN, OUT
  double? amount;
  String? description;
  DateTime? transactionDate;
  
  String? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? version;
  bool? isDeleted;
}
