import 'package:isar/isar.dart';

part 'job_posting.g.dart';

@collection
class ViecJobPosting {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  
  @Index(unique: true, replace: true)
  String jobId = '';
  
  String employerId = ''; // Liên kết nhà tuyển dụng
  
  String title = '';
  String description = '';
  
  String categoryId = ''; // Liên kết ngành nghề
  
  int quantity = 1; // Số lượng cần tuyển
  
  String address = '';
  double? lat;
  double? lng;
  
  double salary = 0;
  String salaryType = 'month'; // hour, day, month
  
  DateTime startDate = DateTime.now();
  DateTime? endDate;
  
  String status = 'open'; // open, closed, filled
  
  DateTime createdAt = DateTime.now();
}
