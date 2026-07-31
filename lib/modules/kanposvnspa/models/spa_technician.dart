import 'package:isar/isar.dart';

part 'spa_technician.g.dart';

@collection
class SpaTechnician {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String techId = '';

  String name = '';
  String phone = '';
  String specialized = ''; // e.g., Facial, Body
}
