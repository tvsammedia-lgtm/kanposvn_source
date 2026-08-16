import 'package:intl/intl.dart';

import '../../../core/auth/auth_service.dart';
import '../../../core/printer/receipt_data.dart';
import '../models/hotel_service.dart';

final _fmt = DateFormat('dd/MM/yyyy HH:mm');

/// Xây dựng [ReceiptData] hóa đơn thanh toán khách sạn từ các thành phần đã
/// biết. Dùng ở cả THỜI ĐIỂM checkout (in lúc thu tiền — có số tiền khách
/// đưa / tiền thừa) và THỜI ĐIỂM in lại hóa đơn cũ (chỉ in các khoản mà
/// không cần cashReceived/change) để công thức tính tiền luôn đồng nhất.
///
/// Quy tắc tính: amountDue = (phòng + dịch vụ) − giảm giá − đã cọc.
Future<ReceiptData> buildHotelReceiptData({
  required double gross,
  required double discount,
  required double prePaid,
  required List<ReceiptItem> items,
  required String checkInId,
  required String customerName,
  required String roomName,
  required DateTime checkInTime,
  required DateTime checkoutTime,
  double? cashReceived,
  String? paymentMethod,
  String? shopName,
  String? shopPhone,
}) async {
  final resolvedShopName = shopName ?? await AuthService.loadSavedStoreName();
  final resolvedShopPhone = shopPhone ?? await AuthService.loadSavedStorePhone();

  final amountDue = (gross - discount - prePaid).clamp(0.0, double.infinity);
  final received = (cashReceived ?? amountDue);
  final change = (received - amountDue).clamp(0.0, double.infinity);

  final orderCode = checkInId.length > 8
      ? checkInId.substring(0, 8)
      : checkInId;

  String prePaidNote = '';
  if (prePaid > 0) {
    prePaidNote = ' | Đã cọc: ${prePaid.toStringAsFixed(0)}đ | Còn lại: ${amountDue.toStringAsFixed(0)}đ';
  }

  return ReceiptData(
    shopName: resolvedShopName ?? 'KANPOSVN KHÁCH SẠN',
    shopPhone: resolvedShopPhone,
    title: 'HÓA ĐƠN THANH TOÁN',
    orderCode: orderCode,
    date: DateTime.now(),
    customer: customerName.isEmpty ? 'Khách vãng lai' : customerName,
    table: 'Phòng $roomName',
    paymentMethod: paymentMethod,
    items: items,
    subtotal: gross,
    discount: discount,
    grandTotal: amountDue,
    cashReceived: cashReceived,
    change: change,
    qrData: checkInId,
    note: 'Giờ vào: ${_fmt.format(checkInTime)} | Giờ ra: ${_fmt.format(checkoutTime)}$prePaidNote',
  );
}

/// Đốnh dạng hàng dịch vụ thành [ReceiptItem] cho hóa đơn.
List<ReceiptItem> serviceItemsToReceiptItems(
    List<RoomServiceOrderItem> orderItems) {
  return orderItems
      .map((oi) => ReceiptItem(
            name: (oi.serviceItem.value?.itemName ?? ''),
            quantity: oi.quantity.toDouble(),
            unitPrice: oi.unitPrice,
            total: oi.totalPrice,
          ))
      .toList();
}
