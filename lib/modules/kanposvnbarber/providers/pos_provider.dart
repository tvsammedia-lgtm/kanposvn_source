import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/barber_invoice_detail.dart';
import '../models/barber_invoice.dart';

class PosState {
  final BarberInvoice invoice;
  final List<BarberInvoiceDetail> details;

  PosState({required this.invoice, required this.details});

  PosState copyWith({BarberInvoice? invoice, List<BarberInvoiceDetail>? details}) {
    return PosState(
      invoice: invoice ?? this.invoice,
      details: details ?? this.details,
    );
  }

  double get subTotal => details.fold(0, (sum, item) => sum + item.total);
  double get total => subTotal - invoice.discount;
}

class PosNotifier extends StateNotifier<PosState> {
  PosNotifier()
      : super(PosState(
          invoice: BarberInvoice()..invoiceId = 'INV-${DateTime.now().millisecondsSinceEpoch}',
          details: [],
        ));

  void setCustomer(String customerId, String customerName) {
    state = state.copyWith(
      invoice: state.invoice
        ..customerId = customerId
        ..customerName = customerName,
    );
  }

  void addItem(String itemId, String itemName, String itemType, double unitPrice, {String? employeeId}) {
    final newDetails = List<BarberInvoiceDetail>.from(state.details);
    
    // Kiểm tra xem đã có trong giỏ chưa
    final existingIndex = newDetails.indexWhere((d) => d.itemId == itemId);
    if (existingIndex >= 0) {
      final existing = newDetails[existingIndex];
      existing.quantity += 1;
      existing.total = existing.quantity * existing.unitPrice;
    } else {
      newDetails.add(BarberInvoiceDetail()
        ..invoiceId = state.invoice.invoiceId
        ..itemId = itemId
        ..itemName = itemName
        ..itemType = itemType
        ..unitPrice = unitPrice
        ..quantity = 1
        ..total = unitPrice
        ..employeeId = employeeId);
    }
    
    _updateTotals(newDetails);
  }

  void removeItem(String itemId) {
    final newDetails = List<BarberInvoiceDetail>.from(state.details)..removeWhere((d) => d.itemId == itemId);
    _updateTotals(newDetails);
  }

  void updateDiscount(double discount) {
    state = state.copyWith(
      invoice: state.invoice..discount = discount,
    );
  }

  void _updateTotals(List<BarberInvoiceDetail> newDetails) {
    final double subTotal = newDetails.fold(0, (sum, item) => sum + item.total);
    final invoice = state.invoice
      ..subTotal = subTotal
      ..total = subTotal - state.invoice.discount;

    state = state.copyWith(details: newDetails, invoice: invoice);
  }

  void clearCart() {
    state = PosState(
      invoice: BarberInvoice()..invoiceId = 'INV-${DateTime.now().millisecondsSinceEpoch}',
      details: [],
    );
  }
}

final posProvider = StateNotifierProvider<PosNotifier, PosState>((ref) {
  return PosNotifier();
});
