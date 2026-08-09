import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../repositories/isar_db.dart';
import '../repositories/property_repository.dart';
import '../repositories/customer_repository.dart';
import '../repositories/broker_repository.dart';
import '../repositories/transaction_repository.dart';
import '../models/property.dart';
import '../models/customer.dart';
import '../models/broker.dart';
import '../models/transaction.dart';
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

final propertiesProvider = FutureProvider<List<BdsProperty>>((ref) async {
  final repository = ref.watch(propertyRepositoryProvider);
  return await repository.getAllProperties();
});

final transactionsProvider = FutureProvider<List<TransactionRecord>>((ref) async {
  final repository = ref.watch(transactionRepositoryProvider);
  return await repository.getAllTransactions();
});

final customersProvider = FutureProvider<List<Customer>>((ref) async {
  final repository = ref.watch(customerRepositoryProvider);
  return await repository.getAllCustomers();
});

final buyersProvider = FutureProvider<List<Customer>>((ref) async {
  final repository = ref.watch(customerRepositoryProvider);
  return await repository.getCustomersByType(CustomerType.buyer);
});

final sellersProvider = FutureProvider<List<Customer>>((ref) async {
  final repository = ref.watch(customerRepositoryProvider);
  return await repository.getCustomersByType(CustomerType.seller);
});

final brokersProvider = FutureProvider<List<Broker>>((ref) async {
  final repository = ref.watch(brokerRepositoryProvider);
  return await repository.getAllBrokers();
});
