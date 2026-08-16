import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:qr/qr.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/auth/auth_service.dart';
import '../models/cafe_order.dart';

final _currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

Future<void> printBillPdf(
  CafeOrder cart, {
  BuildContext? context,
  bool createPdfFileFirst = false,
}) async {
  final storeName = await AuthService.loadSavedStoreName();
  final ownerName = await AuthService.loadSavedOwnerName();
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
      pageFormat: PdfPageFormat(80 * PdfPageFormat.mm, 297 * PdfPageFormat.mm),
      margin: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      theme: theme,
      build: (ctx) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Center(
            child: pw.Text(
              storeName ?? 'KANPOSVN',
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                font: fontBold,
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          if (ownerName != null && ownerName.isNotEmpty && ownerName != storeName)
            pw.Center(
              child: pw.Text(
                ownerName,
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(font: fontBold, fontSize: 10, fontWeight: pw.FontWeight.bold),
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
              'HÓA ĐƠN THANH TOÁN',
              style: pw.TextStyle(
                font: fontBold,
                fontSize: 10,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.SizedBox(height: 3),
          pw.Center(
            child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8)),
          ),
          pw.SizedBox(height: 3),

          pw.Text(
            'Mã đơn: ${cart.orderCode}',
            style: pw.TextStyle(
              font: fontBold,
              fontSize: 9,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Text(
            'Ngày: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}',
            style: pw.TextStyle(fontSize: 9),
          ),
          pw.Text(
            'Loại: ${cart.orderType.label}',
            style: pw.TextStyle(fontSize: 9),
          ),
          if (cart.occupiedAt != null)
            pw.Text(
              'Giờ vào: ${DateFormat('dd/MM/yyyy HH:mm').format(cart.occupiedAt!)}',
              style: pw.TextStyle(fontSize: 9),
            ),
          if (cart.paidAt != null)
            pw.Text(
              'Giờ ra: ${DateFormat('dd/MM/yyyy HH:mm').format(cart.paidAt!)}',
              style: pw.TextStyle(fontSize: 9),
            ),
          if (cart.tableName != null && cart.tableName!.isNotEmpty)
            pw.Text('Bàn: ${cart.tableName}', style: pw.TextStyle(fontSize: 9)),
          if (cart.customerName.isNotEmpty && cart.customerName != 'Khách lẻ')
            pw.Text(
              'Khách: ${cart.customerName}',
              style: pw.TextStyle(fontSize: 9),
            ),
          pw.Text(
            'Thanh toán: ${cart.paymentMethod.label}',
            style: pw.TextStyle(fontSize: 9),
          ),
          pw.SizedBox(height: 3),
          pw.Center(
            child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8)),
          ),

          pw.Text(
            fmtRow('Tên món', 'Thành tiền'),
            style: pw.TextStyle(
              font: fontBold,
              fontSize: 9,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Center(
            child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8)),
          ),

          ...cart.items.map((item) {
            final unitPrice = item.unitPrice + item.selectedSize.extraPrice;
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  '${item.menuItemName} (${item.selectedSize.name})',
                  style: pw.TextStyle(
                    font: fontBold,
                    fontSize: 9,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                if (item.selectedToppings.isNotEmpty)
                  pw.Text(
                    '  + ${item.selectedToppings.map((t) => '${t.name} ${_currency.format(t.price)}').join(', ')}',
                    style: pw.TextStyle(fontSize: 8),
                  ),
                if (item.note.isNotEmpty)
                  pw.Text('  * ${item.note}', style: pw.TextStyle(fontSize: 8)),
                pw.Text(
                  fmtRow(
                    '  ${item.quantity} x ${_currency.format(unitPrice)}',
                    _currency.format(item.totalPrice),
                  ),
                  style: pw.TextStyle(fontSize: 9),
                ),
                pw.SizedBox(height: 2),
              ],
            );
          }),

          pw.Center(
            child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8)),
          ),

          pw.Text(
            fmtRow('Tạm tính:', _currency.format(cart.subtotal)),
            style: pw.TextStyle(fontSize: 9),
          ),
          if (cart.totalDiscount > 0)
            pw.Text(
              fmtRow('Giảm giá:', '-${_currency.format(cart.totalDiscount)}'),
              style: pw.TextStyle(fontSize: 9),
            ),
          pw.SizedBox(height: 3),
          pw.Center(
            child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8)),
          ),
          pw.Text(
            fmtRow('TỔNG CỘNG:', _currency.format(cart.grandTotal)),
            style: pw.TextStyle(
              font: fontBold,
              fontSize: 11,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Center(
            child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8)),
          ),

          pw.SizedBox(height: 3),
          if (cart.status == OrderStatus.daThanhToan)
            pw.Text(
              'Trạng thái: ĐÃ THANH TOÁN',
              style: pw.TextStyle(fontSize: 9),
            ),
          pw.Center(
            child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8)),
          ),

          pw.SizedBox(height: 5),
          pw.Center(child: _buildQrCode(cart.orderCode)),
          pw.SizedBox(height: 3),
          pw.Center(
            child: pw.Text(
              'Quét mã QR để tra cứu hóa đơn',
              style: pw.TextStyle(fontSize: 8),
            ),
          ),
          pw.Center(
            child: pw.Text(
              cart.orderCode,
              style: pw.TextStyle(
                font: fontBold,
                fontSize: 9,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),

          pw.SizedBox(height: 5),
          pw.Center(
            child: pw.Text(
              'Cảm ơn quý khách và hẹn gặp lại!',
              style: pw.TextStyle(
                font: fontBold,
                fontSize: 9,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );

  try {
    final pdfBytes = await pdf.save();

    if (createPdfFileFirst && defaultTargetPlatform == TargetPlatform.android) {
      await _openAndroidPdfFile(pdfBytes, cart.orderCode);
    }

    await Printing.layoutPdf(
      onLayout: (format) async => pdfBytes,
      name: 'Hóa đơn ${cart.orderCode}',
    );
  } on PlatformException catch (_) {
    if (context != null) {
      try {
        final messenger = ScaffoldMessenger.maybeOf(context);
        if (messenger != null && context.mounted) {
          messenger.showSnackBar(
            const SnackBar(
              content: Text(
                'Không thể mở chức năng in trên thiết bị này. Vui lòng kiểm tra thiết bị hỗ trợ in hoặc chọn phương thức khác.',
              ),
            ),
          );
        }
      } catch (_) {}
    }
  } catch (_) {
    if (context != null) {
      try {
        final messenger = ScaffoldMessenger.maybeOf(context);
        if (messenger != null && context.mounted) {
          messenger.showSnackBar(
            const SnackBar(
              content: Text('In hóa đơn thất bại. Vui lòng thử lại sau.'),
            ),
          );
        }
      } catch (_) {}
    }
  }
}

Future<bool> _openAndroidPdfFile(List<int> pdfBytes, String orderCode) async {
  try {
    final appDir = await getApplicationDocumentsDirectory();
    final billsDir = Directory('${appDir.path}/bills');
    if (!await billsDir.exists()) {
      await billsDir.create(recursive: true);
    }

    final safeOrderCode = orderCode.replaceAll(RegExp(r'[^a-zA-Z0-9._-]'), '-');
    final pdfFile = File('${billsDir.path}/hoa-don-$safeOrderCode.pdf');
    await pdfFile.writeAsBytes(pdfBytes, flush: true);

    await Share.shareXFiles(
      [XFile(pdfFile.path)],
      subject: 'Hóa đơn $orderCode',
      text: 'Hóa đơn thanh toán $orderCode',
    );
    return true;
  } catch (_) {
    return false;
  }
}

pw.Widget _buildQrCode(String data) {
  try {
    final qrCode = QrCode.fromData(
      data: data,
      errorCorrectLevel: QrErrorCorrectLevel.M,
    );
    final qrImage = QrImage(qrCode);
    final int moduleCount = qrCode.moduleCount;
    const int quietZone = 4;
    final double moduleSize = 2.0;
    final double totalSize = (moduleCount + quietZone * 2) * moduleSize;

    final List<pw.Widget> rows = [];

    for (int i = 0; i < quietZone; i++) {
      rows.add(
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: List.generate(
            moduleCount + quietZone * 2,
            (_) => _emptyModule(moduleSize),
          ),
        ),
      );
    }

    for (int y = 0; y < moduleCount; y++) {
      final List<pw.Widget> cells = [];
      for (int i = 0; i < quietZone; i++) {
        cells.add(_emptyModule(moduleSize));
      }
      for (int x = 0; x < moduleCount; x++) {
        cells.add(
          qrImage.isDark(x, y)
              ? _darkModule(moduleSize)
              : _emptyModule(moduleSize),
        );
      }
      for (int i = 0; i < quietZone; i++) {
        cells.add(_emptyModule(moduleSize));
      }
      rows.add(
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: cells),
      );
    }

    for (int i = 0; i < quietZone; i++) {
      rows.add(
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: List.generate(
            moduleCount + quietZone * 2,
            (_) => _emptyModule(moduleSize),
          ),
        ),
      );
    }

    return pw.Container(
      width: totalSize,
      height: totalSize,
      decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
      padding: const pw.EdgeInsets.all(1),
      child: pw.Column(children: rows),
    );
  } catch (_) {
    return pw.Text('[QR Error]', style: pw.TextStyle(fontSize: 8));
  }
}

pw.Widget _darkModule(double size) =>
    pw.Container(width: size, height: size, color: PdfColors.black);
pw.Widget _emptyModule(double size) =>
    pw.Container(width: size, height: size, color: PdfColors.white);
