class ReceiptItem {
  const ReceiptItem({
    required this.name,
    required this.quantity,
    required this.unitPrice,
    required this.total,
    this.extra = '',
  });

  final String name;
  final double quantity;
  final double unitPrice;
  final double total;
  final String extra;
}

class ReceiptData {
  const ReceiptData({
    this.shopName,
    this.shopOwnerName,
    this.shopPhone,
    this.shopAddress,
    this.shopTaxCode,
    this.einvoicePattern,
    this.einvoiceSymbol,
    this.einvoiceNumber,
    this.title = 'HÓA ĐƠN',
    this.orderCode,
    this.date,
    this.customer = '',
    this.table = '',
    this.paymentMethod,
    required this.items,
    this.subtotal = 0,
    this.discount = 0,
    this.vat = 0,
    this.grandTotal = 0,
    this.cashReceived,
    this.change,
    this.note = '',
    this.qrData,
    this.footer = 'Cảm ơn quý khách và hẹn gặp lại!',
  });

  final String? shopName;
  final String? shopOwnerName;
  final String? shopPhone;
  final String? shopAddress;
  final String? shopTaxCode;
  final String? einvoicePattern;
  final String? einvoiceSymbol;
  final String? einvoiceNumber;
  final String title;
  final String? orderCode;
  final DateTime? date;
  final String customer;
  final String table;
  final String? paymentMethod;
  final List<ReceiptItem> items;
  final double subtotal;
  final double discount;
  final double vat;
  final double grandTotal;
  final double? cashReceived;
  final double? change;
  final String note;
  final String? qrData;
  final String footer;
}
