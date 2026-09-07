import 'package:isar/isar.dart';

part 'pharmacy.g.dart';

@collection
class Drug {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? uuid;

  @Index()
  String? clinicId;

  String? name;
  String? activeIngredient;
  String? dosage;
  String? form;
  String? unit;
  String? route;
  String? manufacturer;
  String? category;
  
  String? contraindications;
  String? interactions;
  String? warnings;

  // Sync fields
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  int? version;
  String? syncStatus;
  String? deviceId;
}
