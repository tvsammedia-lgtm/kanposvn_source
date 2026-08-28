import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import '../repositories/isar_db.dart';
import '../repositories/property_repository.dart';
import '../repositories/customer_repository.dart';
import '../repositories/broker_repository.dart';
import '../repositories/transaction_repository.dart';
import '../repositories/floor_fee_repository.dart';
import '../models/property.dart';
import '../models/customer.dart';
import '../models/broker.dart';
import '../models/transaction.dart';
import '../models/floor_fee.dart';
import '../services/batdongsan_business_logic.dart';
import '../services/sync_service.dart';

final isarProvider = FutureProvider<Isar>((ref) async {
  return await KanBatDongSanIsarDB.getInstance();
});

final syncServiceProvider = Provider<SyncService>((ref) {
  return SyncService();
});

final propertyRepositoryProvider = Provider<PropertyRepository>((ref) {
  return PropertyRepository();
});

final customerRepositoryProvider = Provider<CustomerRepository>((ref) {
  return CustomerRepository();
});

final brokerRepositoryProvider = Provider<BrokerRepository>((ref) {
  return BrokerRepository();
});

final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  return TransactionRepository();
});

final floorFeeRepositoryProvider = Provider<FloorFeeRepository>((ref) {
  return FloorFeeRepository();
});

// ================= DANH SÁCH CƠ BẢN =================

final propertiesProvider = FutureProvider<List<BdsProperty>>((ref) async {
  final repository = ref.watch(propertyRepositoryProvider);
  final all = await repository.getAllProperties();
  // Loại bỏ bản ghi đã xóa mềm (deletedAt).
  return all.where((p) => p.deletedAt == null).toList()
    ..sort((a, b) => (b.updatedAt ?? DateTime(0)).compareTo(a.updatedAt ?? DateTime(0)));
});

final transactionsProvider = FutureProvider<List<TransactionRecord>>((ref) async {
  final repository = ref.watch(transactionRepositoryProvider);
  final all = await repository.getAllTransactions();
  return all.where((t) => t.deletedAt == null).toList()
    ..sort((a, b) => (b.transactionDate ?? DateTime(0))
        .compareTo(a.transactionDate ?? DateTime(0)));
});

final customersProvider = FutureProvider<List<Customer>>((ref) async {
  final repository = ref.watch(customerRepositoryProvider);
  final all = await repository.getAllCustomers();
  return all.where((c) => c.deletedAt == null).toList()
    ..sort((a, b) => (b.updatedAt ?? DateTime(0)).compareTo(a.updatedAt ?? DateTime(0)));
});

final buyersProvider = FutureProvider<List<Customer>>((ref) async {
  final customers = await ref.watch(customersProvider.future);
  return customers.where((c) => c.type == CustomerType.buyer).toList();
});

final sellersProvider = FutureProvider<List<Customer>>((ref) async {
  final customers = await ref.watch(customersProvider.future);
  return customers.where((c) => c.type == CustomerType.seller).toList();
});

final brokersProvider = FutureProvider<List<Broker>>((ref) async {
  final repository = ref.watch(brokerRepositoryProvider);
  final all = await repository.getAllBrokers();
  return all.where((b) => b.deletedAt == null).toList();
});

final floorFeesProvider = FutureProvider<List<FloorFee>>((ref) async {
  final repository = ref.watch(floorFeeRepositoryProvider);
  final all = await repository.getAllFees();
  return all.where((f) => f.deletedAt == null).toList()
    ..sort((a, b) => (b.feeDate ?? DateTime(0)).compareTo(a.feeDate ?? DateTime(0)));
});

// ================= BUNDLE (tránh deadlock truy vấn Isar song song) =================

/// Gói dữ liệu dashboard đọc trong 1 readTxn duy nhất (tuần tự),
/// tránh chạy nhiều isar.x.where().findAll() đồng thời gây treo trên Windows.
class BdsDashboardBundle {
  final List<BdsProperty> properties;
  final List<Customer> customers;
  final List<TransactionRecord> transactions;
  final List<Broker> brokers;
  final List<FloorFee> floorFees;

  const BdsDashboardBundle({
    required this.properties,
    required this.customers,
    required this.transactions,
    required this.brokers,
    required this.floorFees,
  });
}

final bdsBundleProvider = FutureProvider<BdsDashboardBundle>((ref) async {
  debugPrint('BDS-DEBUG: bundle START');
  // Pass directory path to Isolate
  final dir = await getApplicationDocumentsDirectory();
  final dbPath = dir.path;

  // Run in a separate isolate to prevent Isar FFI from blocking the main thread on Windows
  final bundle = await Isolate.run(() {
    final isar = Isar.getInstance('kanbatdongsan_v2') ?? Isar.openSync(
      [
        BdsPropertySchema,
        CustomerSchema,
        TransactionRecordSchema,
        BrokerSchema,
        FloorFeeSchema
      ],
      directory: dbPath,
      name: 'kanbatdongsan_v2',
    );

    final properties = isar.propertys.where().findAllSync();
    final customers = isar.customers.where().findAllSync();
    final transactions = isar.transactionRecords.where().findAllSync();
    final brokers = isar.brokers.where().findAllSync();
    final floorFees = isar.floorFees.where().findAllSync();

    return BdsDashboardBundle(
      properties: properties.where((p) => p.deletedAt == null).toList(),
      customers: customers.where((c) => c.deletedAt == null).toList(),
      transactions: transactions.where((t) => t.deletedAt == null).toList(),
      brokers: brokers.where((b) => b.deletedAt == null).toList(),
      floorFees: floorFees.where((f) => f.deletedAt == null).toList(),
    );
  }).timeout(const Duration(seconds: 5), onTimeout: () {
    debugPrint('BDS-DEBUG: bundle Isolate TIMED OUT');
    return const BdsDashboardBundle(
      properties: [],
      customers: [],
      transactions: [],
      brokers: [],
      floorFees: [],
    );
  });

  debugPrint('BDS-DEBUG: bundle DONE props=${bundle.properties.length}');
  return bundle;
});

// ================= DASHBOARD / BÁO CÁO =================

/// Chỉ số Dashboard theo PRD mục 4.1.
final dashboardMetricsProvider =
    FutureProvider<Map<String, double>>((ref) async {
  debugPrint('BDS-DEBUG: dashboardMetrics START');
  final bundle = await ref.watch(bdsBundleProvider.future);
  debugPrint('BDS-DEBUG: dashboardMetrics got bundle');
  return BdsBusinessLogic.dashboardMetrics(
    properties: bundle.properties,
    customers: bundle.customers,
    transactions: bundle.transactions,
    fees: bundle.floorFees,
  );
});

/// Xếp hạng môi giới theo KPI (PRD mục 15).
final brokerRankingsProvider =
    FutureProvider<List<BrokerRanking>>((ref) async {
  final brokers = await ref.watch(brokersProvider.future);
  final txs = await ref.watch(transactionsProvider.future);
  return BdsBusinessLogic.brokerRankings(brokers, txs);
});

/// Báo cáo lợi nhuận toàn bộ dữ liệu (lọc kỳ ở UI nếu cần).
final profitReportProvider = FutureProvider<ProfitReport>((ref) async {
  final txs = await ref.watch(transactionsProvider.future);
  final fees = await ref.watch(floorFeesProvider.future);
  return BdsBusinessLogic.profitReport(txs, fees);
});

/// Tìm tên nhanh cho UI (khách/môi giới/BĐS) từ remoteId hoặc code.
class BdsNameResolver {
  final Map<String, Customer> customers = {};
  final Map<String, Broker> brokers = {};
  final Map<String, BdsProperty> properties = {};

  BdsNameResolver();

  static BdsNameResolver build(
      List<BdsProperty> props, List<Customer> custs, List<Broker> brks) {
    final r = BdsNameResolver();
    for (final p in props) {
      if (p.remoteId != null) r.properties[p.remoteId!] = p;
      if (p.propertyCode != null) r.properties[p.propertyCode!] = p;
    }
    for (final c in custs) {
      if (c.remoteId != null) r.customers[c.remoteId!] = c;
    }
    for (final b in brks) {
      if (b.remoteId != null) r.brokers[b.remoteId!] = b;
    }
    return r;
  }

  String customer(String? id) =>
      customers[id]?.name ?? (id == null ? '-' : 'Khách #$id');
  String broker(String? id) =>
      brokers[id]?.fullName ?? (id == null ? '-' : 'MG #$id');
  BdsProperty? property(String? id) => id == null ? null : properties[id];
}
