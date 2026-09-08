import 'dart:convert';
import 'dart:math' as math;

import 'package:uuid/uuid.dart';

import '../models/nongsan_accounting.dart';
import '../models/nongsan_finance.dart';
import '../models/nongsan_inventory_sales.dart';
import '../models/nongsan_partner.dart';
import '../models/nongsan_product.dart';
import '../models/nongsan_purchase.dart';
import 'nongsan_isar_service.dart';

/// Trạng thái chứng từ chuẩn (§48).
abstract final class NongSanDocStatus {
  static const draft = 'DRAFT';
  static const pending = 'PENDING';
  static const approved = 'APPROVED';
  static const posted = 'POSTED';
  static const paid = 'PAID';
  static const partial = 'PARTIAL';
  static const cancelled = 'CANCELLED';
  static const locked = 'LOCKED';

  /// Không cho xóa chứng từ đã ghi sổ (§48).
  static bool isPostedOrLocked(String status) =>
      status == posted || status == locked;
}

/// Nghiệp vụ Đại lý Nông Sản theo agri_trade_manager_spec.md.
///
/// Quy tắc (§50): không sửa trực tiếp chứng từ đã POSTED; điều chỉnh bằng
/// chứng từ mới; mọi nghiệp vụ tài chính phải tạo bút toán cân bằng (§49).
/// Các luồng xử lý quan trọng ghi một batch trong một transaction (§53).
class NongSanBusinessLogic {
  final NongSanIsarService service;
  NongSanBusinessLogic(this.service);

  static const _cSupplier = 'NongSanSupplier';
  static const _cCustomer = 'NongSanCustomer';
  static const _cProduct = 'NongSanProduct';
  static const _cQuality = 'NongSanProductQuality';
  static const _cWarehouse = 'NongSanWarehouse';
  static const _cWeigh = 'NongSanWeighingTicket';
  static const _cInspect = 'NongSanQualityInspection';
  static const _cPo = 'NongSanPurchaseOrder';
  static const _cReceipt = 'NongSanPurchaseReceipt';
  static const _cLot = 'NongSanLot';
  static const _cTx = 'NongSanStockTransaction';
  static const _cIssue = 'NongSanStockIssue';
  static const _cTransfer = 'NongSanStockTransfer';
  static const _cAdjust = 'NongSanStockAdjustment';
  static const _cSalesOrder = 'NongSanSalesOrder';
  static const _cInvoice = 'NongSanSalesInvoice';
  static const _cReturn = 'NongSanSalesReturn';
  static const _cPayment = 'NongSanPayment';
  static const _cExpense = 'NongSanExpense';
  static const _cJournal = 'NongSanJournalEntry';

  /// Tài khoản kế toán mặc định theo §17.1 / §29.
  static const accCash = '111';
  static const accBank = '112';
  static const accReceivable = '131';
  static const accInputVat = '133';
  static const accInventory = '156';
  static const accPayable = '331';
  static const accOutputVat = '333';
  static const accRevenue = '511';
  static const accCogs = '632';
  static const accSelling = '641';
  static const accAdmin = '642';

  static const _uuid = Uuid();
  double _r2(double v) => (v * 100).roundToDouble() / 100;
  String _gen(String prefix) => '$prefix-${_uuid.v4().substring(0, 12)}';
  static String _stamp(DateTime t) =>
      '${t.year}${t.month.toString().padLeft(2, '0')}${t.day.toString().padLeft(2, '0')}';

  // ────────────────────────── READ HELPERS ───────────────────────────
  Future<List<T>> _all<T>(String col, T Function(Map<String, dynamic>) fromJson) async {
    final docs = await service.getDocuments(col);
    return docs
        .map((d) => fromJson(jsonDecode(d.jsonData) as Map<String, dynamic>))
        .toList();
  }

  Future<T?> _byId<T>(String col, String id, T Function(Map<String, dynamic>) fromJson) async {
    final doc = await service.getDocumentById(id);
    if (doc == null) return null;
    return fromJson(jsonDecode(doc.jsonData) as Map<String, dynamic>);
  }

  Future<void> _writeAll(Iterable<NongSanDocWrite> writes) =>
      service.batchSave(writes.toList());

  // ────────────────────────── CATALOG (§5-8) ─────────────────────────
  Future<List<NongSanSupplier>> suppliers() => _all(_cSupplier, NongSanSupplier.fromJson);
  Future<List<NongSanCustomer>> customers() => _all(_cCustomer, NongSanCustomer.fromJson);
  Future<List<NongSanProduct>> products() => _all(_cProduct, NongSanProduct.fromJson);
  Future<List<NongSanProductQuality>> qualities() => _all(_cQuality, NongSanProductQuality.fromJson);
  Future<List<NongSanWarehouse>> warehouses() => _all(_cWarehouse, NongSanWarehouse.fromJson);
  Future<List<NongSanLot>> lots() => _all(_cLot, NongSanLot.fromJson);
  Future<List<NongSanWeighingTicket>> weighingTickets() => _all(_cWeigh, NongSanWeighingTicket.fromJson);
  Future<List<NongSanQualityInspection>> inspections() => _all(_cInspect, NongSanQualityInspection.fromJson);
  Future<List<NongSanPurchaseReceipt>> receipts() => _all(_cReceipt, NongSanPurchaseReceipt.fromJson);
  Future<List<NongSanPurchaseOrder>> purchaseOrders() => _all(_cPo, NongSanPurchaseOrder.fromJson);
  Future<List<NongSanStockTransaction>> stockTransactions() => _all(_cTx, NongSanStockTransaction.fromJson);
  Future<List<NongSanStockIssue>> stockIssues() => _all(_cIssue, NongSanStockIssue.fromJson);
  Future<List<NongSanStockTransfer>> stockTransfers() => _all(_cTransfer, NongSanStockTransfer.fromJson);
  Future<List<NongSanStockAdjustment>> stockAdjustments() => _all(_cAdjust, NongSanStockAdjustment.fromJson);
  Future<List<NongSanSalesOrder>> salesOrders() => _all(_cSalesOrder, NongSanSalesOrder.fromJson);
  Future<List<NongSanSalesInvoice>> invoices() => _all(_cInvoice, NongSanSalesInvoice.fromJson);
  Future<List<NongSanSalesReturn>> salesReturns() => _all(_cReturn, NongSanSalesReturn.fromJson);
  Future<List<NongSanPayment>> payments() => _all(_cPayment, NongSanPayment.fromJson);
  Future<List<NongSanExpense>> expenses() => _all(_cExpense, NongSanExpense.fromJson);
  Future<List<NongSanJournalEntry>> journals() => _all(_cJournal, NongSanJournalEntry.fromJson);

  Future<NongSanSupplier?> supplierById(String id) =>
      _byId(_cSupplier, id, NongSanSupplier.fromJson);
  Future<NongSanCustomer?> customerById(String id) =>
      _byId(_cCustomer, id, NongSanCustomer.fromJson);
  Future<NongSanProduct?> productById(String id) =>
      _byId(_cProduct, id, NongSanProduct.fromJson);
  Future<NongSanWarehouse?> warehouseById(String id) =>
      _byId(_cWarehouse, id, NongSanWarehouse.fromJson);
  Future<NongSanLot?> lotById(String id) => _byId(_cLot, id, NongSanLot.fromJson);
  Future<NongSanSalesInvoice?> invoiceById(String id) =>
      _byId(_cInvoice, id, NongSanSalesInvoice.fromJson);
  Future<NongSanSalesOrder?> salesOrderById(String id) =>
      _byId(_cSalesOrder, id, NongSanSalesOrder.fromJson);
  Future<NongSanWeighingTicket?> weighingTicketById(String id) =>
      _byId(_cWeigh, id, NongSanWeighingTicket.fromJson);
  Future<NongSanPurchaseReceipt?> receiptById(String id) =>
      _byId(_cReceipt, id, NongSanPurchaseReceipt.fromJson);

  Future<void> saveSupplier(NongSanSupplier s) =>
      service.saveDocument(_cSupplier, s.id, s.toJson());
  Future<void> saveCustomer(NongSanCustomer c) =>
      service.saveDocument(_cCustomer, c.id, c.toJson());
  Future<void> saveProduct(NongSanProduct p) =>
      service.saveDocument(_cProduct, p.id, p.toJson());
  Future<void> saveProductQuality(NongSanProductQuality q) =>
      service.saveDocument(_cQuality, q.id, q.toJson());
  Future<void> saveWarehouse(NongSanWarehouse w) =>
      service.saveDocument(_cWarehouse, w.id, w.toJson());

  /// §12.1 Đơn đặt hàng nhập.
  Future<NongSanPurchaseOrder> createPurchaseOrder({
    String? id,
    required String supplierId,
    required String productId,
    String warehouseId = '',
    double expectedQuantity = 0,
    double expectedPrice = 0,
    String note = '',
    String assignee = '',
    String status = NongSanDocStatus.draft,
    DateTime? date,
  }) async {
    if (expectedQuantity <= 0) throw StateError('Số lượng đặt mua phải lớn hơn 0.');
    final order = NongSanPurchaseOrder(
      id: id ?? _gen('PO'),
      orderNumber: 'PO-${_stamp(date ?? DateTime.now())}',
      supplierId: supplierId,
      productId: productId,
      warehouseId: warehouseId,
      orderDate: date ?? DateTime.now(),
      expectedQuantity: expectedQuantity,
      expectedPrice: expectedPrice,
      status: status,
      note: note,
      assignee: assignee,
      updatedAt: date ?? DateTime.now(),
    );
    await service.saveDocument(_cPo, order.id, order.toJson());
    return order;
  }

  /// Xóa mềm (§48): không cho xóa chứng từ đã POSTED/LOCKED.
  Future<void> deleteDocument(String collection, String id) async {
    final doc = await service.getDocumentById(id);
    if (doc == null) return;
    final data = jsonDecode(doc.jsonData) as Map<String, dynamic>;
    final status = data['status'] as String? ?? '';
    if (NongSanDocStatus.isPostedOrLocked(status)) {
      throw StateError('Không thể xóa chứng từ đã ghi sổ (trạng thái $status). '
          'Chỉ được lập chứng từ điều chỉnh.');
    }
    await service.softDeleteDocument(id);
  }

  // ──────────────────────── THU MUA (§9, §42) ────────────────────────
  /// §9.2 Phiếu cân — công thức TL hàng = TL xe có hàng - TL xe không hàng - TL bì.
  Future<NongSanWeighingTicket> createWeighingTicket({
    String? id,
    required String supplierId,
    String ticketNumber = '',
    String vehiclePlate = '',
    String driverName = '',
    double grossWeight = 0,
    double tareWeight = 0,
    double packagingWeight = 0,
    DateTime? date,
  }) async {
    final suffix = (id ?? _gen('')).replaceAll('-', '').substring(0, 4).toUpperCase();
    final ticket = NongSanWeighingTicket(
      id: id ?? _gen('PC'),
      ticketNumber: ticketNumber.isEmpty
          ? 'PC-${_stamp(date ?? DateTime.now())}-$suffix'
          : ticketNumber,
      supplierId: supplierId,
      vehiclePlate: vehiclePlate,
      driverName: driverName,
      grossWeight: grossWeight,
      tareWeight: tareWeight,
      packagingWeight: packagingWeight,
      updatedAt: date,
    );
    if (ticket.netWeight < 0) {
      throw StateError('Lỗi: Trọng lượng hàng không thể âm '
          '(Gross: $grossWeight < Tare: $tareWeight + Bì: $packagingWeight).');
    }
    await service.saveDocument(_cWeigh, ticket.id, ticket.toJson());
    return ticket;
  }

  /// §9.3 Kiểm phẩm: độ ẩm, tạp chất, trừ chất lượng, giá điều chỉnh.
  Future<NongSanQualityInspection> createQualityInspection({
    String? id,
    required String weighingTicketId,
    required String productId,
    double humidity = 0,
    double impurity = 0,
    double deductedWeight = 0,
    double adjustedPrice = 0,
    String grade = '',
    DateTime? date,
  }) async {
    final ticket = await weighingTicketById(weighingTicketId);
    if (ticket == null) {
      throw StateError('Không tìm thấy phiếu cân $weighingTicketId.');
    }
    if (deductedWeight > ticket.netWeight) {
      throw StateError('Khối lượng trừ kém phẩm ($deductedWeight kg) lớn hơn '
          'trọng lượng hàng (${ticket.netWeight} kg).');
    }
    final insp = NongSanQualityInspection(
      id: id ?? _gen('KP'),
      weighingTicketId: weighingTicketId,
      productId: productId,
      humidity: humidity,
      impurity: impurity,
      deductedWeight: deductedWeight,
      adjustedPrice: adjustedPrice,
      grade: grade,
      updatedAt: date,
    );
    await service.saveDocument(_cInspect, insp.id, insp.toJson());
    return insp;
  }

  /// §9.4 Phiếu nhập mua + nhập kho + công nợ 331 + bút toán (§42, §53).
  Future<NongSanPurchaseReceipt> receivePurchase({
    String? id,
    required String supplierId,
    required String productId,
    required String warehouseId,
    String weighingTicketId = '',
    String qualityInspectionId = '',
    double finalQuantity = 0,
    double unitPrice = 0,
    double shippingFee = 0,
    double loadingFee = 0,
    double processingFee = 0,
    double vatRate = 0,
    DateTime? date,
  }) async {
    if (finalQuantity <= 0) {
      throw StateError('Số lượng nhập phải lớn hơn 0.');
    }
    if (unitPrice < 0) {
      throw StateError('Đơn giá không thể âm.');
    }
    final supplier = await _byId(_cSupplier, supplierId, NongSanSupplier.fromJson);
    if (supplier == null) throw StateError('Không tìm thấy nhà cung cấp $supplierId.');

    final receiptId = id ?? _gen('PN');
    final lotId = _gen('LOT');
    final now = date ?? DateTime.now();
    final totalAmount = _r2(finalQuantity * unitPrice);
    final grandTotal = _r2(totalAmount + shippingFee + loadingFee + processingFee);
    final inputTax = _r2(totalAmount * vatRate);
    final unitCost = _r2(grandTotal / finalQuantity);
    // Công nợ 331 = Tiền hàng + chi phí thu mua + thuế GTGT đầu vào chưa khấu trừ.
    final payable = _r2(grandTotal + inputTax);

    final receipt = NongSanPurchaseReceipt(
      id: receiptId,
      supplierId: supplierId,
      weighingTicketId: weighingTicketId,
      qualityInspectionId: qualityInspectionId,
      productId: productId,
      warehouseId: warehouseId,
      lotId: lotId,
      finalQuantity: finalQuantity,
      unitPrice: unitPrice,
      totalAmount: totalAmount,
      shippingFee: shippingFee,
      loadingFee: loadingFee,
      processingFee: processingFee,
      vatRate: vatRate,
      status: NongSanDocStatus.posted,
      updatedAt: now,
    );

    final updatedSupplier = NongSanSupplier(
      id: supplier.id,
      name: supplier.name,
      phone: supplier.phone,
      address: supplier.address,
      taxId: supplier.taxId,
      contactPerson: supplier.contactPerson,
      customerType: supplier.customerType,
      creditLimit: supplier.creditLimit,
      paymentTermDays: supplier.paymentTermDays,
      debtAmount: _r2(supplier.debtAmount + payable),
      totalPurchased: _r2(supplier.totalPurchased + payable),
      totalPaid: supplier.totalPaid,
      updatedAt: now,
      code: supplier.code,
    );

    final lot = NongSanLot(
      id: lotId,
      lotId: lotId,
      productId: productId,
      supplierId: supplierId,
      warehouseId: warehouseId,
      importDate: now,
      initialQuantity: finalQuantity,
      currentQuantity: finalQuantity,
      costPrice: unitCost,
      updatedAt: now,
    );

    final tx = NongSanStockTransaction(
      id: _gen('STX'),
      warehouseId: warehouseId,
      productId: productId,
      lotId: lotId,
      type: 'IMPORT',
      quantity: finalQuantity,
      referenceId: receiptId,
      note: 'Phiếu nhập ${receipt.receiptNumber}',
      timestamp: now,
    );

    // Bút toán tự động MUA HÀNG (§18.2): Nợ 156 + Nợ 133 / Có 331.
    final journal = await _journal(
      refType: 'PURCHASE',
      refId: receiptId,
      narration: 'Nhập mua $productId từ $supplierId',
      date: now,
      lines: [
        NongSanJournalLine(
            accountCode: accInventory, accountName: 'Hàng hóa',
            debit: grandTotal, partnerId: supplierId),
        NongSanJournalLine(
            accountCode: accInputVat, accountName: 'Thuế GTGT được khấu trừ',
            debit: inputTax, partnerId: supplierId),
        NongSanJournalLine(
            accountCode: accPayable, accountName: 'Phải trả người bán',
            credit: _r2(grandTotal + inputTax), partnerId: supplierId),
      ],
    );

    await _writeAll([
      NongSanDocWrite(_cSupplier, updatedSupplier.id, updatedSupplier.toJson()),
      NongSanDocWrite(_cReceipt, receipt.id, receipt.toJson()),
      NongSanDocWrite(_cLot, lot.id, lot.toJson()),
      NongSanDocWrite(_cTx, tx.id, tx.toJson()),
      NongSanDocWrite(_cJournal, journal.id, journal.toJson()),
    ]);
    return receipt;
  }

  /// §14 Thanh toán nhà cung cấp: Nợ 331 / Có 111|112.
  Future<NongSanPayment> paySupplier({
    String? id,
    required String supplierId,
    double amount = 0,
    String method = 'CASH',
    String note = '',
    DateTime? date,
  }) async {
    if (amount <= 0) throw StateError('Số tiền thanh toán phải lớn hơn 0.');
    final supplier = await _byId(_cSupplier, supplierId, NongSanSupplier.fromJson);
    if (supplier == null) throw StateError('Không tìm thấy nhà cung cấp $supplierId.');

    final now = date ?? DateTime.now();
    final payment = NongSanPayment(
      id: id ?? _gen('PC'),
      kind: 'SUPPLIER_PAYMENT',
      partnerId: supplierId,
      direction: 'OUT',
      method: method,
      amount: amount,
      note: note,
      timestamp: now,
    );
    final updated = NongSanSupplier(
      id: supplier.id,
      name: supplier.name,
      phone: supplier.phone,
      address: supplier.address,
      taxId: supplier.taxId,
      contactPerson: supplier.contactPerson,
      customerType: supplier.customerType,
      creditLimit: supplier.creditLimit,
      paymentTermDays: supplier.paymentTermDays,
      debtAmount: _r2(math.max(0, supplier.debtAmount - amount)),
      totalPurchased: supplier.totalPurchased,
      totalPaid: _r2(supplier.totalPaid + amount),
      updatedAt: now,
      code: supplier.code,
    );
    final journal = await _journal(
      refType: 'PAYMENT',
      refId: payment.id,
      narration: 'Thanh toán nhà cung cấp $supplierId',
      date: now,
      lines: [
        NongSanJournalLine(
            accountCode: accPayable, accountName: 'Phải trả người bán',
            debit: amount, partnerId: supplierId),
        NongSanJournalLine(
            accountCode: _cashBank(method), accountName: _cashBankName(method),
            credit: amount),
      ],
    );
    await _writeAll([
      NongSanDocWrite(_cSupplier, updated.id, updated.toJson()),
      NongSanDocWrite(_cPayment, payment.id, payment.toJson()),
      NongSanDocWrite(_cJournal, journal.id, journal.toJson()),
    ]);
    return payment;
  }

  // ─────────────────────────── KHO (§10, §44) ────────────────────────
  /// Lập kế hoạch xuất kho FIFO (chưa ghi) để dùng chung cho bán hàng.
  Future<_IssuePlan> _planIssueFifo({
    required String productId,
    required String warehouseId,
    required double quantity,
    required String referenceId,
    String note = '',
    DateTime? date,
  }) async {
    if (quantity <= 0) throw StateError('Số lượng xuất phải lớn hơn 0.');
    final allLots = await _all(_cLot, NongSanLot.fromJson);
    final eligible = allLots
        .where((l) =>
            l.productId == productId &&
            l.warehouseId == warehouseId &&
            l.currentQuantity > 0.001)
        .toList()
      ..sort((a, b) => a.importDate.compareTo(b.importDate));

    var remaining = quantity;
    final issues = <NongSanStockIssue>[];
    final updatedLots = <NongSanLot>[];
    final now = date ?? DateTime.now();
    for (final lot in eligible) {
      if (remaining < 0.001) break;
      final take = math.min(remaining, lot.currentQuantity);
      issues.add(NongSanStockIssue(
        id: _gen('PX'),
        invoiceId: referenceId,
        productId: productId,
        warehouseId: warehouseId,
        lotId: lot.id,
        quantity: take,
        unitCost: lot.costPrice,
        note: note,
        timestamp: now,
      ));
      updatedLots.add(NongSanLot(
        id: lot.id,
        lotId: lot.lotId,
        productId: lot.productId,
        supplierId: lot.supplierId,
        warehouseId: lot.warehouseId,
        importDate: lot.importDate,
        initialQuantity: lot.initialQuantity,
        currentQuantity: _r2(lot.currentQuantity - take),
        costPrice: lot.costPrice,
        grade: lot.grade,
        size: lot.size,
        expiryDate: lot.expiryDate,
        updatedAt: now,
      ));
      remaining = _r2(remaining - take);
    }
    if (remaining > 0.001) {
      throw StateError('Không đủ tồn kho cho $productId tại kho $warehouseId '
          '(thiếu ${_r2(remaining)}).');
    }
    final exportTx = NongSanStockTransaction(
      id: _gen('STX'),
      warehouseId: warehouseId,
      productId: productId,
      type: 'EXPORT',
      quantity: -quantity,
      referenceId: referenceId,
      note: note.isEmpty ? 'Xuất kho' : note,
      timestamp: now,
    );
    final cogs = _r2(issues.fold(0.0, (s, i) => s + i.lineCost));
    return _IssuePlan(issues, updatedLots, exportTx, cogs);
  }

  /// §10.2 Xuất kho (FIFO) — giảm lô, ghi phiếu xuất + phát sinh.
  Future<List<NongSanStockIssue>> issueStock({
    required String productId,
    required String warehouseId,
    required double quantity,
    String referenceId = '',
    String note = '',
    DateTime? date,
  }) async {
    final plan = await _planIssueFifo(
      productId: productId,
      warehouseId: warehouseId,
      quantity: quantity,
      referenceId: referenceId,
      note: note,
      date: date,
    );
    await _writeAll([
      ...plan.updatedLots.map((l) => NongSanDocWrite(_cLot, l.id, l.toJson())),
      NongSanDocWrite(_cTx, plan.exportTx.id, plan.exportTx.toJson()),
      ...plan.issues.map((i) => NongSanDocWrite(_cIssue, i.id, i.toJson())),
    ]);
    return plan.issues;
  }

  /// §10.2 Chuyển kho.
  Future<void> transferStock({
    required String lotId,
    required String toWarehouseId,
    required double quantity,
    String note = '',
    DateTime? date,
  }) async {
    final lot = await lotById(lotId);
    if (lot == null) throw StateError('Không tìm thấy lô $lotId.');
    if (quantity <= 0 || quantity > lot.currentQuantity + 0.001) {
      throw StateError('Số lượng chuyển không hợp lệ hoặc vượt tồn lô.');
    }
    final now = date ?? DateTime.now();
    final source = NongSanLot(
      id: lot.id,
      lotId: lot.lotId,
      productId: lot.productId,
      supplierId: lot.supplierId,
      warehouseId: lot.warehouseId,
      importDate: lot.importDate,
      initialQuantity: lot.initialQuantity,
      currentQuantity: _r2(lot.currentQuantity - quantity),
      costPrice: lot.costPrice,
      grade: lot.grade,
      size: lot.size,
      expiryDate: lot.expiryDate,
      updatedAt: now,
    );

    final targetLots = await _all(_cLot, NongSanLot.fromJson);
    var target = targetLots
        .where((l) =>
            l.productId == lot.productId &&
            l.warehouseId == toWarehouseId &&
            (l.costPrice - lot.costPrice).abs() < 0.001)
        .firstOrNull;
    NongSanLot targetUpdated;
    if (target == null) {
      final tp = _gen('LOT');
      targetUpdated = NongSanLot(
        id: tp,
        lotId: tp,
        productId: lot.productId,
        supplierId: lot.supplierId,
        warehouseId: toWarehouseId,
        importDate: now,
        initialQuantity: quantity,
        currentQuantity: quantity,
        costPrice: lot.costPrice,
        grade: lot.grade,
        size: lot.size,
        updatedAt: now,
      );
    } else {
      targetUpdated = NongSanLot(
        id: target.id,
        lotId: target.lotId,
        productId: target.productId,
        supplierId: target.supplierId,
        warehouseId: target.warehouseId,
        importDate: target.importDate,
        initialQuantity: target.initialQuantity,
        currentQuantity: _r2(target.currentQuantity + quantity),
        costPrice: target.costPrice,
        grade: target.grade,
        size: target.size,
        expiryDate: target.expiryDate,
        updatedAt: now,
      );
    }

    final transfer = NongSanStockTransfer(
      id: _gen('CC'),
      lotId: lotId,
      productId: lot.productId,
      fromWarehouseId: lot.warehouseId,
      toWarehouseId: toWarehouseId,
      quantity: quantity,
      unitCost: lot.costPrice,
      note: note,
      timestamp: now,
    );
    final txOut = NongSanStockTransaction(
      id: _gen('STX'),
      warehouseId: lot.warehouseId,
      productId: lot.productId,
      lotId: lot.id,
      type: 'TRANSFER_OUT',
      quantity: -quantity,
      referenceId: transfer.id,
      note: 'Chuyển kho -> $toWarehouseId',
      timestamp: now,
    );
    final txIn = NongSanStockTransaction(
      id: _gen('STX'),
      warehouseId: toWarehouseId,
      productId: lot.productId,
      lotId: targetUpdated.id,
      type: 'TRANSFER_IN',
      quantity: quantity,
      referenceId: transfer.id,
      note: 'Chuyển kho từ ${lot.warehouseId}',
      timestamp: now,
    );
    await _writeAll([
      NongSanDocWrite(_cLot, source.id, source.toJson()),
      NongSanDocWrite(_cLot, targetUpdated.id, targetUpdated.toJson()),
      NongSanDocWrite(_cTransfer, transfer.id, transfer.toJson()),
      NongSanDocWrite(_cTx, txOut.id, txOut.toJson()),
      NongSanDocWrite(_cTx, txIn.id, txIn.toJson()),
    ]);
  }

  /// §10.2 Điều chỉnh tăng/giảm (kiểm kê, hủy hàng...).
  Future<void> adjustStock({
    required String lotId,
    required double quantityDelta,
    required String reason,
    DateTime? date,
  }) async {
    final lot = await lotById(lotId);
    if (lot == null) throw StateError('Không tìm thấy lô $lotId.');
    final newQty = _r2(lot.currentQuantity + quantityDelta);
    if (newQty < 0) throw StateError('Điều chỉnh làm tồn lô âm.');
    final now = date ?? DateTime.now();
    final updated = NongSanLot(
      id: lot.id,
      lotId: lot.lotId,
      productId: lot.productId,
      supplierId: lot.supplierId,
      warehouseId: lot.warehouseId,
      importDate: lot.importDate,
      initialQuantity: lot.initialQuantity,
      currentQuantity: newQty,
      costPrice: lot.costPrice,
      grade: lot.grade,
      size: lot.size,
      expiryDate: lot.expiryDate,
      updatedAt: now,
    );
    final adj = NongSanStockAdjustment(
      id: _gen('DK'),
      lotId: lotId,
      productId: lot.productId,
      warehouseId: lot.warehouseId,
      quantityDelta: quantityDelta,
      reason: reason,
      timestamp: now,
    );
    final tx = NongSanStockTransaction(
      id: _gen('STX'),
      warehouseId: lot.warehouseId,
      productId: lot.productId,
      lotId: lotId,
      type: 'ADJUSTMENT',
      quantity: quantityDelta,
      referenceId: adj.id,
      note: reason,
      timestamp: now,
    );
    await _writeAll([
      NongSanDocWrite(_cLot, updated.id, updated.toJson()),
      NongSanDocWrite(_cAdjust, adj.id, adj.toJson()),
      NongSanDocWrite(_cTx, tx.id, tx.toJson()),
    ]);
  }

  /// Tồn kho khả dụng theo sản phẩm/kho.
  Future<double> availableStock(String productId, [String warehouseId = '']) async {
    final lots = await _all(_cLot, NongSanLot.fromJson);
    double total = 0;
    for (final l in lots) {
      if (l.productId == productId &&
          (warehouseId.isEmpty || l.warehouseId == warehouseId)) {
        total += l.currentQuantity;
      }
    }
    return total;
  }

  /// §20 Giá vốn bình quân gia quyền.
  Future<double> averageUnitCost(String productId) async {
    final lots = await _all(_cLot, NongSanLot.fromJson);
    double qty = 0, cost = 0;
    for (final l in lots) {
      if (l.productId != productId || l.currentQuantity <= 0.001) continue;
      qty += l.currentQuantity;
      cost += l.costPrice * l.currentQuantity;
    }
    return qty > 0 ? _r2(cost / qty) : 0;
  }

  // ─────────────────────────── BÁN HÀNG (§12, §43) ───────────────────
  Future<NongSanSalesOrder> createSalesOrder({
    String? id,
    required String customerId,
    required String warehouseId,
    required String productId,
    double quantity = 0,
    double unitPrice = 0,
    double discount = 0,
    double taxRate = 0,
    String note = '',
  }) async {
    if (quantity <= 0) throw StateError('Số lượng đơn bán phải lớn hơn 0.');
    final order = NongSanSalesOrder(
      id: id ?? _gen('SO'),
      customerId: customerId,
      warehouseId: warehouseId,
      productId: productId,
      quantity: quantity,
      unitPrice: unitPrice,
      discount: discount,
      taxRate: taxRate,
      status: NongSanDocStatus.pending,
      note: note,
    );
    await service.saveDocument(_cSalesOrder, order.id, order.toJson());
    return order;
  }

  Future<NongSanSalesOrder> approveSalesOrder(String orderId) async {
    final order = await salesOrderById(orderId);
    if (order == null) throw StateError('Không tìm thấy đơn bán $orderId.');
    if (order.status != NongSanDocStatus.pending) {
      throw StateError('Chỉ đơn bán ở trạng thái ${NongSanDocStatus.pending} '
          'mới được duyệt '
          '(hiện tại: ${order.status}).');
    }
    final updated = _orderWithStatus(order, NongSanDocStatus.approved);
    await service.saveDocument(_cSalesOrder, updated.id, updated.toJson());
    return updated;
  }

  /// §43 Bán hàng: xuất kho (FIFO) -> hóa đơn -> doanh thu + giá vốn ->
  /// công nợ 131 -> bút toán. Toàn bộ trong một transaction (§53).
  Future<NongSanSalesInvoice> completeSale({
    String? id,
    required String salesOrderId,
    String paymentMethod = 'CASH',
    double paidAmount = 0,
    double shippingFee = 0,
    DateTime? date,
  }) async {
    final order = await salesOrderById(salesOrderId);
    if (order == null) throw StateError('Không tìm thấy đơn bán $salesOrderId.');
    if (order.status != NongSanDocStatus.approved) {
      throw StateError('Đơn bán phải được duyệt trước khi xuất kho '
          '(hiện tại: ${order.status}).');
    }
    final customer = await customerById(order.customerId);
    if (customer == null) throw StateError('Không tìm thấy khách hàng ${order.customerId}.');

    final now = date ?? DateTime.now();
    final invoiceId = id ?? _gen('HD');
    final grossAmount = _r2(order.quantity * order.unitPrice);
    final netBeforeTax = _r2(grossAmount - order.discount);
    final tax = _r2(netBeforeTax * order.taxRate);
    final totalPayment = _r2(netBeforeTax + tax + shippingFee);

    final isDebt = paymentMethod == 'DEBT';
    final actualPaid = isDebt ? 0.0 : (paidAmount > 0 ? _r2(paidAmount) : totalPayment);

    final invoice = NongSanSalesInvoice(
      id: invoiceId,
      customerId: order.customerId,
      warehouseId: order.warehouseId,
      productId: order.productId,
      orderId: order.id,
      quantity: order.quantity,
      unitPrice: order.unitPrice,
      discount: order.discount,
      tax: tax,
      shippingFee: shippingFee,
      totalPayment: totalPayment,
      paymentMethod: paymentMethod,
      paidAmount: actualPaid,
      status: NongSanDocStatus.posted,
      updatedAt: now,
    );

    final plan = await _planIssueFifo(
      productId: order.productId,
      warehouseId: order.warehouseId,
      quantity: order.quantity,
      referenceId: invoiceId,
      note: 'Xuất bán ${invoice.invoiceNumber}',
      date: now,
    );

    final updatedCustomer = NongSanCustomer(
      id: customer.id,
      name: customer.name,
      phone: customer.phone,
      address: customer.address,
      company: customer.company,
      taxId: customer.taxId,
      contactPerson: customer.contactPerson,
      creditLimit: customer.creditLimit,
      paymentTermDays: customer.paymentTermDays,
      debtAmount: isDebt
          ? _r2(customer.debtAmount + totalPayment)
          : customer.debtAmount,
      totalSales: _r2(customer.totalSales + totalPayment),
      totalCollected: _r2(customer.totalCollected + actualPaid),
      updatedAt: now,
      code: customer.code,
    );

    // Bút toán BÁN HÀNG (§18.2): Nợ 111/131 / Có 511 / Có 333.
    final journalBase = await _nextJournalNumber();
    final saleJournal = await _journal(
      entryNumber: journalBase,
      refType: 'SALE',
      refId: invoiceId,
      narration: 'Bán hàng ${order.productId} cho ${order.customerId}',
      date: now,
      lines: [
        NongSanJournalLine(
            accountCode: isDebt ? accReceivable : _cashBank(paymentMethod),
            accountName: isDebt ? 'Phải thu khách hàng' : _cashBankName(paymentMethod),
            debit: totalPayment, partnerId: order.customerId),
        NongSanJournalLine(
            accountCode: accRevenue, accountName: 'Doanh thu',
            credit: _r2(netBeforeTax + shippingFee), partnerId: order.customerId),
        NongSanJournalLine(
            accountCode: accOutputVat, accountName: 'Thuế GTGT đầu ra',
            credit: tax, partnerId: order.customerId),
      ],
    );
    // Bút toán GIÁ VỐN (§18.2): Nợ 632 / Có 156.
    final cogsJournal = await _journal(
      entryNumber: journalBase + 1,
      refType: 'COGS',
      refId: invoiceId,
      narration: 'Giá vốn bán hàng ${invoice.invoiceNumber}',
      date: now,
      lines: [
        NongSanJournalLine(
            accountCode: accCogs, accountName: 'Giá vốn', debit: plan.cogs),
        NongSanJournalLine(
            accountCode: accInventory, accountName: 'Hàng hóa', credit: plan.cogs),
      ],
    );

    final ordered = _orderWithStatus(order, NongSanDocStatus.posted);
    await _writeAll([
      NongSanDocWrite(_cCustomer, updatedCustomer.id, updatedCustomer.toJson()),
      NongSanDocWrite(_cInvoice, invoice.id, invoice.toJson()),
      NongSanDocWrite(_cSalesOrder, ordered.id, ordered.toJson()),
      NongSanDocWrite(_cJournal, saleJournal.id, saleJournal.toJson()),
      NongSanDocWrite(_cJournal, cogsJournal.id, cogsJournal.toJson()),
      ...plan.updatedLots.map((l) => NongSanDocWrite(_cLot, l.id, l.toJson())),
      NongSanDocWrite(_cTx, plan.exportTx.id, plan.exportTx.toJson()),
      ...plan.issues.map((i) => NongSanDocWrite(_cIssue, i.id, i.toJson())),
    ]);
    return invoice;
  }

  NongSanSalesOrder _orderWithStatus(NongSanSalesOrder o, String status) =>
      NongSanSalesOrder(
        id: o.id,
        orderNumber: o.orderNumber,
        customerId: o.customerId,
        warehouseId: o.warehouseId,
        productId: o.productId,
        quantity: o.quantity,
        unitPrice: o.unitPrice,
        discount: o.discount,
        taxRate: o.taxRate,
        status: status,
        note: o.note,
        updatedAt: o.updatedAt,
      );

  /// §13 Hàng bán trả lại: điều chỉnh doanh thu, giá vốn, công nợ, nhập lại kho.
  Future<NongSanSalesReturn> returnSale({
    String? id,
    required String invoiceId,
    required double quantity,
    required double refundAmount,
    required String reason,
    DateTime? date,
  }) async {
    final invoice = await invoiceById(invoiceId);
    if (invoice == null) throw StateError('Không tìm thấy hóa đơn $invoiceId.');
    if (quantity <= 0 || quantity > invoice.quantity + 0.001) {
      throw StateError('Số lượng trả lại không hợp lệ.');
    }
    final customer = await customerById(invoice.customerId);
    if (customer == null) throw StateError('Không tìm thấy khách hàng ${invoice.customerId}.');

    final now = date ?? DateTime.now();
    final avgCost = await averageUnitCost(invoice.productId);
    final cogsRefund = _r2(quantity * avgCost);

    final ret = NongSanSalesReturn(
      id: id ?? _gen('TR'),
      invoiceId: invoiceId,
      customerId: invoice.customerId,
      productId: invoice.productId,
      warehouseId: invoice.warehouseId,
      quantity: quantity,
      refundAmount: _r2(refundAmount),
      cogsRefund: cogsRefund,
      reason: reason,
      status: NongSanDocStatus.posted,
      updatedAt: now,
    );

    // Nhập lại kho: cộng lại vào lô còn hàng (nếu có) để khóa tồn lô.
    final lots = await _all(_cLot, NongSanLot.fromJson);
    final target = lots
        .where((l) =>
            l.productId == invoice.productId &&
            l.warehouseId == invoice.warehouseId)
        .toList()
      ..sort((a, b) => a.importDate.compareTo(b.importDate));
    NongSanDocWrite? lotWrite;
    var txLotId = '';
    if (target.isNotEmpty) {
      final lot = target.first;
      txLotId = lot.id;
      lotWrite = NongSanDocWrite(
        _cLot, lot.id,
        NongSanLot(
          id: lot.id,
          lotId: lot.lotId,
          productId: lot.productId,
          supplierId: lot.supplierId,
          warehouseId: lot.warehouseId,
          importDate: lot.importDate,
          initialQuantity: lot.initialQuantity,
          currentQuantity: _r2(lot.currentQuantity + quantity),
          costPrice: lot.costPrice,
          grade: lot.grade,
          size: lot.size,
          expiryDate: lot.expiryDate,
          updatedAt: now,
        ).toJson(),
      );
    }
    final tx = NongSanStockTransaction(
      id: _gen('STX'),
      warehouseId: invoice.warehouseId,
      productId: invoice.productId,
      lotId: txLotId,
      type: 'IMPORT',
      quantity: quantity,
      referenceId: ret.id,
      note: 'Trả hàng ${ret.returnNumber}',
      timestamp: now,
    );

    final updatedCustomer = NongSanCustomer(
      id: customer.id,
      name: customer.name,
      phone: customer.phone,
      address: customer.address,
      company: customer.company,
      taxId: customer.taxId,
      contactPerson: customer.contactPerson,
      creditLimit: customer.creditLimit,
      paymentTermDays: customer.paymentTermDays,
      debtAmount: _r2(math.max(0, customer.debtAmount - refundAmount)),
      totalSales: customer.totalSales,
      totalCollected: customer.totalCollected,
      updatedAt: now,
      code: customer.code,
    );

    final returnBase = await _nextJournalNumber();
    final revenueAdjust = await _journal(
      entryNumber: returnBase,
      refType: 'RETURN',
      refId: ret.id,
      narration: 'Giảm doanh thu do trả hàng ${ret.returnNumber}',
      date: now,
      lines: [
        NongSanJournalLine(
            accountCode: accRevenue, accountName: 'Doanh thu',
            debit: _r2(refundAmount), partnerId: invoice.customerId),
        NongSanJournalLine(
            accountCode: accReceivable, accountName: 'Phải thu khách hàng',
            credit: _r2(refundAmount), partnerId: invoice.customerId),
      ],
    );
    final cogsAdjust = await _journal(
      entryNumber: returnBase + 1,
      refType: 'RETURN_COGS',
      refId: ret.id,
      narration: 'Hoàn giá vốn do trả hàng ${ret.returnNumber}',
      date: now,
      lines: [
        NongSanJournalLine(
            accountCode: accInventory, accountName: 'Hàng hóa',
            debit: cogsRefund),
        NongSanJournalLine(
            accountCode: accCogs, accountName: 'Giá vốn',
            credit: cogsRefund),
      ],
    );

    await _writeAll([
      NongSanDocWrite(_cCustomer, updatedCustomer.id, updatedCustomer.toJson()),
      NongSanDocWrite(_cReturn, ret.id, ret.toJson()),
      NongSanDocWrite(_cTx, tx.id, tx.toJson()),
      if (lotWrite != null) lotWrite,
      NongSanDocWrite(_cJournal, revenueAdjust.id, revenueAdjust.toJson()),
      NongSanDocWrite(_cJournal, cogsAdjust.id, cogsAdjust.toJson()),
    ]);
    return ret;
  }

  // ──────────────────────── TÀI CHÍNH (§15-16) ───────────────────────
  /// §15 Thu tiền khách hàng: Nợ 111/112 / Có 131.
  Future<NongSanPayment> receivePayment({
    String? id,
    required String customerId,
    double amount = 0,
    String method = 'CASH',
    String note = '',
    DateTime? date,
  }) async {
    if (amount <= 0) throw StateError('Số tiền thu phải lớn hơn 0.');
    final customer = await customerById(customerId);
    if (customer == null) throw StateError('Không tìm thấy khách hàng $customerId.');

    final now = date ?? DateTime.now();
    final payment = NongSanPayment(
      id: id ?? _gen('PT'),
      kind: 'CUSTOMER_RECEIPT',
      partnerId: customerId,
      direction: 'IN',
      method: method,
      amount: amount,
      note: note,
      timestamp: now,
    );
    final updated = NongSanCustomer(
      id: customer.id,
      name: customer.name,
      phone: customer.phone,
      address: customer.address,
      company: customer.company,
      taxId: customer.taxId,
      contactPerson: customer.contactPerson,
      creditLimit: customer.creditLimit,
      paymentTermDays: customer.paymentTermDays,
      debtAmount: _r2(math.max(0, customer.debtAmount - amount)),
      totalSales: customer.totalSales,
      totalCollected: _r2(customer.totalCollected + amount),
      updatedAt: now,
      code: customer.code,
    );
    final journal = await _journal(
      refType: 'RECEIPT',
      refId: payment.id,
      narration: 'Thu tiền khách hàng $customerId',
      date: now,
      lines: [
        NongSanJournalLine(
            accountCode: _cashBank(method), accountName: _cashBankName(method),
            debit: amount),
        NongSanJournalLine(
            accountCode: accReceivable, accountName: 'Phải thu khách hàng',
            credit: amount, partnerId: customerId),
      ],
    );
    await _writeAll([
      NongSanDocWrite(_cCustomer, updated.id, updated.toJson()),
      NongSanDocWrite(_cPayment, payment.id, payment.toJson()),
      NongSanDocWrite(_cJournal, journal.id, journal.toJson()),
    ]);
    return payment;
  }

  /// §16 Chi phí: Nợ 641/642 / Có 111|112.
  Future<NongSanExpense> createExpense({
    String? id,
    required double amount,
    required String category,
    String accountCode = accAdmin,
    String method = 'CASH',
    String note = '',
    DateTime? date,
  }) async {
    if (amount <= 0) throw StateError('Số tiền chi phí phải lớn hơn 0.');
    final now = date ?? DateTime.now();
    final expense = NongSanExpense(
      id: id ?? _gen('CP'),
      category: category,
      amount: amount,
      accountCode: accountCode,
      note: note,
      timestamp: now,
    );
    final journal = await _journal(
      refType: 'EXPENSE',
      refId: expense.id,
      narration: 'Chi phí $category',
      date: now,
      lines: [
        NongSanJournalLine(
            accountCode: accountCode, accountName: accountCode == accSelling ? 'Chi phí bán hàng' : 'Chi phí QLDN',
            debit: amount),
        NongSanJournalLine(
            accountCode: _cashBank(method), accountName: _cashBankName(method),
            credit: amount),
      ],
    );
    await _writeAll([
      NongSanDocWrite(_cExpense, expense.id, expense.toJson()),
      NongSanDocWrite(_cJournal, journal.id, journal.toJson()),
    ]);
    return expense;
  }

  // ──────────────────── KẾ TOÁN (§18-19, §29, §49) ───────────────────
  Future<NongSanJournalEntry> postJournalEntry({
    String? id,
    required String narration,
    required List<NongSanJournalLine> lines,
    String refType = 'MANUAL',
    String refId = '',
    DateTime? date,
  }) async {
    final entry = await _journal(
      refType: refType,
      refId: refId,
      narration: narration,
      date: date ?? DateTime.now(),
      lines: lines,
      id: id ?? _gen('JE'),
    );
    await service.saveDocument(_cJournal, entry.id, entry.toJson());
    return entry;
  }

  Future<int> _nextJournalNumber() async {
    final existing = await _all(_cJournal, NongSanJournalEntry.fromJson);
    return existing.isEmpty
        ? 1
        : (existing.map((e) => e.entryNumber).reduce(math.max) + 1);
  }

  Future<NongSanJournalEntry> _journal({
    String? id,
    int? entryNumber,
    required String refType,
    required String refId,
    required String narration,
    required DateTime date,
    required List<NongSanJournalLine> lines,
  }) async {
    final existing = await _all(_cJournal, NongSanJournalEntry.fromJson);
    final nextNumber = entryNumber ??
        (existing.isEmpty
            ? 1
            : (existing.map((e) => e.entryNumber).reduce(math.max) + 1));
    final entry = NongSanJournalEntry(
      id: id ?? _gen('JE'),
      entryNumber: nextNumber,
      entryDate: date,
      refType: refType,
      refId: refId,
      narration: narration,
      status: NongSanDocStatus.posted,
      lines: lines,
    );
    // §18.1: Không cho ghi sổ nếu bút toán không cân.
    if (!entry.isBalanced) {
      throw StateError('Bút toán không cân: Nợ ${entry.totalDebit} != Có ${entry.totalCredit}.');
    }
    return entry;
  }

  /// §19 Sổ cái từng tài khoản.
  Future<Map<String, double>> generalLedger(String accountCode,
      {DateTime? from, DateTime? to}) async {
    final entries = await _all(_cJournal, NongSanJournalEntry.fromJson);
    double debit = 0, credit = 0;
    for (final e in entries) {
      if (from != null && e.entryDate.isBefore(from)) continue;
      if (to != null && e.entryDate.isAfter(to)) continue;
      for (final l in e.lines) {
        if (l.accountCode != accountCode) continue;
        debit += l.debit;
        credit += l.credit;
      }
    }
    return {'debit': _r2(debit), 'credit': _r2(credit), 'balance': _r2(debit - credit)};
  }

  /// §19 Nhật ký chung.
  Future<List<NongSanJournalEntry>> journalListing({DateTime? from, DateTime? to}) async {
    final entries = await _all(_cJournal, NongSanJournalEntry.fromJson);
    return entries
        .where((e) =>
            (from == null || !e.entryDate.isBefore(from)) &&
            (to == null || !e.entryDate.isAfter(to)))
        .toList()
      ..sort((a, b) => a.entryNumber.compareTo(b.entryNumber));
  }

  // ──────────────────────── BÁO CÁO (§21-27, §34, §44) ───────────────
  /// §24 Báo cáo nhập - xuất - tồn.
  Future<List<Map<String, Object?>>> inventoryReport(
      {DateTime? from, DateTime? to}) async {
    final txs = await _all(_cTx, NongSanStockTransaction.fromJson);
    final products = await _all(_cProduct, NongSanProduct.fromJson);
    final byId = {for (final p in products) p.id: p};

    final grouped = <String, _Nxt>{};
    for (final tx in txs) {
      if (from != null && tx.timestamp.isBefore(from)) {
        grouped.putIfAbsent(tx.productId, () => _Nxt()).opening += tx.quantity;
        continue;
      }
      if (to != null && tx.timestamp.isAfter(to)) continue;
      final g = grouped.putIfAbsent(tx.productId, () => _Nxt());
      switch (tx.type) {
        case 'IMPORT':
          g.imported += tx.quantity;
        case 'EXPORT':
          g.exported += tx.quantity;
        default:
          g.adjusted += tx.quantity;
      }
    }
    final productIds = {...grouped.keys, ...byId.keys};
    final rows = <Map<String, Object?>>[];
    for (final pid in productIds) {
      final p = byId[pid];
      final g = grouped[pid] ?? _Nxt();
      final closing = _r2(g.opening + g.imported + g.exported + g.adjusted);
      final unitCost = closing > 0.001 ? await averageUnitCost(pid) : 0.0;
      rows.add({
        'productId': pid,
        'name': p?.name ?? pid,
        'unit': p?.unit ?? '',
        'opening': _r2(g.opening),
        'imported': _r2(g.imported),
        'exported': _r2(g.exported),
        'adjusted': _r2(g.adjusted),
        'closing': closing,
        'unitCost': unitCost,
        'value': _r2(closing * unitCost),
      });
    }
    return rows;
  }

  /// §25 Báo cáo mua hàng.
  Future<Map<String, Object?>> purchaseReport({DateTime? from, DateTime? to}) async {
    final receipts = await _all(_cReceipt, NongSanPurchaseReceipt.fromJson);
    final inRange = receipts
        .where((r) =>
            (from == null || !r.updatedAt.isBefore(from)) &&
            (to == null || !r.updatedAt.isAfter(to)))
        .toList();
    final bySupplier = <String, double>{};
    final byProduct = <String, double>{};
    double total = 0, qty = 0;
    for (final r in inRange) {
      total += r.grandTotal;
      qty += r.finalQuantity;
      bySupplier[r.supplierId] = _r2((bySupplier[r.supplierId] ?? 0) + r.grandTotal);
      byProduct[r.productId] = _r2((byProduct[r.productId] ?? 0) + r.grandTotal);
    }
    return {
      'purchaseTotal': _r2(total),
      'quantity': _r2(qty),
      'count': inRange.length,
      'bySupplier': bySupplier,
      'byProduct': byProduct,
      'avgPrice': qty > 0 ? _r2(total / qty) : 0,
    };
  }

  /// §26 Báo cáo bán hàng.
  Future<Map<String, Object?>> salesReport({DateTime? from, DateTime? to}) async {
    final invoices = await _all(_cInvoice, NongSanSalesInvoice.fromJson);
    final returns = await _all(_cReturn, NongSanSalesReturn.fromJson);
    final issues = await _all(_cIssue, NongSanStockIssue.fromJson);

    final inRangeInvoices = invoices
        .where((i) =>
            (from == null || !i.updatedAt.isBefore(from)) &&
            (to == null || !i.updatedAt.isAfter(to)))
        .toList();
    final inRangeReturns = returns
        .where((r) =>
            (from == null || !r.updatedAt.isBefore(from)) &&
            (to == null || !r.updatedAt.isAfter(to)))
        .toList();

    double gross = 0, discount = 0, tax = 0, total = 0;
    final byProduct = <String, double>{};
    final byCustomer = <String, double>{};
    for (final i in inRangeInvoices) {
      gross += i.grossAmount;
      discount += i.discount;
      tax += i.tax;
      total += i.totalPayment;
      byProduct[i.productId] = _r2((byProduct[i.productId] ?? 0) + i.totalPayment);
      byCustomer[i.customerId] = _r2((byCustomer[i.customerId] ?? 0) + i.totalPayment);
    }
    double refund = 0;
    for (final r in inRangeReturns) {
      refund += r.refundAmount;
    }
    final netRevenue = _r2(total - refund);

    final issueIds = inRangeInvoices.map((i) => i.id).toSet();
    double cogs = 0;
    for (final s in issues) {
      if (issueIds.contains(s.invoiceId)) cogs += s.lineCost;
    }
    final profit = _r2(netRevenue - cogs);
    return {
      'grossRevenue': _r2(gross),
      'discount': _r2(discount),
      'tax': _r2(tax),
      'invoiceTotal': _r2(total),
      'refund': _r2(refund),
      'netRevenue': netRevenue,
      'cogs': cogs,
      'profit': profit,
      'marginPercent': netRevenue > 0 ? _r2(profit / netRevenue * 100) : 0,
      'count': inRangeInvoices.length,
      'byProduct': byProduct,
      'byCustomer': byCustomer,
    };
  }

  /// §22-§23 Lãi/lỗ.
  Future<Map<String, double>> profitLoss({DateTime? from, DateTime? to}) async {
    final sales = await salesReport(from: from, to: to);
    final expenses = await _all(_cExpense, NongSanExpense.fromJson);
    final inRangeExpenses = expenses
        .where((e) =>
            (from == null || !e.timestamp.isBefore(from)) &&
            (to == null || !e.timestamp.isAfter(to)))
        .toList();
    final expenseTotal =
        inRangeExpenses.fold(0.0, (s, e) => s + e.amount);
    final netRevenue = (sales['netRevenue'] as num).toDouble();
    final cogs = (sales['cogs'] as num).toDouble();
    final grossProfit = _r2(netRevenue - cogs);
    final operatingProfit = _r2(grossProfit - expenseTotal);
    return {
      'revenue': _r2(netRevenue),
      'cogs': cogs,
      'grossProfit': grossProfit,
      'expense': _r2(expenseTotal),
      'operatingProfit': operatingProfit,
      'totalIncome': _r2(operatingProfit),
      'marginPercent':
          netRevenue > 0 ? _r2(grossProfit / netRevenue * 100) : 0,
    };
  }

  /// §14 Công nợ nhà cung cấp.
  Future<Map<String, double>> supplierDebtSummary(String supplierId) async {
    final s = await _byId(_cSupplier, supplierId, NongSanSupplier.fromJson);
    if (s == null) return {};
    return {
      'opening': 0,
      'purchased': _r2(s.totalPurchased),
      'paid': _r2(s.totalPaid),
      'closing': _r2(s.debtAmount),
    };
  }

  /// §15 Công nợ khách hàng.
  Future<Map<String, double>> customerDebtSummary(String customerId) async {
    final c = await _byId(_cCustomer, customerId, NongSanCustomer.fromJson);
    if (c == null) return {};
    return {
      'opening': 0,
      'sales': _r2(c.totalSales),
      'collected': _r2(c.totalCollected),
      'closing': _r2(c.debtAmount),
    };
  }

  /// §34 Dashboard quản trị.
  Future<Map<String, Object?>> dashboardSummary() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final monthStart = DateTime(now.year, now.month, 1);

    final invoices = await _all(_cInvoice, NongSanSalesInvoice.fromJson);
    final returns = await _all(_cReturn, NongSanSalesReturn.fromJson);
    final issues = await _all(_cIssue, NongSanStockIssue.fromJson);
    final expenses = await _all(_cExpense, NongSanExpense.fromJson);
    final suppliers = await _all(_cSupplier, NongSanSupplier.fromJson);
    final customers = await _all(_cCustomer, NongSanCustomer.fromJson);

    double revenueToday = 0, revenueMonth = 0, refundMonth = 0;
    for (final i in invoices) {
      if (!i.updatedAt.isBefore(today)) revenueToday += i.totalPayment;
      if (!i.updatedAt.isBefore(monthStart)) revenueMonth += i.totalPayment;
    }
    for (final r in returns) {
      if (!r.updatedAt.isBefore(monthStart)) refundMonth += r.refundAmount;
    }
    double cogsMonth = 0;
    final monthInvoiceIds = invoices
        .where((i) => !i.updatedAt.isBefore(monthStart))
        .map((i) => i.id)
        .toSet();
    for (final s in issues) {
      if (monthInvoiceIds.contains(s.invoiceId)) cogsMonth += s.lineCost;
    }
    final expenseMonth = expenses
        .where((e) => !e.timestamp.isBefore(monthStart))
        .fold(0.0, (s, e) => s + e.amount);

    final invReport = await inventoryReport();
    final invValue = invReport.fold(0.0, (s, r) => s + (r['value'] as num));

    final netRevenueMonth = _r2(revenueMonth - refundMonth);
    final grossMonth = _r2(netRevenueMonth - cogsMonth);
    return {
      'revenueToday': _r2(revenueToday),
      'revenueMonth': netRevenueMonth,
      'cogsMonth': _r2(cogsMonth),
      'grossProfitMonth': grossMonth,
      'expenseMonth': _r2(expenseMonth),
      'operatingProfitMonth': _r2(grossMonth - expenseMonth),
      'inventoryValue': invValue,
      'receivable': _r2(customers.fold(0.0, (s, c) => s + c.debtAmount)),
      'payable': _r2(suppliers.fold(0.0, (s, p) => s + p.debtAmount)),
    };
  }

  static String _cashBank(String method) =>
      method == 'BANK' ? accBank : accCash;
  static String _cashBankName(String method) =>
      method == 'BANK' ? 'Tiền gửi ngân hàng' : 'Tiền mặt';
}

/// Kế hoạch xuất kho FIFO (được tính toán trước, ghi sau trong một batch).
class _IssuePlan {
  final List<NongSanStockIssue> issues;
  final List<NongSanLot> updatedLots;
  final NongSanStockTransaction exportTx;
  final double cogs;
  _IssuePlan(this.issues, this.updatedLots, this.exportTx, this.cogs);
}

/// Nhập - xuất - tồn khóa theo sản phẩm.
class _Nxt {
  double opening = 0, imported = 0, exported = 0, adjusted = 0;
}