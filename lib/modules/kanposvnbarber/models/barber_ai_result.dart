import 'package:isar/isar.dart';

part 'barber_ai_result.g.dart';

@collection
class BarberAiResult {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String resultId = '';

  String styleName = '';
  String? note;
  List<byte> imageBytes = <byte>[];
  bool isFavorite = false;
  bool isActive = true;

  @Index()
  DateTime createdAt = DateTime.now();
}