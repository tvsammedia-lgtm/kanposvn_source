import 'package:intl/intl.dart';

import '../models/compare_config.dart';

/// Kết quả chuẩn hóa một ô — đủ thông tin để so sánh số/ngày/text/rỗng.
class NormCell {
  /// 'empty' | 'number' | 'date' | 'text'
  final String variant;
  final double? number;
  final String? date;
  final String text;

  const NormCell.empty()
      : variant = 'empty',
        number = null,
        date = null,
        text = '';
  const NormCell.number(this.number)
      : variant = 'number',
        date = null,
        text = '';
  const NormCell.date(this.date)
      : variant = 'date',
        number = null,
        text = '';
  const NormCell.text(this.text)
      : variant = 'text',
        number = null,
        date = null;

  bool get isEmpty => variant == 'empty';

  /// Biểu diễn chuẩn dùng để ghép key.
  String get keyText {
    switch (variant) {
      case 'number':
        return _formatNumberPlain(number ?? 0);
      case 'date':
        return date ?? '';
      default:
        return text;
    }
  }
}

/// Chuẩn hóa text (§11, §13).
String normalizeText(
  String input, {
  required bool ignoreCase,
  required bool trimSpaces,
  required bool normalizeUnicode,
}) {
  var s = input;
  if (trimSpaces) {
    s = s.trim().replaceAll(RegExp(r'\s+'), ' ');
  }
  // Lowercase TRƯỚC khi bỏ dấu, vì bảng bỏ dấu chỉ chứa chữ thường.
  if (ignoreCase) {
    s = s.toLowerCase();
  }
  if (normalizeUnicode) {
    s = _stripDiacritics(s);
  }
  return s;
}

const _diacriticsPattern =
    'àáảãạăắằẳẵặâấầẩẫậèéẻẽẹêếềểễệìíỉĩịòóỏõọôốồổỗộơớờởỡợùúủũụưứừửữựỳýỷỹỵđ';
const _diacriticsReplacement =
    'aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyyd';

/// Bỏ dấu tiếng Việt.
String _stripDiacritics(String input) {
  final buffer = StringBuffer();
  for (final rune in input.runes) {
    final ch = String.fromCharCode(rune);
    final idx = _diacriticsPattern.indexOf(ch);
    buffer.write(idx >= 0 ? _diacriticsReplacement[idx] : ch);
  }
  return buffer.toString();
}

/// Lọc ra ký tự tiền tệ và khoảng trắng.
/// KHÔNG được lọc chữ cái — mã chứng từ như "CT01" phải giữ nguyên,
/// nếu không nó sẽ thành "01" và được hiểu là số 1.
String _stripCurrency(String s) {
  var t = s.replaceAll(RegExp(r'\s'), '');
  t = t.replaceAll(RegExp(r'[₫đ$€£¥%]', caseSensitive: false), '');
  t = t.replaceFirst(RegExp(r'^(VND|USD|CNY|JPY|EUR|GBP)', caseSensitive: false), '');
  t = t.replaceFirst(RegExp(r'(VND|USD|CNY|JPY|EUR|GBP)$', caseSensitive: false), '');
  return t;
}

/// Parse một chuỗi số — hỗ trợ 1,250,000 / 1.250.000 / 1 250 000 / (100000) (§11, §42).
double? parseNumber(String input, {bool accountingNegative = true}) {
  final s0 = input.trim();
  if (s0.isEmpty) return null;
  var s = _stripCurrency(s0);
  if (s.isEmpty) return null;

  var negative = false;
  if (accountingNegative && s.startsWith('(') && s.endsWith(')') && s.length >= 3) {
    negative = true;
    s = s.substring(1, s.length - 1);
  }

  if (s.startsWith('+')) {
    s = s.substring(1);
  } else if (s.startsWith('-')) {
    negative = !negative;
    s = s.substring(1);
  }
  if (s.isEmpty) return null;

  final lastComma = s.lastIndexOf(',');
  final lastDot = s.lastIndexOf('.');

  String intPart;
  String decPart = '';

  if (lastComma == -1 && lastDot == -1) {
    intPart = s;
  } else {
    final isCommaSlash = lastComma > lastDot;
    final slash = isCommaSlash ? lastComma : lastDot;
    final rest = s.substring(slash + 1);
    final slashCount =
        (isCommaSlash ? ','.allMatches(s).length : '.'.allMatches(s).length);
    if (rest.length == 3 && slashCount >= 2 && rest == _pad3(rest)) {
      // Châu Âu/VN: 1.250.000 hoặc 1,250,000 → hàng nghìn
      intPart = s.replaceAll(isCommaSlash ? ',' : '.', '');
    } else if (rest.length == 3 && slashCount == 1) {
      intPart = s.replaceAll(isCommaSlash ? ',' : '.', '');
    } else {
      intPart = s.substring(0, slash).replaceAll(isCommaSlash ? '.' : ',', '');
      decPart = rest;
    }
  }

  if (intPart.isEmpty && decPart.isEmpty) return null;
  double? value;
  if (decPart.isEmpty) {
    value = double.tryParse(intPart);
  } else {
    value = double.tryParse('$intPart.$decPart');
  }
  if (value == null) return null;
  return negative ? -value : value;
}

String _pad3(String s) => s;

/// Parse ngày từ nhiều định dạng (§11).
final List<String> _datePatterns = [
  'yyyy-MM-dd',
  'yyyy/MM/dd',
  'yyyy.MM.dd',
  'dd/MM/yyyy',
  'dd-MM-yyyy',
  'dd.MM.yyyy',
  'd/M/yyyy',
  'M/d/yyyy',
  'd-M-yyyy',
  'yyyy-MM-ddTHH:mm:ss',
  'yyyy-MM-dd HH:mm:ss',
  'yyyy-MM-dd HH:mm',
  'yyyy/MM/dd HH:mm:ss',
  'dd/MM/yyyy HH:mm:ss',
  'dd-MM-yyyy HH:mm:ss',
  'dd/MM/yyyy HH:mm',
  'dd-MM-yyyy HH:mm',
];

DateTime? parseDate(String input, {bool lenient = true}) {
  final s = input.trim();
  if (s.isEmpty) return null;
  // 8 chữ số liên tiếp: yyyyMMdd
  if (RegExp(r'^\d{8}$').hasMatch(s)) {
    final y = int.parse(s.substring(0, 4));
    final m = int.parse(s.substring(4, 6));
    final d = int.parse(s.substring(6, 8));
    try {
      return DateTime(y, m, d);
    } catch (_) {
      return null;
    }
  }
  for (final pattern in _datePatterns) {
    try {
      final fmt = DateFormat(pattern, 'en_US');
      final d = fmt.parse(s, lenient);
      // Kiểm tra ngược: format lại phải khớp chính xác input, nếu không thì
      // pattern này không phải định dạng thật (tránh 31/08/2026 bị "yyyy-M-dd" nuốt).
      if (fmt.format(d) == s) return _asLocal(d);
    } catch (_) {
      // thử tiếp pattern khác
    }
  }
  return null;
}

/// Chuyển DateTime (có thể là UTC từ intl) về local nhưng giữ nguyên giá trị
/// các thành phần giờ/phút/giây — so sánh ngày phải độc lập với timezone.
DateTime _asLocal(DateTime d) =>
    DateTime(d.year, d.month, d.day, d.hour, d.minute, d.second, d.millisecond);

/// Chuẩn hóa một ô thành NormCell theo config hiệu lực.
NormCell normalizeCell(dynamic value, CompareConfig cfg) {
  if (value == null) return const NormCell.empty();
  if (value is num) {
    if (cfg.normalizeNumbers) return NormCell.number(value.toDouble());
    return NormCell.text(value.toString());
  }
  if (value is bool) return NormCell.text(value.toString());

  final raw = value.toString().trim();
  if (raw.isEmpty) return const NormCell.empty();
  if (cfg.treatDashAsEmpty && raw == '-') return const NormCell.empty();
  if (cfg.treatNaAsEmpty) {
    final lower = raw.toLowerCase();
    if (lower == 'n/a' || lower == 'na') return const NormCell.empty();
  }

  // Chuỗi ngày dạng 31/01/2026, 2026-01-31, 10:30, yyyyMMdd chứa dấu phân
  // tách ngày nên phải xử lý NGÀY TRƯỚC số. Dấu '-' đứng đầu (số âm -1000)
  // hoặc sau chữ cái (mã HD-2026) thì không xem là ngày.
  final dateLike = raw.contains('/') ||
      RegExp(r'\d[-:]').hasMatch(raw) ||
      RegExp(r'^\d{8}$').hasMatch(raw);

  if (cfg.normalizeNumbers && !dateLike) {
    final n = parseNumber(raw, accountingNegative: cfg.accountingNegative);
    if (n != null) return NormCell.number(n);
  }

  if (cfg.normalizeDates && dateLike) {
    final d = parseDate(raw);
    if (d != null) {
      return NormCell.date(_formatDateKey(d));
    }
  }

  final t = normalizeText(
    raw,
    ignoreCase: cfg.ignoreCase,
    trimSpaces: cfg.trimSpaces,
    normalizeUnicode: cfg.normalizeUnicode,
  );
  return NormCell.text(t);
}

String _formatDateKey(DateTime d) {
  return '${_d2(d.year)}-${_d2(d.month)}-${_d2(d.day)}';
}

String _d2(int n) => n.toString().padLeft(2, '0');

String _formatNumberPlain(double n) {
  if (n == n.roundToDouble() && n.abs() < 1e15) {
    return n.round().toString();
  }
  return n.toString();
}

/// Làm tròn theo số chữ số thập phân của config (§43).
double roundToPlaces(double value, int places) {
  final f = double.parse(value.toStringAsFixed(places));
  return f;
}