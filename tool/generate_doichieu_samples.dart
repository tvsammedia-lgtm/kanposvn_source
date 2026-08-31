// Sinh dữ liệu mẫu (3 file .xlsx) cho module Đối Chiếu Kế Toán.
// Chạy: dart run tool/generate_doichieu_samples.dart [thư mục đích]
//   - Nếu không truyền thư mục: assets/kanposvndoichieuketoan/samples
//   - Ví dụ: dart run tool/generate_doichieu_samples.dart markdown_dacta
//
// Dữ liệu theo spec §4 để nghiệm thu các trường hợp đối chiếu:
//   File A (chuẩn, sổ cái) | File B (so sánh, sổ chi tiết) | File C (đối soát ngân hàng)
//   - HD001  trùng khớp
//   - HD002  khác số        (2,000,000 vs 2,000,500)
//   - HD003  trùng khớp
//   - HD004  khác ký tự     (Nguyễn Văn An vs Nguyễn Văn Ánh — bỏ dấu -> trùng nếu chế độ Normalized)
//   - HD005  khác ngày      (28/08 vs 29/08)
//   - HD006  trùng khớp
//   - HD007  chỉ có File A  -> DƯ
//   - HD008  trùng khớp
//   - HD009  trùng khớp (có ở cả 3 file)
//   - HD010  rỗng vs số     -> KHÁC DỮ LIỆU RỖNG
//   - HD011  chỉ có File B  -> DƯ

import 'dart:io';

import 'package:excel/excel.dart';

const header = ['Số CT', 'Ngày', 'Khách hàng', 'Tên', 'Số tiền'];

const rowsA = [
  ['HD001', '30/08/2026', 'KH01', 'Nguyễn Văn An', '1,250,000'],
  ['HD002', '30/08/2026', 'KH02', 'Trần Thị Bình', '2,000,000'],
  ['HD003', '29/08/2026', 'KH03', 'Lê Văn Cường', '850,000'],
  ['HD004', '28/08/2026', 'KH01', 'Nguyễn Văn An', '3,500,000'],
  ['HD005', '28/08/2026', 'KH04', 'Phạm Thị Dung', '1,100,000'],
  ['HD006', '27/08/2026', 'KH02', 'Trần Thị Bình', '750,000'],
  ['HD007', '27/08/2026', 'KH05', 'Hoàng Văn Em', '2,250,000'],
  ['HD008', '26/08/2026', 'KH03', 'Lê Văn Cường', '6,000,000'],
  ['HD009', '26/08/2026', 'KH01', 'Nguyễn Văn An', '480,000'],
  ['HD010', '25/08/2026', 'KH04', 'Phạm Thị Dung', '1,900,000'],
];

const rowsB = [
  ['HD001', '30/08/2026', 'KH01', 'Nguyễn Văn An', '1,250,000'],
  ['HD002', '30/08/2026', 'KH02', 'Trần Thị Bình', '2,000,500'],
  ['HD003', '29/08/2026', 'KH03', 'Lê Văn Cường', '850,000'],
  ['HD004', '28/08/2026', 'KH01', 'Nguyễn Văn Ánh', '3,500,000'],
  ['HD005', '29/08/2026', 'KH04', 'Phạm Thị Dung', '1,100,000'],
  ['HD006', '27/08/2026', 'KH02', 'Trần Thị Bình', '750,000'],
  ['HD008', '26/08/2026', 'KH03', 'Lê Văn Cường', '6,000,000'],
  ['HD009', '26/08/2026', 'KH01', 'Nguyễn Văn An', '480,000'],
  ['HD010', '25/08/2026', 'KH04', 'Phạm Thị Dung', ''],
  ['HD011', '25/08/2026', 'KH05', 'Hoàng Văn Em', '1,500,000'],
];

const rowsC = [
  ['HD001', '30/08/2026', 'KH01', 'Nguyễn Văn An', '1,250,000'],
  ['HD006', '27/08/2026', 'KH02', 'Trần Thị Bình', '750,000'],
  ['HD009', '26/08/2026', 'KH01', 'Nguyễn Văn An', '480,000'],
];

Future<void> main(List<String> args) async {
  final out = Directory(
    args.isNotEmpty
        ? args.first
        : (Platform.isWindows
            ? 'assets\\kanposvndoichieuketoan\\samples'
            : 'assets/kanposvndoichieuketoan/samples'),
  );
  out.createSync(recursive: true);

  await _write(out, 'A_so_cai_202608.xlsx', [header, ...rowsA]);
  await _write(out, 'B_so_chi_tiet_202608.xlsx', [header, ...rowsB]);
  await _write(out, 'C_ngan_hang_202608.xlsx', [header, ...rowsC]);

  stdout.writeln('Đã tạo 3 file mẫu tại: ${out.path}');
}

Future<void> _write(Directory dir, String name, List<List<String>> rows) async {
  final excel = Excel.createExcel();
  final sheet = excel['Dữ liệu'];
  for (final row in rows) {
    sheet.appendRow([for (final v in row) TextCellValue(v) as CellValue]);
  }
  final bytes = excel.encode();
  if (bytes == null) throw StateError('encode() trả về null cho $name');
  await File('${dir.path}\\$name').writeAsBytes(bytes, flush: true);
}