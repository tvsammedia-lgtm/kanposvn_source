import 'package:intl/intl.dart';

class AppFormatters {
  static final NumberFormat _currencyFormatter = NumberFormat.currency(
    locale: 'vi_VN', symbol: 'đ', decimalDigits: 0,
  );

  static String formatCurrency(double amount) => _currencyFormatter.format(amount);

  static String formatCurrencyShort(double amount) {
    if (amount >= 1000000000) return '${(amount / 1000000000).toStringAsFixed(1)} tỷ';
    if (amount >= 1000000) return '${(amount / 1000000).toStringAsFixed(1)} tr';
    return _currencyFormatter.format(amount);
  }

  static String formatDate(DateTime date) => DateFormat('dd/MM/yyyy').format(date);

  static String formatDateTime(DateTime dateTime) => DateFormat('dd/MM/yyyy HH:mm').format(dateTime);

  static String formatShortTime(DateTime dateTime) => DateFormat('HH:mm').format(dateTime);

  static String formatMonth(int year, int month) =>
      'Tháng ${month.toString().padLeft(2, '0')}/$year';
}
