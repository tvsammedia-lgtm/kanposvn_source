import 'package:isar/isar.dart';

part 'sync_cursor.g.dart';

@collection
class SyncCursor {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String deviceId = '';

  String? lastCursor;
  DateTime? updatedAt;
}