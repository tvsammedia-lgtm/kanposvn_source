import 'package:intl/intl.dart';

/// Mô hình dữ liệu mô phỏng báo cáo dạng Crystal Reports (KANHOT .rpt).
///
/// Gồm: tiêu đề, các dòng phụ đề, bảng (header nhiều dòng + dữ liệu),
/// dòng tổng cộng và khối chữ ký cuối trang.

enum ReportCellAlign { left, center, right }

/// Ô dữ liệu trong bảng báo cáo.
class ReportCell {
  final String text;
  final ReportCellAlign align;
  final bool isBold;
  final bool isItalic;

  const ReportCell(
    this.text, {
    this.align = ReportCellAlign.left,
    this.isBold = false,
    this.isItalic = false,
  });

  ReportCell right() => ReportCell(text, align: ReportCellAlign.right, isBold: isBold);
  ReportCell center() => ReportCell(text, align: ReportCellAlign.center, isBold: isBold);
}

/// Ô header báo cáo, hỗ trợ colspan (gom cột).
class ReportHeaderCell {
  final String text;
  final int colspan;
  final ReportCellAlign align;

  const ReportHeaderCell(this.text, {this.colspan = 1, this.align = ReportCellAlign.center});
}

/// Một dòng dữ liệu trong bảng.
class ReportRow {
  final List<ReportCell> cells;

  /// Dòng nhãn nhóm/section (VD: "Số dư đầu kỳ", "Cộng số phát sinh").
  final bool isSection;

  const ReportRow(this.cells, {this.isSection = false});

  bool get isEmpty => cells.every((c) => c.text.trim().isEmpty);
}

/// Khối chữ ký cuối báo cáo.
class ReportSignatureItem {
  final String role;
  final String sub;

  const ReportSignatureItem(this.role, this.sub);
}

/// Định nghĩa một báo cáo hoàn chỉnh kiểu Crystal.
class CrystalReportModel {
  /// Dòng "Mẫu số S03a-DN / Thông tư..." (căn trái, nhỏ).
  final String formLine;

  /// "Đơn vị: ____"
  final String unitName;

  /// "Địa chỉ: ____"
  final String? unitAddress;

  /// "Mã số thuế: ____"
  final String? taxCode;

  /// Tên báo cáo (căn giữa, in đậm, cỡ lớn).
  final String title;

  /// Dòng phụ dưới tiêu đề (VD: "Dùng cho hình thức kế toán...").
  final String? titleSub;

  /// Các dòng phụ (TK, Tháng, Từ ngày - đến ngày...).
  final List<String> subtitleLines;

  /// Độ rộng tương đối của từng cột (leaf).
  final List<int> columnFlex;

  /// Các dòng header (dòng đầu có thể dùng colspan).
  final List<List<ReportHeaderCell>> headerRows;

  /// Dữ liệu bảng (mỗi dòng phải có đủ [columnFlex] ô).
  final List<ReportRow> rows;

  /// Các dòng tổng cộng in đậm + gạch chân phía trên.
  final List<ReportRow> totalRows;

  /// Ghi chú cuối trang (VD: "Kèm theo: ... chứng từ gốc").
  final String? noteLine;

  /// Khối chữ ký.
  final List<ReportSignatureItem> signature;

  const CrystalReportModel({
    required this.formLine,
    required this.unitName,
    this.unitAddress,
    this.taxCode,
    required this.title,
    this.titleSub,
    this.subtitleLines = const [],
    required this.columnFlex,
    required this.headerRows,
    required this.rows,
    this.totalRows = const [],
    this.noteLine,
    this.signature = const [],
  });

  int get columnCount => columnFlex.length;
}

/// Dòng "Đơn vị: ______" chuẩn của sổ kế toán.
const String kUnitDash =
    '____________________________________________________';

const String kBlankDash = '..............................................................................';

/// Định dạng số tiền VND kiểu kế toán (không có ký hiệu).
String formatMoney(double value) {
  final f = NumberFormat.currency(locale: 'vi_VN', symbol: '', decimalDigits: 0);
  final s = f.format(value);
  return s.endsWith(',') ? s.substring(0, s.length - 1) : s;
}

/// Định dạng ngày dd/MM/yyyy.
String formatDate(DateTime d) => DateFormat('dd/MM/yyyy').format(d);

/// Định dạng ngày giờ dd/MM/yyyy HH:mm.
String formatDateTime(DateTime d) => DateFormat('dd/MM/yyyy HH:mm').format(d);

/// Định dạng số lượng (bỏ số 0 thừa).
String formatQty(double value) {
  if (value == value.roundToDouble()) return value.round().toString();
  return value.toString();
}

/// Đọc số tiền bằng chữ (tiếng Việt) — dùng cho phiếu thu/chi.
const List<String> _so = [
  'không', 'một', 'hai', 'ba', 'bốn', 'năm', 'sáu', 'bảy', 'tám', 'chín',
];

/// Đọc một nhóm 3 chữ số; [isFirst] = true nếu là nhóm cao nhất.
String _docNhom3(String s, {required bool isFirst}) {
  final digits = s.padLeft(3, '0');
  final tram = digits[0];
  final chuc = digits[1];
  final donvi = digits[2];
  final buf = StringBuffer();

  if (tram != '0') {
    buf.write('${_so[int.parse(tram)]} trăm');
  } else if (!isFirst) {
    buf.write('không trăm');
  }

  if (chuc == '0') {
    if (donvi != '0' && tram != '0') {
      buf.write(' lẻ ${_so[int.parse(donvi)]}');
    } else if (donvi != '0') {
      buf.write(' ${_so[int.parse(donvi)]}');
    }
  } else if (chuc == '1') {
    buf.write(' mười');
    if (donvi != '0') buf.write(' ${_so[int.parse(donvi)]}');
  } else {
    buf.write(' ${_so[int.parse(chuc)]} mươi');
    if (donvi == '1') {
      buf.write(' mốt');
    } else if (donvi == '5') {
      buf.write(' lăm');
    } else if (donvi != '0') {
      buf.write(' ${_so[int.parse(donvi)]}');
    }
  }
  return buf.toString().trim();
}

/// Đọc số tiền bằng chữ: 1250000 -> "một triệu hai trăm năm mươi nghìn đồng".
String moneyToWords(double value) {
  final v = value.round();
  if (v == 0) return 'không đồng';
  final negative = v < 0;
  final s = v.abs().toString();
  final chunks = <String>[];
  var i = s.length;
  while (i > 0) {
    final start = (i - 3 < 0) ? 0 : i - 3;
    chunks.add(s.substring(start, i));
    i = start;
  }
  final units = ['', 'nghìn', 'triệu', 'tỷ', 'nghìn tỷ', 'triệu tỷ'];
  final buf = StringBuffer();
  for (var j = chunks.length - 1; j >= 0; j--) {
    final part = _docNhom3(chunks[j], isFirst: j == chunks.length - 1);
    if (part.isEmpty) continue;
    if (buf.isNotEmpty && !part.startsWith('không trăm')) buf.write(' ');
    buf.write(part);
    if (j > 0) {
      buf.write(' ');
      buf.write(units[j]);
    }
  }
  var result = buf.toString().trim();
  result = result.replaceAll(RegExp(r'\s+'), ' ');
  result = '${negative ? 'âm ' : ''}$result đồng';
  return result[0].toUpperCase() + result.substring(1);
}
