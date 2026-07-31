enum ExpenseCategory {
  nhapHang('Nhập hàng'),
  dienNuoc('Điện nước'),
  thueMatBang('Thuê mặt bằng'),
  luongNhanVien('Lương nhân viên'),
  marketing('Marketing & Quảng cáo'),
  khauHao('Khấu hao tài sản'),
  chiKhac('Chi khác');

  final String label;
  const ExpenseCategory(this.label);
}

enum RevenueCategory {
  banHang('Doanh thu bán hàng'),
  thuNo('Thu nợ khách hàng'),
  thuKhac('Thu khác');

  final String label;
  const RevenueCategory(this.label);
}

class CashTransaction {
  final String id;
  final String title;
  final String type; // 'INCOME' or 'EXPENSE'
  final String category;
  final double amount;
  final String paymentMethod;
  final String performerName;
  final String note;
  final DateTime timestamp;

  CashTransaction({
    required this.id,
    required this.title,
    required this.type,
    required this.category,
    required this.amount,
    this.paymentMethod = 'Tiền mặt',
    this.performerName = 'Thu ngân',
    this.note = '',
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'type': type,
    'category': category,
    'amount': amount,
    'paymentMethod': paymentMethod,
    'performerName': performerName,
    'note': note,
    'timestamp': timestamp.toIso8601String(),
  };

  factory CashTransaction.fromJson(Map<String, dynamic> json) =>
      CashTransaction(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        type: json['type'] ?? 'EXPENSE',
        category: json['category'] ?? 'Chi khác',
        amount: (json['amount'] as num?)?.toDouble() ?? 0,
        paymentMethod: json['paymentMethod'] ?? 'Tiền mặt',
        performerName: json['performerName'] ?? 'Thu ngân',
        note: json['note'] ?? '',
        timestamp: json['timestamp'] != null
            ? DateTime.parse(json['timestamp'])
            : DateTime.now(),
      );
}

class ShiftReport {
  final String id;
  final String shiftName; // Ca sáng, Ca chiều, Ca tối
  final String cashierName;
  final DateTime startTime;
  final DateTime? endTime;
  final double openingBalance;
  final double cashRevenue;
  final double qrRevenue;
  final double cardRevenue;
  final double totalExpense;
  final double closingBalance;
  final int totalOrders;

  ShiftReport({
    required this.id,
    required this.shiftName,
    required this.cashierName,
    required this.startTime,
    this.endTime,
    this.openingBalance = 0,
    this.cashRevenue = 0,
    this.qrRevenue = 0,
    this.cardRevenue = 0,
    this.totalExpense = 0,
    this.closingBalance = 0,
    this.totalOrders = 0,
  });

  double get totalRevenue => cashRevenue + qrRevenue + cardRevenue;
  double get netCashInHand => openingBalance + cashRevenue - totalExpense;

  Map<String, dynamic> toJson() => {
    'id': id,
    'shiftName': shiftName,
    'cashierName': cashierName,
    'startTime': startTime.toIso8601String(),
    'endTime': endTime?.toIso8601String(),
    'openingBalance': openingBalance,
    'cashRevenue': cashRevenue,
    'qrRevenue': qrRevenue,
    'cardRevenue': cardRevenue,
    'totalExpense': totalExpense,
    'closingBalance': closingBalance,
    'totalOrders': totalOrders,
  };

  factory ShiftReport.fromJson(Map<String, dynamic> json) => ShiftReport(
    id: json['id'] ?? '',
    shiftName: json['shiftName'] ?? 'Ca sáng',
    cashierName: json['cashierName'] ?? 'Thu ngân',
    startTime: json['startTime'] != null
        ? DateTime.parse(json['startTime'])
        : DateTime.now(),
    endTime: json['endTime'] != null ? DateTime.parse(json['endTime']) : null,
    openingBalance: (json['openingBalance'] as num?)?.toDouble() ?? 0,
    cashRevenue: (json['cashRevenue'] as num?)?.toDouble() ?? 0,
    qrRevenue: (json['qrRevenue'] as num?)?.toDouble() ?? 0,
    cardRevenue: (json['cardRevenue'] as num?)?.toDouble() ?? 0,
    totalExpense: (json['totalExpense'] as num?)?.toDouble() ?? 0,
    closingBalance: (json['closingBalance'] as num?)?.toDouble() ?? 0,
    totalOrders: json['totalOrders'] ?? 0,
  );
}

class AccountingSummaryReport {
  final double totalRevenue;
  final double totalCostOfGoodsSold; // Giá vốn hàng bán
  final double totalOperatingExpenses; // Chi phí vận hành
  final double netProfit; // Lợi nhuận thuần

  // Bảng cân đối kế toán (Balance Sheet)
  final double cashInHand; // Tiền mặt
  final double bankBalance; // Tiền gửi ngân hàng
  final double customerDebts; // Phải thu khách hàng
  final double inventoryValue; // Giá trị hàng tồn kho
  final double supplierDebts; // Phải trả nhà cung cấp
  final double ownerEquity; // Vốn chủ sở hữu

  AccountingSummaryReport({
    this.totalRevenue = 0,
    this.totalCostOfGoodsSold = 0,
    this.totalOperatingExpenses = 0,
    this.netProfit = 0,
    this.cashInHand = 0,
    this.bankBalance = 0,
    this.customerDebts = 0,
    this.inventoryValue = 0,
    this.supplierDebts = 0,
    this.ownerEquity = 0,
  });

  double get totalAssets =>
      cashInHand + bankBalance + customerDebts + inventoryValue;
  double get totalLiabilitiesAndEquity =>
      supplierDebts + ownerEquity + netProfit;
}
