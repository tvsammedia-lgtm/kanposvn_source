import 'dart:typed_data';

import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:intl/intl.dart';

import 'printer_models.dart';
import 'receipt_data.dart';

final _currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

class ReceiptBuilder {
  ReceiptBuilder(this.settings);

  final PrinterSettings settings;

  static CapabilityProfile? _profile;

  static const Map<int, int> _specialCp1258 = {
    0x1A0: 0xD5, // Ơ
    0x1A1: 0xF5, // ơ
    0x1AF: 0xDD, // Ư
    0x1B0: 0xFD, // ư
    0x110: 0xDE, // Đ
    0x111: 0xF0, // đ
    0x20AB: 0xFE, // ₫
  };

  static const Map<int, String> _stripMap = {
    0x1A0: 'O', 0x1A1: 'o', 0x1AF: 'U', 0x1B0: 'u',
    0x110: 'D', 0x111: 'd', 0x20AB: 'd',
    // a
    0x00E0: 'a', 0x00E1: 'a', 0x1EA3: 'a', 0x00E3: 'a', 0x1EA1: 'a',
    0x0103: 'a', 0x1EB1: 'a', 0x1EAF: 'a', 0x1EB5: 'a', 0x1EB7: 'a', 0x1EB3: 'a',
    0x00E2: 'a', 0x1EA7: 'a', 0x1EA5: 'a', 0x1EAB: 'a', 0x1EA9: 'a', 0x1EAD: 'a',
    // A
    0x00C0: 'A', 0x00C1: 'A', 0x1EA2: 'A', 0x00C3: 'A', 0x1EA0: 'A',
    0x0102: 'A', 0x1EB0: 'A', 0x1EAE: 'A', 0x1EB4: 'A', 0x1EB6: 'A', 0x1EB2: 'A',
    0x00C2: 'A', 0x1EA6: 'A', 0x1EA4: 'A', 0x1EAA: 'A', 0x1EA8: 'A', 0x1EAC: 'A',
    // e
    0x00E8: 'e', 0x00E9: 'e', 0x1EBB: 'e', 0x1EBD: 'e', 0x1EB9: 'e',
    0x00EA: 'e', 0x1EC1: 'e', 0x1EBF: 'e', 0x1EC5: 'e', 0x1EC3: 'e', 0x1EC7: 'e',
    // E
    0x00C8: 'E', 0x00C9: 'E', 0x1EBA: 'E', 0x1EBC: 'E', 0x1EB8: 'E',
    0x00CA: 'E', 0x1EC0: 'E', 0x1EBE: 'E', 0x1EC4: 'E', 0x1EC2: 'E', 0x1EC6: 'E',
    // i
    0x00EC: 'i', 0x00ED: 'i', 0x1EC9: 'i', 0x0129: 'i', 0x1ECB: 'i',
    0x00CC: 'I', 0x00CD: 'I', 0x1EC8: 'I', 0x0128: 'I', 0x1ECA: 'I',
    // o
    0x00F2: 'o', 0x00F3: 'o', 0x1ECF: 'o', 0x00F5: 'o', 0x1ECD: 'o',
    0x00F4: 'o', 0x1ED3: 'o', 0x1ED1: 'o', 0x1ED7: 'o', 0x1ED5: 'o', 0x1ED9: 'o',
    0x00D2: 'O', 0x00D3: 'O', 0x1ECE: 'O', 0x00D5: 'O', 0x1ECC: 'O',
    0x00D4: 'O', 0x1ED2: 'O', 0x1ED0: 'O', 0x1ED6: 'O', 0x1ED4: 'O', 0x1ED8: 'O',
    // u
    0x00F9: 'u', 0x00FA: 'u', 0x1EE7: 'u', 0x0169: 'u', 0x1EE5: 'u',
    0x00D9: 'U', 0x00DA: 'U', 0x1EE6: 'U', 0x0168: 'U', 0x1EE4: 'U',
    // y
    0x1EF3: 'y', 0x00FD: 'y', 0x1EF7: 'y', 0x1EF9: 'y', 0x1EF5: 'y',
    0x1EF2: 'Y', 0x00DD: 'Y', 0x1EF6: 'Y', 0x1EF8: 'Y', 0x1EF4: 'Y',
  };

  int get _cols => settings.paper.cols;

  Future<CapabilityProfile> _getProfile() async {
    _profile ??= await CapabilityProfile.load();
    return _profile!;
  }

  /// Chuyển tiếng Việt có dấu sang CP1258 (hoặc không dấu nếu ascii).
  Uint8List _encodeText(String text) {
    final out = BytesBuilder();
    for (final rune in text.runes) {
      int byte = -1;
      if (settings.encoding == TextEncodingMode.ascii) {
        final stripped = _stripMap[rune] ?? (rune < 0x80 ? String.fromCharCode(rune) : null);
        if (stripped != null) {
          for (final c in stripped.codeUnits) {
            out.addByte(c < 0x80 ? c : 0x3F);
          }
          continue;
        }
      } else {
        if (rune < 0x80) {
          out.addByte(rune);
          continue;
        }
        if (_specialCp1258.containsKey(rune)) {
          out.addByte(_specialCp1258[rune]!);
          continue;
        }
        if (rune < 0x100) {
          out.addByte(rune);
          continue;
        }
        final stripped = _stripMap[rune];
        if (stripped != null) {
          for (final c in stripped.codeUnits) {
            out.addByte(c < 0x80 ? c : 0x3F);
          }
          continue;
        }
      }
      byte = 0x3F; // '?'
      out.addByte(byte);
    }
    return out.toBytes();
  }

  List<String> _wrap(String text) {
    final lines = <String>[];
    for (final raw in text.split('\n')) {
      if (raw.isEmpty) {
        lines.add('');
        continue;
      }
      final runes = raw.runes.toList();
      var start = 0;
      while (start < runes.length) {
        final end = (start + _cols) < runes.length ? start + _cols : runes.length;
        lines.add(String.fromCharCodes(runes.sublist(start, end)));
        start = end;
      }
    }
    return lines;
  }

  String _padRow(String left, String right) {
    final avail = _cols - left.length - right.length;
    if (avail <= 0) return '$left $right';
    return '$left${' ' * avail}$right';
  }

  String _center(String text) {
    final len = text.length;
    if (len >= _cols) return text;
    final pad = (_cols - len) ~/ 2;
    return '${' ' * pad}$text';
  }

  Future<Uint8List> buildBytes(ReceiptData receipt) async {
    final profile = await _getProfile();
    final gen = Generator(settings.paper.escPosPaper, profile);
    final bytes = BytesBuilder();

    bytes.add(gen.reset());
    if (settings.encoding == TextEncodingMode.cp1258) {
      bytes.add(gen.setGlobalCodeTable('CP1258'));
    }

    void line(String text, {PosStyles styles = const PosStyles()}) {
      for (final wrapped in _wrap(text)) {
        bytes.add(gen.textEncoded(_encodeText(wrapped), styles: styles));
      }
    }

    void centerLine(String text, {bool bold = false, PosTextSize size = PosTextSize.size1}) {
      line(_center(text), styles: PosStyles(
        align: PosAlign.center,
        bold: bold,
        height: size,
        width: size,
      ));
    }

    void hline(String ch) => line(ch * _cols, styles: const PosStyles());

    final now = receipt.date ?? DateTime.now();

    // Header
    centerLine(receipt.shopName ?? 'KANPOSVN',
        bold: true, size: PosTextSize.size2);
    if (receipt.shopAddress != null && receipt.shopAddress!.isNotEmpty) {
      centerLine(receipt.shopAddress!);
    }
    if (receipt.shopTaxCode != null && receipt.shopTaxCode!.isNotEmpty) {
      centerLine('MST: ${receipt.shopTaxCode}');
    }
    if (receipt.shopPhone != null && receipt.shopPhone!.isNotEmpty) {
      centerLine('ĐT: ${receipt.shopPhone}');
    }
    if (receipt.einvoicePattern != null &&
        receipt.einvoicePattern!.isNotEmpty) {
      centerLine('Mẫu số: ${receipt.einvoicePattern}');
    }
    if (receipt.einvoiceSymbol != null &&
        receipt.einvoiceSymbol!.isNotEmpty) {
      centerLine(
          'Ký hiệu: ${receipt.einvoiceSymbol}'
          '${receipt.einvoiceNumber != null && receipt.einvoiceNumber!.isNotEmpty ? ' · Số: ${receipt.einvoiceNumber}' : ''}');
    }
    bytes.add(gen.feed(1));
    centerLine(receipt.title, bold: true);
    hline('=');
    bytes.add(gen.feed(1));

    if (receipt.orderCode != null && receipt.orderCode!.isNotEmpty) {
      line('Mã đơn: ${receipt.orderCode}', styles: const PosStyles(bold: true));
    }
    line('Ngày: ${DateFormat('dd/MM/yyyy HH:mm').format(now)}');
    if (receipt.table.isNotEmpty) line('Bàn: ${receipt.table}');
    if (receipt.customer.isNotEmpty && receipt.customer != 'Khách lẻ') {
      line('Khách: ${receipt.customer}');
    }
    if (receipt.paymentMethod != null && receipt.paymentMethod!.isNotEmpty) {
      line('Thanh toán: ${receipt.paymentMethod}');
    }
    bytes.add(gen.feed(1));
    hline('-');

    // Items header
    line('Tên món${' ' * (_cols - 'Tên món'.length - 'Thành tiền'.length)}Thành tiền',
        styles: const PosStyles(bold: true));
    hline('-');

    for (final item in receipt.items) {
      final name = item.name;
      line(name, styles: const PosStyles(bold: true));
      if (item.extra.isNotEmpty) {
        line('  + ${item.extra}');
      }
      line(_padRow(
        '  ${_formatQty(item.quantity)} x ${_currency.format(item.unitPrice)}',
        _currency.format(item.total),
      ));
    }

    hline('-');
    line(_padRow('Tạm tính:', _currency.format(receipt.subtotal)));
    if (receipt.discount > 0) {
      line(_padRow('Giảm giá:', '-${_currency.format(receipt.discount)}'));
    }
    if (receipt.vat > 0) {
      line(_padRow('Thuế (VAT):', _currency.format(receipt.vat)));
    }
    bytes.add(gen.feed(1));
    hline('=');
    line(_center('TỔNG CỘNG'),
        styles: const PosStyles(bold: true, height: PosTextSize.size2, width: PosTextSize.size2));
    line(_center(_currency.format(receipt.grandTotal)),
        styles: const PosStyles(bold: true, height: PosTextSize.size2, width: PosTextSize.size2));
    hline('=');

    if (receipt.cashReceived != null && receipt.change != null) {
      bytes.add(gen.feed(1));
      line(_padRow('Khách đưa:', _currency.format(receipt.cashReceived!)));
      line(_padRow('Tiền thừa:', _currency.format(receipt.change!)));
      bytes.add(gen.feed(1));
    }

    if (receipt.note.isNotEmpty) {
      line('Ghi chú: ${receipt.note}');
    }

    bytes.add(gen.feed(1));
    hline('-');
    bytes.add(gen.feed(1));

    // QR
    if (receipt.qrData != null && receipt.qrData!.isNotEmpty) {
      bytes.add(gen.qrcode(
        receipt.qrData!,
        align: PosAlign.center,
        size: QRSize.size6,
        cor: QRCorrection.M,
      ));
      bytes.add(gen.feed(1));
      centerLine('Quét mã QR để tra cứu hóa đơn');
      if (receipt.orderCode != null) {
        centerLine(receipt.orderCode!, bold: true);
      }
      bytes.add(gen.feed(1));
    }

    centerLine(receipt.footer, bold: true);

    // Copies + cut
    bytes.add(gen.feed(4));
    bytes.add(gen.cut(mode: PosCutMode.full));

    return bytes.toBytes();
  }

  String _formatQty(double qty) {
    if (qty == qty.roundToDouble()) return qty.toInt().toString();
    return qty.toStringAsFixed(2).replaceAll(RegExp(r'\.?0+$'), '');
  }
}
