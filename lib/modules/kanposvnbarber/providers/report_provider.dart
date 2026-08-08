import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportState {
  final bool isLoading;
  final double totalRevenue;
  final int totalCustomers;
  final List<double> monthlyRevenue; // Mock 6 tháng gần nhất

  ReportState({
    this.isLoading = false,
    this.totalRevenue = 0.0,
    this.totalCustomers = 0,
    this.monthlyRevenue = const [],
  });

  ReportState copyWith({
    bool? isLoading,
    double? totalRevenue,
    int? totalCustomers,
    List<double>? monthlyRevenue,
  }) {
    return ReportState(
      isLoading: isLoading ?? this.isLoading,
      totalRevenue: totalRevenue ?? this.totalRevenue,
      totalCustomers: totalCustomers ?? this.totalCustomers,
      monthlyRevenue: monthlyRevenue ?? this.monthlyRevenue,
    );
  }
}

class ReportNotifier extends StateNotifier<ReportState> {
  ReportNotifier() : super(ReportState()) {
    loadReportData();
  }

  Future<void> loadReportData() async {
    state = state.copyWith(isLoading: true);
    
    // Giả lập load dữ liệu từ DB (thực tế sẽ join BarberInvoice)
    await Future.delayed(const Duration(seconds: 1));
    
    state = state.copyWith(
      isLoading: false,
      totalRevenue: 125000000,
      totalCustomers: 450,
      monthlyRevenue: [
        10000000, // Tháng -5
        15000000, // Tháng -4
        18000000, // Tháng -3
        22000000, // Tháng -2
        28000000, // Tháng -1
        32000000, // Tháng hiện tại
      ],
    );
  }
}

final reportProvider = StateNotifierProvider<ReportNotifier, ReportState>((ref) {
  return ReportNotifier();
});
