import 'package:isar/isar.dart';
import '../models/giapha_family.dart';
import '../models/giapha_person.dart';

class GiaphaIsarService {
  final Isar isar;

  GiaphaIsarService(this.isar);

  Future<List<GiaphaFamily>> getFamiliesForUser(String userId) async {
    // In real app, query GiaphaMembership to get family IDs, then query GiaphaFamily
    return await isar.giaphaFamilys.where().findAll();
  }

  Future<List<GiaphaPerson>> getPersonsByFamily(String familyId) async {
    return await isar.giaphaPersons
        .filter()
        .familyIdEqualTo(familyId)
        .findAll();
  }
  
  Future<void> savePerson(GiaphaPerson person) async {
    await isar.writeTxn(() async {
      await isar.giaphaPersons.put(person);
    });
  }
}
