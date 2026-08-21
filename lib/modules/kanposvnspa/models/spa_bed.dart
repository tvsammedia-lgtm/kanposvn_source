import 'package:isar/isar.dart';

part 'spa_bed.g.dart';

enum SpaBedStatus {
  EMPTY('Trống'),
  PLAYING('Đang sử dụng'),
  CLEANING('Chờ vệ sinh'),
  MAINTENANCE('Bảo trì');

  final String label;
  const SpaBedStatus(this.label);
}

@collection
class SpaBed {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String bedId = '';

  String name = ''; // e.g., Giường 01
  String room = ''; // e.g., Phòng Facial, Phòng Body

  @enumerated
  SpaBedStatus status = SpaBedStatus.EMPTY;
}
