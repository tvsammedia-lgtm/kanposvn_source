import 'package:intl/intl.dart';
import '../models/isar_models.dart';

class ReceiptPrinterService {
  final currencyFormatter = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
  final dateTimeFormatter = DateFormat('dd/MM/yyyy HH:mm');

  /// Formats order text for 58mm / 80mm thermal receipt printer preview
  String generateThermalReceiptText(OrderModel order, {String paperSize = '80mm'}) {
    final int width = paperSize == '58mm' ? 32 : 42;
    final String lineDivider = '-' * width;
    final String doubleDivider = '=' * width;

    final buffer = StringBuffer();

    // Header
    buffer.writeln(_centerText('KÀN CAFE & TRÀ SỮA', width));
    buffer.writeln(_centerText('ĐC: 123 Đường Trà Sữa, Q.1, TP.HCM', width));
    buffer.writeln(_centerText('Hotline: 0908.123.456', width));
    buffer.writeln(doubleDivider);

    buffer.writeln(_centerText('HÓA ĐƠN THÀNH TOÁN', width));
    buffer.writeln('Mã HD: ${order.orderCode}');
    buffer.writeln('Ngày: ${dateTimeFormatter.format(order.createdAt)}');
    if (order.occupiedAt != null) {
      buffer.writeln('Giờ vào: ${dateTimeFormatter.format(order.occupiedAt!)}');
    }
    if (order.paidAt != null) {
      buffer.writeln('Giờ ra: ${dateTimeFormatter.format(order.paidAt!)}');
    }
    buffer.writeln('Loại: ${order.type.label}${order.tableName != null ? " - ${order.tableName}" : ""}');
    if (order.customerName != null && order.customerName!.isNotEmpty) {
      buffer.writeln('Khách hàng: ${order.customerName}');
    }
    buffer.writeln('Thu ngân: ${order.createdBy}');
    buffer.writeln(lineDivider);

    // Items
    buffer.writeln(_formatRow('Tên món', 'SL', 'Thành tiền', width));
    buffer.writeln(lineDivider);

    for (var item in order.items) {
      String itemTitle = item.productName;
      if (item.sizeName != 'M') itemTitle += ' (Size ${item.sizeName})';
      buffer.writeln(itemTitle);

      // Toppings
      if (item.selectedToppings.isNotEmpty) {
        String toppingsStr = ' + ' + item.selectedToppings.map((t) => t.name).join(', ');
        buffer.writeln('  $toppingsStr');
      }

      if (item.note.isNotEmpty) {
        buffer.writeln('  * Ghi chú: ${item.note}');
      }

      String slStr = '${item.quantity} x ${currencyFormatter.format(item.itemUnitPrice)}';
      String priceStr = currencyFormatter.format(item.totalPrice);
      buffer.writeln(_formatRow('  $slStr', '', priceStr, width));
    }

    buffer.writeln(lineDivider);

    // Summary
    buffer.writeln(_formatRow('Tạm tính:', '', currencyFormatter.format(order.subtotal), width));

    if (order.discountAmount > 0 || order.discountPercent > 0) {
      String discLabel = 'Giảm giá';
      if (order.discountPercent > 0) discLabel += ' (${order.discountPercent.toInt()}%)';
      buffer.writeln(_formatRow('$discLabel:', '', '-${currencyFormatter.format(order.discountAmount)}', width));
    }

    if (order.deliveryFee > 0) {
      buffer.writeln(_formatRow('Phí giao hàng:', '', currencyFormatter.format(order.deliveryFee), width));
    }

    buffer.writeln(doubleDivider);
    buffer.writeln(_formatRow('TỔNG CỘNG:', '', currencyFormatter.format(order.totalAmount), width));
    buffer.writeln(doubleDivider);

    buffer.writeln('Thanh toán: ${order.paymentMethod}');
    buffer.writeln('Trạng thái: ${order.paymentStatus == "PAID" ? "ĐÃ THANH TOÁN" : "CHƯA THANH TOÁN"}');
    buffer.writeln(lineDivider);

    // Footer
    buffer.writeln(_centerText('Cảm ơn Quý khách & Hẹn gặp lại!', width));
    buffer.writeln(_centerText('Wifi: KanCafe_5G / Pass: 88888888', width));

    return buffer.toString();
  }

  String _centerText(String text, int width) {
    if (text.length >= width) return text;
    int leftPadding = (width - text.length) ~/ 2;
    return ' ' * leftPadding + text;
  }

  String _formatRow(String left, String center, String right, int width) {
    int availableWidth = width - left.length - right.length;
    if (availableWidth <= 0) {
      return '$left $right';
    }
    return '$left${' ' * availableWidth}$right';
  }
}
