import 'dart:convert';
import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/product.dart';
import '../models/invoice.dart';
import '../models/inventory.dart';
import '../models/finance.dart';
import '../models/partner.dart';
import '../models/sync_model.dart';

class TapHoaIsarService {
  late Future<Isar> db;

  /// StoreId của cửa hàng đang đăng nhập — set từ Dashboard khi vào module.
  /// Dùng để đính kèm vào payload đồng bộ (admin-web lọc theo store).
  static String currentStoreId = '';

  TapHoaIsarService({Directory? directory, String? instanceName}) {
    db = openDB(directory: directory, instanceName: instanceName);
  }

  Future<Isar> openDB({Directory? directory, String? instanceName}) async {
    final dbName = instanceName ?? 'taphoa_db';
    if (Isar.instanceNames.contains(dbName)) {
      return Isar.getInstance(dbName)!;
    }
    final dir = directory ?? await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        TapHoaCategorySchema,
        TapHoaProductSchema,
        TapHoaInvoiceSchema,
        TapHoaInvoiceItemSchema,
        TapHoaInventoryItemSchema,
        TapHoaInventoryTransactionSchema,
        TapHoaCashTransactionSchema,
        TapHoaCustomerSchema,
        TapHoaSupplierSchema,
        TapHoaSyncQueueSchema,
        TapHoaSyncConfigSchema,
      ],
      inspector: directory == null,
      directory: dir.path,
      name: dbName,
    );
  }

  // ======================= CATEGORY =======================
  Future<List<TapHoaCategory>> getCategories() async {
    final isar = await db;
    return await isar.tapHoaCategorys.where().findAll();
  }

  Future<void> saveCategory(TapHoaCategory category) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tapHoaCategorys.put(category);
      await _queueSync(isar, 'taphoa_categories', category.categoryId, category);
    });
  }

  // ======================= PRODUCT =======================
  Future<List<TapHoaProduct>> getProducts() async {
    final isar = await db;
    return await isar.tapHoaProducts.where().findAll();
  }

  Future<void> saveProduct(TapHoaProduct product) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tapHoaProducts.put(product);
      await product.category.save();
      await _queueSync(isar, 'taphoa_products', product.productId, product);
    });
  }

  Future<void> deleteProduct(String productId) async {
    final isar = await db;
    final product = await isar.tapHoaProducts
        .filter()
        .productIdEqualTo(productId)
        .findFirst();
    if (product != null) {
      await isar.writeTxn(() async {
        await isar.tapHoaProducts.delete(product.id);
        final inv = await isar.tapHoaInventoryItems
            .filter()
            .productIdEqualTo(productId)
            .findFirst();
        if (inv != null) {
          await isar.tapHoaInventoryItems.delete(inv.id);
          await _queueDelete(isar, 'taphoa_inventory_items', inv.inventoryItemId);
        }
        await _queueDelete(isar, 'taphoa_products', productId);
      });
    }
  }

  // ======================= INVOICE =======================
  Future<List<TapHoaInvoice>> getInvoices() async {
    final isar = await db;
    final invoices = await isar.tapHoaInvoices.where().sortByCreatedAtDesc().findAll();
    for (final invoice in invoices) {
      await invoice.items.load();
    }
    return invoices;
  }

  Future<void> saveInvoice(TapHoaInvoice invoice) async {
    final isar = await db;
    await isar.writeTxn(() async {
      final items = invoice.items.toList();
      if (items.isNotEmpty) {
        for (final item in items) {
          item.invoiceId = invoice.invoiceId;
        }
        await isar.tapHoaInvoiceItems.putAll(items);
      }
      await isar.tapHoaInvoices.put(invoice);
      await invoice.items.save();
      await _queueSync(isar, 'orders', invoice.invoiceId, invoice);
    });
  }

  /// Thanh toán hóa đơn: lưu HD, trừ kho, ghi nhận doanh thu, tích điểm KH,
  /// ghi vào Sync Queue (Offline First).
  Future<void> processCheckout(
    TapHoaInvoice invoice,
    List<TapHoaInvoiceItem> items, {
    TapHoaCustomer? customer,
  }) async {
    final isar = await db;
    await isar.writeTxn(() async {
      // 1. Lưu chi tiết trước (cần id để link), rồi lưu hóa đơn
      for (final item in items) {
        item.invoiceId = invoice.invoiceId;
      }
      await isar.tapHoaInvoiceItems.putAll(items);
      invoice.items.clear();
      invoice.items.addAll(items);
      await isar.tapHoaInvoices.put(invoice);
      await invoice.items.save();

      // 2. Trừ kho & ghi phiếu xuất
      for (final item in items) {
        final inv = await isar.tapHoaInventoryItems
            .filter()
            .productIdEqualTo(item.productId)
            .findFirst();
        if (inv != null) {
          final old = inv.currentStock;
          inv.currentStock = (old - item.quantity) < 0 ? 0 : old - item.quantity;
          await isar.tapHoaInventoryItems.put(inv);
          await _queueSync(
              isar, 'taphoa_inventory_items', inv.inventoryItemId, inv);
          final tx = TapHoaInventoryTransaction()
            ..transactionId =
                'ITX_${DateTime.now().millisecondsSinceEpoch}_${inv.id}'
            ..inventoryItemId = inv.inventoryItemId
            ..productName = item.productName
            ..type = 'EXPORT'
            ..quantityChange = -item.quantity
            ..oldStock = old
            ..newStock = inv.currentStock
            ..timestamp = invoice.createdAt
            ..referenceId = invoice.invoiceId
            ..note = 'Xuất bán ${invoice.invoiceNumber}';
          await isar.tapHoaInventoryTransactions.put(tx);
          await _queueSync(isar, 'taphoa_inventory_transactions',
              tx.transactionId, tx);
        }
      }

      // 3. Ghi nhận thu (trừ khi thanh toán bằng công nợ)
      if (invoice.finalAmount > 0 && invoice.paymentMethod != 'debt') {
        final c = TapHoaCashTransaction()
          ..transactionId = 'CTX_${DateTime.now().millisecondsSinceEpoch}'
          ..title = 'Bán hàng ${invoice.invoiceNumber}'
          ..type = 'INCOME'
          ..category = 'Bán hàng'
          ..amount = invoice.finalAmount
          ..paymentMethod = paymentMethodLabel(invoice.paymentMethod)
          ..timestamp = invoice.createdAt
          ..performerName = invoice.cashierName.isEmpty
              ? 'Thu ngân'
              : invoice.cashierName
          ..note = invoice.customerName.isEmpty
              ? 'Khách lẻ'
              : invoice.customerName;
        await isar.tapHoaCashTransactions.put(c);
        await _queueSync(
            isar, 'taphoa_cash_transactions', c.transactionId, c);
      }

      // 4. Tích điểm / tổng chi / công nợ cho khách hàng
      if (customer != null && invoice.customerId.isNotEmpty) {
        final saved = await isar.tapHoaCustomers
            .filter()
            .customerIdEqualTo(customer.customerId)
            .findFirst();
        if (saved != null) {
          saved.totalSpent += invoice.finalAmount;
          saved.rewardPoints += (invoice.finalAmount / 10000).floor();
          if (invoice.paymentMethod == 'debt') {
            saved.debtAmount += invoice.finalAmount;
          }
          saved.memberTier = memberTierFor(saved.totalSpent);
          await isar.tapHoaCustomers.put(saved);
          await _queueSync(isar, 'customers', saved.customerId, saved);
        }
      }

      // 5. Sync queue
      await _queueSync(isar, 'orders', invoice.invoiceId, invoice);
    });
  }

  // ======================= INVENTORY =======================
  Future<List<TapHoaInventoryItem>> getInventoryItems() async {
    final isar = await db;
    return await isar.tapHoaInventoryItems.where().findAll();
  }

  Future<void> saveInventoryItem(TapHoaInventoryItem item) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tapHoaInventoryItems.put(item);
      await _queueSync(
          isar, 'taphoa_inventory_items', item.inventoryItemId, item);
    });
  }

  Future<List<TapHoaInventoryTransaction>> getInventoryTransactions() async {
    final isar = await db;
    return await isar.tapHoaInventoryTransactions
        .where()
        .sortByTimestampDesc()
        .findAll();
  }

  Future<void> saveInventoryTransaction(TapHoaInventoryTransaction tx) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tapHoaInventoryTransactions.put(tx);
      await _queueSync(
          isar, 'taphoa_inventory_transactions', tx.transactionId, tx);
    });
  }

  /// Nhập hàng: cộng tồn kho (hoặc tạo mới), ghi phiếu nhập.
  Future<void> processImport({
    required String productId,
    required String productName,
    required double quantity,
    required double costPrice,
    required String unit,
    String note = '',
  }) async {
    final isar = await db;
    await isar.writeTxn(() async {
      final inv = await isar.tapHoaInventoryItems
          .filter()
          .productIdEqualTo(productId)
          .findFirst();
      if (inv != null) {
        final old = inv.currentStock;
        inv.currentStock = old + quantity;
        inv.costPrice = costPrice > 0 ? costPrice : inv.costPrice;
        inv.unit = unit;
        await isar.tapHoaInventoryItems.put(inv);
        await _queueSync(
            isar, 'taphoa_inventory_items', inv.inventoryItemId, inv);
        final tx = TapHoaInventoryTransaction()
          ..transactionId = 'ITX_${DateTime.now().millisecondsSinceEpoch}_${inv.id}'
          ..inventoryItemId = inv.inventoryItemId
          ..productName = productName
          ..type = 'IMPORT'
          ..quantityChange = quantity
          ..oldStock = old
          ..newStock = inv.currentStock
          ..timestamp = DateTime.now()
          ..note = note.isEmpty ? 'Nhập hàng' : note;
        await isar.tapHoaInventoryTransactions.put(tx);
        await _queueSync(
            isar, 'taphoa_inventory_transactions', tx.transactionId, tx);
      } else {
        final newItem = TapHoaInventoryItem()
          ..inventoryItemId = 'INV_${DateTime.now().millisecondsSinceEpoch}'
          ..productId = productId
          ..productName = productName
          ..currentStock = quantity
          ..costPrice = costPrice
          ..unit = unit
          ..updatedAt = DateTime.now();
        await isar.tapHoaInventoryItems.put(newItem);
        await _queueSync(
            isar, 'taphoa_inventory_items', newItem.inventoryItemId, newItem);
        final tx = TapHoaInventoryTransaction()
          ..transactionId = 'ITX_${DateTime.now().millisecondsSinceEpoch}_$productId'
          ..inventoryItemId = newItem.inventoryItemId
          ..productName = productName
          ..type = 'IMPORT'
          ..quantityChange = quantity
          ..oldStock = 0
          ..newStock = quantity
          ..timestamp = DateTime.now()
          ..note = note.isEmpty ? 'Nhập hàng mới' : note;
        await isar.tapHoaInventoryTransactions.put(tx);
        await _queueSync(
            isar, 'taphoa_inventory_transactions', tx.transactionId, tx);
      }
    });
  }

  // ======================= FINANCE =======================
  Future<List<TapHoaCashTransaction>> getCashTransactions() async {
    final isar = await db;
    return await isar.tapHoaCashTransactions.where().sortByTimestampDesc().findAll();
  }

  Future<void> saveCashTransaction(TapHoaCashTransaction tx) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tapHoaCashTransactions.put(tx);
      await _queueSync(
          isar, 'taphoa_cash_transactions', tx.transactionId, tx);
    });
  }

  // ======================= PARTNER =======================
  Future<List<TapHoaCustomer>> getCustomers() async {
    final isar = await db;
    return await isar.tapHoaCustomers.where().findAll();
  }

  Future<void> saveCustomer(TapHoaCustomer customer) async {
    final isar = await db;
    await isar.writeTxn(() async {
      customer.memberTier = memberTierFor(customer.totalSpent);
      await isar.tapHoaCustomers.put(customer);
      await _queueSync(isar, 'customers', customer.customerId, customer);
    });
  }

  Future<void> deleteCustomer(String customerId) async {
    final isar = await db;
    final customer = await isar.tapHoaCustomers
        .filter()
        .customerIdEqualTo(customerId)
        .findFirst();
    if (customer != null) {
      await isar.writeTxn(() async {
        await isar.tapHoaCustomers.delete(customer.id);
        await _queueDelete(isar, 'customers', customerId);
      });
    }
  }

  Future<List<TapHoaSupplier>> getSuppliers() async {
    final isar = await db;
    return await isar.tapHoaSuppliers.where().findAll();
  }

  Future<void> saveSupplier(TapHoaSupplier supplier) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tapHoaSuppliers.put(supplier);
      await _queueSync(isar, 'suppliers', supplier.supplierId, supplier);
    });
  }

  Future<void> deleteSupplier(String supplierId) async {
    final isar = await db;
    final supplier = await isar.tapHoaSuppliers
        .filter()
        .supplierIdEqualTo(supplierId)
        .findFirst();
    if (supplier != null) {
      await isar.writeTxn(() async {
        await isar.tapHoaSuppliers.delete(supplier.id);
        await _queueDelete(isar, 'suppliers', supplierId);
      });
    }
  }

  // ======================= TRẢ NỢ =======================
  /// Thu công nợ từ khách hàng / trả nợ cho nhà cung cấp.
  /// [isCustomer] = true → thu từ khách (giảm nợ khách, thu tiền),
  ///                = false → trả cho NCC (giảm nợ NCC, chi tiền).
  Future<void> processDebtPayment({
    required String partnerId,
    required bool isCustomer,
    required String partnerName,
    required double amount,
  }) async {
    if (amount <= 0) return;
    final isar = await db;
    await isar.writeTxn(() async {
      if (isCustomer) {
        final c = await isar.tapHoaCustomers
            .filter()
            .customerIdEqualTo(partnerId)
            .findFirst();
        if (c != null) {
          c.debtAmount = (c.debtAmount - amount) < 0 ? 0 : c.debtAmount - amount;
          await isar.tapHoaCustomers.put(c);
          await _queueSync(isar, 'customers', c.customerId, c);
        }
      } else {
        final s = await isar.tapHoaSuppliers
            .filter()
            .supplierIdEqualTo(partnerId)
            .findFirst();
        if (s != null) {
          s.debtAmount = (s.debtAmount - amount) < 0 ? 0 : s.debtAmount - amount;
          await isar.tapHoaSuppliers.put(s);
          await _queueSync(isar, 'suppliers', s.supplierId, s);
        }
      }
      final tx = TapHoaCashTransaction()
        ..transactionId = 'CTX_${DateTime.now().millisecondsSinceEpoch}'
        ..title = isCustomer ? 'Thu công nợ $partnerName' : 'Trả nợ $partnerName'
        ..type = isCustomer ? 'INCOME' : 'EXPENSE'
        ..category = isCustomer ? 'Thu công nợ' : 'Trả nhà cung cấp'
        ..amount = amount
        ..paymentMethod = 'Tiền mặt'
        ..timestamp = DateTime.now()
        ..performerName = 'Thu ngân'
        ..note = partnerName;
      await isar.tapHoaCashTransactions.put(tx);
      await _queueSync(isar, 'taphoa_cash_transactions', tx.transactionId, tx);
    });
  }

  // ======================= SYNC QUEUE =======================
  static String _dts(DateTime? t) => (t ?? DateTime.now()).toIso8601String();

  /// Build payload giàu dữ liệu nghiệp vụ theo từng collection.
  /// Tên collection được chọn sao cho admin-web (/api/sync/summary) tính đúng:
  /// - 'orders': hóa đơn bán hàng (status 'paid' → doanh thu)
  /// - 'taphoa_cash_transactions': thu/chi (type EXPENSE → chi phí)
  /// - 'customers' / 'suppliers': công nợ (debtAmount)
  Map<String, dynamic> _payloadFor(String collection, Object data) {
    final map = <String, dynamic>{};
    if (data is TapHoaInvoice) {
      map
        ..['invoiceId'] = data.invoiceId
        ..['invoiceNumber'] = data.invoiceNumber
        ..['createdAt'] = _dts(data.createdAt)
        ..['paidAt'] = _dts(data.createdAt)
        ..['updatedAt'] = _dts(data.updatedAt)
        ..['status'] = data.status == 'completed' ? 'paid' : data.status
        ..['paymentMethod'] = data.paymentMethod
        ..['customerId'] = data.customerId
        ..['customerName'] = data.customerName
        ..['subtotal'] = data.totalAmount
        ..['totalAmount'] = data.totalAmount
        ..['grandTotal'] = data.finalAmount
        ..['finalAmount'] = data.finalAmount
        ..['discountAmount'] = data.discountAmount
        ..['amountPaid'] = data.amountPaid
        ..['changeAmount'] = data.changeAmount
        ..['note'] = data.note
        ..['cashierName'] = data.cashierName
        ..['items'] = data.items.isLoaded
            ? data.items.toList().map((it) {
                return {
                  'invoiceItemId': it.invoiceItemId,
                  'productId': it.productId,
                  'productName': it.productName,
                  'productCode': it.productCode,
                  'quantity': it.quantity,
                  'price': it.price,
                  'discount': it.discount,
                  'total': it.total,
                };
              }).toList()
            : [];
    } else if (data is TapHoaCashTransaction) {
      map
        ..['transactionId'] = data.transactionId
        ..['title'] = data.title
        ..['type'] = data.type
        ..['category'] = data.category
        ..['amount'] = data.amount
        ..['paymentMethod'] = data.paymentMethod
        ..['timestamp'] = _dts(data.timestamp)
        ..['createdAt'] = _dts(data.timestamp)
        ..['performerName'] = data.performerName
        ..['note'] = data.note;
    } else if (data is TapHoaCustomer) {
      map
        ..['customerId'] = data.customerId
        ..['name'] = data.name
        ..['phone'] = data.phone
        ..['address'] = data.address
        ..['debtAmount'] = data.debtAmount
        ..['totalSpent'] = data.totalSpent
        ..['rewardPoints'] = data.rewardPoints
        ..['memberTier'] = data.memberTier
        ..['updatedAt'] = _dts(data.updatedAt);
    } else if (data is TapHoaSupplier) {
      map
        ..['supplierId'] = data.supplierId
        ..['name'] = data.name
        ..['phone'] = data.phone
        ..['address'] = data.address
        ..['debtAmount'] = data.debtAmount
        ..['updatedAt'] = _dts(data.updatedAt);
    } else if (data is TapHoaProduct) {
      map
        ..['productId'] = data.productId
        ..['productCode'] = data.productCode
        ..['barcode'] = data.barcode
        ..['qrCode'] = data.qrCode
        ..['sku'] = data.sku
        ..['productName'] = data.productName
        ..['categoryId'] =
            data.category.isLoaded ? data.category.value?.categoryId : null
        ..['unit'] = data.unit
        ..['purchasePrice'] = data.purchasePrice
        ..['retailPrice'] = data.retailPrice
        ..['wholesalePrice'] = data.wholesalePrice
        ..['promotionPrice'] = data.promotionPrice
        ..['vatRate'] = data.vatRate
        ..['imageUrl'] = data.imageUrl
        ..['expiryDate'] =
            data.expiryDate != null ? _dts(data.expiryDate) : null
        ..['manufacturer'] = data.manufacturer
        ..['note'] = data.note
        ..['createdAt'] = _dts(data.createdAt)
        ..['updatedAt'] = _dts(data.updatedAt);
    } else if (data is TapHoaCategory) {
      map
        ..['categoryId'] = data.categoryId
        ..['name'] = data.name
        ..['description'] = data.description;
    } else if (data is TapHoaInventoryItem) {
      map
        ..['inventoryItemId'] = data.inventoryItemId
        ..['productId'] = data.productId
        ..['productName'] = data.productName
        ..['currentStock'] = data.currentStock
        ..['minStock'] = data.minStock
        ..['maxStock'] = data.maxStock
        ..['unit'] = data.unit
        ..['costPrice'] = data.costPrice
        ..['updatedAt'] = _dts(data.updatedAt);
    } else if (data is TapHoaInventoryTransaction) {
      map
        ..['transactionId'] = data.transactionId
        ..['inventoryItemId'] = data.inventoryItemId
        ..['productName'] = data.productName
        ..['type'] = data.type
        ..['quantityChange'] = data.quantityChange
        ..['oldStock'] = data.oldStock
        ..['newStock'] = data.newStock
        ..['timestamp'] = _dts(data.timestamp)
        ..['note'] = data.note
        ..['referenceId'] = data.referenceId;
    }
    return map;
  }

  Future<void> _queueSync(
    Isar isar,
    String collection,
    String recordId,
    Object data, {
    String operation = 'UPSERT',
  }) async {
    final payload = _payloadFor(collection, data)
      ..['itemId'] = recordId
      ..['collection'] = collection
      ..['storeId'] = currentStoreId.isEmpty ? 'unknown' : currentStoreId
      ..['savedAt'] = DateTime.now().toIso8601String();
    final item = TapHoaSyncQueue()
      ..operation = operation
      ..collectionName = collection
      ..recordId = recordId
      ..dataJson = jsonEncode(payload)
      ..createdAt = DateTime.now();
    await isar.tapHoaSyncQueues.put(item);
  }

  Future<void> _queueDelete(Isar isar, String collection, String recordId) async {
    await _queueSync(
      isar,
      collection,
      recordId,
      <String, dynamic>{},
      operation: 'DELETE',
    );
  }

  // ======================= UTIL =======================
  Future<bool> isSeeded() async {
    final isar = await db;
    final count = await isar.tapHoaProducts.count();
    return count > 0;
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  static String paymentMethodLabel(String method) {
    switch (method) {
      case 'cash':
        return 'Tiền mặt';
      case 'qr':
        return 'QR Code';
      case 'transfer':
        return 'Chuyển khoản';
      case 'debt':
        return 'Công nợ';
      default:
        return 'Tiền mặt';
    }
  }

  static String memberTierFor(double totalSpent) {
    if (totalSpent >= 50000000) return 'Diamond';
    if (totalSpent >= 20000000) return 'Platinum';
    if (totalSpent >= 5000000) return 'Gold';
    return 'Silver';
  }
}
