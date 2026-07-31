import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/app_providers.dart';
import '../models/isar_models.dart';

class AccountingReportsScreen extends ConsumerStatefulWidget {
  const AccountingReportsScreen({super.key});

  @override
  ConsumerState<AccountingReportsScreen> createState() => _AccountingReportsScreenState();
}

class _AccountingReportsScreenState extends ConsumerState<AccountingReportsScreen> {
  String _dateFilter = 'month'; // day, month, year
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
    final db = ref.watch(dbProvider);

    // Accounting Calculations
    final totalRevenue = db.orders.where((o) => o.paymentStatus == 'PAID').fold(0.0, (sum, o) => sum + o.totalAmount);
    final totalCogs = totalRevenue * 0.35;
    final grossProfit = totalRevenue - totalCogs;
    final totalOperatingExpenses = db.expenses.where((e) => e.type == 'EXPENSE').fold(0.0, (sum, e) => sum + e.amount);
    final netProfit = grossProfit - totalOperatingExpenses;

    final cashInHand = 15500000.0;
    final bankDeposit = 48200000.0;
    final customerReceivables = db.customers.fold(0.0, (sum, c) => sum + c.debt);
    final inventoryValue = db.inventory.fold(0.0, (sum, i) => sum + (i.currentStock * i.costPrice));
    final totalAssets = cashInHand + bankDeposit + customerReceivables + inventoryValue;

    final supplierPayables = db.suppliers.fold(0.0, (sum, s) => sum + s.debt);
    final ownerEquity = totalAssets - supplierPayables;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F6F0),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text('Báo Cáo Kế Toán', style: TextStyle(color: Color(0xFF4A2C2A), fontWeight: FontWeight.bold, fontSize: 16)),
          bottom: const TabBar(
            labelColor: Color(0xFF4A2C2A),
            indicatorColor: Color(0xFF4A2C2A),
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.analytics), text: 'Kết Quả'),
              Tab(icon: Icon(Icons.account_balance), text: 'Cân Đối'),
              Tab(icon: Icon(Icons.swap_horiz), text: 'Lưu Chuyển'),
              Tab(icon: Icon(Icons.bar_chart), text: 'Thống Kế'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Income Statement
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('BÁO CÁO KẾT QUẢ KINH DOANH', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF4A2C2A))),
                    const Divider(height: 24),
                    _buildRow('1. Doanh thu bán hàng:', currency.format(totalRevenue), isBold: true),
                    _buildRow('2. Giá vốn hàng bán (COGS):', '-${currency.format(totalCogs)}', color: Colors.orange.shade800),
                    const Divider(),
                    _buildRow('3. LỢI NHUẬN GỘP:', currency.format(grossProfit), isBold: true, color: Colors.blue.shade900),
                    _buildRow('4. Chi phí hoạt động:', '-${currency.format(totalOperatingExpenses)}', color: Colors.red),
                    const Divider(height: 24),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(10)),
                      child: _buildRow('5. LỢI NHUẬN THUẦN:', currency.format(netProfit), isBold: true, fontSize: 18, color: Colors.green.shade900),
                    ),
                  ]),
                ),
              ),
            ),

            // Tab 2: Balance Sheet
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        const Text('TÀI SẢN', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
                        const Divider(),
                        _buildRow('Tiền mặt:', currency.format(cashInHand)),
                        _buildRow('Tiền gửi ngân hàng:', currency.format(bankDeposit)),
                        _buildRow('Phải thu KH:', currency.format(customerReceivables)),
                        _buildRow('Tồn kho:', currency.format(inventoryValue)),
                        const Divider(height: 24),
                        _buildRow('TỔNG TÀI SẢN:', currency.format(totalAssets), isBold: true, fontSize: 16, color: Colors.blue.shade900),
                      ]),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        const Text('NGUỒN VỐN', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple)),
                        const Divider(),
                        _buildRow('Phải trả NCC:', currency.format(supplierPayables)),
                        _buildRow('Vốn chủ sở hữu:', currency.format(ownerEquity)),
                        _buildRow('LN chưa phân phối:', currency.format(netProfit)),
                        const Divider(height: 24),
                        _buildRow('TỔNG NGUỒN VỐN:', currency.format(totalAssets), isBold: true, fontSize: 16, color: Colors.purple.shade900),
                      ]),
                    ),
                  ),
                ),
              ]),
            ),

            // Tab 3: Cash Flow
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('LƯU CHUYỂN TIỀN TỆ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF4A2C2A))),
                    const Divider(height: 24),
                    _buildRow('Thu từ bán hàng:', '+${currency.format(totalRevenue)}', color: Colors.green),
                    _buildRow('Chi mua nguyên liệu & hoạt động:', '-${currency.format(totalOperatingExpenses)}', color: Colors.red),
                    const Divider(height: 24),
                    _buildRow('TIỀN TỒN CUỐI KỲ:', currency.format(cashInHand + bankDeposit), isBold: true, fontSize: 16, color: const Color(0xFF2E7D32)),
                  ]),
                ),
              ),
            ),

            // Tab 4: Sales Statistics (MỚI)
            _buildSalesStatisticsTab(db, currency),
          ],
        ),
      ),
    );
  }

  // ===================== TAB 4: SALES STATISTICS =====================

  Widget _buildSalesStatisticsTab(dynamic db, NumberFormat currency) {
    final paidOrders = db.orders.where((o) => o.paymentStatus == 'PAID').toList();

    // Filter orders by selected date range
    final filteredOrders = paidOrders.where((o) {
      if (_dateFilter == 'day') {
        return o.createdAt.year == _selectedDate.year && o.createdAt.month == _selectedDate.month && o.createdAt.day == _selectedDate.day;
      } else if (_dateFilter == 'month') {
        return o.createdAt.year == _selectedDate.year && o.createdAt.month == _selectedDate.month;
      } else {
        return o.createdAt.year == _selectedDate.year;
      }
    }).toList();

    final totalRevenue = filteredOrders.fold(0.0, (sum, o) => sum + o.totalAmount);
    final orderCount = filteredOrders.length;
    final avgOrderValue = orderCount > 0 ? totalRevenue / orderCount : 0.0;

    // Revenue by order type
    final revenueByType = <String, double>{};
    final countByType = <String, int>{};
    for (var o in filteredOrders) {
      final typeLabel = _getOrderTypeLabel(o.type);
      revenueByType[typeLabel] = (revenueByType[typeLabel] ?? 0) + o.totalAmount;
      countByType[typeLabel] = (countByType[typeLabel] ?? 0) + 1;
    }

    // Revenue by payment method
    final revenueByPayment = <String, double>{};
    for (var o in filteredOrders) {
      final label = _getPaymentLabel(o.paymentMethod);
      revenueByPayment[label] = (revenueByPayment[label] ?? 0) + o.totalAmount;
    }

    // Top selling items
    final itemSales = <String, Map<String, dynamic>>{};
    for (var o in filteredOrders) {
      for (var item in o.items) {
        if (!itemSales.containsKey(item.productName)) {
          itemSales[item.productName] = {'qty': 0, 'revenue': 0.0};
        }
        itemSales[item.productName]!['qty'] += item.quantity;
        itemSales[item.productName]!['revenue'] += item.totalPrice;
      }
    }
    final topItems = itemSales.entries.toList()
      ..sort((a, b) => (b.value['qty'] as int).compareTo(a.value['qty'] as int));

    return Column(
      children: [
        // Date selector
        Container(
          padding: const EdgeInsets.all(12),
          color: Colors.white,
          child: Row(
            children: [
              // Filter type
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'day', label: Text('Ngày'), icon: Icon(Icons.today, size: 16)),
                  ButtonSegment(value: 'month', label: Text('Tháng'), icon: Icon(Icons.calendar_month, size: 16)),
                  ButtonSegment(value: 'year', label: Text('Năm'), icon: Icon(Icons.calendar_today, size: 16)),
                ],
                selected: {_dateFilter},
                onSelectionChanged: (set) => setState(() => _dateFilter = set.first),
              ),
              const SizedBox(width: 12),

              // Date picker
              OutlinedButton.icon(
                onPressed: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) setState(() => _selectedDate = picked);
                },
                icon: const Icon(Icons.date_range, size: 18),
                label: Text(
                  _dateFilter == 'day'
                      ? DateFormat('dd/MM/yyyy').format(_selectedDate)
                      : _dateFilter == 'month'
                          ? 'Tháng ${_selectedDate.month}/${_selectedDate.year}'
                          : 'Năm ${_selectedDate.year}',
                ),
              ),

              // Quick nav
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () => setState(() {
                  if (_dateFilter == 'day') _selectedDate = _selectedDate.subtract(const Duration(days: 1));
                  if (_dateFilter == 'month') _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1);
                  if (_dateFilter == 'year') _selectedDate = DateTime(_selectedDate.year - 1, _selectedDate.month);
                }),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () => setState(() {
                  if (_dateFilter == 'day') _selectedDate = _selectedDate.add(const Duration(days: 1));
                  if (_dateFilter == 'month') _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1);
                  if (_dateFilter == 'year') _selectedDate = DateTime(_selectedDate.year + 1, _selectedDate.month);
                }),
              ),
            ],
          ),
        ),

        // Stats content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              // Summary cards
              Row(children: [
                _buildStatCard('Doanh thu', currency.format(totalRevenue), Icons.monetization_on, Colors.green),
                const SizedBox(width: 12),
                _buildStatCard('Số đơn', '$orderCount đơn', Icons.receipt_long, Colors.blue),
                const SizedBox(width: 12),
                _buildStatCard('TB/đơn', currency.format(avgOrderValue), Icons.analytics, Colors.orange),
              ]),
              const SizedBox(height: 16),

              // Revenue breakdown by type - prominent
              _buildSectionTitle('Phân tích doanh thu theo kênh bán'),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(children: [
                    _buildRevenueRow(
                      'Tại bàn',
                      revenueByType['Tại bàn'] ?? 0.0,
                      countByType['Tại bàn'] ?? 0,
                      totalRevenue,
                      Colors.green,
                      Icons.table_restaurant,
                    ),
                    const Divider(),
                    _buildRevenueRow(
                      'Mang đi',
                      revenueByType['Mang đi'] ?? 0.0,
                      countByType['Mang đi'] ?? 0,
                      totalRevenue,
                      Colors.blue,
                      Icons.shopping_bag,
                    ),
                    const Divider(),
                    _buildRevenueRow(
                      'Giao hàng',
                      revenueByType['Giao hàng'] ?? 0.0,
                      countByType['Giao hàng'] ?? 0,
                      totalRevenue,
                      Colors.purple,
                      Icons.delivery_dining,
                    ),
                    const Divider(thickness: 2),
                    // TONG DOANH THU
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          const Icon(Icons.stacked_bar_chart, color: Color(0xFF4A2C2A), size: 28),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text('TỔNG DOANH THU', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4A2C2A))),
                          ),
                          Text(
                            currency.format(totalRevenue),
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const SizedBox(width: 40),
                        Text('$orderCount đơn hàng', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                        const SizedBox(width: 16),
                        Text('TB/đơn: ${currency.format(avgOrderValue)}', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                      ],
                    ),
                  ]),
                ),
              ),
              const SizedBox(height: 16),

              // Revenue by type
              if (revenueByType.isNotEmpty) ...[
                _buildSectionTitle('Doanh thu theo loại đơn'),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: revenueByType.entries.map((e) {
                      final count = countByType[e.key] ?? 0;
                      final pct = totalRevenue > 0 ? (e.value / totalRevenue * 100) : 0.0;
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: e.key == 'Tại bàn' ? Colors.green[100] : e.key == 'Mang đi' ? Colors.blue[100] : Colors.purple[100],
                          child: Icon(e.key == 'Tại bàn' ? Icons.table_restaurant : e.key == 'Mang đi' ? Icons.shopping_bag : Icons.delivery_dining,
                              size: 20, color: e.key == 'Tại bàn' ? Colors.green : e.key == 'Mang đi' ? Colors.blue : Colors.purple),
                        ),
                        title: Text('${e.key} ($count đơn)'),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(currency.format(e.value), style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text('${pct.toStringAsFixed(1)}%', style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Revenue by payment method
              if (revenueByPayment.isNotEmpty) ...[
                _buildSectionTitle('Doanh thu theo phương thức TT'),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: revenueByPayment.entries.map((e) {
                      final pct = totalRevenue > 0 ? (e.value / totalRevenue * 100) : 0.0;
                      return ListTile(
                        leading: CircleAvatar(backgroundColor: Colors.amber[100], child: const Icon(Icons.payment, size: 20, color: Colors.amber)),
                        title: Text(e.key),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(currency.format(e.value), style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text('${pct.toStringAsFixed(1)}%', style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Top items
              if (topItems.isNotEmpty) ...[
                _buildSectionTitle('Món bán chạy'),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: topItems.take(10).toList().asMap().entries.map((entry) {
                      final rank = entry.key + 1;
                      final item = entry.value;
                      final qty = item.value['qty'] as int;
                      final rev = item.value['revenue'] as double;
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: rank <= 3 ? Colors.amber[100] : Colors.grey[100],
                          child: Text('$rank', style: TextStyle(fontWeight: FontWeight.bold, color: rank <= 3 ? Colors.amber[800] : Colors.grey[600])),
                        ),
                        title: Text(item.key),
                        subtitle: Text('$qty phần đã bán'),
                        trailing: Text(currency.format(rev), style: const TextStyle(fontWeight: FontWeight.bold)),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Daily breakdown for month view
              if (_dateFilter == 'month' && filteredOrders.isNotEmpty) ...[
                _buildSectionTitle('Chi tiết theo ngày trong tháng'),
                _buildDailyBreakdown(filteredOrders, currency),
              ],
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildDailyBreakdown(List<OrderModel> orders, NumberFormat currency) {
    final dailyData = <int, Map<String, dynamic>>{};
    for (var o in orders) {
      final day = o.createdAt.day;
      if (!dailyData.containsKey(day)) {
        dailyData[day] = {'revenue': 0.0, 'count': 0};
      }
      dailyData[day]!['revenue'] += o.totalAmount;
      dailyData[day]!['count']++;
    }

    final sortedDays = dailyData.keys.toList()..sort();

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: const BorderRadius.vertical(top: Radius.circular(12))),
            child: const Row(children: [
              Expanded(flex: 2, child: Text('Ngày', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
              Expanded(flex: 2, child: Text('Đơn hàng', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12), textAlign: TextAlign.center)),
              Expanded(flex: 3, child: Text('Doanh thu', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12), textAlign: TextAlign.end)),
            ]),
          ),
          ...sortedDays.map((day) {
            final data = dailyData[day]!;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
              child: Row(children: [
                Expanded(flex: 2, child: Text('Ngày $day', style: const TextStyle(fontSize: 13))),
                Expanded(flex: 2, child: Text('${data['count']} đơn', style: const TextStyle(fontSize: 13), textAlign: TextAlign.center)),
                Expanded(flex: 3, child: Text(currency.format(data['revenue']), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold), textAlign: TextAlign.end)),
              ]),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF4A2C2A))),
    );
  }

  Widget _buildRevenueRow(String label, double revenue, int count, double totalRevenue, Color color, IconData icon) {
    final pct = totalRevenue > 0 ? (revenue / totalRevenue * 100) : 0.0;
    final currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
    return Row(
      children: [
        CircleAvatar(backgroundColor: color.withValues(alpha: 0.15), radius: 18, child: Icon(icon, color: color, size: 20)),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text('$count đơn', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ])),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text(currency.format(revenue), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: color)),
          Text('${pct.toStringAsFixed(1)}%', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ]),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
            Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          ]),
        ),
      ),
    );
  }

  String _getOrderTypeLabel(OrderType type) {
    switch (type) {
      case OrderType.atTable: return 'Tại bàn';
      case OrderType.takeaway: return 'Mang đi';
      case OrderType.delivery: return 'Giao hàng';
    }
  }

  String _getPaymentLabel(String method) {
    switch (method) {
      case 'CASH': return 'Tiền mặt';
      case 'VIETQR': return 'VietQR';
      case 'BANK_TRANSFER': return 'Chuyển khoản';
      case 'CARD': return 'Thẻ';
      case 'E_WALLET': return 'Ví điện tử';
      default: return method;
    }
  }

  Widget _buildRow(String label, String value, {bool isBold = false, double fontSize = 14, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: TextStyle(fontSize: fontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        Text(value, style: TextStyle(fontSize: fontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: color)),
      ]),
    );
  }
}
