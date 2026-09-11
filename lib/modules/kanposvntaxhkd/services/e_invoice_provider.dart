class EInvoiceRequest {}
class EInvoiceResult {}
class AdjustmentRequest {}
class ReplacementRequest {}
class EInvoiceStatus {}
class EInvoiceSearchRequest {}

abstract class EInvoiceProvider {
  Future<EInvoiceResult> issue(EInvoiceRequest request);
  Future<EInvoiceResult> cancel(String invoiceId);
  Future<EInvoiceResult> adjust(String invoiceId, AdjustmentRequest request);
  Future<EInvoiceResult> replace(String invoiceId, ReplacementRequest request);
  Future<EInvoiceStatus> getStatus(String invoiceId);
  Future<List<EInvoiceResult>> search(EInvoiceSearchRequest request);
}
