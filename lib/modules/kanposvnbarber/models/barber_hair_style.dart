import 'package:isar/isar.dart';

part 'barber_hair_style.g.dart';

@collection
class BarberHairStyle {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String styleId = '';

  String name = '';
  String? description;
  String? imageUrl;
  
  // Các đặc tính nhận diện
  List<String> faceShapes = []; // Mặt tròn, Mặt vuông, v.v.
  List<String> hairTypes = []; // Tóc mỏng, Tóc dày, v.v.
  
  bool isActive = true;

  @Index()
  DateTime createdAt = DateTime.now();
}
