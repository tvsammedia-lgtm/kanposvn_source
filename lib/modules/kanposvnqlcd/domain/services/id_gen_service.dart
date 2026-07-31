import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/garment_repository.dart';

final idGenServiceProvider = Provider<IdGenService>((ref) {
  return IdGenService(ref.watch(garmentRepositoryProvider));
});

class IdGenService {
  final GarmentRepository repo;

  IdGenService(this.repo);

  Future<int> nextId() async {
    final maxId = await repo.getMaxIdGen();
    return maxId + 1;
  }
}
