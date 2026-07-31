import 'package:isar/isar.dart';

part 'spa_bed.g.dart';

enum SpaBedStatus {
  EMPTY('Trống'),
  PLAYING('Đang phục vụ'),
  CLEANING('Chờ vệ sinh');

  final String label;
  const SpaBedStatus(this.label);
}

@collection
class SpaBed {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String bedId = '';

  String name = ''; // e.g., Giường 01
  String room = ''; // e.g., Phòng Facial, Phòng Body

  @enumerated
  SpaBedStatus status = SpaBedStatus.EMPTY;
}
