import 'package:isar/isar.dart';

part 'camera.g.dart';

@collection
class ParkingCamera {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  
  @Index(unique: true, replace: true)
  String cameraId = '';
  
  String name = ''; // Cổng vào 1, Cổng ra 1
  String ipAddress = '';
  String rtspUrl = '';
  
  String type = 'in'; // in, out, area
  
  String status = 'active'; // active, offline
}
