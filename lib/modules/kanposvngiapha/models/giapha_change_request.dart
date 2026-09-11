import 'package:isar/isar.dart';

part 'giapha_change_request.g.dart';

@collection
class GiaphaChangeRequest {
  Id id = Isar.autoIncrement;

  @Index()
  String? serverId;
  
  @Index()
  String? familyId;
  
  String? personId;
  String? requestedBy;
  
  String? fieldName;
  String? oldValue;
  String? newValue;
  String? reason;
  
  String? status; // PENDING, APPROVED, REJECTED
  String? reviewedBy;
  DateTime? reviewedAt;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? version;
  bool? isDeleted;
}
