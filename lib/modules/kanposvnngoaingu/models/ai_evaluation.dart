import 'package:isar/isar.dart';

part 'ai_evaluation.g.dart';

@collection
class NgoaiNguAIAssessment {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;
  
  String? studentUuid;
  String? lessonUuid;
  
  @enumerated
  AIEvaluationType type = AIEvaluationType.speaking;
  
  String? originalText; // Text hoặc URL file ghi âm gốc
  String? aiCorrectedText; // Kết quả AI sửa lỗi
  
  // Điểm đánh giá (0 - 100)
  double? pronunciationScore;
  double? grammarScore;
  double? vocabularyScore;
  double? fluencyScore;
  double? overallScore;
  
  String? feedback; // Nhận xét chung của AI
  String? weaknesses; // Điểm yếu cần cải thiện (JSON string)
  
  DateTime? assessedAt;
  bool isDeleted = false;
  int syncVersion = 1;
}

enum AIEvaluationType {
  speaking,
  writing,
  grammar,
  vocabulary,
  placementTest
}
