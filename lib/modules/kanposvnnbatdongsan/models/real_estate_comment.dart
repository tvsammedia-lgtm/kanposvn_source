import 'package:isar/isar.dart';

part 'real_estate_comment.g.dart';

@collection
class RealEstateComment {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;

  @Index()
  String? realEstateUuid; // Khóa ngoại liên kết với bài BĐS

  String? userName;
  String? content;
  
  DateTime? createdAt;
}
