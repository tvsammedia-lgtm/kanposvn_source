import 'package:intl/intl.dart';

import '../../../core/auth/auth_service.dart';
import '../../../core/printer/receipt_data.dart';
import '../../../core/utils/formatters.dart';
import '../models/hotel_checkin_checkout.dart';
import '../models/hotel_service.dart';

final _fmt = DateFormat('dd/MM/yyyy HH:mm');

/// Tính thời gian lưu trú dạng读人类-readable.
/// Trả về chuỗi như "2 giờ 30 phút", "1 ngày 3 giờ", "Qua đêm (11h45p)".
String _formatDuration(Duration diff, RentalType rentalType) {
  final hours = diff.inHours;
  final minutes = diff.inMinutes % 60;
  final days = diff.inDays;

  switch (rentalType) {
    case RentalType.HOURLY:
      if (hours > 0) return '$hours giờ $minutes phút';
      return '$minutes phút';
    case RentalType.OVERNIGHT:
      return 'Qua đêm (${hours}h${minutes.toString().padLeft(2, '0')}p)';
    case RentalType.DAILY:
      if (days > 0) {
        if (hours % 24 > 0) return '$days ngày ${hours % 24} giờ';
        return '$days ngày';
      }
      return '$hours giờ $minutes phút';
  }
}

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
  required RentalType rentalType,
  double? cashReceived,
  String? paymentMethod,
  String? shopName,
  String? shopPhone,
}) async {
  final resolvedShopName = shopName ?? await AuthService.loadSavedStoreName();
  final resolvedShopPhone = shopPhone ?? await AuthService.loadSavedStorePhone();

  final amountDue = safeDouble(gross - discount - prePaid);
  final received = (cashReceived ?? amountDue);
  final change = safeDouble(received - amountDue);

  final orderCode = checkInId.length > 8
      ? checkInId.substring(0, 8)
      : checkInId;

  String prePaidNote = '';
  if (prePaid > 0) {
    prePaidNote = ' | Đã cọc: ${prePaid.toStringAsFixed(0)}đ | Còn lại: ${amountDue.toStringAsFixed(0)}đ';
  }

  final elapsed = checkoutTime.difference(checkInTime);
  final durationStr = _formatDuration(elapsed, rentalType);

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
    note: 'Thuê: ${rentalType.label} | Thời gian: $durationStr\nGiờ vào: ${_fmt.format(checkInTime)} | Giờ ra: ${_fmt.format(checkoutTime)}$prePaidNote',
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
