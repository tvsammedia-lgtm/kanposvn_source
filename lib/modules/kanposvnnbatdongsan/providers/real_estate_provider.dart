import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../models/real_estate.dart';
import 'bds_isar_provider.dart';

final realEstateProvider = StateNotifierProvider<RealEstateNotifier, AsyncValue<List<RealEstate>>>((ref) {
  final isar = ref.watch(bdsIsarProvider);
  return RealEstateNotifier(isar);
});

class RealEstateNotifier extends StateNotifier<AsyncValue<List<RealEstate>>> {
  final Isar isar;

  RealEstateNotifier(this.isar) : super(const AsyncValue.loading()) {
    _initMockData();
  }

  Future<void> _initMockData() async {
    try {
      final count = await isar.realEstates.count();
      if (count == 0) {
        final uuid = const Uuid();
        await isar.writeTxn(() async {
          await isar.realEstates.putAll([
            RealEstate()
              ..uuid = uuid.v4()
              ..title = 'Nhà Phố Mặt Tiền Q.10, Sổ Hồng Chính Chủ'
              ..price = 12500000000
              ..area = 65
              ..address = 'Sư Vạn Hạnh, Quận 10'
              ..description = 'Nhà 1 trệt 2 lầu, đang cho thuê kinh doanh sầm uất.'
              ..imageUrl = 'https://dummyimage.com/600x400/000/fff&text=Nha+Pho+Q10'
              ..createdAt = DateTime.now(),
            RealEstate()
              ..uuid = uuid.v4()
              ..title = 'Căn hộ Landmark 81 View Sông'
              ..price = 8500000000
              ..area = 80
              ..address = 'Vinhomes Central Park, Bình Thạnh'
              ..description = 'Căn 2PN view trực diện sông Sài Gòn, nội thất cao cấp.'
              ..imageUrl = 'https://dummyimage.com/600x400/000/fff&text=Landmark+81'
              ..createdAt = DateTime.now().subtract(const Duration(hours: 2)),
          ]);
        });
      }
      loadListings();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> loadListings({double? minPrice, double? maxPrice}) async {
    try {
      var query = isar.realEstates.where();
      var data = await query.sortByCreatedAtDesc().findAll();
      
      if (minPrice != null) {
        data = data.where((bds) => (bds.price ?? 0) >= minPrice).toList();
      }
      if (maxPrice != null) {
        data = data.where((bds) => (bds.price ?? 0) <= maxPrice).toList();
      }
      
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addRealEstate(RealEstate newBds) async {
    try {
      await isar.writeTxn(() async {
        await isar.realEstates.put(newBds);
      });
      await loadListings();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
