import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../../data/models/cut_detail.dart';
import '../../../data/repositories/garment_repository.dart';

class TicketPreviewScreen extends ConsumerWidget {
  final int idGen;

  const TicketPreviewScreen({super.key, required this.idGen});

  Future<pw.Document> _generatePdf(List<CutDetail> details) async {
    final pdf = pw.Document();

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

    // 2 tem / dòng = khoảng 180x40mm, layout dạng A4 nhiều dòng
    // Ở đây ta mô phỏng một trang in danh sách liên tục
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(20),
        theme: theme,
        build: (context) {
          return [
            pw.Text('Phiếu in tem - Mã $idGen', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.Table(
              border: pw.TableBorder.all(),
              children: details.map((d) {
                return pw.TableRow(
                  children: [
                    _buildTicketCell(d.cutNo, d.poNo, d.size, d.startBundle, d.opNo, d.qty),
                    d.cutNo1 != null
                        ? _buildTicketCell(d.cutNo1!, d.poNo1!, d.size1!, d.startBundle1!, d.opNo1!, d.qty1!)
                        : pw.Container(padding: const pw.EdgeInsets.all(8)),
                  ]
                );
              }).toList(),
            ),
          ];
        },
      ),
    );
    return pdf;
  }

  pw.Widget _buildTicketCell(String cutNo, String poNo, String size, int bundle, int op, int qty) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('CutNo: $cutNo | PoNo: $poNo'),
          pw.Text('Size: $size | Bundle: $bundle'),
          pw.Text('OpNo: $op | Qty: $qty'),
          pw.BarcodeWidget(
            barcode: pw.Barcode.code128(),
            data: '$poNo-$bundle-$op',
            width: 120,
            height: 40,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('In tem: $idGen')),
      body: FutureBuilder<List<CutDetail>>(
        future: ref.read(garmentRepositoryProvider).getCutDetailsByIdGen(idGen),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          }
          
          final details = snapshot.data ?? [];
          if (details.isEmpty) {
            return const Center(child: Text('Không tìm thấy dữ liệu.'));
          }

          return PdfPreview(
            build: (format) async {
              final doc = await _generatePdf(details);
              return doc.save();
            },
            allowSharing: false,
            canChangeOrientation: false,
            canChangePageFormat: false,
          );
        },
      ),
    );
  }
}
