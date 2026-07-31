import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../isar_service.dart';
import '../models/cut_header.dart';
import '../models/cut_detail.dart';
import '../models/thong_so.dart';

final garmentRepositoryProvider = Provider<GarmentRepository>((ref) {
  return GarmentRepository(ref.watch(isarProvider));
});

class GarmentRepository {
  final Isar isar;

  GarmentRepository(this.isar);

  Future<int> getMaxIdGen() async {
    final maxHeader = await isar.cutHeaders.where().sortByIdGenDesc().findFirst();
    return (maxHeader?.idGen ?? 0);
  }

  Future<void> saveTicketData(
    CutHeader header,
    List<CutDetail> details,
    ThongSo thongSo,
  ) async {
    await isar.writeTxn(() async {
      await isar.cutHeaders.put(header);
      await isar.cutDetails.putAll(details);
      await isar.thongSos.put(thongSo);
    });
  }

  Future<List<CutDetail>> getCutDetailsByIdGen(int idGen) async {
    return await isar.cutDetails.where().idGenEqualTo(idGen).sortByGen().findAll();
  }

  Future<CutHeader?> getCutHeaderByIdGen(int idGen) async {
    return await isar.cutHeaders.where().idGenEqualTo(idGen).findFirst();
  }

  Future<ThongSo?> getThongSoByIdGen(int idGen) async {
    return await isar.thongSos.where().idGenEqualTo(idGen).findFirst();
  }

  Future<List<CutHeader>> getAllCutHeaders() async {
    return await isar.cutHeaders.where().findAll();
  }

  Future<List<CutDetail>> getAllCutDetails() async {
    return await isar.cutDetails.where().findAll();
  }

  Future<List<ThongSo>> getAllThongSos() async {
    return await isar.thongSos.where().findAll();
  }
}
