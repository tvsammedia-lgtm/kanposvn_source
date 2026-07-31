import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../repositories/garment_repository.dart';

final syncServiceProvider = Provider<SyncService>((ref) {
  return SyncService(ref.watch(garmentRepositoryProvider));
});

class SyncService {
  final GarmentRepository repo;

  SyncService(this.repo);

  // ===== THAY ĐỔI URL NÀY SAU KHI DEPLOY VERCEL =====
  static const String _baseUrl = 'https://your-app.vercel.app/api/sync';

  Future<SyncResult> syncAll() async {
    final headers = <String, String>{'Content-Type': 'application/json'};
    int totalSynced = 0;
    final errors = <String>[];

    try {
      // 1. Lấy tất cả CutHeader
      final cutHeaders = await repo.getAllCutHeaders();
      if (cutHeaders.isNotEmpty) {
        final body = jsonEncode({
          'table': 'cut_headers',
          'records': cutHeaders.map((h) => {
            'id_gen': h.idGen,
            'cut_no': h.cutNo,
            'po_no': h.poNo,
            'start_bundle': h.startBundle,
            'from_op': h.fromOp,
            'to_op': h.toOp,
            'date_create': h.dateCreate.toIso8601String(),
            'size_labels': h.sizeLabels,
          }).toList(),
        });
        final resp = await http.post(Uri.parse(_baseUrl), headers: headers, body: body);
        if (resp.statusCode == 200) {
          totalSynced += cutHeaders.length;
        } else {
          errors.add('cut_headers: ${resp.statusCode} ${resp.body}');
        }
      }

      // 2. Lấy tất cả CutDetail
      final cutDetails = await repo.getAllCutDetails();
      if (cutDetails.isNotEmpty) {
        final body = jsonEncode({
          'table': 'cut_details',
          'records': cutDetails.map((d) => {
            'id_gen': d.idGen,
            'gen': d.gen,
            'cut_no': d.cutNo,
            'po_no': d.poNo,
            'size': d.size,
            'color': d.color,
            'start_bundle': d.startBundle,
            'op_no': d.opNo,
            'qty': d.qty,
            'cut_no1': d.cutNo1,
            'po_no1': d.poNo1,
            'size1': d.size1,
            'start_bundle1': d.startBundle1,
            'op_no1': d.opNo1,
            'qty1': d.qty1,
          }).toList(),
        });
        final resp = await http.post(Uri.parse(_baseUrl), headers: headers, body: body);
        if (resp.statusCode == 200) {
          totalSynced += cutDetails.length;
        } else {
          errors.add('cut_details: ${resp.statusCode} ${resp.body}');
        }
      }

      // 3. Lấy tất cả ThongSo
      final thongSos = await repo.getAllThongSos();
      if (thongSos.isNotEmpty) {
        final body = jsonEncode({
          'table': 'thong_sos',
          'records': thongSos.map((t) => {
            'id_gen': t.idGen,
            'po_no': t.poNo,
            'bundle_no': t.bundleNo,
            'pieces': t.pieces,
          }).toList(),
        });
        final resp = await http.post(Uri.parse(_baseUrl), headers: headers, body: body);
        if (resp.statusCode == 200) {
          totalSynced += thongSos.length;
        } else {
          errors.add('thong_sos: ${resp.statusCode} ${resp.body}');
        }
      }

      return SyncResult(
        success: errors.isEmpty,
        syncedRecords: totalSynced,
        errors: errors,
      );
    } catch (e) {
      return SyncResult(
        success: false,
        syncedRecords: totalSynced,
        errors: ['Lỗi kết nối: $e'],
      );
    }
  }
}

class SyncResult {
  final bool success;
  final int syncedRecords;
  final List<String> errors;

  SyncResult({
    required this.success,
    required this.syncedRecords,
    required this.errors,
  });
}
