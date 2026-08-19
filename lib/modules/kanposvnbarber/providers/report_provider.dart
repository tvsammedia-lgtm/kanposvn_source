import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/barber_invoice.dart';
import '../models/barber_expense.dart';
import '../models/barber_customer.dart';
import '../models/barber_employee.dart';
import 'barber_service_provider.dart';

class ReportState {
  final bool isLoading;
  final double totalRevenue;
  final double monthRevenue;
  final double monthExpenses;
  final double monthProfit;
  final int totalCustomers;
  final int totalInvoices;
  final int employeeCount;
  final List<double> monthlyRevenue;
  final List<String> monthLabels;

  ReportState({
    this.isLoading = false,
    this.totalRevenue = 0.0,
    this.monthRevenue = 0.0,
    this.monthExpenses = 0.0,
    this.monthProfit = 0.0,
    this.totalCustomers = 0,
    this.totalInvoices = 0,
    this.employeeCount = 0,
    this.monthlyRevenue = const [],
    this.monthLabels = const [],
  });

  ReportState copyWith({
    bool? isLoading,
    double? totalRevenue,
    double? monthRevenue,
    double? monthExpenses,
    double? monthProfit,
    int? totalCustomers,
    int? totalInvoices,
    int? employeeCount,
    List<double>? monthlyRevenue,
    List<String>? monthLabels,
  }) {
    return ReportState(
      isLoading: isLoading ?? this.isLoading,
      totalRevenue: totalRevenue ?? this.totalRevenue,
      monthRevenue: monthRevenue ?? this.monthRevenue,
      monthExpenses: monthExpenses ?? this.monthExpenses,
      monthProfit: monthProfit ?? this.monthProfit,
      totalCustomers: totalCustomers ?? this.totalCustomers,
      totalInvoices: totalInvoices ?? this.totalInvoices,
      employeeCount: employeeCount ?? this.employeeCount,
      monthlyRevenue: monthlyRevenue ?? this.monthlyRevenue,
      monthLabels: monthLabels ?? this.monthLabels,
    );
  }
}

class ReportNotifier extends StateNotifier<ReportState> {
  final Isar isar;
  ReportNotifier(this.isar) : super(ReportState()) {
    loadReportData();
  }

  Future<void> loadReportData() async {
    state = state.copyWith(isLoading: true);

    final now = DateTime.now();
    final monthStart = DateTime(now.year, now.month, 1);

    // Invoices
    final allInvoices = await isar.barberInvoices.where().anyId().findAll();
    final monthInvoices = allInvoices.where((i) => i.createdAt.isAfter(monthStart)).toList();
    final totalRevenue = allInvoices.fold<double>(0, (s, i) => s + i.total);
    final monthRevenue = monthInvoices.fold<double>(0, (s, i) => s + i.total);

    // Expenses
    final allExpenses = await isar.barberExpenses.where().anyId().findAll();
    final monthExpenses = allExpenses.where((e) => e.createdAt.isAfter(monthStart)).fold<double>(0, (s, e) => s + e.amount);

    // Customers & Employees
    final customerCount = await isar.barberCustomers.count();
    final employeeCount = await isar.barberEmployees.count();

    // 6-month revenue data
    final monthlyRevenue = <double>[];
    final monthLabels = <String>[];
    for (int i = 5; i >= 0; i--) {
      final m = DateTime(now.year, now.month - i, 1);
      final mEnd = DateTime(now.year, now.month - i + 1, 1);
      final label = 'T${m.month}';
      final rev = allInvoices
          .where((inv) => inv.createdAt.isAfter(m) && inv.createdAt.isBefore(mEnd))
          .fold<double>(0, (s, inv) => s + inv.total);
      monthlyRevenue.add(rev);
      monthLabels.add(label);
    }

    state = state.copyWith(
      isLoading: false,
      totalRevenue: totalRevenue,
      monthRevenue: monthRevenue,
      monthExpenses: monthExpenses,
      monthProfit: monthRevenue - monthExpenses,
      totalCustomers: customerCount,
      totalInvoices: allInvoices.length,
      employeeCount: employeeCount,
      monthlyRevenue: monthlyRevenue,
      monthLabels: monthLabels,
    );
  }
}

final reportProvider = StateNotifierProvider<ReportNotifier, ReportState>((ref) {
  final isar = ref.watch(barberIsarProvider).requireValue;
  return ReportNotifier(isar);
});
