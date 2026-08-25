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

  // §8. Yêu cầu ứng viên.
  String requiredGender = 'any'; // any | male | female
  int ageMin = 18;
  int ageMax = 60;
  int minExperienceYears = 0;

  /// Số người đã tuyển được (so với quantity -> filled/open).
  int filledCount = 0;

  DateTime startDate = DateTime.now();
  DateTime? endDate;
  
  String status = 'open'; // open, closed, filled
  
  DateTime createdAt = DateTime.now();
}
