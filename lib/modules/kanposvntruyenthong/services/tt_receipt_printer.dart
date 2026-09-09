import '../../../core/auth/auth_service.dart';
import '../../../core/printer/receipt_data.dart';
import '../models/tt_order.dart';

/// Dựng dữ liệu in PDF hóa đơn bán lẻ từ hóa đơn vừa thanh toán.
Future<ReceiptData> buildTtReceiptData(
  TtSalesInvoice invoice,
  List<TtSalesItem> items, {
  String? customerName,
}) async {
  final storeName = await AuthService.loadSavedStoreName();
  final ownerName = await AuthService.loadSavedOwnerName();
  final storePhone = await AuthService.loadSavedStorePhone();

  return ReceiptData(
    shopName: storeName ?? 'KANPOSVN TRUYỀN THÔNG',
    shopOwnerName: ownerName,
    shopPhone: storePhone,
    title: 'HÓA ĐƠN BÁN LẺ',
    orderCode: invoice.invoiceNumber,
    date: invoice.saleDate,
    customer: customerName ?? '',
    paymentMethod: invoice.paymentMethod.label,
    qrData: invoice.invoiceId,
    items: items
        .map((item) => ReceiptItem(
              name: item.product.value?.name ?? 'Sản phẩm',
              quantity: item.quantity,
              unitPrice: item.unitPrice,
              total: item.amount,
            ))
        .toList(),
    subtotal: invoice.subtotal,
    discount: invoice.discount + invoice.loyaltyDiscount,
    grandTotal: invoice.totalAmount,
    cashReceived: invoice.paidAmount,
    change: (invoice.paidAmount - invoice.totalAmount).clamp(0, double.infinity),
    note: invoice.note,
    footer: 'Cảm ơn quý khách!',
  );
}