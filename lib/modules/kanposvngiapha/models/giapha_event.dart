import 'package:isar/isar.dart';

part 'giapha_event.g.dart';

@collection
class GiaphaEvent {
  Id id = Isar.autoIncrement;

  @Index()
  String? serverId;
  
  @Index()
  String? familyId;
  
  String? title;
  String? eventType; // ANNIVERSARY, MEETING, TET...
  DateTime? eventDate;
  String? location;
  String? description;
  
  String? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? version;
  bool? isDeleted;
}
