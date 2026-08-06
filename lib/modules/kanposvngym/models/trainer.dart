import 'package:isar/isar.dart';

part 'trainer.g.dart';

@collection
class GymTrainer {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  
  @Index(unique: true, replace: true)
  String trainerId = '';
  
  String fullName = '';
  String specialty = 'personal_trainer'; // personal_trainer, yoga, boxing, dance
  String phone = '';
  
  double salary = 0;
  double commissionRate = 0; // Hoa hồng
  
  String status = 'active'; // active, inactive
}

@collection
class GymClassSchedule {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  
  @Index(unique: true, replace: true)
  String classId = '';
  
  String trainerId = '';
  
  String className = ''; // Yoga cơ bản, Zumba...
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();
  
  int maxCapacity = 20;
  int registeredCount = 0;
  
  String status = 'scheduled'; // scheduled, in_progress, completed, cancelled
}
