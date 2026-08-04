import 'package:isar/isar.dart';

part 'vantai_route.g.dart';

@collection
class VantaiRoute {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String routeId = '';
  
  String routeName = '';
  String startPoint = '';
  String endPoint = '';
  
  double distanceKm = 0.0;
  double basePrice = 0.0; // Giá vé cơ bản
  
  String estimatedTime = ''; // VD: 8 tiếng
  String notes = '';
}
