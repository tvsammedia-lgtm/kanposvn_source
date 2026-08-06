import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../../core/auth/auth_service.dart';
import '../models/cafe_finance_accounting.dart';

final _currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
final _dateFmt = DateFormat('dd/MM/yyyy HH:mm');

Future<void> printExpenseVoucher(CashTransaction tx) async {
  final storeName = await AuthService.loadSavedStoreName();
  final storePhone = await AuthService.loadSavedStorePhone();
  pw.Font? font;
  pw.Font? fontBold;
  try {
    font = await PdfGoogleFonts.robotoRegular();
    fontBold = await PdfGoogleFonts.robotoBold();
  } catch (_) {}
  final theme = pw.ThemeData.withFont(
    base: font ?? pw.Font.helvetica(),
    bold: fontBold ?? pw.Font.helveticaBold(),
  );

  const int width = 42;
  String fmtRow(String left, String right) {
    final int avail = width - left.length - right.length;
    if (avail <= 0) return '$left $right';
    return '$left${' ' * avail}$right';
  }

  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat(80 * PdfPageFormat.mm, 200 * PdfPageFormat.mm),
      margin: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      theme: theme,
      build: (ctx) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Center(
            child: pw.Text(
              storeName ?? 'KANPOSVN',
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(font: fontBold, fontSize: 14, fontWeight: pw.FontWeight.bold),
            ),
          ),
          if (storePhone != null && storePhone.isNotEmpty)
            pw.Center(
              child: pw.Text(
                'ĐT: $storePhone',
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(fontSize: 8),
              ),
            ),
          pw.Center(
            child: pw.Text(
              'PHIẾU CHI',
              style: pw.TextStyle(font: fontBold, fontSize: 11, fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.Center(child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8))),
          pw.SizedBox(height: 3),
          pw.Text('Số phiếu: ${_voucherCode(tx)}', style: pw.TextStyle(fontSize: 9)),
          pw.Text('Ngày: ${_dateFmt.format(tx.timestamp)}', style: pw.TextStyle(fontSize: 9)),
          pw.Text('Danh mục: ${tx.category}', style: pw.TextStyle(fontSize: 9)),
          pw.Center(child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),
          pw.SizedBox(height: 4),
          pw.Center(
            child: pw.Text(
              tx.title,
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(font: fontBold, fontSize: 9, fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.SizedBox(height: 4),
          pw.Center(child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),
          pw.SizedBox(height: 4),
          pw.Center(
            child: pw.Text(
              _currency.format(tx.amount),
              style: pw.TextStyle(font: fontBold, fontSize: 14, fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.Center(
            child: pw.Text(
              'Bằng chữ: ${_numberToVietnamese(tx.amount.round())} đồng',
              style: pw.TextStyle(fontSize: 8),
            ),
          ),
          pw.SizedBox(height: 4),
          pw.Center(child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),
          pw.SizedBox(height: 3),
          pw.Text(fmtRow('Người chi:', tx.performerName), style: pw.TextStyle(fontSize: 9)),
          pw.Text(fmtRow('Phương thức:', tx.paymentMethod), style: pw.TextStyle(fontSize: 9)),
          if (tx.note.isNotEmpty) ...[
            pw.Text('Ghi chú: ${tx.note}', style: pw.TextStyle(fontSize: 8)),
          ],
          pw.SizedBox(height: 4),
          pw.Center(child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8))),
          pw.SizedBox(height: 5),
          pw.Center(
            child: pw.Text(
              'Người nhận tiền',
              style: pw.TextStyle(fontSize: 8),
            ),
          ),
          pw.SizedBox(height: 3),
          pw.Text('Họ tên: ............................', style: pw.TextStyle(fontSize: 8)),
          pw.Text('Chữ ký: .............................', style: pw.TextStyle(fontSize: 8)),
          pw.SizedBox(height: 4),
          pw.Center(child: pw.Text('Cảm ơn quý khách!', style: pw.TextStyle(fontSize: 8))),
        ],
      ),
    ),
  );

  await Printing.layoutPdf(
    onLayout: (format) async => pdf.save(),
    name: 'Phieu chi ${_voucherCode(tx)}',
  );
}

Future<void> printExpenseSummary({
  required List<CashTransaction> txs,
  required DateTime from,
  required DateTime to,
}) async {
  final storeName = await AuthService.loadSavedStoreName();
  final storePhone = await AuthService.loadSavedStorePhone();
  pw.Font? font;
  pw.Font? fontBold;
  try {
    font = await PdfGoogleFonts.robotoRegular();
    fontBold = await PdfGoogleFonts.robotoBold();
  } catch (_) {}
  final theme = pw.ThemeData.withFont(
    base: font ?? pw.Font.helvetica(),
    bold: fontBold ?? pw.Font.helveticaBold(),
  );

  final endOfDay = DateTime(to.year, to.month, to.day, 23, 59, 59);
  final filtered = txs
      .where(
        (t) =>
            t.type == 'EXPENSE' &&
            !t.timestamp.isBefore(from) &&
            !t.timestamp.isAfter(endOfDay),
      )
      .toList()
    ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

  double total = filtered.fold(0, (sum, t) => sum + t.amount);

  final byCategory = <String, double>{};
  for (final t in filtered) {
    byCategory[t.category] = (byCategory[t.category] ?? 0) + t.amount;
  }

  final byDay = <String, double>{};
  for (final t in filtered) {
    final key = DateFormat('dd/MM/yyyy').format(t.timestamp);
    byDay[key] = (byDay[key] ?? 0) + t.amount;
  }

  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      theme: theme,
      build: (ctx) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Center(
            child: pw.Text(
              storeName ?? 'KANPOSVN',
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(font: fontBold, fontSize: 18, fontWeight: pw.FontWeight.bold),
            ),
          ),
          if (storePhone != null && storePhone.isNotEmpty)
            pw.Center(
              child: pw.Text(
                'ĐT: $storePhone',
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(fontSize: 10),
              ),
            ),
          pw.Center(
            child: pw.Text(
              'BÁO CÁO TỔNG HỢP PHIẾU CHI',
              style: pw.TextStyle(font: fontBold, fontSize: 14, fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.Center(
            child: pw.Text(
              'Từ ngày ${DateFormat('dd/MM/yyyy').format(from)} đến ngày ${DateFormat('dd/MM/yyyy').format(to)}',
              style: pw.TextStyle(fontSize: 10),
            ),
          ),
          pw.SizedBox(height: 6),
          pw.Divider(),
          pw.SizedBox(height: 4),

          pw.Text(
            'I. TỔNG HỢP THEO DANH MỤC',
            style: pw.TextStyle(font: fontBold, fontSize: 11, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 4),
          pw.TableHelper.fromTextArray(
            headerStyle: pw.TextStyle(font: fontBold, fontWeight: pw.FontWeight.bold, fontSize: 9),
            cellStyle: pw.TextStyle(fontSize: 9),
            border: pw.TableBorder.all(color: PdfColors.grey300),
            headers: ['STT', 'Danh mục', 'Số phiếu', 'Tổng tiền'],
            data: [
              for (final (i, e) in byCategory.entries.indexed)
                [
                  '${i + 1}',
                  e.key,
                  '${filtered.where((t) => t.category == e.key).length}',
                  _currency.format(e.value),
                ],
              ['', 'CỘNG', '${filtered.length}', _currency.format(total)],
            ],
            columnWidths: {
              0: const pw.FixedColumnWidth(30),
              1: const pw.FlexColumnWidth(),
              2: const pw.FixedColumnWidth(60),
              3: const pw.FixedColumnWidth(110),
            },
          ),

          pw.SizedBox(height: 12),
          pw.Text(
            'II. TỔNG HỢP THEO NGÀY',
            style: pw.TextStyle(font: fontBold, fontSize: 11, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 4),
          pw.TableHelper.fromTextArray(
            headerStyle: pw.TextStyle(font: fontBold, fontWeight: pw.FontWeight.bold, fontSize: 9),
            cellStyle: pw.TextStyle(fontSize: 9),
            border: pw.TableBorder.all(color: PdfColors.grey300),
            headers: ['STT', 'Ngày', 'Số phiếu', 'Tổng tiền'],
            data: [
              for (final (i, e) in byDay.entries.indexed)
                [
                  '${i + 1}',
                  e.key,
                  '${filtered.where((t) => DateFormat('dd/MM/yyyy').format(t.timestamp) == e.key).length}',
                  _currency.format(e.value),
                ],
              ['', 'CỘNG', '${filtered.length}', _currency.format(total)],
            ],
            columnWidths: {
              0: const pw.FixedColumnWidth(30),
              1: const pw.FlexColumnWidth(),
              2: const pw.FixedColumnWidth(60),
              3: const pw.FixedColumnWidth(110),
            },
          ),

          pw.SizedBox(height: 12),
          pw.Text(
            'III. CHI TIẾT PHIẾU CHI',
            style: pw.TextStyle(font: fontBold, fontSize: 11, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 4),
          pw.TableHelper.fromTextArray(
            headerStyle: pw.TextStyle(font: fontBold, fontWeight: pw.FontWeight.bold, fontSize: 8),
            cellStyle: pw.TextStyle(fontSize: 8),
            border: pw.TableBorder.all(color: PdfColors.grey300),
            headers: ['STT', 'Số phiếu', 'Ngày giờ', 'Nội dung', 'Danh mục', 'Số tiền'],
            data: [
              for (final (i, t) in filtered.indexed)
                [
                  '${i + 1}',
                  _voucherCode(t),
                  _dateFmt.format(t.timestamp),
                  t.title,
                  t.category,
                  _currency.format(t.amount),
                ],
              ['', '', '', '', 'TỔNG CỘNG', _currency.format(total)],
            ],
            columnWidths: {
              0: const pw.FixedColumnWidth(26),
              1: const pw.FixedColumnWidth(80),
              2: const pw.FixedColumnWidth(80),
              3: const pw.FlexColumnWidth(),
              4: const pw.FixedColumnWidth(90),
              5: const pw.FixedColumnWidth(90),
            },
          ),

          pw.SizedBox(height: 16),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text('Kế toán', style: pw.TextStyle(font: fontBold, fontSize: 10, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(width: 60),
              pw.Text('Giám đốc', style: pw.TextStyle(font: fontBold, fontSize: 10, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(width: 60),
            ],
          ),
        ],
      ),
    ),
  );

  await Printing.layoutPdf(
    onLayout: (format) async => pdf.save(),
    name: 'Tong hop phieu chi ${DateFormat('ddMMyyyy').format(from)}-${DateFormat('ddMMyyyy').format(to)}',
  );
}

String _voucherCode(CashTransaction tx) {
  final ts = tx.timestamp.millisecondsSinceEpoch;
  return 'PC-${ts.toString().substring(ts.toString().length - 6)}';
}

String _numberToVietnamese(int num) {
  if (num == 0) return 'không';
  const digits = ['', 'một', 'hai', 'ba', 'bốn', 'năm', 'sáu', 'bảy', 'tám', 'chín'];
  const tens = ['', 'mười', 'hai mươi', 'ba mươi', 'bốn mươi', 'năm mươi', 'sáu mươi', 'bảy mươi', 'tám mươi', 'chín mươi'];
  const units = ['', 'nghìn', 'triệu', 'tỷ'];

  List<String> chunks = [];
  var n = num;
  while (n > 0) {
    chunks.add((n % 1000).toString());
    n ~/= 1000;
  }

  String readChunk(int v) {
    if (v == 0) return '';
    final h = v ~/ 100;
    final r = v % 100;
    final t = r ~/ 10;
    final u = r % 10;
    String s = '';
    if (h > 0) s += '${digits[h]} trăm';
    if (r > 0) {
      if (h > 0) s += ' ';
      if (t == 1) {
        s += 'mười';
      } else if (t > 1) {
        s += tens[t];
      }
      if (u > 0) {
        if (t > 0) s += ' ';
        if (u == 5 && t > 0) {
          s += 'lăm';
        } else if (u == 1 && t > 1) {
          s += 'mốt';
        } else {
          s += digits[u];
        }
      }
    }
    return s.trim();
  }

  String result = '';
  for (int i = chunks.length - 1; i >= 0; i--) {
    final v = int.parse(chunks[i]);
    if (v == 0) continue;
    final part = readChunk(v);
    if (part.isNotEmpty) {
      result += '$part ${units[i]} ';
    }
  }
  return result.trim();
}
