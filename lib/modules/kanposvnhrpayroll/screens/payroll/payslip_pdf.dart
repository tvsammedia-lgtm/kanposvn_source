import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../models/payroll.dart';

final _currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

String _fmt(double v) => _currency.format(v.roundToDouble());

/// Load Roboto fonts to support Vietnamese diacritics.
Future<(pw.Font, pw.Font)> _loadFonts() async {
  pw.Font? font;
  pw.Font? fontBold;
  try {
    font = await PdfGoogleFonts.robotoRegular();
    fontBold = await PdfGoogleFonts.robotoBold();
  } catch (_) {}
  return (
    font ?? pw.Font.helvetica(),
    fontBold ?? pw.Font.helveticaBold(),
  );
}

/// Tạo PDF phiếu lương cho 1 nhân viên.
Future<pw.Document> buildSinglePayslipPdf(Payroll p) async {
  final (base, bold) = await _loadFonts();
  final doc = pw.Document();
  doc.addPage(pw.MultiPage(
    pageFormat: PdfPageFormat.a4,
    margin: const pw.EdgeInsets.all(24),
    theme: pw.ThemeData.withFont(base: base, bold: bold),
    build: (_) => [_buildBody(p)],
  ));
  return doc;
}

/// Tạo PDF phiếu lương cho toàn bộ danh sách (mỗi nhân viên 1 trang).
Future<pw.Document> buildBatchPayslipPdf(List<Payroll> payrolls) async {
  final (base, bold) = await _loadFonts();
  final doc = pw.Document();
  for (final p in payrolls) {
    doc.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(24),
      theme: pw.ThemeData.withFont(base: base, bold: bold),
      build: (_) => [_buildBody(p)],
    ));
  }
  return doc;
}

/// In phiếu lương 1 người — mở dialog preview/máy in.
Future<void> printPayslip(Payroll p) async {
  final pdf = await buildSinglePayslipPdf(p);
  await Printing.layoutPdf(
    onLayout: (_) async => pdf.save(),
    name: 'PhieuLuong_${p.employeeCode}_${p.month}_${p.year}.pdf',
  );
}

/// In tất cả phiếu lương — mở dialog preview/máy in.
Future<void> printAllPayslips(List<Payroll> payrolls) async {
  final pdf = await buildBatchPayslipPdf(payrolls);
  await Printing.layoutPdf(
    onLayout: (_) async => pdf.save(),
    name: 'PhieuLuong_${payrolls.first.month}_${payrolls.first.year}.pdf',
  );
}

// ─── PDF Body ──────────────────────────────────────────────────────────────

pw.Widget _buildBody(Payroll p) {
  final sectionTitle = pw.TextStyle(
    fontSize: 10,
    fontWeight: pw.FontWeight.bold,
    color: PdfColors.blue800,
  );

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      // ── Header ──
      pw.Center(
        child: pw.Text('PHIẾU LƯƠNG', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
      ),
      pw.Center(
        child: pw.Text(
          'Tháng ${p.month.toString().padLeft(2, '0')}/${p.year}',
          style: pw.TextStyle(fontSize: 12, color: PdfColors.grey700),
        ),
      ),
      pw.SizedBox(height: 12),
      pw.Divider(color: PdfColors.blue800, thickness: 1.5),
      pw.SizedBox(height: 8),

      // ── Employee info ──
      _infoBlock([
        _kv('Mã nhân viên:', p.employeeCode),
        _kv('Họ tên:', p.employeeName),
        _kv('Phòng ban:', p.department),
        _kv('Chức vụ:', p.position),
        _kv('Loại nhân viên:', p.isDriver ? 'Tài xế' : 'Văn phòng'),
        _kv('Số ngày công:', '${p.actualWorkingDays.toInt()}/${p.workingDays.toInt()}'),
      ]),
      pw.SizedBox(height: 14),

      // ── Thu nhập ──
      pw.Text('I. THU NHẬP', style: sectionTitle),
      pw.SizedBox(height: 4),
      _tableSection(_incomeRows(p), boldLabel: 'Tổng thu nhập', boldValue: _fmt(p.grossSalary)),
      pw.SizedBox(height: 12),

      // ── Khấu trừ ──
      pw.Text('II. KHẤU TRỪ CÁ NHÂN', style: sectionTitle),
      pw.SizedBox(height: 4),
      _tableSection(_deductionRows(p), boldLabel: 'Tổng khấu trừ', boldValue: _fmt(p.totalDeductions)),
      pw.SizedBox(height: 12),

      // ── Thực lĩnh ──
      pw.Container(
        padding: const pw.EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: pw.BoxDecoration(
          color: PdfColors.green50,
          borderRadius: pw.BorderRadius.circular(6),
          border: pw.Border.all(color: PdfColors.green800, width: 1),
        ),
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('THỰC LĨNH', style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold)),
            pw.Text(_fmt(p.netSalary), style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
          ],
        ),
      ),
      pw.SizedBox(height: 20),

      // ── Chi phí NSDL (tham khảo) ──
      pw.Text('III. CHI PHÍ NHÀ SỬ DỤNG LAO ĐỘNG (tham khảo)', style: sectionTitle),
      pw.SizedBox(height: 4),
      _tableSection([
        _row('BHXH NSDL (17.5%)', _fmt(p.employerBhxh)),
        _row('BHYT NSDL (3%)', _fmt(p.employerBhyt)),
        _row('BHTN NSDL (1%)', _fmt(p.employerBhtn)),
        _row('Kinh phí Công đoàn (2%)', _fmt(p.unionFee)),
      ], boldLabel: 'Tổng chi phí NSDL', boldValue: _fmt(p.totalEmployerCost)),
      pw.SizedBox(height: 28),

      // ── Signatures ──
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          _signatureBox('Nhân viên\n(Ký, ghi rõ họ tên)'),
          _signatureBox('Trưởng phòng\n(Ký, ghi rõ họ tên)'),
          _signatureBox('Kế toán\n(Ký, ghi rõ họ tên)'),
          _signatureBox('Giám đốc\n(Ký, ghi rõ họ tên)'),
        ],
      ),
    ],
  );
}

// ─── Helpers ───────────────────────────────────────────────────────────────

List<pw.Widget> _incomeRows(Payroll p) {
  final rows = <pw.Widget>[
    _row('Lương cơ bản', _fmt(p.baseSalary)),
  ];
  if (p.isDriver) {
    if (p.tripSalary > 0) rows.add(_row('  Lương chuyến', _fmt(p.tripSalary)));
    if (p.kmSalary > 0) rows.add(_row('  Lương km', _fmt(p.kmSalary)));
    if (p.containerSalary > 0) rows.add(_row('  Lương container', _fmt(p.containerSalary)));
    if (p.allowanceNightStay > 0) rows.add(_row('  PC lưu đêm', _fmt(p.allowanceNightStay)));
  } else {
    if (p.earnedBaseSalary != p.baseSalary && p.earnedBaseSalary > 0) {
      rows.add(_row('  Lương thực tế', _fmt(p.earnedBaseSalary)));
    }
    if (p.overtimeSalary > 0) rows.add(_row('  Tăng ca (OT)', _fmt(p.overtimeSalary)));
    if (p.diligenceBonus > 0) rows.add(_row('  Chuyên cần', _fmt(p.diligenceBonus)));
  }
  if (p.allowancePhone > 0) rows.add(_row('  PC điện thoại', _fmt(p.allowancePhone)));
  if (p.allowanceMeal > 0) rows.add(_row('  PC ăn trưa', _fmt(p.allowanceMeal)));
  if (p.allowanceFuel > 0) rows.add(_row('  PC xăng xe', _fmt(p.allowanceFuel)));
  if (p.safetyBonus > 0) rows.add(_row('  Thưởng an toàn', _fmt(p.safetyBonus)));
  if (p.fuelSavingBonus > 0) rows.add(_row('  Thưởng tiết kiệm xăng', _fmt(p.fuelSavingBonus)));
  if (p.kpiBonus > 0) rows.add(_row('  Thưởng KPI', _fmt(p.kpiBonus)));
  if (p.monthlyBonus > 0) rows.add(_row('  Thưởng tháng', _fmt(p.monthlyBonus)));
  if (p.otherBonus > 0) rows.add(_row('  Thưởng khác', _fmt(p.otherBonus)));
  return rows;
}

List<pw.Widget> _deductionRows(Payroll p) {
  final rows = <pw.Widget>[
    _row('BHXH NLĐ (8%)', _fmt(p.socialInsurance)),
    _row('BHYT NLĐ (1.5%)', _fmt(p.healthInsurance)),
    _row('BHTN NLĐ (1%)', _fmt(p.unemploymentInsurance)),
  ];
  if (p.personalIncomeTax > 0) rows.add(_row('Thuế TNCN', _fmt(p.personalIncomeTax)));
  if (p.violationPenalty > 0) rows.add(_row('Phạt vi phạm', _fmt(p.violationPenalty)));
  if (p.accidentPenalty > 0) rows.add(_row('Phạt tai nạn', _fmt(p.accidentPenalty)));
  if (p.cargoPenalty > 0) rows.add(_row('Phạt hàng hóa', _fmt(p.cargoPenalty)));
  if (p.otherPenalty > 0) rows.add(_row('Phạt khác', _fmt(p.otherPenalty)));
  if (p.advanceDeduction > 0) rows.add(_row('Tạm ứng', _fmt(p.advanceDeduction)));
  if (p.otherDeduction > 0) rows.add(_row('Khấu trừ khác', _fmt(p.otherDeduction)));
  return rows;
}

pw.Widget _row(String label, String value) {
  return pw.Padding(
    padding: const pw.EdgeInsets.symmetric(vertical: 2),
    child: pw.Row(
      children: [
        pw.Expanded(child: pw.Text(label, style: const pw.TextStyle(fontSize: 9))),
        pw.SizedBox(
          width: 100,
          child: pw.Text(value, textAlign: pw.TextAlign.right, style: const pw.TextStyle(fontSize: 9)),
        ),
      ],
    ),
  );
}

pw.Widget _kv(String label, String value) {
  return pw.Padding(
    padding: const pw.EdgeInsets.symmetric(vertical: 1),
    child: pw.Row(
      children: [
        pw.SizedBox(
          width: 120,
          child: pw.Text(label, style: pw.TextStyle(fontSize: 9, color: PdfColors.grey600)),
        ),
        pw.Text(value, style: const pw.TextStyle(fontSize: 9)),
      ],
    ),
  );
}

pw.Widget _tableSection(List<pw.Widget> rows, {required String boldLabel, required String boldValue}) {
  return pw.Container(
    padding: const pw.EdgeInsets.all(8),
    decoration: pw.BoxDecoration(
      border: pw.Border.all(color: PdfColors.grey300),
      borderRadius: pw.BorderRadius.circular(4),
    ),
    child: pw.Column(
      children: [
        ...rows,
        pw.Divider(color: PdfColors.grey300),
        pw.Row(
          children: [
            pw.Expanded(
              child: pw.Text(boldLabel, style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
            ),
            pw.SizedBox(
              width: 100,
              child: pw.Text(boldValue,
                  textAlign: pw.TextAlign.right,
                  style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
            ),
          ],
        ),
      ],
    ),
  );
}

pw.Widget _infoBlock(List<pw.Widget> items) {
  return pw.Container(
    padding: const pw.EdgeInsets.all(8),
    decoration: pw.BoxDecoration(
      color: PdfColors.grey50,
      borderRadius: pw.BorderRadius.circular(4),
    ),
    child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: items),
  );
}

pw.Widget _signatureBox(String title) {
  return pw.SizedBox(
    width: 120,
    child: pw.Column(
      children: [
        pw.Container(height: 60),
        pw.Divider(color: PdfColors.grey400),
        pw.Text(title, textAlign: pw.TextAlign.center,
            style: pw.TextStyle(fontSize: 8, color: PdfColors.grey600)),
      ],
    ),
  );
}
