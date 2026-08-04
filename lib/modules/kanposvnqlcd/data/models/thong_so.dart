import 'package:isar/isar.dart';

part 'thong_so.g.dart';

@Collection()
class ThongSo {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index()
  late int idGen;

  late String poNo;
  late int bundleNo;   // Tổng số bó
  late int pieces;     // Tổng số mảnh
}
