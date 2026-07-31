import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/cut_header.dart';
import '../../data/models/cut_detail.dart';
import '../../data/models/thong_so.dart';
import '../../data/repositories/garment_repository.dart';
import '../models/cut_header_input.dart';
import 'id_gen_service.dart';

final ticketGeneratorServiceProvider = Provider<TicketGeneratorService>((ref) {
  return TicketGeneratorService(
    ref.watch(garmentRepositoryProvider),
    ref.watch(idGenServiceProvider),
  );
});

class TicketGeneratorService {
  final GarmentRepository repo;
  final IdGenService idGenService;

  TicketGeneratorService(this.repo, this.idGenService);

  Future<int> saveAndGenerate({
    required CutHeaderInput headerInput,
    required List<List<int?>> qtyGrid,
    required List<String> colors,
    required List<String> sizes,
  }) async {
    final idGen = await idGenService.nextId();
    int bundleNo = headerInput.startBundle;
    int gen = 0;
    int bundleCount = 0;
    int totalPieces = 0;
    final details = <CutDetail>[];

    for (var r = 0; r < colors.length; r++) {
      for (var c = 0; c < sizes.length; c++) {
        final qty = qtyGrid[r][c];
        if (qty != null && qty > 0 && colors[r].isNotEmpty && sizes[c].isNotEmpty) {
          bundleCount++;
          totalPieces += qty;

          CutDetail? pending;
          for (var op = headerInput.fromOp; op <= headerInput.toOp; op++) {
            if (pending == null) {
              pending = CutDetail()
                ..idGen = idGen
                ..gen = ++gen
                ..cutNo = headerInput.cutNo
                ..poNo = headerInput.poNo
                ..size = sizes[c]
                ..color = colors[r]
                ..startBundle = bundleNo
                ..opNo = op
                ..qty = qty;
            } else {
              pending
                ..cutNo1 = headerInput.cutNo
                ..poNo1 = headerInput.poNo
                ..size1 = sizes[c]
                ..startBundle1 = bundleNo
                ..opNo1 = op
                ..qty1 = qty;
              details.add(pending);
              pending = null;
            }
          }
          if (pending != null) details.add(pending); 
          bundleNo++;
        }
      }
    }

    final header = CutHeader()
      ..idGen = idGen
      ..cutNo = headerInput.cutNo
      ..poNo = headerInput.poNo
      ..startBundle = headerInput.startBundle
      ..fromOp = headerInput.fromOp
      ..toOp = headerInput.toOp
      ..dateCreate = DateTime.now()
      ..sizeLabels = sizes.where((s) => s.isNotEmpty).toList();

    final thongSo = ThongSo()
      ..idGen = idGen
      ..poNo = headerInput.poNo
      ..bundleNo = bundleCount
      ..pieces = totalPieces;

    await repo.saveTicketData(header, details, thongSo);
    return idGen;
  }
}
