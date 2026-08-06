import 'package:isar/isar.dart';

part 'job_match.g.dart';

@collection
class ViecJobMatch {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  
  @Index(unique: true, replace: true)
  String matchId = '';
  
  String jobId = ''; // Tin tuyển dụng
  String candidateId = ''; // Ứng viên
  
  double matchScore = 0; // Tỷ lệ phù hợp (%)
  double distanceKm = 0; // Khoảng cách
  
  String status = 'suggested'; // suggested, interviewed, accepted, rejected
  
  DateTime createdAt = DateTime.now();
}
