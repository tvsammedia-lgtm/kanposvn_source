import 'package:isar/isar.dart';

part 'cut_header.g.dart';

@Collection()
class CutHeader {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late int idGen;          // tương ứng ID_GEN, tự sinh tăng dần

  late String cutNo;        // Bàn cắt
  late String poNo;         // Số đơn hàng
  late int startBundle;     // Số bó bắt đầu
  late int fromOp;          // Công đoạn từ
  late int toOp;            // Công đoạn đến
  late DateTime dateCreate;

  // Danh sách size khai báo cho phiếu này
  List<String> sizeLabels = [];
}
