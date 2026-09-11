import 'package:isar/isar.dart';

part 'giapha_document.g.dart';

@collection
class GiaphaDocument {
  Id id = Isar.autoIncrement;

  @Index()
  String? serverId;
  
  @Index()
  String? familyId;
  String? personId;
  
  String? title;
  String? documentType; // IMAGE, VIDEO, PDF
  String? fileUrl;
  String? storageKey;
  String? mimeType;
  int? fileSize;
  
  String? uploadedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? version;
  bool? isDeleted;
}
