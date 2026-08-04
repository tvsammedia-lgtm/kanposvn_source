import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/batdongsan_providers.dart';
import '../models/transaction.dart';

class BatDongSanSalesReportScreen extends ConsumerStatefulWidget {
  const BatDongSanSalesReportScreen({super.key});

  @override
  ConsumerState<BatDongSanSalesReportScreen> createState() => _BatDongSanSalesReportScreenState();
}

class _BatDongSanSalesReportScreenState extends ConsumerState<BatDongSanSalesReportScreen> {
  DateTime? _startDate;
  DateTime? _endDate;
  String _filterPeriod = 'Tháng này';

  @override
  void initState() {
    super.initState();
    _setMonthFilter();
  }

  void _setTodayFilter() {
    final now = DateTime.now();
    setState(() {
      _startDate = DateTime(now.year, now.month, now.day);
      _endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
      _filterPeriod = 'Hôm nay';
    });
  }

  void _setWeekFilter() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    setState(() {
      _startDate = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
      _endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
      _filterPeriod = 'Tuần này';
    });
  }

  void _setMonthFilter() {
    final now = DateTime.now();
    setState(() {
      _startDate = DateTime(now.year, now.month, 1);
      _endDate = DateTime(now.year, now.month + 1, 0, 23, 59, 59);
      _filterPeriod = 'Tháng này';
    });
  }

  Future<void> _selectDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: _startDate != null && _endDate != null
          ? DateTimeRange(start: _startDate!, end: DateTime(_endDate!.year, _endDate!.month, _endDate!.day))
          : null,
    );

    if (picked != null) {
      setState(() {
        _startDate = DateTime(picked.start.year, picked.start.month, picked.start.day);
        _endDate = DateTime(picked.end.year, picked.end.month, picked.end.day, 23, 59, 59);
        _filterPeriod = 'Tùy chỉnh';
      });
    }
  }

  List<TransactionRecord> _getFilteredTransactions(List<TransactionRecord> transactions) {
    if (_startDate == null || _endDate == null) return transactions;

    return transactions.where((transaction) {
      if (transaction.transactionDate == null) return false;
      final transactionDate = transaction.transactionDate!;
      return transactionDate.isAfter(_startDate!) && transactionDate.isBefore(_endDate!);
    }).toList();
  }

  Map<String, dynamic> _calculateSummary(List<TransactionRecord> transactions) {
    final completedTransactions = transactions.where((t) => t.status == TransactionStatus.completed).toList();
    
    double totalRevenue = completedTransactions.fold(0, (sum, t) => sum + (t.finalPrice ?? 0));
    double totalCommission = completedTransactions.fold(0, (sum, t) => sum + (t.commission ?? 0));
    double totalFloorFee = completedTransactions.fold(0, (sum, t) => sum + (t.floorFee ?? 0));
    int transactionCount = completedTransactions.length;
    double avgTransactionValue = transactionCount > 0 ? totalRevenue / transactionCount : 0;

    return {
      'totalRevenue': totalRevenue,
      'totalCommission': totalCommission,
      'totalFloorFee': totalFloorFee,
      'transactionCount': transactionCount,
      'avgTransactionValue': avgTransactionValue,
    };
  }

  @override
  Widget build(BuildContext context) {
    final transactionsAsync = ref.watch(transactionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Báo Cáo Giao Dịch BĐS'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(transactionsProvider);
            },
          ),
        ],
      ),
      body: transactionsAsync.when(
        data: (transactions) {
          final filteredTransactions = _getFilteredTransactions(transactions);
          final summary = _calculateSummary(filteredTransactions);

          return Column(
            children: [
              _buildFilterSection(),
              _buildSummarySection(summary),
              Expanded(
                child: _buildDetailsSection(filteredTransactions),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[100],
      child: Column(
        children: [
          Row(
            children: [
              _buildFilterChip('Hôm nay', _filterPeriod == 'Hôm nay', _setTodayFilter),
              const SizedBox(width: 8),
              _buildFilterChip('Tuần này', _filterPeriod == 'Tuần này', _setWeekFilter),
              const SizedBox(width: 8),
              _buildFilterChip('Tháng này', _filterPeriod == 'Tháng này', _setMonthFilter),
              const SizedBox(width: 8),
              _buildFilterChip('Tùy chỉnh', _filterPeriod == 'Tùy chỉnh', _selectDateRange),
            ],
          ),
          if (_filterPeriod == 'Tùy chỉnh' && _startDate != null && _endDate != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Từ ${DateFormat('dd/MM/yyyy').format(_startDate!)} đến ${DateFormat('dd/MM/yyyy').format(_endDate!)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected, VoidCallback onTap) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
      selectedColor: Colors.deepOrange,
      checkmarkColor: Colors.white,
    );
  }

  Widget _buildSummarySection(Map<String, dynamic> summary) {
    final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '');

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  'Tổng Giá Trị',
                  currencyFormat.format(summary['totalRevenue']),
                  Icons.attach_money,
                  Colors.deepOrange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  'Số Giao Dịch',
                  '${summary['transactionCount']}',
                  Icons.description,
                  Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  'Hoa Hồng',
                  currencyFormat.format(summary['totalCommission']),
                  Icons.percent,
                  Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  'Phí Sàn',
                  currencyFormat.format(summary['totalFloorFee']),
                  Icons.business,
                  Colors.purple,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildSummaryCard(
            'Trung Bình/Giao Dịch',
            currencyFormat.format(summary['avgTransactionValue']),
            Icons.trending_up,
            Colors.amber,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsSection(List<TransactionRecord> transactions) {
    final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '');

    if (transactions.isEmpty) {
      return const Center(child: Text('Không có giao dịch nào trong khoảng thời gian này'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            title: Text('Giao dịch #${transaction.transactionCode ?? "N/A"}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (transaction.transactionDate != null)
                  Text('Ngày: ${DateFormat('dd/MM/yyyy').format(transaction.transactionDate!)}'),
                Text('Môi giới: ${transaction.brokerId ?? "N/A"}'),
                Text('Bán: ${transaction.sellerId ?? "N/A"}'),
                Text('Mua: ${transaction.buyerId ?? "N/A"}'),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  currencyFormat.format(transaction.finalPrice ?? 0),
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: transaction.status == TransactionStatus.completed ? Colors.green : Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _getStatusLabel(transaction.status),
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getStatusLabel(TransactionStatus status) {
    switch (status) {
      case TransactionStatus.negotiating:
        return 'Đang đàm phán';
      case TransactionStatus.deposited:
        return 'Đã cọc';
      case TransactionStatus.notarized:
        return 'Đã công chứng';
      case TransactionStatus.completed:
        return 'Hoàn thành';
      case TransactionStatus.cancelled:
        return 'Đã hủy';
    }
  }
}
