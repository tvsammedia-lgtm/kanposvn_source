import 'package:isar/isar.dart';

part 'broker.g.dart';

@collection
class Broker {
  Id id = Isar.autoIncrement;
  DateTime? deletedAt;
  String deviceId = "";

  @Index(unique: true, replace: true)
  String? remoteId;

  String? brokerCode;
  String? fullName;
  String? phone;
  String? email;
  String? cccd;
  String? branch;
  DateTime? joinDate;

  @Enumerated(EnumType.name)
  BrokerStatus status = BrokerStatus.active;

  // Sync details
  DateTime? updatedAt;
  int? version;
  bool isSynced = false;
}

enum BrokerStatus {
  active,
  inactive,
  suspended
}
