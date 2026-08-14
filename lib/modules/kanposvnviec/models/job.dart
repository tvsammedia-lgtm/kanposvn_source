import 'package:isar/isar.dart';

part 'job.g.dart';

@collection
class JobLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;

  String? title;
  String? company;
  String? address;
  
  double? latitude;
  double? longitude;
  
  double? salary; // Mức lương
  String? salaryType; // Theo tháng, Theo giờ...
  
  String? description;
  String? tags; // VD: "Part-time, Phục vụ"

  @enumerated
  JobStatus status = JobStatus.open;

  DateTime? createdAt;
}

enum JobStatus {
  open,
  closed
}
