import 'package:isar/isar.dart';

part 'spa_service_model.g.dart';

@collection
class SpaServiceModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String serviceId = '';

  String name = ''; // e.g., Gội đầu dưỡng sinh
  
  int durationMinutes = 60;
  double price = 0.0;
}
