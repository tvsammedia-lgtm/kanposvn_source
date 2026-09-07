import 'package:isar/isar.dart';

part 'app_setting.g.dart';

@collection
class AppSetting {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String key = '';

  String? value;
  String? description;

  @Index()
  DateTime? updatedAt;
}