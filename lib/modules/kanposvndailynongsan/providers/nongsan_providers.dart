import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/nongsan_accounting.dart';
import '../models/nongsan_finance.dart';
import '../models/nongsan_inventory_sales.dart';
import '../models/nongsan_partner.dart';
import '../models/nongsan_product.dart';
import '../models/nongsan_purchase.dart';
import '../services/nongsan_business_logic.dart';
import '../services/nongsan_isar_service.dart';
import '../services/nongsan_seed_data.dart';

final nongsanIsarProvider = Provider<NongSanIsarService>((ref) {
  return NongSanIsarService();
});

final nongsanBusinessLogicProvider = Provider<NongSanBusinessLogic>((ref) {
  return NongSanBusinessLogic(ref.watch(nongsanIsarProvider));
});

FutureProvider<List<T>> _collectionProvider<T>(
    String collection, T Function(Map<String, dynamic>) fromJson) {
  return FutureProvider<List<T>>((ref) async {
    final service = ref.watch(nongsanIsarProvider);
    final docs = await service.getDocuments(collection);
    return docs
        .map((d) => jsonDecode(d.jsonData) as Map<String, dynamic>)
        .map(fromJson)
        .toList();
  });
}

final nongsanSuppliersProvider =
    _collectionProvider('NongSanSupplier', NongSanSupplier.fromJson);
final nongsanCustomersProvider =
    _collectionProvider('NongSanCustomer', NongSanCustomer.fromJson);
final nongsanProductsProvider =
    _collectionProvider('NongSanProduct', NongSanProduct.fromJson);
final nongsanQualitiesProvider =
    _collectionProvider('NongSanProductQuality', NongSanProductQuality.fromJson);
final nongsanWarehousesProvider =
    _collectionProvider('NongSanWarehouse', NongSanWarehouse.fromJson);
final nongsanLotsProvider =
    _collectionProvider('NongSanLot', NongSanLot.fromJson);
final nongsanWeighingTicketsProvider =
    _collectionProvider('NongSanWeighingTicket', NongSanWeighingTicket.fromJson);
final nongsanInspectionsProvider =
    _collectionProvider('NongSanQualityInspection', NongSanQualityInspection.fromJson);
final nongsanPurchaseOrdersProvider =
    _collectionProvider('NongSanPurchaseOrder', NongSanPurchaseOrder.fromJson);
final nongsanReceiptsProvider =
    _collectionProvider('NongSanPurchaseReceipt', NongSanPurchaseReceipt.fromJson);
final nongsanSalesOrdersProvider =
    _collectionProvider('NongSanSalesOrder', NongSanSalesOrder.fromJson);
final nongsanInvoicesProvider =
    _collectionProvider('NongSanSalesInvoice', NongSanSalesInvoice.fromJson);
final nongsanSalesReturnsProvider =
    _collectionProvider('NongSanSalesReturn', NongSanSalesReturn.fromJson);
final nongsanPaymentsProvider =
    _collectionProvider('NongSanPayment', NongSanPayment.fromJson);
final nongsanExpensesProvider =
    _collectionProvider('NongSanExpense', NongSanExpense.fromJson);
final nongsanJournalsProvider =
    _collectionProvider('NongSanJournalEntry', NongSanJournalEntry.fromJson);
final nongsanStockTransactionsProvider =
    _collectionProvider('NongSanStockTransaction', NongSanStockTransaction.fromJson);
final nongsanStockIssuesProvider =
    _collectionProvider('NongSanStockIssue', NongSanStockIssue.fromJson);
final nongsanStockTransfersProvider =
    _collectionProvider('NongSanStockTransfer', NongSanStockTransfer.fromJson);
final nongsanStockAdjustmentsProvider =
    _collectionProvider('NongSanStockAdjustment', NongSanStockAdjustment.fromJson);

/// Dữ liệu mẫu: chạy một lần khi cơ sở dữ liệu trống.
final nongsanSeedProvider = FutureProvider.autoDispose<bool>((ref) {
  return NongSanSeedData.seedIfEmpty(ref.watch(nongsanBusinessLogicProvider));
});