import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/hostel.dart';
import '../models/room.dart';
import '../models/tenant.dart';
import '../models/contract.dart';

class NhaTroIsarDB {
  static Isar? _isar;

  static Future<Isar> getInstance() async {
    if (_isar != null) return _isar!;

    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [
        HostelSchema,
        RoomSchema,
        TenantSchema,
        ContractSchema
      ],
      directory: dir.path,
      name: 'kanposvnnhatro200',
    );
    return _isar!;
  }
}
