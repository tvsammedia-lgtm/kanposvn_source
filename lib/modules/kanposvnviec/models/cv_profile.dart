import 'package:isar/isar.dart';

part 'cv_profile.g.dart';

@collection
class CvProfile {
  Id id = Isar.autoIncrement;

  String? fullName;
  String? email;
  String? phone;

  String? desiredPosition; // Vị trí mong muốn
  double? expectedSalary; // Lương mong muốn
  
  String? experience; // Kinh nghiệm
  String? skills; // Kỹ năng
  
  DateTime? updatedAt;
}
