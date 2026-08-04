import 'package:isar/isar.dart';

part 'spa_service_model.g.dart';

@collection
class SpaServiceModel {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String serviceId = '';

  String name = ''; // e.g., Gội đầu dưỡng sinh
  
  int durationMinutes = 60;
  double price = 0.0;
}
