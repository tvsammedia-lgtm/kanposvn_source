import 'package:isar/isar.dart';

part 'data_entity.g.dart';

@collection
class DataEntity {
  Id id = Isar.autoIncrement;

  @Index(composite: [CompositeIndex('appCode')])
  late String collection;

  @Index()
  late String appCode;

  late String itemId;

  late String jsonData;

  DataEntity();
}
