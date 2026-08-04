import 'package:isar/isar.dart';

part 'cut_detail.g.dart';

@Collection()
class CutDetail {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index()
  late int idGen;

  late int gen;             // STT dòng in (thứ tự hiển thị/in)

  // --- Tem thứ nhất ---
  late String cutNo;
  late String poNo;
  late String size;         // Type
  late String color;
  late int startBundle;
  late int opNo;
  late int qty;

  // --- Tem thứ hai (ghép cặp để in 2 tem/dòng, có thể null nếu lẻ) ---
  String? cutNo1;
  String? poNo1;
  String? size1;
  int? startBundle1;
  int? opNo1;
  int? qty1;
}
