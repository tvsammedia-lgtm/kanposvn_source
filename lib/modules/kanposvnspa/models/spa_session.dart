import 'package:isar/isar.dart';
import 'spa_bed.dart';
import 'spa_service_model.dart';
import 'spa_technician.dart';
import 'spa_customer.dart';

part 'spa_session.g.dart';

enum SpaSessionStatus {
  IN_PROGRESS('Đang làm'),
  COMPLETED('Đã xong');

  final String label;
  const SpaSessionStatus(this.label);
}

@collection
class SpaSession {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String sessionId = '';

  final bed = IsarLink<SpaBed>();
  final service = IsarLink<SpaServiceModel>();
  final technician = IsarLink<SpaTechnician>();
  final customer = IsarLink<SpaCustomer>();

  DateTime? startTime;
  DateTime? endTime;

  @enumerated
  SpaSessionStatus status = SpaSessionStatus.IN_PROGRESS;

  double totalAmount = 0.0;
}
