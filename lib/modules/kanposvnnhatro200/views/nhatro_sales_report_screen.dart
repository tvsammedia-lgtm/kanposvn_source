import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/nhatro_providers.dart';
import '../models/contract.dart';
import '../models/room.dart';
import '../models/tenant.dart';

class NhaTroSalesReportScreen extends ConsumerStatefulWidget {
  const NhaTroSalesReportScreen({super.key});

  @override
  ConsumerState<NhaTroSalesReportScreen> createState() => _NhaTroSalesReportScreenState();
}

class _NhaTroSalesReportScreenState extends ConsumerState<NhaTroSalesReportScreen> {
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
    final now = DateTime.now();
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: now,
      initialDateRange: _startDate != null && _endDate != null
          ? DateTimeRange(
              start: _startDate!,
              end: _endDate!.isAfter(now) ? now : _endDate!,
            )
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

  List<Contract> _getFilteredContracts(List<Contract> contracts) {
    if (_startDate == null || _endDate == null) return contracts;

    return contracts.where((contract) {
      if (contract.startDate == null) return false;
      final contractDate = contract.startDate!;
      return contractDate.isAfter(_startDate!) && contractDate.isBefore(_endDate!);
    }).toList();
  }

  Map<String, dynamic> _calculateSummary(List<Contract> contracts) {
    double totalRent = contracts.fold(0, (sum, contract) => sum + (contract.rentPrice ?? 0));
    double totalDeposit = contracts.fold(0, (sum, contract) => sum + (contract.depositAmount ?? 0));
    int contractCount = contracts.length;
    double avgRent = contractCount > 0 ? totalRent / contractCount : 0;

    return {
      'totalRent': totalRent,
      'totalDeposit': totalDeposit,
      'contractCount': contractCount,
      'avgRent': avgRent,
    };
  }

  @override
  Widget build(BuildContext context) {
    final contractsAsync = ref.watch(contractsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Báo Cáo Thuê Nhà Trọ'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(contractsProvider);
            },
          ),
        ],
      ),
      body: contractsAsync.when(
        data: (contracts) {
          final filteredContracts = _getFilteredContracts(contracts);
          final summary = _calculateSummary(filteredContracts);

          return Column(
            children: [
              _buildFilterSection(),
              _buildSummarySection(summary),
              Expanded(
                child: _buildDetailsSection(filteredContracts),
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
      selectedColor: Colors.teal,
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
                  'Tổng Tiền Thuê',
                  currencyFormat.format(summary['totalRent']),
                  Icons.attach_money,
                  Colors.teal,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  'Số Hợp Đồng',
                  '${summary['contractCount']}',
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
                  'Tổng Đặt Cọc',
                  currencyFormat.format(summary['totalDeposit']),
                  Icons.account_balance_wallet,
                  Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  'Trung Bình/Phòng',
                  currencyFormat.format(summary['avgRent']),
                  Icons.trending_up,
                  Colors.orange,
                ),
              ),
            ],
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

  Widget _buildDetailsSection(List<Contract> contracts) {
    final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '');
    final roomsAsync = ref.watch(roomsProvider);
    final tenantsAsync = ref.watch(tenantsProvider);
    final roomMap = roomsAsync.maybeWhen(data: (r) => {for (final x in r) x.uuid: x}, orElse: () => <String?, Room>{});
    final tenantMap = tenantsAsync.maybeWhen(data: (t) => {for (final x in t) x.uuid: x}, orElse: () => <String?, Tenant>{});

    if (contracts.isEmpty) {
      return const Center(child: Text('Không có hợp đồng nào trong khoảng thời gian này'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: contracts.length,
      itemBuilder: (context, index) {
        final contract = contracts[index];
        final room = roomMap[contract.roomUuid];
        final tenant = tenantMap[contract.tenantUuid];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            title: Text('Hợp đồng #${contract.contractNumber ?? "N/A"}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Phòng: ${room?.roomCode ?? contract.roomUuid ?? "N/A"}'),
                Text('Khách: ${tenant?.fullName ?? contract.tenantUuid ?? "N/A"}'),
                if (contract.startDate != null)
                  Text('Ngày bắt đầu: ${DateFormat('dd/MM/yyyy').format(contract.startDate!)}'),
                if (contract.endDate != null)
                  Text('Ngày kết thúc: ${DateFormat('dd/MM/yyyy').format(contract.endDate!)}'),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  currencyFormat.format(contract.rentPrice ?? 0),
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                ),
                if (contract.paymentCycleMonths != null)
                  Text(
                    '${contract.paymentCycleMonths} tháng',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
