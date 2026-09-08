import 'package:isar/isar.dart';

part 'nongsan_document.g.dart';

@collection
class NongSanDocument {
  Id id = Isar.autoIncrement;

  // ID ngoài (docId) của business object. Unique + replace để `put` luôn
  // ghi đè đúng document cũ.
  @Index(unique: true, replace: true)
  late String docId;

  @Index()
  late String appCode;

  @Index()
  late String collectionName;

  late String jsonData;

  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  String syncStatus = 'PENDING';

  NongSanDocument();
}