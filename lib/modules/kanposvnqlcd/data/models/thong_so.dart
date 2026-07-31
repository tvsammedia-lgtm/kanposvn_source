import 'package:isar/isar.dart';

part 'thong_so.g.dart';

@Collection()
class ThongSo {
  Id id = Isar.autoIncrement;

  @Index()
  late int idGen;

  late String poNo;
  late int bundleNo;   // Tổng số bó
  late int pieces;     // Tổng số mảnh
}
