import 'package:isar/isar.dart';

part 'job_chat.g.dart';

@collection
class JobChat {
  Id id = Isar.autoIncrement;

  @Index()
  String? jobUuid; // Cuộc trò chuyện liên quan đến công việc nào

  String? sender; // 'USER' hoặc 'HR_BOT'
  String? message;
  
  DateTime? createdAt;
}
