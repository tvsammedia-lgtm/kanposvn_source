import 'package:isar/isar.dart';

part 'candidate.g.dart';

@collection
class ViecCandidate {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  
  @Index(unique: true, replace: true)
  String candidateId = '';
  
  String fullName = '';
  String phone = '';
  String cccd = '';
  String gender = 'male'; // male, female
  DateTime? dateOfBirth;
  
  String address = '';
  double? lat;
  double? lng;
  double workRadiusKm = 10; // Bán kính làm việc
  
  List<String> categoryIds = []; // Ngành nghề muốn làm
  double desiredSalary = 0; // Lương mong muốn
  
  String status = 'available'; // available, working, resting
  
  DateTime createdAt = DateTime.now();
}
