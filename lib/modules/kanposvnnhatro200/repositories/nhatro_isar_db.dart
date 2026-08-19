import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/hostel.dart';
import '../models/room.dart';
import '../models/tenant.dart';
import '../models/contract.dart';
import '../models/payment.dart';
import '../models/expense.dart';
import '../models/electric_reading.dart';
import '../models/water_reading.dart';
import '../models/hostel_service.dart';
import '../models/maintenance.dart';
import '../models/asset.dart';

class NhaTroIsarDB {
  static Isar? _isar;

  static Future<Isar> getInstance() async {
    if (_isar != null && _isar!.isOpen) return _isar!;
    const name = 'kanposvnnhatro200';
    final existing = Isar.getInstance(name);
    if (existing != null && existing.isOpen) {
      _isar = existing;
      return _isar!;
    }
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [
        HostelSchema,
        RoomSchema,
        TenantSchema,
        ContractSchema,
        PaymentSchema,
        HostelExpenseSchema,
        ElectricReadingSchema,
        WaterReadingSchema,
        HostelServiceSchema,
        MaintenanceSchema,
        AssetSchema,
      ],
      directory: dir.path,
      name: name,
    );
    return _isar!;
  }
}
