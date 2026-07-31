import 'dart:math';

class IdGenerator {
  static final _random = Random();

  static String generateId([String prefix = 'ID']) {
    final ts = DateTime.now().millisecondsSinceEpoch;
    final r = _random.nextInt(9000) + 1000;
    return '$prefix-$ts-$r';
  }

  static String generateInvoiceCode() {
    final now = DateTime.now();
    final d = '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
    return 'HD-$d-${_random.nextInt(900) + 100}';
  }

  static String generatePurchaseCode() {
    final now = DateTime.now();
    final d = '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
    return 'PN-$d-${_random.nextInt(900) + 100}';
  }

  static String generateMedicineCode() => 'TH-${_random.nextInt(89999) + 10000}';

  static String generatePatientCode() => 'BN-${_random.nextInt(89999) + 10000}';

  static String generateEmployeeCode() => 'NV-${_random.nextInt(89999) + 10000}';

  static String generateOrderCode(String prefix) => '$prefix-${DateTime.now().millisecondsSinceEpoch}-${_random.nextInt(900) + 100}';
}
