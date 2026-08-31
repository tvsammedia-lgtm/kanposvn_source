import 'package:intl/intl.dart';

/// Hiển thị giá trị cell (số được format phân cách hàng nghìn).
String valueText(dynamic value) {
  if (value == null) return '';
  if (value is num) {
    return NumberFormat.decimalPattern('vi').format(value);
  }
  return value.toString();
}

String iconFor(dynamic value) => valueText(value);

String dateTimeText(DateTime dt) {
  return DateFormat('dd/MM/yyyy HH:mm:ss').format(dt);
}

String dateText(DateTime dt) {
  return DateFormat('dd/MM/yyyy').format(dt);
}