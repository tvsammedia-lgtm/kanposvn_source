import 'package:isar/isar.dart';

part 'bida_table.g.dart';

enum BidaTableType {
  LO('Bida Lỗ'),
  LIBRE('Bida Libre'),
  BANG_3('Bida 3 Băng');

  final String label;
  const BidaTableType(this.label);
}

enum BidaTimeBlock {
  MINUTE_1(1, 'Thực tế (Từng phút)'),
  MINUTE_15(15, 'Block 15 Phút'),
  MINUTE_30(30, 'Block 30 Phút'),
  MINUTE_60(60, 'Block 60 Phút');

  final int minutes;
  final String label;
  const BidaTimeBlock(this.minutes, this.label);
}

enum BidaTableStatus {
  EMPTY('Trống'),
  PLAYING('Đang chơi'),
  RESERVED('Đã đặt'),
  MAINTENANCE('Bảo trì');

  final String label;
  const BidaTableStatus(this.label);
}

@collection
class BidaTable {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String tableId = '';

  String name = ''; // e.g. Bàn 01
  
  @enumerated
  BidaTableType type = BidaTableType.LIBRE;
  
  @enumerated
  BidaTableStatus status = BidaTableStatus.EMPTY;
  
  @enumerated
  BidaTimeBlock timeBlock = BidaTimeBlock.MINUTE_15;

  // Hourly price based on table type/settings
  double hourlyPrice = 0.0;
}
