import 'package:isar/isar.dart';

part 'employer.g.dart';

@collection
class ViecEmployer {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  
  @Index(unique: true, replace: true)
  String employerId = '';
  
  String companyName = '';
  String contactName = '';
  String phone = '';
  String email = '';
  
  String address = '';
  double? lat;
  double? lng;
  
  double rating = 5.0; // Đánh giá độ uy tín
  
  DateTime createdAt = DateTime.now();
}
